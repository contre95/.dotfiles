{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    policies =
      {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
        DisablePocket = true;
        DisableFirefoxAccounts = true;
        DisableAccounts = true;
        DisableFirefoxScreenshots = true;
        OverrideFirstRunPage = "";
        OverridePostUpdatePage = "";
        DontCheckDefaultBrowser = true;
        DisplayBookmarksToolbar = "never"; # alternatives: "always" or "newtab"
        DisplayMenuBar = "default-off"; # alternatives: "always", "never" or "default-on"
        SearchBar = "unified"; # alternative: "separate"
      };
    profiles = {
      ContreKiosk = {
        id = 1;
      };
      Contre = {
        id = 0;
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          privacy-badger
          # firefox-color
          darkreader
          sponsorblock
          improved-tube
          # multi-account-containers
          h264ify
          # i-dont-care-about-cookies
        ];

        settings = {
          "signon.rememberSignons" = false;
          "browser.startup.homepage" = "https://contre.io";
          "general.smoothScrolling" = true;
          # Enable DRM support (Spotify, Netflix, so on and so forth... i really don't want to enable this, but... oh well...)
          "media.eme.enabled" = true;
          "media.gmp-widevinecdm.enabled" = true;
          "media.gmp-widevinecdm.visible" = true;
          "browser.newtabpage.enabled" = false;
          "browser.newtab.url" = "about:blank";
          # Disable Activity Stream
          "browser.newtabpage.introShown" = true;
          "browser.newtab.preload" = false;
          "browser.newtabpage.directory.ping" = "";
          "browser.newtabpage.activity-stream.feeds.telemetry" = false;
          "browser.translations.automaticallyPopup" = false;
          "browser.newtabpage.activity-stream.telemetry" = false;
          "browser.ping-centre.telemetry" = false;
          "toolkit.telemetry.archive.enabled" = false;
          "toolkit.telemetry.bhrPing.enabled" = false;
          "toolkit.telemetry.enabled" = false;
          "toolkit.telemetry.firstShutdownPing.enabled" = false;
          "toolkit.telemetry.hybridContent.enabled" = false;
          "toolkit.telemetry.newProfilePing.enabled" = false;
          "toolkit.telemetry.reportingpolicy.firstRun" = false;
          "toolkit.telemetry.shutdownPingSender.enabled" = false;
          "toolkit.telemetry.unified" = false;
          "toolkit.telemetry.updatePing.enabled" = false;
          # Remove annoying indicator that's shown when webcam or mic is in use via firefox.
          "privacy.webrtc.legacyGlobalIndicator" = false;
          "privacy.webrtc.hideGlobalIndicator" = true;
        };

        search = {
          force = true;
          engines = {
            "Home Manager" = {
              urls = [{ template = "https://mipmip.github.io/home-manager/search?query={searchTerms}"; }];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "hm" ];
            };
            "Reddit" = {
              urls = [{ template = "https://www.reddit.com/search/?q={searchTerms}"; }];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "re" ];
            };
            "Home Manager Options" = {
              urls = [{ template = "https://nix-community.github.io/home-manager/options.html#opt-{searchTerms}"; }];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "ho" ];
            };
            "Nix Packages" = {
              urls = [{ template = "https://search.nixos.org/packages?query={searchTerms}"; }];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "np" ];
            };
            "NixOS Options" = {
              urls = [{ template = "https://search.nixos.org/options?query={searchTerms}"; }];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "no" ];
            };
            "NixOS Wiki" = {
              urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "nw" ];
            };
            "SearXNG" = {
              urls = [{ template = "https://searx.org/search?q={searchTerms}"; }];
              iconUpdateURL = "https://searx.org/static/themes/simple/img/favicon.svg?ee99f2c4793c32451062177672c8ab309dbef940";
              updateInterval = 7 * 24 * 60 * 60 * 1000;
              definedAliases = [ "@sex" ];
            };
            "Ecosia" = {
              urls = [{ template = "https://www.ecosia.org/search?q={searchTerms}"; }];
              iconUpdateURL = "https://cdn-static.ecosia.org/static/icons/favicon.ico";
              updateInterval = 7 * 24 * 60 * 60 * 1000;
              definedAliases = [ "@eco" ];
            };
            "GitHub" = {
              urls = [{ template = "https://github.com/search?q={searchTerms}"; }];
              iconUpdateURL = "https://blog.contre.io/images/img.svg";
              definedAliases = [ "gh" ];
            };
            "Start Page" = {
              urls = [{ template = "https://www.startpage.com/sp/search?query={searchTerms}"; }];
              iconUpdateURL = "https://www.startpage.com/sp/cdn/favicons/favicon--dark.ico";
              updateInterval = 7 * 24 * 60 * 60 * 1000;
              definedAliases = [ "@start" ];
            };
            "SteamDB" = {
              urls = [{ template = "https://steamdb.info/search/?a=app&q={searchTerms}"; }];
              iconUpdateURL = "https://steamdb.info/static/logos/512px.png";
              updateInterval = 7 * 24 * 60 * 60 * 1000;
              definedAliases = [ "sdb" ];
            };
            "Google" = {
              urls = [{ template = "https://www.google.com/search?q={searchTerms}"; }];
              iconUpdateURL = "https://www.google.com/favicon.ico";
              updateInterval = 7 * 24 * 60 * 60 * 1000;
              definedAliases = [ "go" ];
            };
            "Twitter" = {
              urls = [{ template = "https://twitter.com/search?q={searchTerms}&src = typed_query "; }];
              iconUpdateURL = " https://abs.twimg.com/favicons/twitter.2.ico ";
              updateInterval = 7 * 24 * 60 * 60 * 1000;
              definedAliases = [ "x" ];
            };
            "ProtonDB" = {
              urls = [{ template = "https://www.protondb.com/search?q={searchTerms}"; }];
              iconUpdateURL = "https://www.protondb.com/sites/protondb/images/favicon.ico";
              updateInterval = 7 * 24 * 60 * 60 * 1000;
              definedAliases = [ "pdb" ];
            };
            "AmazonES" = {
              urls = [{ template = "https://www.amazon.es/s?k={searchTerms}"; }];
              iconUpdateURL = "https://upload.wikimedia.org/wikipedia/commons/a/a9/Amazon_logo.svg";
              definedAliases = [ "amz" ];
            };
            "Youtube" = {
              urls = [{ template = "https://youtube.com/search?q={searchTerms}"; }];
              iconUpdateURL = "https://www.youtube.com/s/desktop/5d5de6d9/img/favicon.ico";
              updateInterval = 7 * 24 * 60 * 60 * 1000;
              definedAliases = [ "y" "@youtube" ];
            };
            "YoutubeMusic" = {
              urls = [{ template = "https://music.youtube.com/search?q={searchTerms}"; }];
              iconUpdateURL = "https://www.youtube.com/s/desktop/5d5de6d9/img/favicon.ico";
              updateInterval = 7 * 24 * 60 * 60 * 1000;
              definedAliases = [ "@ytm" "@ym" ];
            };
            "Spotify" = {
              urls = [{ template = "https://open.spotify.com/search/{searchTerms}"; }];
              iconUpdateURL = "https://www.scdn.co/i/_global/favicon.png";
              updateInterval = 7 * 24 * 60 * 60 * 1000;
              definedAliases = [ "sp" ];
            };
            "DuckDuckGo" = {
              urls = [{ template = "https://duckduckgo.com/?q={searchTerms}"; }];
              iconUpdateURL = "https://blog.contre.io/images/img.svg";
              definedAliases = [ "ddg" ];
            };
          };
          default = "DuckDuckGo";
        };

        # userChrome = import ../../../../misc/themes/cascade + builtins.readFile ../../../../misc/themes/everblush/cascade.css;

        extraConfig = ''
          	# user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
          	user_pref("full-screen-api.ignore-widgets", false);
          	user_pref("media.ffmpeg.vaapi.enabled", true);
            lockPref("signon.rememberSignons",false);
          	user_pref("media.rdd-vpx.enabled", true);
        '';
      };
    };
  };
}
