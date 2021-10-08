local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
        'git', 'clone', 'https://github.com/wbthomason/packer.nvim',
        install_path
    })
    execute 'packadd packer.nvim'
end

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
        'git', 'clone', 'https://github.com/wbthomason/packer.nvim',
        install_path
    })
    execute 'packadd packer.nvim'
end

-- Autocompile
vim.cmd 'autocmd BufWritePost init.lua PackerCompile'

return require('packer').startup(function(use)
    -- Package Manager
    use 'wbthomason/packer.nvim'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'tami5/lspsaga.nvim'
    use 'kabouzeid/nvim-lspinstall'
    use 'hrsh7th/nvim-compe'
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
    }
    use 'jose-elias-alvarez/nvim-lsp-ts-utils'

    -- file search
	use {'nvim-telescope/telescope.nvim',
  		requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}, {'nvim-telescope/telescope-fzy-native.nvim'}, {'nvim-telescope/telescope-media-files.nvim'}}
	}

    --General
    use 'folke/which-key.nvim'
    use 'windwp/nvim-autopairs'
    use 'kyazdani42/nvim-tree.lua'
    use 'b3nj5m1n/kommentary'
    use 'p00f/nvim-ts-rainbow'
    use 'folke/lsp-colors.nvim'

    --Themeing
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'projekt0n/github-nvim-theme'
    use 'rakr/vim-two-firewatch'
    use 'folke/tokyonight.nvim'
    use 'tomasiser/vim-code-dark'
    use 'jparise/vim-graphql'

    -- Git manager
    use 'tpope/vim-fugitive'

end)
