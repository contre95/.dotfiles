{ pkgs, ... }:
{
  home.packages = [ pkgs.qobuz-dl ];
  programs.beets = {
    enable = true;

    #package = pkgs.beets-unstable;
    package = pkgs.beets-unstable.override {
      pluginOverrides = {
        filetote = {
          enable = true;
          propagatedBuildInputs = [ pkgs.beets-filetote ];
        };
        #dynamicrange = {
        #  enable = true;
        #  propagatedBuildInputs = [ pkgs.beets-dynamicrange ];
        #};
        # hack, remove eventually:
        limit.builtin = true;
        substitute.builtin = true;
        advancedrewrite.builtin = true;
        autobpm.builtin = true;
      };
    };
    settings = {
      directory = "~/Music";
      library = "~/beets/library.db";
      embedart.auto = true;
      per_disc_numbering = true;
      ui.color = true;
      plugins = [
        "badfiles"
        "duplicates"
        "edit"
        "embedart"
        "fetchart"
        "fromfilename"
        "ftintitle"
        "fuzzy"
        "filetote"
        #"dynamicrange"
        "info"
        "inline"
        "limit"
        #"lyrics"
        "mbsync"
        "missing"
        #"permissions"
        "replaygain"
        "rewrite"
        "scrub"
        "types"
      ];
      # replaygain = {
      #   # Use ffmpeg as the backend, but specify its path in command
      #   backend = "ffmpeg";
      #   command = "${pkgs.ffmpeg-headless}/bin/ffmpeg";
      #   auto = true;
      #   threads = 4;
      #   parallel_on_import = true; # don't forget to run `beet write` after import
      # };
      import = {
        duplicate_action = "ask";
        log = "~/import.log";
        move = true;
        copy = false;
        #timid = false;
        write = true;
        incremental = false;
        resume = false;
      };
      filetote = {
        extensions = [
          ".cue"
          ".pdf"
        ];
        filenames = "cover.jpg cover.png";
        pairing = {
          enabled = true;
          pairing_only = true;
          extensions = [ ".lrc" ];
        };
      };
      item_fields = {
        multidisc = "1 if disctotal > 1 else 0";
        first_artist = ''
          # import an album to another artists directory, like:
          # Tom Jones │1999│ Burning Down the House [Single, CD, FLAC]
          # to The Cardigans/+singles/Tom Jones & the Cardigans │1999│ Burning Down the House [Single, CD, FLAC]
          # https://github.com/beetbox/beets/discussions/4012#discussioncomment-1021414
          # beet import --set myartist='The Cardigans'
          # we must first check to see if myartist is defined, that is, given on
          # import time, or we raise an NameError exception.
          try:
            myartist
          except NameError:
            import re
            return re.split(',|\s+(feat(.?|uring)|&|(Vs|Ft).)', albumartist, 1, flags=re.IGNORECASE)[0]
          else:
            return myartist
        '';

        first_artist_singleton = ''
          try:
            myartist
          except NameError:
            import re
            return re.split(',|\s+(feat(.?|uring)|&|(Vs|Ft).)', artist, 1, flags=re.IGNORECASE)[0]
          else:
            return myartist
        '';
      };
      match = {
        strong_rec_thresh = 0.1;
        max_rec.missing_tracks = "low";
        #required = [ "year" ]; # [ "year" "label" "country"];
        preferred = {
          countries = [
            "XW"
            "US"
          ];
          media = [
            "Digital Media|File"
            "CD"
          ];
          original_year = true;
        };
        ignored = "missing_tracks unmatched_tracks";
        ignored_media = [
          "Data CD"
          "DVD"
          "DVD-Video"
          "Blu-ray"
          "HD-DVD"
          "VCD"
          "SVCD"
          "UMD"
          "VHS"
        ];
      };
      fetchart = {
        auto = true;
      };
      ftintitle = {
        auto = true;
      };
      edit.itemfields = [
        "track"
        "title"
        "artist"
        "album"
        "year"
        "month"
        "day"
      ];
      edit.albumfields = [
        "album"
        "albumartist"
        "albumdisambig"
        "year"
        "month"
        "day"
      ];
      paths = {
        "albumtype:soundtrack" =
          "Soundtracks/%if{$year,$year - }$album%aunique{albumtype albumdisambig year label catalognum releasegroupdisambig} %if{$albumdisambig,($albumdisambig)} - $first_artist [%upper{$format} %if{$bitdepth,\${bitdepth}B-}$samplerate]/%if{$multidisc,$disc-}%if{$track,$track - } $artist - $title";
        default = "$first_artist/%if{$year,$year - }$album%aunique{albumtype albumdisambig year label catalognum releasegroupdisambig} %if{$albumdisambig,($albumdisambig)} [%upper{$format} %if{$bitdepth,\${bitdepth}B-}$samplerate]/%if{$multidisc,$disc-}%if{$track,$track - }$title";
        singleton = "$albumartist/Singles/$title";
        comp = "Various Artists/$album%aunique{}/%if{$track,$track - }$title";
      };
    };
  };
}
