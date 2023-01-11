{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "oauth2-proxy-mastodon";
  version = "7.4.0";

  src = fetchFromGitHub {
    repo = "oauth2-proxy";
    owner = "haileys";
    sha256 = "sha256-j6vxIaWagUa/CxlzJufJXxSDIIT9FzN+C1XmiwhPmTc=";
    rev = "v7.4.0-mastodon1";
  };

  vendorSha256 = "sha256-2WUd2RxeOal0lpp/TuGSyfP1ppvG/Vd3bgsSsNO8ejo=";

  # Taken from https://github.com/oauth2-proxy/oauth2-proxy/blob/master/Makefile
  ldflags = [ "-X main.VERSION=${version}" ];

  meta = with lib; {
    description = "A reverse proxy that provides authentication with Google, Github, or other providers. Using the fork at https://github.com/haileys/oauth2-proxy/tree/mastodon which adds Mastodon oauth support.";
    homepage = "https://github.com/oauth2-proxy/oauth2-proxy/";
    license = licenses.mit;
    maintainers = teams.serokell.members;
  };
}
