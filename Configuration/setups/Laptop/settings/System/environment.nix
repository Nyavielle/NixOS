{
  environment.sessionVariables = rec {
    TERMINAL = "alacritty";
    EDITOR = "nvim";
  };

  xdg.mime.defaultApplications = {
    "inode/directory" = "ranger";
  };
}
