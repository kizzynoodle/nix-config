# vim: tabstop=2 shiftwidth=2 expandtab foldmethod=marker
# plugins.nix
# Nixvim plugin import
{ lib, pkgs, ... }:
{

  # TODO: Figure out how to make lazy loading work
  # programs.nixvim.lazyLoad.enable = true;

  programs.nixvim.plugins = {

    # {{{ UI

    # Status bar
    lualine.enable = true;

    # Buffer bar
    bufferline.enable = true;

    # Icons
    web-devicons.enable = true;

    # Folding
    nvim-ufo = {
      enable = true;
      settings = {
        # Show amount of lines folded
        fold_virt_text_handler = ''
          function(virtText, lnum, endLnum, width, truncate)
            local newVirtText = {}
            local suffix = ('  %d '):format(endLnum - lnum)
            local sufWidth = vim.fn.strdisplaywidth(suffix)
            local targetWidth = width - sufWidth
            local curWidth = 0
            for _, chunk in ipairs(virtText) do
              local chunkText = chunk[1]
              local chunkWidth = vim.fn.strdisplaywidth(chunkText)
              if targetWidth > curWidth + chunkWidth then
                table.insert(newVirtText, chunk)
              else
                chunkText = truncate(chunkText, targetWidth - curWidth)
                local hlGroup = chunk[2]
                table.insert(newVirtText, {chunkText, hlGroup})
                chunkWidth = vim.fn.strdisplaywidth(chunkText)
                -- str width returned from truncate() may less than 2nd argument, need padding
                if curWidth + chunkWidth < targetWidth then
                  suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
                end
                break
              end
              curWidth = curWidth + chunkWidth
            end
            table.insert(newVirtText, {suffix, 'MoreMsg'})
            return newVirtText
          end
        '';

        # Use LSP for folding
        provide_selector = ''
          function(bufnr, filetype, buftype)
            return { 'lsp', 'treesitter', 'indent' }
          end
        '';
      };
    };

    # Highlight word under cursor
    illuminate = {
      enable = true;
      underCursor = false;
      filetypesDenylist = [
        "Outline"
        "TelescopePrompt"
        "alpha"
        "harpoon"
        "reason"
      ];
    };

    # Lazygit
    lazygit.enable = true;

    # Git signs in code
    gitsigns = {
      enable = true;
      settings.current_line_blame = true;
    };

    # Show delimiters
    indent-blankline = {
      enable = true;
      settings = {
        exclude = {
          buftypes = [
            "terminal"
            "quickfix"
          ];
          filetypes = [
            ""
            "checkhealth"
            "help"
            "lspinfo"
            "packer"
            "TelescopePrompt"
            "TelescopeResults"
            # "yaml"
          ];
        };
        #indent = {
        #  highlight = "";
        #};
        scope = {
          enabled = true;
          # highlight = "#fe8819";
          show_exact_scope = true;
        };
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
          "FoldColumn"
          "FoldContext"
          "TreesitterContextBottom"
          "TreesitterContextLineNumberBottom"
        ];
        extra_groups = [
          "GitSignsAdd"
          "GitSignsChange"
          "GitSignsDelete"
        ];
        exclude_groups = [
          "NonText"
          "StatusLine"
          "StatusLineNC"
        ];
      };
    };

    # }}} UI Plugins

    # {{{ Tweaks and utilities

    # Nix expressions in neovim
    nix.enable = true;

    # Sets tab width based on current file
    sleuth.enable = true;

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
          "h" = [
            "n"
            "x"
          ];
          "j" = [
            "n"
            "x"
          ];
          "k" = [
            "n"
            "x"
          ];
          "l" = [
            "n"
            "x"
          ];
          "-" = [
            "n"
            "x"
          ];
          "+" = [
            "n"
            "x"
          ];
          "gj" = [
            "n"
            "x"
          ];
          "gk" = [
            "n"
            "x"
          ];
          "<CR>" = [
            "n"
            "x"
          ];
          "<C-M>" = [
            "n"
            "x"
          ];
          "<C-N>" = [
            "n"
            "x"
          ];
          "<C-P>" = [
            "n"
            "x"
          ];
        };
      };
    };

    # Discord rich presence
    presence-nvim = {
      enable = true;
    };

    # }}} Tweaks and Utilities

    # {{{ LSP

    # LSP
    lsp = {
      enable = true;
      # autoLoad = true;
      inlayHints = true;
      servers = {
        cssls.enable = true; # CSS
        html.enable = true; # HTML
        marksman.enable = true; # Markdown
        # nil_ls.enable = true; # Nix
        nixd.enable = true; # Nix
        bashls.enable = true; # Bash
        clangd.enable = true; # C/C++
        yamlls.enable = true; # YAML
        jsonls.enable = true; # JSON
        ltex = {
          enable = true;
          settings = {
            enabled = [
              "astro"
              "html"
              "latex"
              "markdown"
              "text"
              "tex"
              "gitcommit"
            ];
            completionEnabled = true;
            language = "en-US es-ES nl";
          };
        };
        lua_ls = {
          # Lua
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

    luasnip = {
      enable = true;
    };

    copilot-lua = {
      enable = true;
    };

    cmp-emoji.enable = true;

    cmp = {
      enable = true;
      settings = {
        completion = {
          completeopt = "menu,menuone,noinsert";
        };
        autoEnableSources = true;
        experimental = {
          ghost_text = true;
        };
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
            mapping = {
              __raw = "cmp.mapping.preset.cmdline()";
            };
            sources = [ { name = "buffer"; } ];
          };
          "?" = {
            mapping = {
              __raw = "cmp.mapping.preset.cmdline()";
            };
            sources = [ { name = "buffer"; } ];
          };
          # Use cmdline & path source for ":"
          ":" = {
            mapping = {
              __raw = "cmp.mapping.preset.cmdline()";
            };
            sources = [
              { name = "path"; }
              {
                name = "cmdline";
                option = {
                  ignore_cmds = [
                    "Man"
                    "!"
                  ];
                };
              }
            ];
            matching = {
              disallow_symbol_nonprefix_matching = false;
            };
          };
        };
        window = {
          completion = {
            border = "solid";
          };
          documentation = {
            border = "solid";
          };
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

    cmp-nvim-lsp = {
      enable = true;
    };
    cmp-nvim-lua = {
      enable = true;
    };
    cmp-buffer = {
      enable = true;
    };
    cmp-path = {
      enable = true;
    };
    cmp_luasnip = {
      enable = true;
    };
    cmp-cmdline = {
      enable = true;
    };
    cmp-latex-symbols = {
      enable = true;
    };

    lspkind = {
      enable = true;
      symbolMap = {
        Copilot = "";
      };
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

    # Indicate current context
    treesitter-context = {
      enable = true;
      settings = {
        max_lines = 2;
      };
    };

    # Auto formatting
    conform-nvim = {
      enable = true;
      settings = {
        format_on_save = {
          lsp_format = "fallback";
          timeout_ms = 500;
        };
        format_after_save = {
          lsp_format = "fallback";
        };
        log_level = "warn";
        notify_on_error = true;
        notify_no_formatters = true;
        formatters_by_ft = {
          bash = [ "shfmt" ];
          nix = [ "nixfmt" ];
          lua = [ "stylua" ];
          json = [ "jq" ];
          yaml = [ "prettier" ];
          markdown = [ "prettier" ];
          tex = [ "latexindent" ];
          html = [ "prettier" ];
          css = [ "prettier" ];
          javascript = [ "prettier" ];
          rust = [ "rustfmt" ];

          # All file types
          "*" = [ "codespell" ];
        };
        formatters = {
          codespell.command = lib.getExe pkgs.codespell;
          jq.command = lib.getExe pkgs.jq;
          nixfmt.command = lib.getExe pkgs.nixfmt-rfc-style;
          prettier.command = lib.getExe pkgs.nodePackages.prettier;
          rustfmt.command = lib.getExe pkgs.rustfmt;
          shfmt.command = lib.getExe pkgs.shfmt;
          stylua.command = lib.getExe pkgs.stylua;
        };
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

        integration = {
          "nvim-tree".enable = true;
        };
      };
    };

    # }}} LSP Plugins

    # {{{ Language specific
    vimtex = {
      enable = true;
      settings = {
        # latexFormatter = "latexindent";

        # latexFormatterArgs = [ "-l" ];
        # latexFormatterConfig = "indentLine";
        latexLinting = true;
        latexLintingArgs = [ "--synctex=1" ];
        # latexLintingConfig = "chktexrc";
        view_method = "zathura";
        latexmk_progrname = "nvr";

        quickfix_mode = 2;
        quickfix_open_on_warning = true;
      };
    };
    # }}}
  };
}
