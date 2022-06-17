-- vim:fileencoding=utf-8:foldmethod=marker:foldmarker={{{,}}}

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

cmd [[packadd packer.nvim]]

require('plugin_conf/neovide') -- load Neovide config

return require('packer').startup(function(use)
    use
    {
      'wbthomason/packer.nvim'                                  -- Plugin manager
    }

    use
    {
      'nvim-lualine/lualine.nvim',                                -- Statusline
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
      config   = function() require('plugin_conf/lualine') end
    }

    use
    {
      'romgrk/barbar.nvim',                                       -- Tab bar
      requires = { 'kyazdani42/nvim-web-devicons' },
      config   = function() require('plugin_conf/barbar') end
    }

    use
    {
      'numToStr/FTerm.nvim',                                      -- Floating terminal
      config   = function() require('plugin_conf/fterm') end
    }

    use
    {
      'kevinhwang91/rnvimr',                                     -- File manager
      config   = function() require('plugin_conf/rnvimr') end
    }

    use
    {
      'is0n/jaq-nvim',                                           -- Quick-run code
      config   = function() require('plugin_conf/jaq') end
    }

    use
    {
      'petertriho/nvim-scrollbar',                               -- Scrollbar
      config   = function() require('plugin_conf/scrollbar') end
    }

    use
    {
      'yamatsum/nvim-cursorline',                                -- Underline similar stuff
      config   = function() require('plugin_conf/cursorline') end
    }

    use
    {
      'ethanholz/nvim-lastplace'                                -- Remember last place in file
    }

    use
    {
      'windwp/nvim-autopairs',                                   -- Bracket matching/pairing
      config   = function() require('plugin_conf/autopairs') end
    }

    use
    {
      'andymass/vim-matchup'                                    -- Better '%'
    }

    use
    {
      'numToStr/Comment.nvim',                                   -- Commands to comment text
      config   = function() require('plugin_conf/comment') end
    }

    use
    {
      'lukas-reineke/indent-blankline.nvim',                     -- Indent lines
      config   = function() require('plugin_conf/indent_blankline') end
    }

    use
    {
      'norcalli/nvim-colorizer.lua',                             -- Render colors present in text
      config   = function() require('plugin_conf/colorizer') end
    }

    use
    {
      'goolord/alpha-nvim',                                     -- Start screen
      requires = { 'kyazdani42/nvim-web-devicons' },
      config   = function() require('plugin_conf/alpha') end
    }

    use
    {
      'andweeb/presence.nvim',                                   -- Discord Rich Presence (yes, really)
      config   = function() require('plugin_conf/presence') end
    }

    use
    {
      'booperlv/nvim-gomove',                                    -- Move selection in file
      config   = function() require('plugin_conf/gomove') end
    }

    use
    {
      'folke/which-key.nvim',                                    -- Keybind tooltips
      config   = function() require('plugin_conf/which-key') end
    }

    use
    {
      'rainbowhxch/accelerated-jk.nvim'                         -- Repeat jk movements
    }

    use
    {
      'mrjones2014/smart-splits.nvim'                           -- Better split resize
    }

    use
    {
      'sindrets/winshift.nvim'                                  -- Better split move
    }

    use
    {
      'lervag/vimtex',                                           -- LaTeX support
      config   = function() require('plugin_conf/vimtex') end
    }

    use
    {
      'glacambre/firenvim',                                       -- Neovim in browser
      run = function() fn['firenvim#install'](0) end
    }

    use
    {
      'tpope/vim-surround'                                      -- Surround text in parentheses
    }

    use
    {
      'nvim-treesitter/nvim-treesitter',                          -- Better syntax highlighting
      run = ':TSUpdate', --why won't this work
      config   = function() require('plugin_conf/treesitter') end
    }

    use
    {
      'ms-jpq/coq_nvim',                                          -- Tab completion
      branch   = 'coq',
      run      = ':COQdeps',
      requires =
      {
        {
          'ms-jpq/coq.artifacts',                                 -- 9k+ snippets
          branch = 'artifacts'
        },
        {
          'ms-jpq/coq.thirdparty',                                -- third party sources
          branch = '3p'
        }
      },
      config   = function() require('plugin_conf/coq') end
    }

    use
    {
      'williamboman/nvim-lsp-installer',                         -- LSP installer
      config   = function() require('plugin_conf/lsp-installer') end
    }

    use
    {
      'neovim/nvim-lspconfig',                                   -- LSP server configuration
      config   = function() require('plugin_conf/lsp-installer') require('plugin_conf/lspconfig')  end
    }

--[[
    use
    {
      'arcticicestudio/nord-vim',                              -- Nord
    }
]]

--[[
    use
    {
      'fneu/breezy',                                           -- Breeze Dark
    }
]]

--[[
    use
    {
      'dracula/vim',                                            -- Dracula
      as       = 'dracula'
    }
]]

--[[
    use
    {
      'morhetz/gruvbox',                                       -- Gruvbox
    }
]]

    use
    {
      "catppuccin/nvim",                                          -- Catppuccin
      as       = "catppuccin",
      config   = function() require('plugin_conf/catppuccin') end
    }

  if packer_bootstrap then
    require('packer').sync()
  end
end)