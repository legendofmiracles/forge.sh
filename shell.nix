{ pkgs ? import <nixpkgs> {}  }:
pkgs.mkShell {
          nativeBuildInputs = with pkgs; [ curl fzf libxml2 adoptopenjdk-hotspot-bin-8 ];
          shellHook = ''
            ./forge.sh
          '';
}
