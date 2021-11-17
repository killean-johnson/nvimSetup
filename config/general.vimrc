let $NVIM_TUI_ENABLE_TRUE_COLOR=1

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

set nocompatible
" Theme
syntax enable
syntax on
"colorscheme onenord
"colorscheme onedark

"let ayucolor = "dark"
"colorscheme ayu

"colorscheme humanoid

let g:gruvbox_contrast_light='medium'
set bg=dark
colorscheme gruvbox

" lua << EOF
"     vim.g.rose_pine_variant='moon'
"     vim.g.rose_pine_disable_background = false
" EOF
" colorscheme rose-pine

"colorscheme OceanicNext

filetype plugin on
set number


"leader remap
let mapleader = ","

"Clear search highlighting
nnoremap <leader><space> :nohlsearch<cr>

" Toggle relative numbering
nnoremap <leader>sn :set rnu!<cr>
"highlight where line where cursor is
set cursorline

" enable mouse scroll and highlight
set mouse=a

"tab settings
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set smarttab

"Autoclose tag settings
let g:closetag_filenames = '*.html,*.jsx,*.tsx'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,tsx,javascriptreact,typescriptreact'
let g:closetag_regions =  {
\ 'typescript.tsx': 'jsxRegion,tsxRegion',
\ 'javascript.jsx': 'jsxRegion',
\ }
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut ='<leader>>'

autocmd FileType netrw setl bufhidden=delete
let g:netrw_fastbrowse = 0
let g:netrw_liststyle = 3


"FZF shortcut
let $FZF_DEFAULT_COMMAND = 'rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*,vendor/*}"'
nnoremap <c-p> :Files<CR>
nnoremap <Leader>p :Rg<CR>

"Ranger command remap
let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'

"VimWiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
nnoremap <Leader>wp :call vimwiki#base#goto_index(v:count, 3)<cr>

"WSL yank support
" let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
" if executable(s:clip)
"     augroup WSLYank
"             autocmd!
"             autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
"     augroup END
" endif

" vim which key setup
nnoremap <silent> <leader> :WhichKey ','<CR>
set timeoutlen=500

" Lazygit keybinding
nnoremap <silent> <leader>lg :LazyGit<CR>

" vim sneak
let g:sneak#label = 1

nnoremap <leader>gs :G<CR>
nnoremap <leader>gd : Gvdiff<CR>
nnoremap <leader>gf :diffget //2<CR>
nnoremap <leader>gj :diffget //3<CR>
