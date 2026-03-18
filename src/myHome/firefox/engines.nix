{ pkgs }:
{
  "namuwiki" = {
    name = "나무위키";
    urls = [
      {
        template = "https://namu.wiki/go/{searchTerms}";
      }
    ];
    definedAliases = [
      "@namu"
      "@namuw"
    ];
  };
  "minecraft-wiki" = {
    name = "Minecraft Wiki";
    urls = [
      {
        template = "https://minecraft.wiki?search={searchTerms}";
      }
    ];
    definedAliases = [ "@mcw" ];
  };
  "terraria-wiki" = {
    name = "Terraria Wiki";
    urls = [
      {
        template = "https://terraria.wiki.gg/wiki/Special:Search";
        params = [
          {
            name = "search";
            value = "{searchTerms}";
          }
          {
            name = "go";
            value = "Go";
          }
        ];
      }
    ];
    definedAliases = [ "@trw" ];
  };

  "nix-packages" = {
    name = "Nix Packages";
    urls = [
      {
        template = "https://search.nixos.org/packages";
        params = [
          {
            name = "channel";
            value = "25.11";
          }
          {
            name = "query";
            value = "{searchTerms}";
          }
        ];
      }
    ];
    icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
    definedAliases = [ "@np" ];
  };

  "nix-options" = {
    name = "Nix Options";
    urls = [
      {
        template = "https://search.nixos.org/options";
        params = [
          {
            name = "channel";
            value = "25.11";
          }
          {
            name = "query";
            value = "{searchTerms}";
          }
        ];
      }
    ];
    icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
    definedAliases = [ "@no" ];
  };

  "nixos-wiki" = {
    name = "NixOS Wiki";
    urls = [
      {
        template = "https://wiki.nixos.org/w/index.php";
        params = [
          {
            name = "search";
            value = "{searchTerms}";
          }
        ];
      }
    ];
    icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
    definedAliases = [ "@nw" ];
  };

  "noogle" = {
    name = "Noogλe";
    urls = [
      {
        template = "https://noogle.dev/q";
        params = [
          {
            name = "term";
            value = "{searchTerms}";
          }
        ];
      }
    ];
    definedAliases = [ "@ng" ];
  };

  "mynixos" = {
    name = "MyNixOS";
    urls = [
      {
        template = "https://mynixos.com/search";
        params = [
          {
            name = "q";
            value = "{searchTerms}";
          }
        ];
      }
    ];
    definedAliases = [ "@myn" ];
  };

  "archlinux-wiki" = {
    name = "Arch Linux Wiki";
    urls = [
      {
        template = "https://wiki.archlinux.org/index.php";
        params = [
          {
            name = "search";
            value = "{searchTerms}";
          }
        ];
      }
    ];
    definedAliases = [ "@aw" ];
  };

  "naver" = {
    name = "네이버";
    urls = [
      {
        template = "https://search.naver.com/search.naver";
        params = [
          {
            name = "query";
            value = "{searchTerms}";
          }
        ];
      }
    ];
    definedAliases = [
      "@n"
      "@naver"
    ];
  };

  "naver-map" = {
    name = "네이버 지도";
    urls = [
      {
        template = "https://map.naver.com/p/search/{searchTerms}";
      }
    ];
    definedAliases = [
      "@nmap"
    ];
  };

  "wikipedia" = {
    name = "Wikipedia";
    urls = [
      {
        template = "https://en.wikipedia.org/wiki/";
        params = [
          {
            name = "search";
            value = "{searchTerms}";
          }
        ];
      }
    ];
    definedAliases = [
      "@w"
      "@wiki"
      "@wikipedia"
    ];
  };

  "github-code" = {
    name = "GitHub Code";
    urls = [
      {
        template = "https://github.com/search";
        params = [
          {
            name = "q";
            value = "{searchTerms}";
          }
          {
            name = "type";
            value = "code";
          }
        ];
      }
    ];
    definedAliases = [ "@ghcode" ];
  };

  "github-repos" = {
    name = "GitHub Repositories";
    urls = [
      {
        template = "https://github.com/search";
        params = [
          {
            name = "q";
            value = "{searchTerms}";
            type = "repositories";
          }
        ];
      }
    ];
    definedAliases = [
      "@gh"
      "@ghr"
      "@github"
    ];
  };

  "github-issues" = {
    name = "GitHub Issues";
    urls = [
      {
        template = "https://github.com/search";
        params = [
          {
            name = "q";
            value = "{searchTerms}";
          }
          {
            name = "type";
            value = "issues";
          }
        ];
      }
    ];
    definedAliases = [ "@ghi" ];
  };

  "github-prs" = {
    name = "GitHub Pull Requests";
    urls = [
      {
        template = "https://github.com/search";
        params = [
          {
            name = "q";
            value = "{searchTerms}";
          }
          {
            name = "type";
            value = "pullrequests";
          }
        ];
      }
    ];
    definedAliases = [ "@ghpr" ];
  };

  "github-discussions" = {
    name = "GitHub Discussions";
    urls = [
      {
        template = "https://github.com/search";
        params = [
          {
            name = "q";
            value = "{searchTerms}";
          }
          {
            name = "type";
            value = "discussions";
          }
        ];
      }
    ];
    definedAliases = [ "@ghd" ];
  };

  "github-users" = {
    name = "GitHub Users";
    urls = [
      {
        template = "https://github.com/search";
        params = [
          {
            name = "q";
            value = "{searchTerms}";
          }
          {
            name = "type";
            value = "users";
          }
        ];
      }
    ];
    definedAliases = [ "@ghu" ];
  };

  "github-commits" = {
    name = "GitHub Commits";
    urls = [
      {
        template = "https://github.com/search";
        params = [
          {
            name = "q";
            value = "{searchTerms}";
          }
          {
            name = "type";
            value = "commits";
          }
        ];
      }
    ];
    definedAliases = [ "@ghc" ];
  };

  "github-packages" = {
    name = "GitHub Packages";
    urls = [
      {
        template = "https://github.com/search";
        params = [
          {
            name = "q";
            value = "{searchTerms}";
          }
          {
            name = "type";
            value = "registrypackages";
          }
        ];
      }
    ];
    definedAliases = [ "@ghp" ];
  };

  "github-wikis" = {
    name = "GitHub Wikis";
    urls = [
      {
        template = "https://github.com/search";
        params = [
          {
            name = "q";
            value = "{searchTerms}";
          }
          {
            name = "type";
            value = "wikis";
          }
        ];
      }
    ];
    definedAliases = [ "@ghw" ];
  };

  "github-topics" = {
    name = "GitHub Topics";
    urls = [
      {
        template = "https://github.com/search";
        params = [
          {
            name = "q";
            value = "{searchTerms}";
          }
          {
            name = "type";
            value = "topics";
          }
        ];
      }
    ];
    definedAliases = [ "@ght" ];
  };

  "github-marketplace" = {
    name = "GitHub Marketplace";
    urls = [
      {
        template = "https://github.com/search";
        params = [
          {
            name = "q";
            value = "{searchTerms}";
          }
          {
            name = "type";
            value = "marketplace";
          }
        ];
      }
    ];

    definedAliases = [ "@ghm" ];
  };

  "rust-std" = {
    name = "Rust Standrard Library";
    urls = [
      {
        template = "https://doc.rust-lang.org/std/";
        params = [
          {
            name = "search";
            value = "{searchTerms}";
          }
        ];
      }
    ];
    definedAliases = [ "@rust" ];
  };

  "google" = {
    name = "Google";
    urls = [
      {
        template = "https://www.google.com/search";
        params = [
          {
            name = "q";
            value = "{searchTerms}";
          }
        ];
      }
    ];
    definedAliases = [
      "@g"
      "@google"
    ];
  };
}
