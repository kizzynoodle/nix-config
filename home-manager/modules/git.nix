# git.nix
# Git config for home manager
{
  # Git
  programs.git = {
    enable = true;
    userName = "kizzy";
    userEmail = "kizzytastic@gmail.com";
  };
}
