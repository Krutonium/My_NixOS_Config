{ lib, ... }:
let
  mkTuple = lib.hm.gvariant.mkTuple;
in
{
  dconf.settings = {
    "org/gnome/Connections" = {
      first-run = false;
    };
    "org/gnome/Disks" = {
      image-dir-uri = "file:///home/krutonium/Downloads";
    };
    "org/gnome/control-center" = {
      last-panel = "wifi";
    };
    "org/gnome/desktop/input-sources" = {
      sources = [("xkb"  "us")];
      xkb-options = ["terminate:ctrl_alt_bksp"];
    };
    "org/gnome/desktop/interface" = {
      clock-format = "12h";
      clock-show-seconds = true;
      clock-show-weekday = true;
      cursor-theme = "Yaru";
      document-font-name = "Ubuntu 11";
      font-antialiasing = "rgba";
      font-hinting = "full";
      font-name = "Ubuntu 11";
      gtk-im-module = "gtk-im-context-simple";
      gtk-theme = "Sweet-Dark";
      icon-theme = "Obsidian-Purple";
      monospace-font-name = "Ubuntu Mono 12";
      show-battery-percentage = true;
    };
    "org/gnome/desktop/notifications" = {
      application-children = ["gnome-power-panel"  "telegramdesktop"  "org-gnome-epiphany"  "firefox"  "discord"  "org-gnome-nautilus"  "gnome-network-panel"  "steam"  "plexamp"  "transgui"  "rider"];
    };
    "org/gnome/desktop/notifications/application/discord" = {
      application-id = "discord.desktop";
    };
    "org/gnome/desktop/notifications/application/firefox" = {
      application-id = "firefox.desktop";
    };
    "org/gnome/desktop/notifications/application/gnome-network-panel" = {
      application-id = "gnome-network-panel.desktop";
    };
    "org/gnome/desktop/notifications/application/gnome-power-panel" = {
      application-id = "gnome-power-panel.desktop";
    };
    "org/gnome/desktop/notifications/application/org-gnome-epiphany" = {
      application-id = "org.gnome.Epiphany.desktop";
    };
    "org/gnome/desktop/notifications/application/org-gnome-nautilus" = {
      application-id = "org.gnome.Nautilus.desktop";
    };
    "org/gnome/desktop/notifications/application/plexamp" = {
      application-id = "plexamp.desktop";
    };
    "org/gnome/desktop/notifications/application/rider" = {
      application-id = "rider.desktop";
    };
    "org/gnome/desktop/notifications/application/steam" = {
      application-id = "steam.desktop";
    };
    "org/gnome/desktop/notifications/application/telegramdesktop" = {
      application-id = "telegramdesktop.desktop";
    };
    "org/gnome/desktop/notifications/application/transgui" = {
      application-id = "transgui.desktop";
    };
    "org/gnome/desktop/peripherals/keyboard" = {
      numlock-state = false;
    };
    "org/gnome/desktop/privacy" = {
      disable-microphone = false;
    };
    "org/gnome/desktop/sound" = {
      allow-volume-above-100-percent = true;
    };
    "org/gnome/desktop/wm/keybindings" = {
    };
    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize maximize close";
      titlebar-font = "Ubuntu 11";
    };
    "org/gnome/eog/view" = {
      background-color = "rgb(0 0 0)";
      use-background-color = true;
    };
    "org/gnome/epiphany/state" = {
      is-maximized = false;
      window-position = (-1  -1);
      window-size = (1024  768);
    };
    "org/gnome/evince/default" = {
      window-ratio = (1.0078613182826044  0.7126567844925884);
    };
    "org/gnome/evolution-data-server" = {
      migrated = true;
      network-monitor-gio-name = "";
    };
    "org/gnome/file-roller/dialogs/extract" = {
      recreate-folders = true;
      skip-newer = false;
    };
    "org/gnome/file-roller/listing" = {
      list-mode = "as-folder";
      name-column-width = 250;
      show-path = false;
      sort-method = "name";
      sort-type = "ascending";
    };
    "org/gnome/file-roller/ui" = {
      sidebar-width = 200;
      window-height = 480;
      window-width = 600;
    };
    "org/gnome/gedit/plugins" = {
      active-plugins = ["sort"  "docinfo"  "spell"  "filebrowser"  "modelines"];
    };
    "org/gnome/gedit/plugins/filebrowser" = {
      root = "file:///";
      tree-view = true;
      virtual-root = "file:///home/krutonium/.nix-profile/share/applications";
    };
    "org/gnome/gedit/preferences/ui" = {
      show-tabs-mode = "auto";
    };
    "org/gnome/gedit/state/window" = {
      bottom-panel-size = 140;
      side-panel-active-page = "GeditWindowDocumentsPanel";
      side-panel-size = 200;
      size = (900  700);
      state = 87168;
    };
    "org/gnome/gnome-screenshot" = {
      delay = 0;
      include-pointer = false;
      last-save-directory = "file:///home/krutonium/Pictures";
    };
    "org/gnome/gnome-system-monitor" = {
      current-tab = "resources";
      maximized = false;
      network-total-in-bits = false;
      show-dependencies = false;
      show-whose-processes = "user";
      window-state = (700  500  50  50);
    };
    "org/gnome/gnome-system-monitor/disktreenew" = {
      col-6-visible = true;
      col-6-width = 0;
    };
    "org/gnome/mutter" = {
      attach-modal-dialogs = true;
      dynamic-workspaces = true;
      edge-tiling = true;
      focus-change-on-pointer-rest = true;
      overlay-key = "Super_L";
      workspaces-only-on-primary = true;
    };
    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "icon-view";
      search-filter-time-type = "last_modified";
      search-view = "list-view";
    };
    "org/gnome/nautilus/window-state" = {
      initial-size = (890  550);
      maximized = false;
      sidebar-width = 202;
    };
    "org/gnome/nm-applet/eap/16588f28-9ad4-4226-b0bb-ba41077b6c59" = {
      ignore-ca-cert = false;
      ignore-phase2-ca-cert = false;
    };
    "org/gnome/nm-applet/eap/33c17e53-c057-36a2-8af5-66c5425b9f10" = {
      ignore-ca-cert = false;
      ignore-phase2-ca-cert = false;
    };
    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
      night-light-schedule-automatic = false;
      night-light-schedule-from = 22.0;
      night-light-schedule-to = 2.0;
      night-light-temperature = uint32 1700;
    };
    "org/gnome/shell" = {
      command-history = ["r"];
      disabled-extensions = ["native-window-placement@gnome-shell-extensions.gcampax.github.com"];
      enabled-extensions = ["appindicatorsupport@rgcjonas.gmail.com"  "dash-to-panel@jderose9.github.com"  "launch-new-instance@gnome-shell-extensions.gcampax.github.com"  "user-theme@gnome-shell-extensions.gcampax.github.com"  "arcmenu@arcmenu.com"];
      favorite-apps = ["firefox.desktop"  "org.gnome.Nautilus.desktop"];
      remember-mount-password = false;
      welcome-dialog-last-shown-version = "41.1";
    };
    "org/gnome/shell/extensions/arcmenu" = {
      arc-menu-placement = "DTP";
      available-placement = [false  true  false];
      menu-hotkey = "Super_L";
      pinned-app-list = ["Firefox"  ""  "firefox.desktop"  "Terminal"  ""  "org.gnome.Terminal.desktop"  "ArcMenu Settings"  "ArcMenu_ArcMenuIcon"  "gnome-extensions prefs arcmenu@arcmenu.com"];
      prefs-visible-page = 0;
      recently-installed-apps = ["jetbrains-rider.desktop"];
    };
    "org/gnome/shell/extensions/dash-to-panel" = {
      appicon-margin = 8;
      appicon-padding = 4;
      available-monitors = [0];
      hotkeys-overlay-combo = "TEMPORARILY";
      leftbox-padding = -1;
      panel-anchors = "{"0":"MIDDLE"}";
      panel-element-positions = "{"0":[{"element":"showAppsButton" "visible":false "position":"stackedTL"} {"element":"activitiesButton" "visible":false "position":"stackedTL"} {"element":"leftBox" "visible":true "position":"stackedTL"} {"element":"taskbar" "visible":true "position":"stackedTL"} {"element":"centerBox" "visible":true "position":"stackedBR"} {"element":"rightBox" "visible":true "position":"stackedBR"} {"element":"dateMenu" "visible":true "position":"stackedBR"} {"element":"systemMenu" "visible":true "position":"stackedBR"} {"element":"desktopButton" "visible":true "position":"stackedBR"}]}";
      panel-lengths = "{"0":100}";
      panel-sizes = "{"0":48}";
      status-icon-padding = -1;
      tray-padding = -1;
      window-preview-title-position = "TOP";
    };
    "org/gnome/shell/extensions/user-theme" = {
      name = "Arc-Dark";
    };
    "org/gnome/shell/world-clocks" = {
    };
    "org/gnome/tweaks" = {
      show-extensions-notice = false;
    };
    "org/gtk/settings/file-chooser" = {
      clock-format = "12h";
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = false;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 179;
      sort-column = "name";
      sort-directories-first = false;
      sort-order = "ascending";
      type-format = "category";
      window-position = (0  46);
      window-size = (1203  902);
      };
    };
  }
