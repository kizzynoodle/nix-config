# keymaps.nix
{
  programs.nixvim.keymaps = [

    # {{{ UI keybinds
    {
      key = "<C-t>";
      mode = "n";
      action = "<cmd>NvimTreeToggle<CR>";
      options = {
        silent = true;
        desc = "Toggle NvimTree";
      };
    }
    # }}}

    # {{{ Fold keybinds
    # {
    #   action = "require('ufo').openAllFolds()";
    #   key = "zR";
    #   options = { desc = "Open all folds"; };
    # }
    # {
    #   action = "require('ufo').closeAllFolds()";
    #   key = "zM";
    #   options = { desc = "Close all folds"; };
    # }
    {
      key = "zK";
      mode = "n";
      action = ''
        function()
          local winid = require('ufo').peekFoldedLinesUnderCursor()
          if not winid then
            vim.lsp.buf.hover()
          end
        end
      '';
      options = { desc = "Peek Fold"; };
    }
    # }}}
  ];
}
