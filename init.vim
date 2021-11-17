call plug#begin()
" Syntax highlighting
Plug 'sheerun/vim-polyglot'

" Color themes
Plug 'jaredgorski/spacecamp'
Plug 'mhartington/oceanic-next'
Plug 'joshdick/onedark.vim'
Plug 'humanoid-colors/vim-humanoid-colorscheme'
Plug 'ayu-theme/ayu-vim'
Plug 'rmehri01/onenord.nvim', { 'branch': 'main' }
Plug 'rose-pine/neovim'
Plug 'morhetz/gruvbox'

" Lazygit plugin
Plug 'kdheepak/lazygit.nvim'

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
Plug 'ZSaberLv0/ZFVimDirDiff'

" jira plugin
Plug 'n0v1c3/vira', { 'do': './install.sh' }

" Smooth scrolling plugins (Only use one at a time)
"Plug 'yuttie/comfortable-motion.vim'
Plug 'psliwka/vim-smoothie'

" close tags for jsx, html
Plug 'alvan/vim-closetag'

" status bar plug
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" end tags for vb
"Plug 'tpope/vim-endwise'

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
"Plug 'francoiscabrol/ranger.vim'

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

" Auto set syntax highlighting and folding to vbnet for vb files
"autocmd BufNewFile,BufRead *.vb set ft=vbnet

" Set up folding plugin
filetype plugin indent on
syntax on
autocmd BufNewFile,BufRead *.vb AnyFoldActivate
set foldlevel=99
hi Folded term=underline

" Reinstall highlight if you want this
autocmd CursorHold * silent call CocActionAsync('highlight')
hi CocHighlightText term=underline gui=underline

" Comment support for vb
autocmd FileType vbnet setlocal commentstring='\ %s

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

" puremourning/vimspector
fun! GotoWindow(id)
    :call win_gotoid(a:id)
endfun
func! AddToWatch()
    let word = expand("<cexpr>")
    call vimspector#AddWatch(word)
endfunction
let g:vimspector_base_dir = expand('$HOME/.config/nvim')
let g:vimspector_sidebar_width = 60
nnoremap <leader>va :call vimspector#Launch()<CR>
nnoremap <leader>vc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>vv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>vw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>vs :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>vo :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>vi :call AddToWatch()<CR>
nnoremap <leader>vx :call vimspector#Reset()<CR>
nnoremap <leader>vX :call vimspector#ClearBreakpoints()<CR>
nnoremap <leader>si :call vimspector#StepInto()<CR>
nnoremap <leader>so :call vimspector#StepOver()<CR>
nnoremap <leader>sO :call vimspector#StepOut()<CR>
nnoremap <leader>v_ :call vimspector#Restart()<CR>
nnoremap <leader>vn :call vimspector#Continue()<CR>
nnoremap <leader>vrc :call vimspector#RunToCursor()<CR>
nnoremap <leader>vh :call vimspector#ToggleBreakpoint()<CR>
nnoremap <leader>ve :call vimspector#ToggleConditionalBreakpoint()<CR>
let g:vimspector_sign_priority = {
    \    'vimspectorBP':         998,
    \    'vimspectorBPCond':     997,
    \    'vimspectorBPDisabled': 996,
    \    'vimspectorPC':         999,
\ }

set tags=./tags,tags;$HOME
