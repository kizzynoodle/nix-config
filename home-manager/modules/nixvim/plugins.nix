# plugins.nix
# Nixvim plugin import
{ pkgs, ... }: {
  programs.nixvim.plugins = {
    # Status bar
    lualine.enable = true;

    # Buffer bar
    bufferline.enable = true;

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

    # Highlight word under cursor
    illuminate = {
      enable = true;
      underCursor = false;
      filetypesDenylist =
        [ "Outline" "TelescopePrompt" "alpha" "harpoon" "reason" ];
    };

    # Break bad habits, master Vim motions
    hardtime = {
      enable = false;
      settings = {
        disableMouse = true;
        enabled = false;
        disabledFiletypes = [ "Oil" ];
        restrictionMode = "hint";
        hint = true;
        maxCount = 40;
        maxTime = 1000;
        restrictedKeys = {
          "h" = [ "n" "x" ];
          "j" = [ "n" "x" ];
          "k" = [ "n" "x" ];
          "l" = [ "n" "x" ];
          "-" = [ "n" "x" ];
          "+" = [ "n" "x" ];
          "gj" = [ "n" "x" ];
          "gk" = [ "n" "x" ];
          "<CR>" = [ "n" "x" ];
          "<C-M>" = [ "n" "x" ];
          "<C-N>" = [ "n" "x" ];
          "<C-P>" = [ "n" "x" ];
        };
      };
    };

    # LSP
    lsp = {
      enable = true;
      # autoLoad = true;
      inlayHints = true;
      servers = {
        cssls.enable = true; # CSS
        html.enable = true; # HTML
        marksman.enable = true; # Markdown
        nil_ls.enable = true; # Nix
        bashls.enable = true; # Bash
        clangd.enable = true; # C/C++
        yamlls.enable = true; # YAML
        jsonls.enable = true; # JSON
        ltex = {
          enable = true;
          settings = {
            enabled =
              [ "astro" "html" "latex" "markdown" "text" "tex" "gitcommit" ];
            completionEnabled = true;
            language = "en-US es-ES nl";
          };
        };
        lua_ls = { # Lua
          enable = true;
          settings.telemetry.enable = false;
        };
        rust_analyzer = {
          enable = true;
          installRustc = true;
          installCargo = true;
        };
      };

      keymaps.lspBuf = {
        "gd" = "definition";
        "gD" = "references";
        "gt" = "type_definition";
        "gi" = "implementation";
        "K" = "hover";
      };
    };

    luasnip = { enable = true; };

    copilot-lua = { enable = true; };

    cmp-emoji.enable = true;

    cmp = {
      enable = true;
      settings = {
        completion = { completeopt = "menu,menuone,noinsert"; };
        autoEnableSources = true;
        experimental = { ghost_text = true; };
        performance = {
          debounce = 60;
          fetchingTimeout = 200;
          maxViewEntries = 30;
        };
        sources = [
          { name = "nvim_lsp"; }
          { name = "emoji"; }
          { name = "git"; }
          {
            name = "buffer";
            option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
            keywordLength = 3;
          }
          { name = "copilot"; } # enable/disable copilot
          {
            name = "path"; # file system paths
            keywordLength = 3;
          }
          {
            name = "luasnip"; # snippets
            keywordLength = 3;
          }
        ];
        cmdline = {
          # Use buffer source for "/" and "?"
          "/" = {
            mapping = { __raw = "cmp.mapping.preset.cmdline()"; };
            sources = [{ name = "buffer"; }];
          };
          "?" = {
            mapping = { __raw = "cmp.mapping.preset.cmdline()"; };
            sources = [{ name = "buffer"; }];
          };
          # Use cmdline & path source for ":"
          ":" = {
            mapping = { __raw = "cmp.mapping.preset.cmdline()"; };
            sources = [
              { name = "path"; }
              {
                name = "cmdline";
                option = { ignore_cmds = [ "Man" "!" ]; };
              }
            ];
            matching = { disallow_symbol_nonprefix_matching = false; };
          };
        };
        window = {
          completion = { border = "solid"; };
          documentation = { border = "solid"; };
        };
        snippet.expand = ''
          function(args)
            require('luasnip').lsp_expand(args.body)
          end
        '';
        mapping = {
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          "<C-j>" = "cmp.mapping.select_next_item()";
          "<C-k>" = "cmp.mapping.select_prev_item()";
          "<C-e>" = "cmp.mapping.close()";
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<C-l>" = ''
            cmp.mapping(function()
              if luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
              end
            end, { 'i', 's' })
          '';
          "<C-h>" = ''
            cmp.mapping(function()
              if luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
              end
            end, { 'i', 's' })
          '';
        };
      };
    };

    cmp-nvim-lsp = { enable = true; };
    cmp-nvim-lua = { enable = true; };
    cmp-buffer = { enable = true; };
    cmp-path = { enable = true; };
    cmp_luasnip = { enable = true; };
    cmp-cmdline = { enable = true; };

    lspkind = {
      enable = true;
      symbolMap = { Copilot = ""; };
      extraOptions = {
        maxwidth = 50;
        ellipsis_char = "...";
      };
    };

    schemastore = {
      enable = true;
      yaml.enable = true;
      json.enable = false;
    };

    # Better file highlighting
    treesitter = {
      enable = true;
      nixGrammars = true;
      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        bash
        c
        cpp
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
      settings = {
        progress = {
          suppress_on_insert = true;
          ignore_done_already = true;
          poll_rate = 1;
        };

        notification.window.winblend = 0;

        integration = { "nvim-tree".enable = true; };
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
      autoLoad = true;
      settings = {
        groups = [
          "Normal"
          "NormalNC"
          "Comment"
          "Constant"
          "Special"
          "Identifier"
          "Statement"
          "PreProc"
          "Type"
          "Underlined"
          "Todo"
          "String"
          "Function"
          "Conditional"
          "Repeat"
          "Operator"
          "Structure"
          "LineNr"
          "SignColumn"
          "EndOfBuffer"
          "CursorLine"
          "CursorLineNR"
        ];
        extra_groups = [ "GitSignsAdd" "GitSignsChange" "GitSignsDelete" ];
        exclude_groups = [ "NonText" "StatusLine" "StatusLineNC" ];
      };
    };
  };
}
