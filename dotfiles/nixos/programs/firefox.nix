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
        # OverrideFirstRunPage = "";
        # OverridePostUpdatePage = "";
        DontCheckDefaultBrowser = true;
        DisplayBookmarksToolbar = "never"; # alternatives: "always" or "newtab"
        DisplayMenuBar = "default-on"; # alternatives: "always", "never" or "default-on"
        SearchBar = "unified"; # alternative: "separate"
      };
    profiles.ContreKiosk = {
      id = 1;
    };
    profiles.Contre = {
      id = 0;
      containersForce = true;
      containers = {
        sinenomine = {
          id = 1;
          icon = "chill";
          color = "purple";
        };
      };
      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        # https://nur.nix-community.org/repos/rycee/
        ublock-origin
        hover-zoom-plus
        # firefox-color
        sponsorblock
        darkreader
        privacy-badger
        improved-tube
        multi-account-containers
        h264ify
        # i-dont-care-about-cookies
      ];

      settings = {
        "dom.security.https_only_mode" = true; # force https
        "browser.download.panel.shown" = true; # show download panel
        "identity.fxaccounts.enabled" = false; # disable firefox accounts
        "signon.rememberSignons" = false; # disable saving passwords
        "extensions.pocket.enabled" = false; # disable pocket
        "app.shield.optoutstudies.enabled" = false; # disable shield studies
        "app.update.auto" = false; # disable auto update
        "browser.bookmarks.restore_default_bookmarks" = false; # don't restore default bookmarks
        "browser.quitShortcut.disabled" = true; # disable ctrl+q
        "browser.shell.checkDefaultBrowser" = false; # don't check if default browser

        # download handling
        "browser.download.dir" = "/home/meain/down"; # default download dir
        "browser.startup.page" = 3; # restore previous session

        # ui changes
        "browser.aboutConfig.showWarning" = false; # disable warning about about:config
        "browser.compactmode.show" = true; # enable compact mode
        "browser.uidensity" = 1; # enable dense UI
        "general.autoScroll" = true; # enable autoscroll
        "browser.tabs.firefox-view" = false; # enable firefox view
        "browser.toolbars.bookmarks.visibility" = "never"; # hide bookmarks toolbar
        "media.videocontrols.picture-in-picture.video-toggle.enabled" = true; # disable picture in picture button
        "startup.homepage_welcome_url" = ""; # disable welcome page
        "browser.newtabpage.enabled" = false; # disable new tab page
        # "toolkit.legacyUserProfileCustomizations.stylesheets" = true; # enable userChrome.css
        "full-screen-api.ignore-widgets" = true; # fullscreen within window

        # privacy
        "browser.contentblocking.category" = "custom"; # set tracking protection to custom
        "browser.discovery.enabled" = false; # disable discovery
        "browser.search.suggest.enabled" = false; # disable search suggestions
        "browser.protections_panel.infoMessage.seen" = true; # disable tracking protection info
        "dom.private-attribution.submission.enabled" = false; # stop doing dumb stuff mozilla

        # disable telemetry
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

        # let me close and open tabs without confirmation
        "browser.tabs.closeWindowWithLastTab" = false; # don't close window when last tab is closed
        "browser.tabs.loadBookmarksInTabs" = true; # open bookmarks in new tab
        "browser.tabs.loadDivertedInBackground" = false; # open new tab in background
        "browser.tabs.loadInBackground" = true; # open new tab in background
        "browser.tabs.warnOnClose" = false; # don't warn when closing multiple tabs
        "browser.tabs.warnOnCloseOtherTabs" = false; # don't warn when closing multiple tabs
        "browser.tabs.warnOnOpen" = false; # don't warn when opening multiple tabs
        "browser.tabs.warnOnQuit" = false; # don't warn when closing multiple tabs

        # other
        "devtools.cache.disabled" = true; # disable caching in devtools
        "devtools.toolbox.host" = "right"; # move devtools to right
        # "browser.ssb.enabled" = true; # enable site specific browser
        "media.autoplay.default" = 0; # enable autoplay on open
        "media.ffmpeg.vaapi.enabled" = true; # enable hardware acceleration
        "media.rdd-vpx.enabled" = true; # enable hardware acceleration

        # override fonts (Set tracking protection to custom without "Suspected fingerprinters")
        "font.minimum-size.x-western" = 13;
        "font.size.fixed.x-western" = 15;
        "font.size.monospace.x-western" = 15;
        "font.size.variable.x-western" = 15;
        "browser.display.use_document_fonts" = 0;

        # do not open a tab in a new window
        # ascentpayroll.net open link in a new without without any
        # chrome and I can't even use my password manager
        # https://support.mozilla.org/eu/questions/1151067?&mobile=1
        "browser.link.open_newwindow.restriction" = 0;

        # "keyword.enable" = false; # Disable search when typing unexistent TLD
        "browser.fixup.domainsuffixwhitelist.home" = true;
        "browser.fixup.domainwhitelist.server.home" = true; # whitelist contre.lucas tld
        # "keyword.enable" = false; # Disable search when typing unexistent TLD
      };

      search = {
        force = true;
        engines = {
          # don't need these default ones
          "Amazon.com".metaData.hidden = true;
          "Bing".metaData.hidden = true;
          "eBay".metaData.hidden = true;

          "DuckDuckGo" = {
            urls = [{
              template = "https://duckduckgo.com";
              params = [
                { name = "q"; value = "{searchTerms}"; }
              ];
            }];
            definedAliases = [ ",d" ];
          };
          "Google" = {
            urls = [{
              template = "https://google.com/search";
              params = [
                { name = "q"; value = "{searchTerms}"; }
              ];
            }];
            definedAliases = [ ",g" ];
          };
          "Nix Packages" = {
            urls = [{
              template = "https://search.nixos.org/packages";
              params = [
                { name = "type"; value = "packages"; }
                { name = "query"; value = "{searchTerms}"; }
              ];
            }];
            definedAliases = [ "np" ];
          };
          "YouTube" = {
            urls = [{
              template = "https://www.youtube.com/results";
              params = [
                { name = "search_query"; value = "{searchTerms}"; }
              ];
            }];
            definedAliases = [ "y" ];
          };
          "Wikipedia" = {
            urls = [{
              template = "https://en.wikipedia.org/wiki/Special:Search";
              params = [
                { name = "search"; value = "{searchTerms}"; }
              ];
            }];
            definedAliases = [ "wik" ];
          };
          "DockerHub" = {
            urls = [{
              template = "https://hub.docker.com/search";
              params = [
                { name = "q"; value = "{searchTerms}"; }
              ];
            }];
            definedAliases = [ "dh" ];
          };
          "GitHub" = {
            urls = [{
              template = "https://github.com/search";
              params = [
                { name = "q"; value = "{searchTerms}"; }
              ];
            }];
            definedAliases = [ "gh" ];
          };
        };
        default = "DuckDuckGo";
      };

    };
  };
}
