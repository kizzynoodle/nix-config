# options.nix
# Nixvim global option settings
{
  # Let Home manager manage Neovim
  programs.nixvim = {
    enable = true;

    # Set as default editor
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    # Set colorscheme
    # TODO: Let stylix manage color scheme
    colorschemes.gruvbox.enable = true;

    # Set global options
    globals = { mapleader = "º"; };

    # Set local options
    opts = {
      # Show relative line numbers
      number = true;
      relativenumber = true;

      # Set tab to 2 spaces
      expandtab = true;
      shiftwidth = 2;
      tabstop = 2;

      # Enable more colors
      termguicolors = true;

      # Better completion experience
      completeopt = [ "menuone" "noselect" "noinsert" ];

      # Always show sign column (so text isn't shifted)
      signcolumn = "yes";

      # Enable mouse
      mouse = "a";

      # Search
      ignorecase = true;
      smartcase = true;

      # Use treesitter for folding by default
      foldcolumn = "1";
      foldlevel = 99;
      foldenable = true;
      foldlevelstart = 99;

      # Configure how new splits should be opened
      splitright = true;
      splitbelow = true;

      # Raw lua code, non visible chars
      list = true;
      listchars.__raw = ''
        { 
            tab = '» ', 
            nbsp = '␣',
            trail = '·', 
            extends = '⟩',
            precedes = '⟨'
        }'';
      showbreak = "↪";

      # Set encoding
      encoding = "utf-8";
      fileencoding = "utf-8";

      # Save undo history
      undofile = true;
      swapfile = true;
      backup = false;
      autoread = true;

      # Highlight the current line for cursor
      cursorline = true;

      # Show line and column when searching
      ruler = true;

      # Start scrolling when cursor is X lines away from top/bottom
      scrolloff = 5;
    };
  };
}
