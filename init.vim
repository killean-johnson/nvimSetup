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

" go tools
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Better quickfix
Plug 'kevinhwang91/nvim-bqf'

" vbnet tools
Plug 'vim-scripts/vbnet.vim'

" diff tools
Plug 'will133/vim-dirdiff'

" jira plugin
Plug 'n0v1c3/vira', { 'do': './install.sh' }

" Smooth scrolling plugins (Only use one at a time)
"Plug 'yuttie/comfortable-motion.vim'
Plug 'psliwka/vim-smoothie'

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

" Folding plugin
Plug 'pseewald/vim-anyfold'

" never forget keybindings
Plug 'liuchengxu/vim-which-key'

" highlighting current line
Plug 'miyakogi/conoline.vim'

" fast moving
Plug 'justinmk/vim-sneak'

" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" File explorer
Plug 'francoiscabrol/ranger.vim'

" Debugger
"Plug 'puremourning/vimspector'
call plug#end()

" general mappings
source $HOME/.config/nvim/config/general.vimrc
" mapping specific to coc
source $HOME/.config/nvim/config/coc.vimrc

" Auto set syntax highlighting and folding to vbnet for vb files
"autocmd BufNewFile,BufRead *.vb set ft=vbnet

" Set up folding plugin
filetype plugin indent on
syntax on
autocmd BufNewFile,BufRead *.vb AnyFoldActivate
set foldlevel=99
hi Folded term=underline

" Reinstall highlight if you want this
"autocmd CursorHold * silent call CocActionAsync('highlight')
"hi CocHighlightText term=underline gui=underline

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

set tags=./tags,tags;$HOME
