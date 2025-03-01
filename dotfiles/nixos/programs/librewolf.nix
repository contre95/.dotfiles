{ pkgs, ... }:
let
  unstable = import <nixos-unstable> {
    config = {
      allowUnfree = true;
    };
  };
in
{
  programs.librewolf = {
    # package = (pkgs.wrapFirefox (pkgs.firefox-devedition-unwrapped.override { pipewireSupport = true; }) { });
    package = unstable.librewolf;
    enable = true;
    policies = {
      ExtensionSettings = {
        "*".installation_mode = "blocked";
        "jid1-MnnxcxisBPnSXQ@jetpack" = {
          install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/privacy-badger17/latest.xpi";
          installation_mode = "force_installed";
        };

        "sponsorBlocker@ajay.app" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
          installation_mode = "force_installed";
        };

        "@testpilot-containers" = {
          install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/multi-account-containers/latest.xpi";
          installation_mode = "force_installed";
        };

        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
      };
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
      # DisableAccounts = true;
      DisableFirefoxScreenshots = true;
      # OverrideFirstRunPage = "";
      # OverridePostUpdatePage = "";
      DontCheckDefaultBrowser = true;
      DisplayBookmarksToolbar = "never"; # alternatives: "always" or "newtab"
      DisplayMenuBar = "never"; # alternatives: "always", "never" or "default-on"
      SearchBar = "unified"; # alternative: "separate"
      SecurityDevices = {
        Add = {
          "OpenSC PKCS#11" = "${pkgs.opensc}/lib/opensc-pkcs11.so";
        };
      };
    };
    profiles.default = {
      # userChrome = builtins.readFile ./userChrome.css;
      # userContent = builtins.readFile ./userChrome.css;
      search = {
        force = true;
        engines = {
          # don't need these default ones
          "Amazon.com".metaData.hidden = true;
          "Bing".metaData.hidden = true;
          "eBay".metaData.hidden = true;
          "DuckDuckGo" = {
            urls = [
              {
                template = "https://duckduckgo.com";
                params = [
                  {
                    name = "q";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            definedAliases = [ ",d" ];
          };
          "Google" = {
            urls = [
              {
                template = "https://google.com/search";
                params = [
                  {
                    name = "q";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            definedAliases = [ ",g" ];
          };
          "Home Manager Options" = {
            urls = [
              {
                template = "https://mipmip.github.io/home-manager-option-search/";
                params = [
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            definedAliases = [ "ho" ];
          };
          "Nix Packages" = {
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            definedAliases = [ "np" ];
          };
          "YouTube" = {
            urls = [
              {
                template = "https://www.youtube.com/results";
                params = [
                  {
                    name = "search_query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            definedAliases = [ "y" ];
          };
          "Wikipedia" = {
            urls = [
              {
                template = "https://en.wikipedia.org/wiki/Special:Search";
                params = [
                  {
                    name = "search";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            definedAliases = [ "wik" ];
          };
          "DockerHub" = {
            urls = [
              {
                template = "https://hub.docker.com/search";
                params = [
                  {
                    name = "q";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            definedAliases = [ "dh" ];
          };
          "GitHub" = {
            urls = [
              {
                template = "https://github.com/search";
                params = [
                  {
                    name = "q";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            definedAliases = [ "gh" ];
          };
        };
        default = "DuckDuckGo";
      };
      id = 0;
      containersForce = true;
      containers = {
        sinenomine = {
          id = 1;
          icon = "chill";
          color = "purple";
        };
        nublado = {
          id = 2;
          icon = "chill";
          color = "blue";
        };
      };
      settings = {
        # settings = lib.mapAttrs' (n: lib.nameValuePair "pref.${n}") {
        "app.update.auto" = true; # disable auto update
        "dom.security.https_only_mode" = true; # force https
        "extensions.pocket.enabled" = false; # disable pocket
        "browser.quitShortcut.disabled" = true; # disable ctrl+q
        "browser.download.panel.shown" = true; # show download panel
        "signon.rememberSignons" = false; # disable saving passwords
        "identity.fxaccounts.enabled" = false; # disable librewolf accounts
        "app.shield.optoutstudies.enabled" = false; # disable shield studies
        "browser.shell.checkDefaultBrowser" = false; # don't check if default browser
        "browser.bookmarks.restore_default_bookmarks" = false; # don't restore default bookmarks
        # Download handling
        "browser.download.dir" = "/home/meain/down"; # default download dir
        "browser.startup.page" = 3; # restore previous session
        # UI changes
        # "browser.uidensity" = 1; # enable dense UI
        "general.autoScroll" = true; # enable autoscroll
        # "browser.compactmode.show" = true; # enable compact mode
        # "browser.tabs.firefox-view" = false; # enable librewolf view
        "startup.homepage_welcome_url" = ""; # disable welcome page
        "browser.newtabpage.enabled" = false; # disable new tab page
        "full-screen-api.ignore-widgets" = true; # fullscreen within window
        "browser.toolbars.bookmarks.visibility" = "never"; # hide bookmarks toolbar
        "browser.aboutConfig.showWarning" = false; # disable warning about about:config
        "media.videocontrols.picture-in-picture.video-toggle.enabled" = true; # disable picture in picture button

        # Privacy
        "privacy.resistFingerprinting" = false;
        # "privacy.clearOnShutdown.cache" = false;
        "privacy.clearOnShutdown.history" = false;
        "privacy.clearOnShutdown_v2.siteSettings" = false;
        "privacy.clearOnShutdown_v2.cookiesAndStorage" = false;
        "services.sync.prefs.sync.privacy.clearOnShutdown_v2.history" = false;
        "services.sync.prefs.sync.privacy.clearOnShutdown_v2.siteSettings" = false;
        "services.sync.prefs.sync.privacy.clearOnShutdown_v2.sessions" = false;
        "services.sync.prefs.sync.privacy.clearOnShutdown_v2.cookies" = false;
        "services.sync.prefs.sync.privacy.clearOnShutdown.history" = false;
        "services.sync.prefs.sync.privacy.clearOnShutdown.siteSettings" = false;
        "services.sync.prefs.sync.privacy.clearOnShutdown.sessions" = false;
        "services.sync.prefs.sync.privacy.clearOnShutdown.cookies" = false;
        "privacy.clearOnShutdown.cookies" = false;
        "browser.discovery.enabled" = false; # disable discovery
        "browser.search.suggest.enabled" = false; # disable search suggestions
        "browser.contentblocking.category" = "custom"; # set tracking protection to custom
        "dom.private-attribution.submission.enabled" = false; # stop doing dumb stuff mozilla
        "browser.protections_panel.infoMessage.seen" = true; # disable tracking protection info

        # Disable telemetry
        "toolkit.telemetry.enabled" = false;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "svg.context-properties.content.enabled" = true;
        "toolkit.telemetry.unified" = false;
        "browser.ping-centre.telemetry" = false;
        "toolkit.telemetry.archive.enabled" = false;
        "toolkit.telemetry.bhrPing.enabled" = false;
        "toolkit.telemetry.updatePing.enabled" = false;
        "browser.translations.automaticallyPopup" = false;
        "toolkit.telemetry.hybridContent.enabled" = false;
        "toolkit.telemetry.newProfilePing.enabled" = false;
        "toolkit.telemetry.reportingpolicy.firstRun" = false;
        "toolkit.telemetry.firstShutdownPing.enabled" = false;
        "browser.newtabpage.activity-stream.telemetry" = false;
        "toolkit.telemetry.shutdownPingSender.enabled" = false;
        "browser.newtabpage.activity-stream.feeds.telemetry" = false;

        # let me close and open tabs without confirmation
        "browser.tabs.loadInBackground" = true; # open new tab in background
        "browser.tabs.loadBookmarksInTabs" = true; # open bookmarks in new tab
        "browser.tabs.warnOnOpen" = false; # don't warn when opening multiple tabs
        "browser.tabs.warnOnQuit" = false; # don't warn when closing multiple tabs
        "browser.tabs.warnOnClose" = false; # don't warn when closing multiple tabs
        "browser.tabs.loadDivertedInBackground" = false; # open new tab in background
        "browser.tabs.warnOnCloseOtherTabs" = false; # don't warn when closing multiple tabs
        "browser.tabs.closeWindowWithLastTab" = false; # don't close window when last tab is closed

        # other
        "media.autoplay.default" = 0; # enable autoplay on open
        "devtools.toolbox.host" = "right"; # move devtools to right
        "devtools.theme" = "dark";
        # "browser.ssb.enabled" = true; # enable site specific browser
        "media.rdd-vpx.enabled" = true; # enable hardware acceleration
        "devtools.cache.disabled" = true; # disable caching in devtools
        "media.ffmpeg.vaapi.enabled" = true; # enable hardware acceleration

        # Fonts
        "font.size.fixed.x-western" = 15;
        "font.minimum-size.x-western" = 13;
        "font.size.variable.x-western" = 15;
        "font.size.monospace.x-western" = 15;
        "browser.display.use_document_fonts" = 1;
        "browser.link.open_newwindow.restriction" = 0;

        "browser.fixup.domainsuffixwhitelist.home" = true;
        "browser.fixup.domainwhitelist.server.home" = true;
        # "keyword.enable" = false; # Disable search when typing unexistent TLD
      };
    };
  };
}
