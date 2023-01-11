{
  description = "pieces of nixpkgs that I needed to override in isolation";

  inputs = {
    nixpkgs.url      = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url  = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    (flake-utils.lib.eachDefaultSystem (system:
      let
        # overlay containing packages built in this repo
        mypkgoverlay = final: prev: {
          oauth2-proxy-with-mastodon = final.callPackage ./oauth2-proxy/package.nix { };
        };
        overlays = [ mypkgoverlay ];
        pkgs = import nixpkgs {
          inherit system overlays;
        };
      in
      {
        packages = {
          oauth2-proxy-with-mastodon = pkgs.oauth2-proxy-with-mastodon;
        };
        nixosModules = {
          oauth2-proxy-with-mastodon = (import ./oauth2-proxy/nixos_module.nix pkgs self );
          oauth2-proxy-with-mastodon-nginx = (import ./oauth2-proxy/nixos_nginx_module.nix self);
        };
      }
    ));
}

