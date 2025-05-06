# git.nix
# Git config for home manager
{ user, ... }:
{
  # Git
  programs.git = {
    enable = true;
    userName = "${user}";
    userEmail = "kizzytastic@gmail.com";
  };
}
