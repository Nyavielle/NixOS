{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 28;
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "battery" ];

        clock = {
          format = "{:%I:%M %p  %d.%m.%Y}";
        };

        battery = {
          format = "{}%";
        };
      };
    };

    style = ''
      * {
        font-family: "Terminus";
        font-size: 14px;
        background-color: #000000;
        color: #00FF00;
        border: none;
        box-shadow: none;
      }

      window {
        border-bottom: 2px solid #00FF00;
      }

      #workspaces button {
        padding: 0 6px;
        background: transparent;
        color: #00FF00;
        border: none;
      }

      #workspaces button.active {
        text-decoration: underline;
        font-weight: bold;
      }

      #clock, #battery {
        padding: 0 10px;
      }
    '';
  };
}

