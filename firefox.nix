{ ... }:
{
  # Install firefox.
  programs.firefox = {
    enable = true;

    policies =
      {
      ExtensionSettings =
      let
      generate_extension_settings =
        ids: builtins.listToAttrs (
        map
        (
          id: {
            name = id;
            value = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/${id}/latest.xpi";
              installation_mode = "normal_installed";
            };
          }
        )
        ids
      ); in
      generate_extension_settings [
        "ublock0@raymondhill.net"
        "{446900e4-71c2-419f-a6a7-df9c091e268b}"
      ];
    };
  };
}
