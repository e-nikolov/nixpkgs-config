{ config, pkgs, values, inputs, ... }:
{
  home.username = "${values.username}";
  home.homeDirectory = "/home/${values.username}";
  programs.home-manager.enable = true;

  home.packages = [
    pkgs.nix
    pkgs.micro
    pkgs.htop
    pkgs.nixfmt
    pkgs.curl
    pkgs.kubectl
    pkgs.kubectx
    pkgs.git
    pkgs.ripgrep-all
    pkgs.niv
    pkgs.go
    pkgs.python3
    pkgs.nodejs
    pkgs.jq
    pkgs.websocat
    pkgs.rustc
    pkgs.file
    pkgs.tldr
    pkgs.rsync
    pkgs.direnv
    pkgs.rnix-lsp
    pkgs.gnupg
    pkgs.gnumake
    pkgs.bc
    pkgs.xclip
    pkgs.lsof
    pkgs.bash-completion
    pkgs.oh-my-zsh
    pkgs.zsh-fzf-tab
    pkgs.zsh-z
    pkgs.zsh-autosuggestions
    pkgs.zsh-fast-syntax-highlighting
    pkgs.zsh-powerlevel10k
    pkgs.zsh-autopair
    pkgs.zsh-you-should-use
    pkgs.zsh-completions
    pkgs.meslo-lgs-nf
    # pkgs.fortune
    # pkgs.hello
    # pkgs.cowsay
  ] ++ [ ];

  programs.git = {
    enable = true;
    difftastic.enable = true;
    extraConfig = {
      core = {
        editor = "micro";
      };
      credential = {
        helper = "cache --timeout=3600";
      };

      url = {
        "git@github.com:" = { insteadOf = "https://github.com/"; };
        "ssh://git@bitbucket.org/" = { insteadOf = "https://bitbucket.org/"; };
      };

      pull = {
        ff = "only";
      };
    };
  };

  programs.gitui.enable = true;

  programs.exa = {
    enable = true;
    # enableAliases = true;
  };

  programs.ssh = {
    forwardAgent = true;
    enable = true;
  };

  programs.nix-index.enable = true;
  fonts.fontconfig.enable = true;

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  home.shellAliases = {
    nfg = "code ~/nix-config/";
    hm = "home-manager";

    gct = "git commit -am 'tmp'";

    sudo = ''sudo -E env "PATH=$PATH" '';
    ls = "exa -alh --group-directories-first --color always ";
    tree = "exa --tree -alh --group-directories-first --color always ";
    grep = "grep --color --ignore-case --line-number --context=3 ";
    df = "df -h ";

    zfg = "code ~/.zshrc";
    src = "source ~/.zshrc";

    port = "sudo lsof -i -P -n | fzf";
    pp = "ps axww -o pid,user,%cpu,%mem,start,time,command | fzf | sed 's/^ *//' | cut -f1 -d' '";

    gi = "go install ./...";
    gomt = "go mod tidy";

    d = "docker";
    dc = "docker-compose";
    dcu = "docker-compose up";
    dcr = "docker-compose run";
    dclt = "docker-compose logs --follow --tail=100";

    k = "kubectl";
    kx = "kubectx";
    kn = "kubens";

    tf = "terraform";
  };

  home.sessionVariables = {
    ZSH_AUTOSUGGEST_USE_ASYNC = "on";
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE = "fg=12";
    EDITOR = "micro";
    GOBIN = "~/go/bin";
    GOMODCACHE = "$HOME/go/pkg/mod";
    GOPATH = "$HOME/go";
    COPY_COMMAND = "xc";
    NODE_PATH = "~/.npm-packages/lib/node_modules";
    PATH = "$PATH:$GOBIN:~/.local/bin:~/.npm-packages/bin";
  };

  programs.bash.enable = true;
  nix.package = pkgs.nix;
  nix.settings.experimental-features = [ "flakes" "nix-command" "repl-flake" ];
  nix.settings.keep-derivations = true;
  nix.settings.keep-outputs = true;


  programs.zsh =
    let
      omzp = name: { inherit name; src = "${pkgs.oh-my-zsh}/share/oh-my-zsh/plugins/${name}"; };
      omzl = name: file: {
        inherit name file;
        # file = if file != "" then file else "${name}.zsh";
        src = "${pkgs.oh-my-zsh}/share/oh-my-zsh/lib/";
      };
    in
    {
      enable = true;
      enableAutosuggestions = true;

      initExtraFirst = ''
        # p10k instant prompt
        local P10K_INSTANT_PROMPT="${config.xdg.cacheHome}/p10k-instant-prompt-''${(%):-%n}.zsh"
        [[ ! -r "$P10K_INSTANT_PROMPT" ]] || source "$P10K_INSTANT_PROMPT"

        export GPG_TTY=$TTY

        zstyle :omz:plugins:ssh-agent agent-forwarding on
        zstyle :omz:plugins:ssh-agent helper ksshaskpass
        zstyle :omz:plugins:ssh-agent lazy yes
        zstyle :omz:plugins:ssh-agent lifetime 30m
      '';

      defaultKeymap = "emacs";

      plugins = with pkgs; [
        {
          file = "powerlevel10k.zsh-theme";
          name = "powerlevel10k";
          src = "${zsh-powerlevel10k}/share/zsh-powerlevel10k";
        }
        {
          file = "p10k.zsh";
          name = "powerlevel10k-config";
          src = ../../dotfiles/.;
        }
        {
          file = "text-selections.zsh";
          name = "text-selections";
          src = ../../dotfiles/.;
        }
        {
          file = "zsh-z.plugin.zsh";
          name = "zsh-z";
          src = "${zsh-z}/share/zsh-z";
        }
        {
          file = "fast-syntax-highlighting.plugin.zsh";
          name = "zsh-fast-syntax-highlighting";
          src = "${zsh-fast-syntax-highlighting}/share/zsh/site-functions/";
        }
        {
          file = "fzf-tab.plugin.zsh";
          name = "zsh-fzf-tab";
          src = "${zsh-fzf-tab}/share/fzf-tab/";
        }
        {
          file = "autopair.zsh";
          name = "zsh-autopair";
          src = "${zsh-autopair}/share/zsh/zsh-autopair/";
        }
        {
          name = "you-should-use";
          src = "${zsh-you-should-use}/share/zsh/plugins/you-should-use/";
        }
        # {
        #   name = "zsh-completions";
        #   src = "${zsh-completions}/share/zsh/zsh-completions/";
        # }
        {
          name = "git-it-on";
          src = pkgs.fetchFromGitHub {
            owner = "peterhurford";
            repo = "git-it-on.zsh";
            rev = "6495b09d3bf60a103f45e1e39ce904ae3cf18cf0";
            sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
          };
        }
        {
          name = "zsh-tab-title";
          src = pkgs.fetchFromGitHub {
            owner = "trystan2k";
            repo = "zsh-tab-title";
            rev = "6e532a48e46ae56daec18255512dd8d0597f4aa6";
            sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
          };
        }
        (omzp "sudo")
        (omzl "functions" "functions.zsh")
        (omzp "web-search")
        (omzp "dirhistory")
        (omzp "golang")
        (omzl "git-lib" "git.zsh")
        (omzp "git")
        (omzp "ssh-agent")
        (omzp "colored-man-pages")
      ];

      completionInit = ''
        zstyle ':completion:*:default' menu select=1
        zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
        zstyle ':completion:*' list-colors ""
        zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

        zmodload -i zsh/complist
        autoload -U compinit && compinit
        autoload bashcompinit && bashcompinit
        complete -o nospace -C ${pkgs.terraform}/bin/terraform terraform 
        command -v vault > /dev/null && complete -o nospace -C vault vault

        WORDCHARS=""
        unsetopt MENU_COMPLETE
        unsetopt FLOW_CONTROL
        setopt AUTO_MENU
        setopt COMPLETE_IN_WORD
        setopt ALWAYS_TO_END
        setopt NO_LIST_BEEP
        setopt LIST_PACKED
        setopt HIST_IGNORE_ALL_DUPS
      '';

      initExtra = ''
        xc() {
            xclip -selection clipboard
        }

        hms() {
          home-manager switch --flake ~/nix-config $@
          exec $SHELL
        }
      
        nrs() {
          sudo nixos-rebuild switch --flake ~/nix-config/ $@
          exec $SHELL
        } 

        ns() {
            nix develop $@ --command zsh
        }

        . ~/nix-config/dotfiles/.zshrc
    
      '';

      history = {
        size = 10000;
        path = "$HOME/.zsh_history";
        ignoreDups = true;
      };
    };

  programs.fzf.enable = true;

  programs.htop.enable = true;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";
}
