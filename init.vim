call plug#begin()
" Syntax highlighting
"Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Color themes
" Plug 'jaredgorski/spacecamp'
" Plug 'mhartington/oceanic-next'
" Plug 'joshdick/onedark.vim'
" Plug 'humanoid-colors/vim-humanoid-colorscheme'
" Plug 'ayu-theme/ayu-vim'
" Plug 'rmehri01/onenord.nvim', { 'branch': 'main' }
" Plug 'rose-pine/neovim'
" Plug 'morhetz/gruvbox'
Plug 'sainnhe/everforest'

" Lazygit plugin
Plug 'kdheepak/lazygit.nvim'

" coc for language servers
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" go tools
Plug 'darrikonn/vim-gofmt'
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Better quickfix
Plug 'kevinhwang91/nvim-bqf'

" vbnet tools
Plug 'vim-scripts/vbnet.vim'

" Smooth scrolling plugins (Only use one at a time)
Plug 'psliwka/vim-smoothie'

" close tags for jsx, html
Plug 'alvan/vim-closetag'

" Toggle term plugin
Plug 'akinsho/toggleterm.nvim'

" status bar plug
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" file searching
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" delete buffer without closing window
Plug 'rbgrouleff/bclose.vim'

" surround with whatever
Plug 'tpope/vim-surround'

" commenting plugin
Plug 'tpope/vim-commentary'

" Folding plugin
Plug 'pseewald/vim-anyfold'

" never forget keybindings
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

" highlighting current line
Plug 'miyakogi/conoline.vim'

" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Another file explorer
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

" Debugger
Plug 'puremourning/vimspector'
call plug#end()

" general mappings
source $HOME/.config/nvim/config/general.vimrc
" mapping specific to coc
source $HOME/.config/nvim/config/coc.vimrc
" Lua crap mappings
source $HOME/.config/nvim/config/lua.vimrc
" Syntax highlighting
source $HOME/.config/nvim/config/tree-sitter-config.vimrc

" Set up folding plugin
filetype plugin indent on
syntax on
autocmd BufNewFile,BufRead * AnyFoldActivate
set foldlevel=99
hi Folded term=underline

" Reinstall highlight if you want this
autocmd CursorHold * silent call CocActionAsync('highlight')
hi CocHighlightText term=underline gui=underline

" Comment support for vb
autocmd FileType vbnet setlocal commentstring='\ %s

" Set up web dev icons
function! StartifyEntryFormat() abort
  return 'v:lua.webDevIcons(absolute_path) . " " . entry_path'
endfunction

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

set tags=./tags,tags;$HOME
