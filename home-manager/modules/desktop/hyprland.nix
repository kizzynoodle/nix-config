{ inputs, lib, pkgs, user, ... }:

{
  # wayland.windowManager.hyprland = {
  wayland.windowManager.hyprland = {
    # Enable hyprland as a NixOS module
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    portalPackage =
      inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
    plugins = [
      inputs.Hyprspace.packages.${pkgs.system}.Hyprspace
      inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
      inputs.hyprland-plugins.packages.${pkgs.system}.hyprtrails
      inputs.hyprland-plugins.packages.${pkgs.system}.hyprexpo
    ];
    xwayland.enable = true;
    systemd.enable = true;

    settings = {
      ################
      ### MONITORS ###
      ################

      monitor = ",preferred,auto,auto";

      #################
      ### VARIABLES ###
      #################

      # Programs
      "$terminal" = "kitty";
      "$fileManager" = "dolphin";
      "$menu" =
        "wofi --show drun --allow-images --style=/home/${user}/.nix-config/home-manager/modules/desktop/wofi.css";

      # Super key
      "$mainMod" = "SUPER";
      "$shiftMod" = "SUPER SHIFT";

      #################
      ### AUTOSTART ###
      #################

      exec-once = [
        "nm-applet --indicator &"
        "waybar &"
        "playerctld &"
        "hyprpaper &"
        "mako --config /home/${user}/.config/hypr/mako.config"
      ];

      #############################
      ### ENVIRONMENT VARIABLES ###
      #############################

      env = [ "XCURSOR_SIZE,24" "HYPRCURSOR_SIZE,24" ];

      #####################
      ### LOOK AND FEEL ###
      #####################

      # Refer to https://wiki.hyprland.org/Configuring/Variables/

      # https://wiki.hyprland.org/Configuring/Variables/#general
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = lib.mkForce "rgba(fe8019ff)";
        "col.inactive_border" = lib.mkForce "rgba(3c3836ff)";

        # Set to true enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false;

        # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false;

        layout = "dwindle";
      };

      # https://wiki.hyprland.org/Configuring/Variables/#decoration
      decoration = {
        #rounding = 10
        #rounding_power = 2

        # Change transparency of focused and unfocused windows
        active_opacity = 1.0;
        inactive_opacity = 1.0;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          # color = rgba(1a1a1aee)
        };

        # https://wiki.hyprland.org/Configuring/Variables/#blur
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      plugin = {

        # TODO: Make it work :V
        hyprbars = {
          bar_height = 16;
          bar_color = "rgba(1d2021ff)";
          "col.text" = "rgba(ebdbb2ff)";
          # bar_text_size = 10;
          bar_text_font = "FiraCode Nerd Font";
          # bar_button_padding = 10;
          # bar_padding = 10;
          bar_precedence_over_border = true;
          hyprbars-button = [
            "rgba(fb4934ff), 20, , hyprctl dispatch killactive"
            "rgba(b8bb26ff), 20, , hyprctl dispatch fullscreen 2"
            "rgba(83a598ff), 20, , hyprctl dispatch togglefloating"
          ];
        };

        hyprtrails = { color = "rgba(fe8019ff)"; };

        hyprexpo = {
          columns = 3;
          gap_size = 5;
          bg_col = "rgb(111111)";
          # [center/first] [workspace] e.g. first 1 or center m+1
          workspace_method = "center current";

          enable_gesture = true; # laptop touchpad
          gesture_fingers = 3; # 3 or 4
          gesture_distance = 300; # how far is the "max"
          gesture_positive = true; # positive = swipe down. Negative = swipe up.
        };
      };

      # https://wiki.hyprland.org/Configuring/Variables/#animations
      animations = {
        enabled = "yes, please :)";

        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];

        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
        ];
      };

      # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
      master = { new_status = "dwindle"; };

      # https://wiki.hyprland.org/Configuring/Variables/#misc
      misc = {
        # force_default_wallpaper = -1;
        disable_hyprland_logo = lib.mkForce true;
      };

      #############
      ### INPUT ###
      #############

      # https://wiki.hyprland.org/Configuring/Variables/#input
      input = {
        kb_layout = "es";
        # kb_variant =
        # kb_model =
        # kb_options =
        # kb_rules =

        follow_mouse = 1;
        sensitivity = 0;
        touchpad = { natural_scroll = false; };
      };

      # https://wiki.hyprland.org/Configuring/Variables/#gestures
      gestures = { workspace_swipe = false; };

      # Example per-device config
      # See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more
      #device = {
      #  name = "epic-mouse-v1";
      #  sensitivity = -0.5;
      #};

      ###################
      ### KEYBINDINGS ###
      ###################

      # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more

      bind = [
        "$mainMod, Q, exec, $terminal"
        "$mainMod, C, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, V, togglefloating,"
        "$mainMod, F, fullscreen,"
        "$mainMod, R, exec, $menu"
        "$mainMod, P, pseudo, dwindle"
        "$mainMod, T, togglesplit, dwindle"
        "$mainMod, W, exec, pkill waybar || waybar"

        # Move focus with mainMod + arrow keys
        "$mainMod, H, movefocus, l"
        "$mainMod, L, movefocus, r"
        "$mainMod, K, movefocus, u"
        "$mainMod, J, movefocus, d"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # Magic workspace toggle
        "$mainMod, S, togglespecialworkspace, magic"
        "$shiftMod, S, movetoworkspace, special:magic"

        # Scroll through existing workspaces with mainMod + scroll
        "ALT, TAB, workspace, e+1"
        "ALT SHIFT, TAB, workspace, e-1"

        # Workspace overview
        "$mainMod, TAB, overview:toggle, all"
        "$shiftMod, TAB, hyprexpo:expo, toggle"

        # Screenshot
        "$mainMod, PRINT, exec, hyprshot -m window"
        ", PRINT, exec, hyprshot -m output"
        "$shiftMod, PRINT, exec, hyprshot -m region"
      ];

      bindm = [
        # Move/resize windows with mainMod + LMB/RMB and dragging
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      bindel = [
        # Laptop multimedia keys for volume and LCD brightness
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      ];

      bindl = [
        # Requires playerctl
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      ##############################
      ### WINDOWS AND WORKSPACES ###
      ##############################

      windowrule = [
        # Ignore maximize requests from apps. You'll probably like this.
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"

        # TODO: Spawn windows in specific workspaces
        #"workspace 2, firefox"
        #"workspace 3, discord"
        #"workspace 4, steam"
        #"workspace 5, spotify"
      ];

      windowrulev2 = [ "noborder, onworkspace:w[t1]" ];
    };
  };
}
