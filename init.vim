call plug#begin()
" Syntax highlighting
Plug 'sheerun/vim-polyglot'

" Color themes
Plug 'jaredgorski/spacecamp'
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

" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

Plug 'francoiscabrol/ranger.vim'
call plug#end()

" general mappings
source $HOME/.config/nvim/config/general.vimrc
" mapping specific to coc
source $HOME/.config/nvim/config/coc.vimrc

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif
