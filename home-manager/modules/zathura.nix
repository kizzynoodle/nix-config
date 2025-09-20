# zathura.nix
# Home manager kit config settings
{ lib, pkgs, ... }:
{
  programs.zathura = lib.mkForce {
    enable = true;
    package = (pkgs.zathura.override { plugins = with pkgs.zathuraPkgs; [ zathura_pdf_mupdf ]; });
    options = {
      notification-error-bg = "rgba(29,32,33,0.9)"; # bg
      notification-error-fg = "rgba(251,73,52,1)"; # bright:red
      notification-warning-bg = "rgba(29,32,33,0.9)"; # bg
      notification-warning-fg = "rgba(250,189,47,1)"; # bright:yellow
      notification-bg = "rgba(29,32,33,0.9)"; # bg
      notification-fg = "rgba(184,187,38,1)"; # bright:green

      completion-bg = "rgba(80,73,69,0.9)"; # bg2
      completion-fg = "rgba(235,219,178,1)"; # fg
      completion-group-bg = "rgba(60,56,54,0.9)"; # bg1
      completion-group-fg = "rgba(146,131,116,1)"; # gray
      completion-highlight-bg = "rgba(131,165,152,1)"; # bright:blue
      completion-highlight-fg = "rgba(80,73,69,0.9)"; # bg2

      index-bg = "rgba(80,73,69,0.9)"; # bg2
      index-fg = "rgba(235,219,178,1)"; # fg
      index-active-bg = "rgba(131,165,152,1)"; # bright:blue
      index-active-fg = "rgba(80,73,69,0.9)"; # bg2

      inputbar-bg = "rgba(29,32,33,0.9)"; # bg
      inputbar-fg = "rgba(235,219,178,1)"; # fg

      statusbar-bg = "rgba(80,73,69,0.9)"; # bg2
      statusbar-fg = "rgba(235,219,178,1)"; # fg

      highlight-color = "rgba(250,189,47,0.5)"; # bright:yellow
      highlight-active-color = "rgba(254,128,25,0.5)"; # bright:orange

      default-bg = "rgba(29,32,33,0)"; # bg
      default-fg = "rgba(235,219,178,1)"; # fg
      render-loading = true;
      render-loading-bg = "rgba(29,32,33,0.9)"; # bg
      render-loading-fg = "rgba(235,219,178,1)"; # fg

      recolor-lightcolor = "rgba(29,32,33,0.9)"; # bg
      recolor-darkcolor = "rgba(235,219,178,1)"; # fg
      recolor = "true";
      recolor-keephue = "true"; # keep original color

      guioptions = ""; # disable bottom bar
      adjust-open = "width"; # fit to width when opening
      page-padding = 0;
    };
  };
}
