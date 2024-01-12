{
  config,
  pkgs,
  lib,
  ...
}: let
  inherit
    (lib)
    mkEnableOption
    mkPackageOption
    mkBefore
    mkAfter
    mkIf
    pipe
    fileContents
    splitString
    ;
  cfg = config.programs.carapace;
  bin = cfg.package + "/bin/carapace";
in {
  disabledModules = [
    "programs/carapace.nix"
  ];

  meta.maintainers = with lib.maintainers; [weathercold bobvanderlinden];

  options.programs.carapace = {
    enable =
      mkEnableOption "carapace, a multi-shell multi-command argument completer";

    package = mkPackageOption pkgs "carapace" {};

    enableBashIntegration =
      mkEnableOption "Bash integration"
      // {
        default = true;
      };

    enableZshIntegration =
      mkEnableOption "Zsh integration"
      // {
        default = true;
      };

    enableFishIntegration =
      mkEnableOption "Fish integration"
      // {
        default = true;
      };

    enableNushellIntegration =
      mkEnableOption "Nushell integration"
      // {
        default = true;
      };
  };

  config = mkIf cfg.enable {
    home.packages = [cfg.package];

    programs = {
      bash.initExtra = mkIf cfg.enableBashIntegration ''
        source <(${bin} _carapace bash)
      '';

      # source <(${bin} _carapace zsh)
      zsh.completionInit = mkIf cfg.enableZshIntegration (mkAfter ''
        get-env () { echo "''${(P)1}"; }
        set-env () { export "$1=$2"; }
        unset-env () { unset "$1"; }

        function _carapace_lazy {
            source <(carapace $words[1] zsh)
        }

        # Skip the nix completer, since we're using the one from https://github.com/nix-community/nix-zsh-completions
        # compdef _carapace_lazy acpi acpid adb age agg alsamixer ant aplay apropos apt-cache apt-get ar arecord asciinema autoconf avdmanager awk aws az baobab basename bash bash-language-server bat batdiff batgrep batman bats bc benthos black boundary brew brotli bun bunx calibre capslock carapace cargo cargo-clippy cargo-fmt cargo-metadata cargo-rm cargo-set-version cargo-upgrade cargo-watch cat cfdisk charm cheese chgrp chmod chown chpasswd chroma chromium chroot chsh circleci cksum clamav-config clamav-milter clambc clamconf clamd clamdscan clamdtop clamonacc clamscan clamsubmit cmus code code-insiders codecov comm conda conda-content-trust conda-env conky consul coredumpctl cp csplit csview cura curl cut darktable darktable-cli dart date dbt dc dd deadcode delta deno devbox df dfc dict diff diff3 dig dir dircolors direnv dirname dive dlv dmenu dmesg dms dnsmasq docker docker-buildx docker-compose docker-scan dockerd doctl dos2unix downgrade dpkg du ebook-convert egrep electron elvish env envsubst exa expand expr eza faas-cli factor fakechroot fakeroot fastfetch fc-cache fc-cat fc-conflist fc-list fd fdisk ffmpeg fgrep file find firefox fish flatpak flutter fmt fold foot ftp ftpd fzf gatsby gcloud gdb gdu get-env gftp gh gh-dash gimp git git-abort git-alias git-archive-file git-authors git-clang-format git-extras git-info git-standup gitk gitui glab glow gnome-keyring gnome-keyring-daemon gnome-maps gnome-terminal go go-carpet go-tool-asm go-tool-buildid go-tool-cgo go-tool-compile go-tool-covdata go-tool-cover go-tool-dist go-tool-doc go-tool-fix go-tool-link go-tool-nm go-tool-objdump go-tool-pack gocyclo gofmt goimports golangci-lint gonew google-chrome gopls goreleaser goweight gparted gpasswd gpg gpg-agent gradle grep groupadd groupdel groupmems groupmod groups grype gulp gum gunzip gzip halt head helix helm helmsman hexchat hexdump hostid hostname htop http https hugo hwinfo hx i3 i3-scrot i3exit i3lock i3status i3status-rs id imv inkscape inshellisense install ion jar java javac jj join journalctl jq julia just kak kak-lsp kill killall kmonad kompose kotlin kotlinc ktlint kubeadm kubectl last lastb lastlog lazygit lf light lightdm link ln lnav lncrawl locale localectl logname ls lsb_release lsblk lscpu lslocks lslogins lsmem lsns lsusb lua lzcat lzma make makepkg man mcomix md5sum mdbook meld melt micro minikube mitmproxy mkcert mkdir mkfifo mkfs mknod mkswap mktemp modinfo modprobe more mosh mount mousepad mpv mv mvn nano nc ncdu neomutt netcat newman newrelic nfpm ng nice nilaway nix nix-build nix-channel nix-instantiate nix-shell nl nmcli node nohup nomad npm ntpd nu nvim od openscad optipng packer pacman pacman-conf pacman-db-upgrade pacman-key pacman-mirrors palemoon pamac pandoc paru pass passwd paste patch pathchk pcmanfm pgrep picard ping pinky pip pkg pkgsite pkill pnpm podman poweroff powertop pprof pr present prettybat prettyping printenv ps ptx pulumi pwait pwd python qmk qrencode qutebrowser ranger readlink reboot redis-cli restic resume-cli rg rifle rm rmdir rmmod rsync rust-analyzer rustc rustdoc rustup scp scrot sdkmanager sed semver seq set-env sftp sha1sum sha256sum showkey shred shutdown sleep slides soft sort speedtest-cli split ssh ssh-agent ssh-copy-id ssh-keygen st starship stat staticcheck strings stty su sudo sudoedit sudoreplay sulogin sum supervisorctl supervisord svg-term svgcleaner sway swaybar swaybg swayidle swaylock swaymsg swaynag syft sync sysctl systemctl tac tail tar task tea tee telnet templ termux-apt-repo terraform terraform-ls terragrunt terramate tesseract tig tinygo tldr tmate tmux tofu toit.lsp toit.pkg top tor-browser tor-gencert tor-print-ed-signing-cert tor-resolve torsocks touch tr traefik tree truncate ts tsc tsh tshark tsort tty ttyd turbo umount uname unbrotli unexpand uniq unlink unlzma unset-env unxz unzip upower uptime upx useradd userdel usermod users vagrant vault vdir vercel vhs vi viewnior visudo viu vivid vlc volta w watch watchexec watchgnupg waypoint wc wezterm wget whereis which who whoami wine wineboot winepath wineserver winetricks wire wireshark wishlist woeusb xargs xbacklight xdotool xonsh xz xzcat yarn yay yes yj youtube-dl yt-dlp zathura zcat zip zoxide
        compdef _carapace_lazy acpi acpid adb age agg alsamixer ant aplay apropos apt-cache apt-get ar arecord asciinema autoconf avdmanager awk aws az baobab basename bash bash-language-server bat batdiff batgrep batman bats bc benthos black boundary brew brotli bun bunx calibre capslock carapace cargo cargo-clippy cargo-fmt cargo-metadata cargo-rm cargo-set-version cargo-upgrade cargo-watch cat cfdisk charm cheese chgrp chmod chown chpasswd chroma chromium chroot chsh circleci cksum clamav-config clamav-milter clambc clamconf clamd clamdscan clamdtop clamonacc clamscan clamsubmit cmus code code-insiders codecov comm conda conda-content-trust conda-env conky consul coredumpctl cp csplit csview cura curl cut darktable darktable-cli dart date dbt dc dd deadcode delta deno devbox df dfc dict diff diff3 dig dir dircolors direnv dirname dive dlv dmenu dmesg dms dnsmasq docker docker-buildx docker-compose docker-scan dockerd doctl dos2unix downgrade dpkg du ebook-convert egrep electron elvish env envsubst exa expand expr eza faas-cli factor fakechroot fakeroot fastfetch fc-cache fc-cat fc-conflist fc-list fd fdisk ffmpeg fgrep file find firefox fish flatpak flutter fmt fold foot ftp ftpd fzf gatsby gcloud gdb gdu get-env gftp gh gh-dash gimp git git-abort git-alias git-archive-file git-authors git-clang-format git-extras git-info git-standup gitk gitui glab glow gnome-keyring gnome-keyring-daemon gnome-maps gnome-terminal go go-carpet go-tool-asm go-tool-buildid go-tool-cgo go-tool-compile go-tool-covdata go-tool-cover go-tool-dist go-tool-doc go-tool-fix go-tool-link go-tool-nm go-tool-objdump go-tool-pack gocyclo gofmt goimports golangci-lint gonew google-chrome gopls goreleaser goweight gparted gpasswd gpg gpg-agent gradle grep groupadd groupdel groupmems groupmod groups grype gulp gum gunzip gzip halt head helix helm helmsman hexchat hexdump hostid hostname htop http https hugo hwinfo hx i3 i3-scrot i3exit i3lock i3status i3status-rs id imv inkscape inshellisense install ion jar java javac jj join journalctl jq julia just kak kak-lsp kill killall kmonad kompose kotlin kotlinc ktlint kubeadm kubectl last lastb lastlog lazygit lf light lightdm link ln lnav lncrawl locale localectl logname ls lsb_release lsblk lscpu lslocks lslogins lsmem lsns lsusb lua lzcat lzma make makepkg man mcomix md5sum mdbook meld melt micro minikube mitmproxy mkcert mkdir mkfifo mkfs mknod mkswap mktemp modinfo modprobe more mosh mount mousepad mpv mv mvn nano nc ncdu neomutt netcat newman newrelic nfpm ng nice nilaway nix-build nix-channel nix-instantiate nix-shell nl nmcli node nohup nomad npm ntpd nu nvim od openscad optipng packer pacman pacman-conf pacman-db-upgrade pacman-key pacman-mirrors palemoon pamac pandoc paru pass passwd paste patch pathchk pcmanfm pgrep picard ping pinky pip pkg pkgsite pkill pnpm podman poweroff powertop pprof pr present prettybat prettyping printenv ps ptx pulumi pwait pwd python qmk qrencode qutebrowser ranger readlink reboot redis-cli restic resume-cli rg rifle rm rmdir rmmod rsync rust-analyzer rustc rustdoc rustup scp scrot sdkmanager sed semver seq set-env sftp sha1sum sha256sum showkey shred shutdown sleep slides soft sort speedtest-cli split ssh ssh-agent ssh-copy-id ssh-keygen st starship stat staticcheck strings stty su sudo sudoedit sudoreplay sulogin sum supervisorctl supervisord svg-term svgcleaner sway swaybar swaybg swayidle swaylock swaymsg swaynag syft sync sysctl systemctl tac tail tar task tea tee telnet templ termux-apt-repo terraform terraform-ls terragrunt terramate tesseract tig tinygo tldr tmate tmux tofu toit.lsp toit.pkg top tor-browser tor-gencert tor-print-ed-signing-cert tor-resolve torsocks touch tr traefik tree truncate ts tsc tsh tshark tsort tty ttyd turbo umount uname unbrotli unexpand uniq unlink unlzma unset-env unxz unzip upower uptime upx useradd userdel usermod users vagrant vault vdir vercel vhs vi viewnior visudo viu vivid vlc volta w watch watchexec watchgnupg waypoint wc wezterm wget whereis which who whoami wine wineboot winepath wineserver winetricks wire wireshark wishlist woeusb xargs xbacklight xdotool xonsh xz xzcat yarn yay yes yj youtube-dl yt-dlp zathura zcat zip zoxide
      '');

      fish.interactiveShellInit = mkIf cfg.enableFishIntegration ''
        ${bin} _carapace fish | source
      '';

      nushell = mkIf cfg.enableNushellIntegration {
        # Note, the ${"$"} below is a work-around because xgettext otherwise
        # interpret it as a Bash i18n string.
        extraEnv = ''
          let carapace_cache = "${config.xdg.cacheHome}/carapace"
          if not ($carapace_cache | path exists) {
            mkdir $carapace_cache
          }
          ${bin} _carapace nushell | save -f ${"$"}"($carapace_cache)/init.nu"
        '';
        extraConfig = ''
          source ${config.xdg.cacheHome}/carapace/init.nu
        '';
      };
    };

    xdg.configFile = mkIf (config.programs.fish.enable && cfg.enableFishIntegration) (
      # Convert the entries from `carapace --list` to empty
      # xdg.configFile."fish/completions/NAME.fish" entries.
      #
      # This is to disable fish builtin completion for each of the
      # carapace-supported completions It is in line with the instructions from
      # carapace-bin:
      #
      #   carapace --list | awk '{print $1}' | xargs -I{} touch ~/.config/fish/completions/{}.fish
      #
      # See https://github.com/rsteube/carapace-bin#getting-started
      let
        carapaceListFile =
          pkgs.runCommandLocal "carapace-list" {
            buildInputs = [cfg.package];
          } ''
            ${bin} --list > $out
          '';
      in
        pipe carapaceListFile [
          fileContents
          (splitString "\n")
          (map (builtins.match "^([a-z0-9-]+) .*"))
          (builtins.filter
            (match: match != null && (builtins.length match) > 0))
          (map (match: builtins.head match))
          (map (name: {
            name = "fish/completions/${name}.fish";
            value = {text = "";};
          }))
          builtins.listToAttrs
        ]
    );
  };
}
