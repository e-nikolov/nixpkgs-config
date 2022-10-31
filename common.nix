{ config, pkgs, id, inputs, ... }:
let
  nixpkgsPackages = with pkgs; [
    nix
    tailscale
    htop
    fortune
    cacert
    zotero
    nixfmt
    curl
    docker
    docker-compose
    runc
    containerd
    iptables
    kubectl
    kubectx
    doctl
    vault
    git
    git-filter-repo
    kubernetes-helm
    inotify-tools
    ripgrep-all
    niv
    cmctl
    go
    python3
    nodejs
    elixir
    jq
    websocat
    rustc
    go-ethereum
    awscli2
    file
    xclip
    vscode
    firefox
    popcorntime
    yakuake
    nebula
    bash-completion
    tldr
    vault
    rsync
    asdf-vm
    zsh-fzf-tab
    zsh-z
    zsh-autosuggestions
    zsh-fast-syntax-highlighting
    zsh-powerlevel10k
    meslo-lgs-nf
    direnv
    rnix-lsp
    udisks2
    # devbox
    # hello
    pam_mount
    cowsay
  ];
in
{
  home.username = "${id.username}";
  home.homeDirectory = "/home/${id.username}";
  programs.home-manager.enable = true;

  home.packages = nixpkgsPackages ++ [ ];

  programs.nix-index.enable = true;
  fonts.fontconfig.enable = true;

  home.shellAliases = {
    gi = "go install ./...";
    sudo = ''sudo -E env "PATH=$PATH" '';
    scode = "sudo code --user-data-dir ~/codee";
    dc = "docker-compose";
    dcu = "docker-compose up";
    dcr = "docker-compose run";
    dclt = "docker-compose logs --follow --tail=100";
    d = "docker";
    dci = "docker_install";
    port = "sudo lsof -i -P -n | grep LISTEN | grep ";
    K =
      "KUBECONFIG=~/go/src/github.com/unchain/tbg-nodes/kubeconfig.local.yaml ";
    kk =
      "KUBECONFIG=~/go/src/github.com/unchain/tbg-nodes/kubeconfig.local.yaml k ";
    cz = "chezmoi";
    pp =
      "ps axww -o pid,user,%cpu,%mem,start,time,command | fzf | sed 's/^ *//' | cut -f1 -d' '";

    ll = "ls -l";

    gct = "git commit -am 'tmp'";
    tf = "terraform";
    k = "kubectl";
    kx = "kubectx";
    kn = "kubens";
    gl = "launch_goland";
    hm = "home-manager";
    hms =
      ''home-manager switch --flake "$HOME/.config/nixpkgs"'';
    hmg = "code ~/.config/nixpkgs/";

    zfg = "subl ~/.zshrc";
    gomt = "go mod tidy";
    src = "source ~/.zshrc";
    # ns = "nix develop --command zsh ";

  };

  home.sessionVariables = rec {
    ZSH_AUTOSUGGEST_USE_ASYNC = "on";
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE = "fg=12";
    EDITOR = "micro";
    GOBIN = "~/go/bin";
    # GOMODCACHE = "/home/enikolov/go/pkg/mod";
    # GOPATH = "/home/enikolov/go";
    GOMODCACHE = "$HOME/go/pkg/mod";
    GOPATH = "$HOME/go";
    PATH = "$PATH:${GOBIN}:~/.local/bin";
    COPY_COMMAND = "xc";
  };

  programs.bash.enable = true;
  nix.settings.experimental-features = [ "flakes" "nix-command" "repl-flake" ];
  nix.settings.cores = 4;

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;

    initExtraFirst = ''
      # p10k instant prompt
      local P10K_INSTANT_PROMPT="${config.xdg.cacheHome}/p10k-instant-prompt-''${(%):-%n}.zsh"
      [[ ! -r "$P10K_INSTANT_PROMPT" ]] || source "$P10K_INSTANT_PROMPT"
    '';

    plugins = with pkgs; [
      {
        file = "powerlevel10k.zsh-theme";
        name = "powerlevel10k";
        src = "${zsh-powerlevel10k}/share/zsh-powerlevel10k";
      }
      {
        file = "p10k.zsh";
        name = "powerlevel10k-config";
        src = ./.;
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
    ];

    initExtra = ''
      . ~/.config/nixpkgs/.zshrc
    '';

    # setOption = [
    #   "auto_menu"
    #   "complete_in_word"
    #   "always_to_end"
    #   "list_packed"
    #   "nolistbeep"
    # ];

    history = {
      size = 10000;
      path = "$HOME/.zsh_history";
    };
  };

  programs.fzf.enable = true;

  programs.git = {
    enable = true;
    userName = "${id.gitUsername}";
    userEmail = "${id.email}";
  };

  programs.htop.enable = true;
  # services.tailscaled.enable = true;
  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };

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
