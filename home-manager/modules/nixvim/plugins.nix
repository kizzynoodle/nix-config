# plugins.nix
# Nixvim plugin import
{ pkgs, ... }:

{
  programs.nixvim.plugins = {
    # Status bar
    lualine.enable = true;

    # Icons
    web-devicons.enable = true;

    # Sets tab width based on current file
    sleuth.enable = true;

    # Lazygit
    lazygit.enable = true;

    # Git signs in code
    gitsigns = {
      enable = true;
      settings.current_line_blame = true;
    };

    # Nix expressions in neovim
    nix.enable = true;

    # LSP
    lsp = {
      enable = true;
      # autoLoad = true;
      inlayHints = true;
      servers = {
        bashls.enable = true;
        clangd.enable = true;
        nixd.enable = true;
      };

      keymaps.lspBuf = {
        "gd" = "definition";
        "gD" = "references";
        "gt" = "type_definition";
        "gi" = "implementation";
        "K" = "hover";
      };
    };

    # Better file highlighting
    treesitter = {
      enable = true;
      nixGrammars = true;
      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        bash
        json
        lua
        make
        markdown
        nix
        regex
        vim
        vimdoc
        xml
        yaml
      ];
      settings = {
        highlight.enable = true;
        indent.enable = true;
      };
    };

    treesitter-context = {
      enable = true;
      settings = { max_lines = 2; };
    };

    # Show delimiters
    indent-blankline = {
      enable = true;
      settings.scope = {
        enabled = true;
        show_exact_scope = true;
      };
    };

    # Auto formatting and diagnostics
    none-ls = {
      enable = true;
      sources = { formatting = { nixfmt.enable = true; }; };

      settings = {
        on_attach = ''
          function(client, bufnr)
            if client.supports_method("textDocument/formatting") then
              vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
              vim.api.nvim_create_autocmd("BufWritePre", {
                  group = augroup,
                  buffer = bufnr,
                  callback = function()
                      vim.lsp.buf.format({ async = false })
                      -- vim.lsp.buf.formatting_sync()
                  end,
              })
            end
          end 
        '';
      };
    };

    # LSP Message and notif daemon
    fidget = {
      enable = true;
      settings.progress = {
        suppress_on_insert = true;
        ignore_done_already = true;
        poll_rate = 1;
      };
    };

    # NVIM Tree
    # TODO: Add keybinds for opening and closing nvim tree
    nvim-tree = {
      enable = true;
      openOnSetupFile = true;
      autoReloadOnWrite = true;
    };

    # Transparency
    transparent = {
      enable = true;
      # TODO: Figure out how to make git signs transparent
      settings = {
        extra_groups = [ "GitSignsAdd" "GitSignsChange" "GitSignsDelete" ];
      };
    };
  };
}
