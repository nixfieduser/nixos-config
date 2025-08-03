{ config, inputs, pkgs, lib,... }:{

    programs.firefox = {
    enable = true;

    languagePacks = [ "en-US" "br" ];

    profiles.default.search = {
        force           = true;
        default         = "DuckDuckGo";
        privateDefault  = "DuckDuckGo";
        };

    preferences = {
        "browser.startup.homepage"      = "previous-session";
        "privacy.resistFingerprinting"  = true;
        };

    policies = {
        DisableTelemetry = true;
        DisablePocket = true;
        DisableFirefoxStudies = true;

        ExtensionSettings = let
            moz = short: "https://addons.mozilla.org/firefox/downloads/latest/${short}/latest.xpi";
            in {
                    "*".installation_mode = "blocked";

            #Extension ID available on about:support

                    "uBlock0@raymondhill.net" = {
                        install_url       = moz "ublock-origin";
                        installation_mode = "force_installed";
                        updates_disabled  = true; };

                    "{c2c003ee-bd69-42a2-b0e9-6f34222cb046}" = {
                        install_url       = moz "auto-tab-discard";
                        installation_mode = "force_installed";
                        updates_disabled  = true;  };

                    "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
                        install_url       = moz "bitwarden-password-manager";
                        installation_mode = "force_installed";
                        updates_disabled  = true;  };

                    "vimium-c@gdh1995.cn" = {
                        install_url       = moz "vimium-c";
                        installation_mode = "force_installed";
                        updates_disabled  = true;  };

                    "@testpilot-containers" = {
                        install_url       = moz "multi-account-containers";
                        installation_mode = "force_installed";
                        updates_disabled  = true;  };

                    "languagetool-webextension@languagetool.org" = {
                        install_url       = moz "languagetool";
                        installation_mode = "force_installed";
                        updates_disabled  = true;  };

                };

        };


    };

}
