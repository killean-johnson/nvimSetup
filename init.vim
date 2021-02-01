call plug#begin()
" Syntax highlighting
Plug 'sheerun/vim-polyglot'

" Color themes
lug 'jaredgorski/spacecamp'
Plug 'mhartington/oceanic-next'
Plug 'joshdick/onedark.vim'
Plug 'humanoid-colors/vim-humanoid-colorscheme'
Plug 'ayu-theme/ayu-vim'

" coc for language servers
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" auto closing of brackets etc.
Plug 'yuttie/comfortable-motion.vim'

" smooth scrolling through files
Plug 'yuttie/comfortable-motion.vim'

" close tags for jsx, html
Plug 'alvan/vim-closetag'

" file searching
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" delete buffer without closing window
Plug 'rbgrouleff/bclose.vim'

" Vim wiki for personal notes
Plug 'vimwiki/vimwiki'

" surround with whatever
Plug 'tpope/vim-surround'

" commenting plugin
Plug 'tpope/vim-commentary'

" never forget keybindings
Plug 'liuchengxu/vim-which-key'

" highlighting current line
Plug 'miyakogi/conoline.vim'

" fast moving
Plug 'justinmk/vim-sneak'

Plug 'git@github.com:prettier/vim-prettier'
Plug 'git@github.com:francoiscabrol/ranger.vim'
call plug#end()

" general mappings
source $HOME/.config/nvim/config/general.vimrc
" mapping specific to coc
source $HOME/.config/nvim/config/coc.vimrc
