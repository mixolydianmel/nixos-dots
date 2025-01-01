{ config, pkgs, ... }:
{
  # Neovim
  programs.neovim =
    let
      toLua = str: ''
        lua << EOF
        ${str}
        EOF
      '';
      toLuaFile = file: ''
        lua << EOF
        ${builtins.readFile file}
        EOF
      '';
    in
    {
      enable = true;
      defaultEditor = true;

      extraPackages = with pkgs; [
        wl-clipboard
        stylua
        tree-sitter

        # LSP
        lua-language-server

        # Images
        imagemagick
      ];

      extraLuaPackages = ps: [
        ps.magick
        ps.lua-utils-nvim
        ps.pathlib-nvim
        ps.nvim-nio
      ];

      extraLuaConfig = "${builtins.readFile ../configs/nvim/options.lua}";

      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      plugins = with pkgs.vimPlugins; [
        # Deps
        plenary-nvim

        # Colorscheme
        {
          plugin = onedark-nvim;
          config = toLuaFile ../configs/nvim/plugins/onedark.lua;
        }

        # Coding
        {
          plugin = luasnip; # Snippet enigne
          config = toLuaFile ../configs/nvim/plugins/luasnip.lua;
        }
        friendly-snippets # Snippets for multiple langs
        {
          plugin = nvim-cmp; # Autocompletion
          config = toLuaFile ../configs/nvim/plugins/cmp.lua;
        }
        cmp-nvim-lsp
        cmp-buffer
        cmp-path
        cmp_luasnip
        {
          plugin = nvim-autopairs; # Automatic paired delimiters
          config = toLua "require('nvim-autopairs').setup {}";
        }
        {
          plugin = nvim-surround; # Surround selections, stylishly
          config = toLua "require('nvim-surround').setup {}";
        }
        {
          plugin = comment-nvim; # Powerful comment management
          config = toLua "require('Comment').setup {}";
        }
        {
          plugin = toggleterm-nvim; # Terminal in your neovim!
          config = toLua "require('toggleterm').setup { shell = 'nu', }";
        }
        {
          plugin = flatten-nvim; # Squish sessions into current window
          config = toLua "require('flatten').setup {}";
        }
        nvim-navic # Breadcrumbs for scopes
        {
          plugin = barbecue-nvim;
          config = toLua "require('barbecue').setup {}";
        }

        # DAP
        nvim-dap
        nvim-dap-ui
        nvim-dap-virtual-text

        # Editor
        neo-tree-nvim # File browser
        {
          plugin = oil-nvim; # Filesystem as a buffer
          config = toLua "require('oil').setup {}";
        }
        nvim-spectre # Find-and-replace across multiple files
        flash-nvim # Jump labels for search
        {
          plugin = which-key-nvim; # Key browsing
          config = toLuaFile ../configs/nvim/plugins/which-key.lua;
        }
        {
          plugin = gitsigns-nvim; # Changes in signcolumn
          config = toLua "require('gitsigns').setup()";
        }
        vim-illuminate # Highlight word under cursor
        bufdelete-nvim # Delete buffers cleanly
        {
          plugin = trouble-nvim; # Diagnostic list and others
          config = toLua "require('trouble').setup {}";
        }
        {
          plugin = todo-comments-nvim; # Finds and lists certain comments
          config = toLua "require('todo-comments').setup {}";
        }
        telescope-nvim # Find things in many places
        {
          plugin = flit-nvim; # Enhanced f/t motions for leap
          config = toLua "require('flit').setup {}";
        }
        {
          plugin = leap-nvim; # Scoot around
          # config = toLua "require('leap').create_default_mappings()";
        }
        vim-repeat # Make certain actions (e.g. leap) .-repeatable
        {
          plugin = aerial-nvim; # Outline of symbols in a file
          config = toLua "require('aerial').setup {}";
        }
        {
          plugin = edgy-nvim; # Control your window layout
          config = toLuaFile ../configs/nvim/plugins/edgy.lua;
        }
        {
          plugin = neorg; # A better notetaking plugin
          config = toLuaFile ../configs/nvim/plugins/neorg.lua;
        }
        nvim-nio # Neorg dep
        {
          plugin = image-nvim; # Images! In the terminal!
          config = toLuaFile ../configs/nvim/plugins/image.lua;
        }
        typst-vim # Rich Typst support

        # Formatting
        {
          plugin = conform-nvim; # Auto formatting
          config = toLuaFile ../configs/nvim/plugins/conform.lua;
        }
        {
          plugin = none-ls-nvim; # Inject into lsp for linting / other
          config = toLuaFile ../configs/nvim/plugins/none-ls.lua;
        }

        # Linting
        nvim-lint # Extensible linter

        # LSP
        {
          plugin = nvim-lspconfig; # LSP server configuration
          config = toLuaFile ../configs/nvim/plugins/lspconfig.lua;
        }

        neoconf-nvim # Manage global and project-local settings
        nvim-lightbulb # Lightbulb popup on lines with code actions
        lspkind-nvim # Icons in lsp popup

        # Treesitter
        {
          plugin = nvim-treesitter.withPlugins (
            _:
            nvim-treesitter.allGrammars
            ++ [
              pkgs.tree-sitter-grammars.tree-sitter-uiua
            ]
          );
          config = toLuaFile ../configs/nvim/plugins/treesitter.lua;
        }

        nvim-treesitter-textobjects # More text objects

        # UI
        {
          plugin = nvim-notify; # Better backend for notifications
          config = toLua "require('notify').setup { background_colour = '#000000' }";
        }
        dressing-nvim # Better vim UI
        {
          plugin = bufferline-nvim; # Fancy lookin tabs
          config = toLua "require('bufferline').setup {}";
        }
        {
          plugin = lualine-nvim; # Status bar
          config = toLua "require('lualine').setup { options = { theme = 'onedark', }, }";
        }
        {
          plugin = indent-blankline-nvim; # Indentation markings
          config = toLua "require('ibl').setup {}";
        }
        {
          plugin = noice-nvim; # Replaces UI for messages
          config = toLuaFile ../configs/nvim/plugins/noice.lua;
        }
        {
          plugin = nvim-web-devicons; # Icons
          config = toLua "require('nvim-web-devicons').setup {}";
        }
        nui-nvim # UI components
        {
          plugin = dashboard-nvim; # Empty nvim dashboard
          config = toLua "require('dashboard').setup {}";
        }

        # Util
        {
          plugin = persistence-nvim; # Session management
          config = toLua "require('persistence').setup {}";
        }
      ];
    };
}
