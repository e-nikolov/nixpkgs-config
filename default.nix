# # Shell for bootstrapping flake-enabled nix and home-manager
{ pkgs ? let
    # If pkgs is not defined, instantiate nixpkgs from locked commit
    lock = (builtins.fromJSON (builtins.readFile ./flake.lock)).nodes.nixpkgs.locked;
    nixpkgs = fetchTarball {
      url = "https://github.com/nixos/nixpkgs/archive/${lock.rev}.tar.gz";
      sha256 = lock.narHash;
    };
    system = builtins.currentSystem;
    overlays = [ ]; # Explicit blank overlay to avoid interference
  in
  import nixpkgs { inherit system overlays; }
, ...
}: pkgs.mkShell
{
  # Enable experimental features without having to specify the argument
  NIX_CONFIG = "experimental-features = nix-command flakes";
  nativeBuildInputs = with pkgs; [
    (pkgs.buildEnv {
      name = "bootstrap";
      paths = [ ./. ];
      # pathsToLink = [ "/demos" ];
      extraPrefix = "/bootstrap-scripts";
    })
    nix
    home-manager
    git

    sops
    gnupg
    age

    zsh
  ];

  shellHook = ''
    echo ${bootstrap-scripts}
    ls ${bootstrap-scripts}/scripts/
    # exec zsh
  '';
}

# (import (fetchTarball "https://github.com/edolstra/flake-compat/archive/master.tar.gz") {
#   src = ./.;
#   system = builtins.currentSystem;
# }).shellNix
