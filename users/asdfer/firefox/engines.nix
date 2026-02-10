{ pkgs }:
{
  "나무위키" = {
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
  "Minecraft Wiki" = {
    urls = [
      {
        template = "https://minecraft.wiki?search={searchTerms}";
      }
    ];
    definedAliases = [ "@mcw" ];
  };
  "Terraria Wiki" = {
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

  "Nix Packages" = {
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

  "Nix Options" = {
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

  "NixOS Wiki" = {
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

  "MyNixOS" = {
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

  "Arch Linux Wiki" = {
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

  "네이버" = {
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
    icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
    definedAliases = [
      "@n"
      "@naver"
    ];
  };

  "Wikipedia" = {
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
    ];
  };

  "GitHub Repositories" = {
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
    definedAliases = [ "@gh" ];
  };

}
