{
  config,
  pkgs,
  me,
  inputs,
  lib,
  ...
}: let
  noctis = import ./themes/noctis.nix;
  inherit (builtins) toString;
in {
  home = {
    packages = [
      pkgs.hyper
    ];
  };

  xdg.configFile."tabby/config.yaml" = {
    onChange = ''
      cp --no-preserve=mode -f $XDG_CONFIG_HOME/tabby/config.yaml ${me.flake-path}/preferences/home/cli/term/tabby.yaml
    '';

    source = (pkgs.formats.yaml {}).generate "tabby.yaml" {
      accessibility = {};
      appearance = {
        dock = "top";
        dockAlwaysOnTop = false;
        dockFill = 0.94;
        dockSpace = 0.75;
        opacity = 0.98;
        spaciness = 0.9;
        tabsLocation = "top";
        # vibrancy = true;
        # vibrancyType = "fluent";
      };
      clickableLinks = {modifier = "ctrlKey";};
      commandBlacklist = [];
      configSync = {parts = {};};
      enableWelcomeTab = false;
      groups = [];
      hacks = {
        disableVibrancyWhileDragging = true;
        enableFluentBackground = false;
      };
      hotkeys = {
        clear = ["Ctrl-L"];
        close-pane = ["Ctrl-W"];
        close-tab = ["Ctrl-Shift-W"];
        combine-tabs = ["Ctrl-Shift-,"];
        command-selector = ["Ctrl-Shift-A"];
        copy = ["Ctrl-Shift-C"];
        copy-current-path = [];
        ctrl-c = ["Ctrl-C"];
        delete-line = ["Ctrl-Shift-Backspace"];
        delete-next-word = ["Ctrl-Delete"];
        delete-previous-word = ["Ctrl-Backspace"];
        disconnect-tab = [];
        duplicate-tab = [];
        end = ["End"];
        explode-tab = ["Ctrl-Shift-."];
        focus-all-tabs = ["Ctrl-Alt-Shift-I"];
        home = ["Home"];
        launch-winscp = [];
        move-tab-left = ["Ctrl-Shift-PageUp"];
        move-tab-right = ["Ctrl-Shift-PageDown"];
        new-tab = ["Ctrl-T"];
        new-window = ["Ctrl-Shift-N"];
        next-tab = ["Ctrl-Tab"];
        next-word = ["Ctrl-Right"];
        pane-decrease-horizontal = ["Ctrl-Alt-Shift-Left"];
        pane-decrease-vertical = ["Ctrl-Alt-Shift-Down"];
        pane-focus-all = ["Ctrl-Shift-I"];
        pane-increase-horizontal = ["Ctrl-Alt-Shift-Right"];
        pane-increase-vertical = ["Ctrl-Alt-Shift-Up"];
        pane-maximize = ["Ctrl-Alt-Enter" "Ctrl-Enter"];
        pane-nav-1 = [];
        pane-nav-2 = [];
        pane-nav-3 = [];
        pane-nav-4 = [];
        pane-nav-5 = [];
        pane-nav-6 = [];
        pane-nav-7 = [];
        pane-nav-8 = [];
        pane-nav-9 = [];
        pane-nav-down = ["Ctrl-Alt-Down"];
        pane-nav-left = ["Ctrl-Alt-Left"];
        pane-nav-next = ["Ctrl-Alt-]"];
        pane-nav-previous = ["Ctrl-Alt-["];
        pane-nav-right = ["Ctrl-Alt-Right"];
        pane-nav-up = ["Ctrl-Alt-Up"];
        paste = ["Ctrl-V" "Shift-Insert"];
        previous-tab = ["Ctrl-Shift-Tab"];
        previous-word = ["Ctrl-Left"];
        profile = {"local:default" = ["Ctrl-Shift-1"];};
        profile-selector = ["Ctrl-Shift-E"];
        profile-selectors = {};
        rearrange-panes = ["Ctrl-Alt" "Ctrl-Space"];
        reconnect-tab = [];
        rename-tab = ["Ctrl-Shift-R"];
        reopen-tab = ["Ctrl-Shift-T"];
        reset-zoom = ["Ctrl-0"];
        restart-serial-session = [];
        restart-ssh-session = [];
        restart-tab = [];
        restart-telnet-session = [];
        scroll-down = ["Alt-PageDown"];
        scroll-to-bottom = ["Ctrl-PageDown"];
        scroll-to-top = ["Ctrl-PageUp"];
        scroll-up = ["Alt-PageUp"];
        search = ["Ctrl-F" "Ctrl-Shift-F"];
        select-all = [];
        serial = ["Alt-K"];
        settings = ["Ctrl-Alt-S"];
        settings-tab = {};
        split-bottom = ["Ctrl-Shift-D"];
        split-left = [];
        split-right = ["Ctrl-Shift-S"];
        split-top = [];
        switch-profile = ["Ctrl-Alt-T"];
        tab-1 = ["Alt-1"];
        tab-10 = ["Alt-0"];
        tab-11 = [];
        tab-12 = [];
        tab-13 = [];
        tab-14 = [];
        tab-15 = [];
        tab-16 = [];
        tab-17 = [];
        tab-18 = [];
        tab-19 = [];
        tab-2 = ["Alt-2"];
        tab-20 = [];
        tab-3 = ["Alt-3"];
        tab-4 = ["Alt-4"];
        tab-5 = ["Alt-5"];
        tab-6 = ["Alt-6"];
        tab-7 = ["Alt-7"];
        tab-8 = ["Alt-8"];
        tab-9 = ["Alt-9"];
        toggle-fullscreen = ["F11" "Alt-Enter"];
        toggle-last-tab = [];
        toggle-window = ["Alt-`"];
        zoom-in = ["Ctrl-="];
        zoom-out = ["Ctrl--" "Ctrl-Shift--"];
      };
      pluginBlacklist = [];
      profileBlacklist = [];
      profileDefaults = {
        local = {
          options = {
            args = [];
            cwd = "";
            env = {};
          };
          type = "local";
        };
        ssh = {disableDynamicTitle = true;};
      };
      profiles = [
        {
          icon = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?> <!-- Created with Inkscape (http://www.inkscape.org/) -->  <svg    xmlns:dc=\"http://purl.org/dc/elements/1.1/\"    xmlns:cc=\"http://creativecommons.org/ns#\"    xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"    xmlns:svg=\"http://www.w3.org/2000/svg\"    xmlns=\"http://www.w3.org/2000/svg\"    xmlns:xlink=\"http://www.w3.org/1999/xlink\"    xmlns:sodipodi=\"http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd\"    xmlns:inkscape=\"http://www.inkscape.org/namespaces/inkscape\"    width=\"141.5919mm\"    height=\"122.80626mm\"    viewBox=\"0 0 501.70361 435.14028\"    id=\"svg2\"    version=\"1.1\"    inkscape:version=\"0.92.0 r15299\"    sodipodi:docname=\"nix-snowflake.svg\">   <defs      id=\"defs4\">     <linearGradient        inkscape:collect=\"always\"        id=\"linearGradient5562\">       <stop          style=\"stop-color:#699ad7;stop-opacity:1\"          offset=\"0\"          id=\"stop5564\" />       <stop          id=\"stop5566\"          offset=\"0.24345198\"          style=\"stop-color:#7eb1dd;stop-opacity:1\" />       <stop          style=\"stop-color:#7ebae4;stop-opacity:1\"          offset=\"1\"          id=\"stop5568\" />     </linearGradient>     <linearGradient        inkscape:collect=\"always\"        id=\"linearGradient5053\">       <stop          style=\"stop-color:#415e9a;stop-opacity:1\"          offset=\"0\"          id=\"stop5055\" />       <stop          id=\"stop5057\"          offset=\"0.23168644\"          style=\"stop-color:#4a6baf;stop-opacity:1\" />       <stop          style=\"stop-color:#5277c3;stop-opacity:1\"          offset=\"1\"          id=\"stop5059\" />     </linearGradient>     <linearGradient        id=\"linearGradient5960\"        inkscape:collect=\"always\">       <stop          id=\"stop5962\"          offset=\"0\"          style=\"stop-color:#637ddf;stop-opacity:1\" />       <stop          style=\"stop-color:#649afa;stop-opacity:1\"          offset=\"0.23168644\"          id=\"stop5964\" />       <stop          id=\"stop5966\"          offset=\"1\"          style=\"stop-color:#719efa;stop-opacity:1\" />     </linearGradient>     <linearGradient        inkscape:collect=\"always\"        id=\"linearGradient5867\">       <stop          style=\"stop-color:#7363df;stop-opacity:1\"          offset=\"0\"          id=\"stop5869\" />       <stop          id=\"stop5871\"          offset=\"0.23168644\"          style=\"stop-color:#6478fa;stop-opacity:1\" />       <stop          style=\"stop-color:#719efa;stop-opacity:1\"          offset=\"1\"          id=\"stop5873\" />     </linearGradient>     <linearGradient        y2=\"515.97058\"        x2=\"282.26105\"        y1=\"338.62445\"        x1=\"213.95642\"        gradientTransform=\"translate(983.36076,601.38885)\"        gradientUnits=\"userSpaceOnUse\"        id=\"linearGradient5855\"        xlink:href=\"#linearGradient5960\"        inkscape:collect=\"always\" />     <linearGradient        y2=\"515.97058\"        x2=\"282.26105\"        y1=\"338.62445\"        x1=\"213.95642\"        gradientTransform=\"translate(-197.75174,-337.1451)\"        gradientUnits=\"userSpaceOnUse\"        id=\"linearGradient5855-8\"        xlink:href=\"#linearGradient5867\"        inkscape:collect=\"always\" />     <linearGradient        y2=\"247.58188\"        x2=\"-702.75317\"        y1=\"102.74675\"        x1=\"-775.20807\"        gradientTransform=\"translate(983.36076,601.38885)\"        gradientUnits=\"userSpaceOnUse\"        id=\"linearGradient4544\"        xlink:href=\"#linearGradient5960\"        inkscape:collect=\"always\" />     <clipPath        id=\"clipPath4501\"        clipPathUnits=\"userSpaceOnUse\">       <circle          r=\"241.06563\"          cy=\"686.09473\"          cx=\"335.13995\"          id=\"circle4503\"          style=\"color:#000000;clip-rule:nonzero;display:inline;overflow:visible;visibility:visible;opacity:1;isolation:auto;mix-blend-mode:normal;color-interpolation:sRGB;color-interpolation-filters:linearRGB;solid-color:#000000;solid-opacity:1;fill:#adadad;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:3;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;marker:none;color-rendering:auto;image-rendering:auto;shape-rendering:auto;text-rendering:auto;enable-background:accumulate\" />     </clipPath>     <clipPath        id=\"clipPath5410\"        clipPathUnits=\"userSpaceOnUse\">       <circle          r=\"241.13741\"          cy=\"340.98975\"          cx=\"335.98114\"          id=\"circle5412\"          style=\"color:#000000;clip-rule:nonzero;display:inline;overflow:visible;visibility:visible;opacity:1;isolation:auto;mix-blend-mode:normal;color-interpolation:sRGB;color-interpolation-filters:linearRGB;solid-color:#000000;solid-opacity:1;fill:#ffffff;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:3;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;marker:none;color-rendering:auto;image-rendering:auto;shape-rendering:auto;text-rendering:auto;enable-background:accumulate\" />     </clipPath>     <linearGradient        inkscape:collect=\"always\"        xlink:href=\"#linearGradient5053\"        id=\"linearGradient5137\"        gradientUnits=\"userSpaceOnUse\"        gradientTransform=\"translate(864.55062,-2197.497)\"        x1=\"-584.19934\"        y1=\"782.33563\"        x2=\"-496.29703\"        y2=\"937.71399\" />     <linearGradient        inkscape:collect=\"always\"        xlink:href=\"#linearGradient5053\"        id=\"linearGradient5147\"        gradientUnits=\"userSpaceOnUse\"        gradientTransform=\"translate(864.55062,-2197.497)\"        x1=\"-584.19934\"        y1=\"782.33563\"        x2=\"-496.29703\"        y2=\"937.71399\" />     <linearGradient        inkscape:collect=\"always\"        xlink:href=\"#linearGradient5562\"        id=\"linearGradient5162\"        gradientUnits=\"userSpaceOnUse\"        gradientTransform=\"translate(70.505061,-1761.3076)\"        x1=\"200.59668\"        y1=\"351.41116\"        x2=\"290.08701\"        y2=\"506.18814\" />     <linearGradient        inkscape:collect=\"always\"        xlink:href=\"#linearGradient5562\"        id=\"linearGradient5172\"        gradientUnits=\"userSpaceOnUse\"        gradientTransform=\"translate(70.505061,-1761.3076)\"        x1=\"200.59668\"        y1=\"351.41116\"        x2=\"290.08701\"        y2=\"506.18814\" />     <linearGradient        inkscape:collect=\"always\"        xlink:href=\"#linearGradient5562\"        id=\"linearGradient5182\"        gradientUnits=\"userSpaceOnUse\"        gradientTransform=\"translate(70.505061,-1761.3076)\"        x1=\"200.59668\"        y1=\"351.41116\"        x2=\"290.08701\"        y2=\"506.18814\" />     <linearGradient        y2=\"506.18814\"        x2=\"290.08701\"        y1=\"351.41116\"        x1=\"200.59668\"        gradientTransform=\"translate(70.505061,-1761.3076)\"        gradientUnits=\"userSpaceOnUse\"        id=\"linearGradient5201\"        xlink:href=\"#linearGradient5562\"        inkscape:collect=\"always\" />     <linearGradient        y2=\"937.71399\"        x2=\"-496.29703\"        y1=\"782.33563\"        x1=\"-584.19934\"        gradientTransform=\"translate(864.55062,-2197.497)\"        gradientUnits=\"userSpaceOnUse\"        id=\"linearGradient5205\"        xlink:href=\"#linearGradient5053\"        inkscape:collect=\"always\" />     <linearGradient        inkscape:collect=\"always\"        xlink:href=\"#linearGradient5562\"        id=\"linearGradient4328\"        gradientUnits=\"userSpaceOnUse\"        gradientTransform=\"translate(70.650339,-1055.1511)\"        x1=\"200.59668\"        y1=\"351.41116\"        x2=\"290.08701\"        y2=\"506.18814\" />     <linearGradient        inkscape:collect=\"always\"        xlink:href=\"#linearGradient5053\"        id=\"linearGradient4330\"        gradientUnits=\"userSpaceOnUse\"        gradientTransform=\"translate(864.69589,-1491.3405)\"        x1=\"-584.19934\"        y1=\"782.33563\"        x2=\"-496.29703\"        y2=\"937.71399\" />   </defs>   <sodipodi:namedview      id=\"base\"      pagecolor=\"#ffffff\"      bordercolor=\"#666666\"      borderopacity=\"1.0\"      inkscape:pageopacity=\"0.0\"      inkscape:pageshadow=\"2\"      inkscape:zoom=\"0.98318225\"      inkscape:cx=\"113.58176\"      inkscape:cy=\"-45.193301\"      inkscape:document-units=\"px\"      inkscape:current-layer=\"layer3\"      showgrid=\"false\"      inkscape:window-width=\"2560\"      inkscape:window-height=\"1577\"      inkscape:window-x=\"0\"      inkscape:window-y=\"0\"      inkscape:window-maximized=\"1\"      inkscape:snap-global=\"true\"      fit-margin-top=\"0\"      fit-margin-left=\"0\"      fit-margin-right=\"0\"      fit-margin-bottom=\"0\" />   <metadata      id=\"metadata7\">     <rdf:RDF>       <cc:Work          rdf:about=\"\">         <dc:format>image/svg+xml</dc:format>         <dc:type            rdf:resource=\"http://purl.org/dc/dcmitype/StillImage\" />         <dc:title />       </cc:Work>     </rdf:RDF>   </metadata>   <g      inkscape:groupmode=\"layer\"      id=\"layer7\"      inkscape:label=\"bg\"      style=\"display:none\"      transform=\"translate(-23.75651,-24.84972)\">     <rect        transform=\"translate(-132.5822,958.04022)\"        style=\"color:#000000;clip-rule:nonzero;display:inline;overflow:visible;visibility:visible;opacity:1;isolation:auto;mix-blend-mode:normal;color-interpolation:sRGB;color-interpolation-filters:linearRGB;solid-color:#000000;solid-opacity:1;fill:#ffffff;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:3;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;marker:none;color-rendering:auto;image-rendering:auto;shape-rendering:auto;text-rendering:auto;enable-background:accumulate\"        id=\"rect5389\"        width=\"1543.4283\"        height=\"483.7439\"        x=\"132.5822\"        y=\"-957.77832\" />   </g>   <g      inkscape:groupmode=\"layer\"      id=\"layer6\"      inkscape:label=\"logo-guide\"      style=\"display:none\"      transform=\"translate(-156.33871,933.1905)\">     <rect        y=\"-958.02759\"        x=\"132.65129\"        height=\"484.30399\"        width=\"550.41602\"        id=\"rect5379\"        style=\"color:#000000;clip-rule:nonzero;display:inline;overflow:visible;visibility:visible;opacity:1;isolation:auto;mix-blend-mode:normal;color-interpolation:sRGB;color-interpolation-filters:linearRGB;solid-color:#000000;solid-opacity:1;fill:#5c201e;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:3;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;marker:none;color-rendering:auto;image-rendering:auto;shape-rendering:auto;text-rendering:auto;enable-background:accumulate\"        inkscape:export-filename=\"/home/tim/dev/nix/homepage/logo/nix-wiki.png\"        inkscape:export-xdpi=\"22.07\"        inkscape:export-ydpi=\"22.07\" />     <rect        style=\"color:#000000;clip-rule:nonzero;display:inline;overflow:visible;visibility:visible;opacity:1;isolation:auto;mix-blend-mode:normal;color-interpolation:sRGB;color-interpolation-filters:linearRGB;solid-color:#000000;solid-opacity:1;fill:#c24a46;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:3;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;marker:none;color-rendering:auto;image-rendering:auto;shape-rendering:auto;text-rendering:auto;enable-background:accumulate\"        id=\"rect5372\"        width=\"501.94415\"        height=\"434.30405\"        x=\"156.12303\"        y=\"-933.02759\"        inkscape:export-filename=\"/home/tim/dev/nix/homepage/logo/nixos-logo-only-hires-print.png\"        inkscape:export-xdpi=\"212.2\"        inkscape:export-ydpi=\"212.2\" />     <rect        style=\"color:#000000;clip-rule:nonzero;display:inline;overflow:visible;visibility:visible;opacity:1;isolation:auto;mix-blend-mode:normal;color-interpolation:sRGB;color-interpolation-filters:linearRGB;solid-color:#000000;solid-opacity:1;fill:#d98d8a;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:3;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;marker:none;color-rendering:auto;image-rendering:auto;shape-rendering:auto;text-rendering:auto;enable-background:accumulate\"        id=\"rect5381\"        width=\"24.939611\"        height=\"24.939611\"        x=\"658.02826\"        y=\"-958.04022\" />   </g>   <g      inkscape:label=\"print-logo\"      inkscape:groupmode=\"layer\"      id=\"layer1\"      style=\"display:inline\"      transform=\"translate(-156.33871,933.1905)\"      sodipodi:insensitive=\"true\">     <path        style=\"color:#000000;clip-rule:nonzero;display:inline;overflow:visible;visibility:visible;opacity:1;isolation:auto;mix-blend-mode:normal;color-interpolation:sRGB;color-interpolation-filters:linearRGB;solid-color:#000000;solid-opacity:1;fill:#5277c3;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:3;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;color-rendering:auto;image-rendering:auto;shape-rendering:auto;text-rendering:auto;enable-background:accumulate\"        d=\"m 309.40365,-710.2521 122.19683,211.6751 -56.15706,0.5268 -32.6236,-56.8692 -32.85645,56.5653 -27.90237,-0.011 -14.29086,-24.6896 46.81047,-80.4902 -33.22946,-57.8256 z\"        id=\"path4861\"        inkscape:connector-curvature=\"0\"        sodipodi:nodetypes=\"cccccccccc\" />     <path        style=\"color:#000000;clip-rule:nonzero;display:inline;overflow:visible;visibility:visible;opacity:1;isolation:auto;mix-blend-mode:normal;color-interpolation:sRGB;color-interpolation-filters:linearRGB;solid-color:#000000;solid-opacity:1;fill:#7ebae4;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:3;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;color-rendering:auto;image-rendering:auto;shape-rendering:auto;text-rendering:auto;enable-background:accumulate\"        d=\"m 353.50926,-797.4433 -122.21756,211.6631 -28.53477,-48.37 32.93839,-56.6875 -65.41521,-0.1719 -13.9414,-24.1698 14.23637,-24.721 93.11177,0.2939 33.46371,-57.6903 z\"        id=\"use4863\"        inkscape:connector-curvature=\"0\"        sodipodi:nodetypes=\"cccccccccc\" />     <path        style=\"color:#000000;clip-rule:nonzero;display:inline;overflow:visible;visibility:visible;opacity:1;isolation:auto;mix-blend-mode:normal;color-interpolation:sRGB;color-interpolation-filters:linearRGB;solid-color:#000000;solid-opacity:1;fill:#7ebae4;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:3;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;color-rendering:auto;image-rendering:auto;shape-rendering:auto;text-rendering:auto;enable-background:accumulate\"        d=\"m 362.88537,-628.243 244.41439,0.012 -27.62229,48.8968 -65.56199,-0.1817 32.55876,56.7371 -13.96098,24.1585 -28.52722,0.032 -46.3013,-80.7841 -66.69317,-0.1353 z\"        id=\"use4865\"        inkscape:connector-curvature=\"0\"        sodipodi:nodetypes=\"cccccccccc\" />     <path        style=\"color:#000000;clip-rule:nonzero;display:inline;overflow:visible;visibility:visible;opacity:1;isolation:auto;mix-blend-mode:normal;color-interpolation:sRGB;color-interpolation-filters:linearRGB;solid-color:#000000;solid-opacity:1;fill:#7ebae4;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:3;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;color-rendering:auto;image-rendering:auto;shape-rendering:auto;text-rendering:auto;enable-background:accumulate\"        d=\"m 505.14318,-720.9886 -122.19683,-211.6751 56.15706,-0.5268 32.6236,56.8692 32.85645,-56.5653 27.90237,0.011 14.29086,24.6896 -46.81047,80.4902 33.22946,57.8256 z\"        id=\"use4867\"        inkscape:connector-curvature=\"0\"        sodipodi:nodetypes=\"cccccccccc\" />     <path        sodipodi:nodetypes=\"cccccccccc\"        inkscape:connector-curvature=\"0\"        id=\"path4873\"        d=\"m 309.40365,-710.2521 122.19683,211.6751 -56.15706,0.5268 -32.6236,-56.8692 -32.85645,56.5653 -27.90237,-0.011 -14.29086,-24.6896 46.81047,-80.4902 -33.22946,-57.8256 z\"        style=\"color:#000000;clip-rule:nonzero;display:inline;overflow:visible;visibility:visible;opacity:1;isolation:auto;mix-blend-mode:normal;color-interpolation:sRGB;color-interpolation-filters:linearRGB;solid-color:#000000;solid-opacity:1;fill:#5277c3;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:3;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;color-rendering:auto;image-rendering:auto;shape-rendering:auto;text-rendering:auto;enable-background:accumulate\" />     <path        sodipodi:nodetypes=\"cccccccccc\"        inkscape:connector-curvature=\"0\"        id=\"use4875\"        d=\"m 451.3364,-803.53264 -244.4144,-0.012 27.62229,-48.89685 65.56199,0.18175 -32.55875,-56.73717 13.96097,-24.15851 28.52722,-0.0315 46.3013,80.78414 66.69317,0.13524 z\"        style=\"color:#000000;clip-rule:nonzero;display:inline;overflow:visible;visibility:visible;opacity:1;isolation:auto;mix-blend-mode:normal;color-interpolation:sRGB;color-interpolation-filters:linearRGB;solid-color:#000000;solid-opacity:1;fill:#5277c3;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:3;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;color-rendering:auto;image-rendering:auto;shape-rendering:auto;text-rendering:auto;enable-background:accumulate\" />     <path        sodipodi:nodetypes=\"cccccccccc\"        inkscape:connector-curvature=\"0\"        id=\"use4877\"        d=\"m 460.87178,-633.8425 122.21757,-211.66304 28.53477,48.37003 -32.93839,56.68751 65.4152,0.1718 13.9414,24.1698 -14.23636,24.7211 -93.11177,-0.294 -33.46371,57.6904 z\"        style=\"color:#000000;clip-rule:nonzero;display:inline;overflow:visible;visibility:visible;opacity:1;isolation:auto;mix-blend-mode:normal;color-interpolation:sRGB;color-interpolation-filters:linearRGB;solid-color:#000000;solid-opacity:1;fill:#5277c3;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:3;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;color-rendering:auto;image-rendering:auto;shape-rendering:auto;text-rendering:auto;enable-background:accumulate\" />     <g        id=\"layer2\"        inkscape:label=\"guides\"        style=\"display:none\"        transform=\"translate(72.039038,-1799.4476)\">       <path          d=\"M 460.60629,594.72881 209.74183,594.7288 84.309616,377.4738 209.74185,160.21882 l 250.86446,1e-5 125.43222,217.255 z\"          inkscape:randomized=\"0\"          inkscape:rounded=\"0\"          inkscape:flatsided=\"true\"          sodipodi:arg2=\"1.5707963\"          sodipodi:arg1=\"1.0471976\"          sodipodi:r2=\"217.25499\"          sodipodi:r1=\"250.86446\"          sodipodi:cy=\"377.47382\"          sodipodi:cx=\"335.17407\"          sodipodi:sides=\"6\"          id=\"path6032\"          style=\"color:#000000;display:inline;overflow:visible;visibility:visible;opacity:0.23600003;fill:#4e4d52;fill-opacity:1;fill-rule:nonzero;stroke:none;stroke-width:3;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;marker:none;enable-background:accumulate\"          sodipodi:type=\"star\" />       <path          transform=\"translate(0,-308.26772)\"          sodipodi:type=\"star\"          style=\"color:#000000;display:inline;overflow:visible;visibility:visible;opacity:1;fill:#4e4d52;fill-opacity:1;fill-rule:nonzero;stroke:none;stroke-width:3;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;marker:none;enable-background:accumulate\"          id=\"path5875\"          sodipodi:sides=\"6\"          sodipodi:cx=\"335.17407\"          sodipodi:cy=\"685.74158\"          sodipodi:r1=\"100.83495\"          sodipodi:r2=\"87.32563\"          sodipodi:arg1=\"1.0471976\"          sodipodi:arg2=\"1.5707963\"          inkscape:flatsided=\"true\"          inkscape:rounded=\"0\"          inkscape:randomized=\"0\"          d=\"m 385.59154,773.06721 -100.83495,0 -50.41747,-87.32564 50.41748,-87.32563 100.83495,10e-6 50.41748,87.32563 z\" />       <path          transform=\"translate(0,-308.26772)\"          sodipodi:nodetypes=\"ccccccccc\"          inkscape:connector-curvature=\"0\"          id=\"path5851\"          d=\"m 1216.5591,938.53395 123.0545,228.14035 -42.6807,-1.2616 -43.4823,-79.7725 -39.6506,80.3267 -32.6875,-19.7984 53.4737,-100.2848 -37.1157,-73.88955 z\"          style=\"fill:url(#linearGradient5855);fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:3;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1\" />       <rect          style=\"color:#000000;clip-rule:nonzero;display:inline;overflow:visible;visibility:visible;opacity:0.41499999;isolation:auto;mix-blend-mode:normal;color-interpolation:sRGB;color-interpolation-filters:linearRGB;solid-color:#000000;solid-opacity:1;fill:#c53a3a;fill-opacity:1;fill-rule:nonzero;stroke:none;stroke-width:3;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;marker:none;color-rendering:auto;image-rendering:auto;shape-rendering:auto;text-rendering:auto;enable-background:accumulate\"          id=\"rect5884\"          width=\"48.834862\"          height=\"226.22897\"          x=\"-34.74221\"          y=\"446.17056\"          transform=\"rotate(-30)\" />       <path          transform=\"translate(0,-308.26772)\"          sodipodi:type=\"star\"          style=\"color:#000000;clip-rule:nonzero;display:inline;overflow:visible;visibility:visible;opacity:0.50899999;isolation:auto;mix-blend-mode:normal;color-interpolation:sRGB;color-interpolation-filters:linearRGB;solid-color:#000000;solid-opacity:1;fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:3;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;marker:none;color-rendering:auto;image-rendering:auto;shape-rendering:auto;text-rendering:auto;enable-background:accumulate\"          id=\"path3428\"          sodipodi:sides=\"6\"          sodipodi:cx=\"223.93674\"          sodipodi:cy=\"878.63831\"          sodipodi:r1=\"28.048939\"          sodipodi:r2=\"24.291094\"          sodipodi:arg1=\"0\"          sodipodi:arg2=\"0.52359878\"          inkscape:flatsided=\"true\"          inkscape:rounded=\"0\"          inkscape:randomized=\"0\"          d=\"m 251.98568,878.63831 -14.02447,24.29109 h -28.04894 l -14.02447,-24.29109 14.02447,-24.2911 h 28.04894 z\" />       <use          x=\"0\"          y=\"0\"          xlink:href=\"#rect5884\"          id=\"use4252\"          transform=\"rotate(60,268.29786,489.4515)\"          width=\"100%\"          height=\"100%\" />       <rect          style=\"color:#000000;clip-rule:nonzero;display:inline;overflow:visible;visibility:visible;opacity:1;isolation:auto;mix-blend-mode:normal;color-interpolation:sRGB;color-interpolation-filters:linearRGB;solid-color:#000000;solid-opacity:1;fill:#000000;fill-opacity:0.6507937;fill-rule:evenodd;stroke:none;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;marker:none;color-rendering:auto;image-rendering:auto;shape-rendering:auto;text-rendering:auto;enable-background:accumulate\"          id=\"rect4254\"          width=\"5.3947482\"          height=\"115.12564\"          x=\"545.71014\"          y=\"467.07007\"          transform=\"rotate(30,575.23539,-154.13386)\" />     </g>   </g>   <g      inkscape:groupmode=\"layer\"      id=\"layer3\"      inkscape:label=\"gradient-logo\"      style=\"display:inline;opacity:1\"      sodipodi:insensitive=\"true\"      transform=\"translate(-156.33871,933.1905)\">     <path        sodipodi:nodetypes=\"cccccccccc\"        inkscape:connector-curvature=\"0\"        id=\"path3336-6\"        d=\"m 309.54892,-710.38827 122.19683,211.67512 -56.15706,0.5268 -32.6236,-56.8692 -32.85645,56.5653 -27.90237,-0.011 -14.29086,-24.6896 46.81047,-80.4901 -33.22946,-57.8257 z\"        style=\"opacity:1;fill:url(#linearGradient4328);fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:3;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1\" />     <use        height=\"100%\"        width=\"100%\"        transform=\"rotate(60,407.11155,-715.78724)\"        id=\"use3439-6\"        inkscape:transform-center-y=\"151.59082\"        inkscape:transform-center-x=\"124.43045\"        xlink:href=\"#path3336-6\"        y=\"0\"        x=\"0\" />     <use        height=\"100%\"        width=\"100%\"        transform=\"rotate(-60,407.31177,-715.70016)\"        id=\"use3445-0\"        inkscape:transform-center-y=\"75.573958\"        inkscape:transform-center-x=\"-168.20651\"        xlink:href=\"#path3336-6\"        y=\"0\"        x=\"0\" />     <use        height=\"100%\"        width=\"100%\"        transform=\"rotate(180,407.41868,-715.7565)\"        id=\"use3449-5\"        inkscape:transform-center-y=\"-139.94592\"        inkscape:transform-center-x=\"59.669705\"        xlink:href=\"#path3336-6\"        y=\"0\"        x=\"0\" />     <path        style=\"color:#000000;clip-rule:nonzero;display:inline;overflow:visible;visibility:visible;opacity:1;isolation:auto;mix-blend-mode:normal;color-interpolation:sRGB;color-interpolation-filters:linearRGB;solid-color:#000000;solid-opacity:1;fill:url(#linearGradient4330);fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:3;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;color-rendering:auto;image-rendering:auto;shape-rendering:auto;text-rendering:auto;enable-background:accumulate\"        d=\"m 309.54892,-710.38827 122.19683,211.67512 -56.15706,0.5268 -32.6236,-56.8692 -32.85645,56.5653 -27.90237,-0.011 -14.29086,-24.6896 46.81047,-80.4901 -33.22946,-57.8256 z\"        id=\"path4260-0\"        inkscape:connector-curvature=\"0\"        sodipodi:nodetypes=\"cccccccccc\" />     <use        height=\"100%\"        width=\"100%\"        transform=\"rotate(120,407.33916,-716.08356)\"        id=\"use4354-5\"        xlink:href=\"#path4260-0\"        y=\"0\"        x=\"0\"        style=\"display:inline\" />     <use        height=\"100%\"        width=\"100%\"        transform=\"rotate(-120,407.28823,-715.86995)\"        id=\"use4362-2\"        xlink:href=\"#path4260-0\"        y=\"0\"        x=\"0\"        style=\"display:inline\" />   </g> </svg>";
          id = "local:custom:nix:d2c83dc4-13a9-4469-afd3-b45a111bdb22";
          name = "nix";
          options = {
            args = ["--cd" "~"];
            command = ''C:\\WINDOWS\\system32\\wsl.exe'';
            env = {
              COLORTERM = "truecolor";
              TERM = "xterm-color";
            };
          };
          type = "local";
        }
      ];
      providerBlacklist = [];
      qmicaversion = 6;
      recoverTabs = false;
      ssh = {};
      terminal = {
        bell = "visual";
        colorScheme = {
          inherit (noctis.colors) name;
          # background = noctis.colors.background;
          background = "#1e272d";
          # foreground = noctis.colors.foreground;
          foreground = "#d88a3a";
          cursor = noctis.colors.cursorColor;
          selection = noctis.colors.selectionBackground;
          # selectionForeground = "#4527a0";
          colors = [
            noctis.colors.black
            noctis.colors.red
            noctis.colors.green
            noctis.colors.yellow
            "#666042"
            # noctis.colors.blue
            noctis.colors.purple
            noctis.colors.cyan
            noctis.colors.white
            noctis.colors.brightBlack
            noctis.colors.brightRed
            noctis.colors.brightGreen
            noctis.colors.brightYellow
            noctis.colors.brightBlue
            noctis.colors.brightPurple
            noctis.colors.brightCyan
            noctis.colors.brightWhite
          ];
        };
        copyAsHTML = false;
        copyOnSelect = false;

        cursor = lib.toLower noctis.cursor.shape;
        customColorSchemes = [
          {
            inherit (noctis.colors) name;
            background = "#1e272d";
            # background = noctis.colors.background;
            # foreground = noctis.colors.foreground;
            foreground = "#d88a3a";
            cursor = noctis.colors.cursorColor;
            selection = noctis.colors.selectionBackground;
            # selectionForeground = "#4527a0";
            colors = [
              noctis.colors.black
              noctis.colors.red
              noctis.colors.green
              noctis.colors.yellow
              "#666042"
              # noctis.colors.blue
              noctis.colors.purple
              noctis.colors.cyan
              noctis.colors.white
              noctis.colors.brightBlack
              noctis.colors.brightRed
              noctis.colors.brightGreen
              noctis.colors.brightYellow
              noctis.colors.brightBlue
              noctis.colors.brightPurple
              noctis.colors.brightCyan
              noctis.colors.brightWhite
            ];
          }
        ];
        focusFollowsMouse = true;
        font = noctis.font.family;
        fontSize = noctis.font.size + 3;
        hideCloseButton = true;
        hideTabOptionsButton = true;
        ligatures = true;
        linePadding = noctis.font.lineHeight;
        profile = "local:custom:nix:d2c83dc4-13a9-4469-afd3-b45a111bdb22";
        rightClick = "menu";
        searchOptions = {};
        showTabProfileIcon = true;
        warnOnMultilinePaste = false;
      };
      version = 7;
    };
  };
}
