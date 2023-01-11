package and modules for running a open pull request on oauth2-proxy by github user `haileys` which has mastodon oauth2 support added.
that pr can be found here: https://github.com/oauth2-proxy/oauth2-proxy/pull/1953

we can't simply override the package in nixpkgs because the configuration is not aware that mastodon is a valid backend choice now.
i copied the below from nixpkgs at 9852294f15c380cd61fd441538982426f8ee8ccc, and made modifications to allow configuring mastodon.

nixpkgs/pkgs/servers/oauth2-proxy/default.nix -> package.nix
nixpkgs/nixos/modules/services/security/oauth2_proxy.nix -> nixos_module.nix
nixpkgs/nixos/modules/services/security/oauth2_proxy_nginx.nix -> nixos_nginx_module.nix
