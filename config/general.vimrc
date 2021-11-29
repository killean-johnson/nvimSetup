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
" lua << EOF
"     -- vim.g.rose_pine_variant='moon'
"     vim.g.rose_pine_disable_background = false
" EOF
" colorscheme rose-pine
"colorscheme OceanicNext

set background=dark
let g:everforest_background = 'hard'
let g:airline_theme = 'everforest'
colorscheme everforest

" let g:gruvbox_contrast_light='medium'
" set bg=dark
" colorscheme gruvbox

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

" Lazygit keybinding and settings
nnoremap <silent> <leader>lg :LazyGit<CR>

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
nnoremap <leader>vb <Plug>VimspectorBalloonEval <CR>
nmap <leader>vb <Plug>VimspectorBalloonEval <CR>
let g:vimspector_sign_priority = {
    \    'vimspectorBP':         998,
    \    'vimspectorBPCond':     997,
    \    'vimspectorBPDisabled': 996,
    \    'vimspectorPC':         999,
\ }

lua << EOF
    local Terminal  = require('toggleterm.terminal').Terminal
    local jiratui = Terminal:new({ cmd = "jira-tui", direction = 'float', hidden = true })

    function _jiratui_toggle()
      jiratui:toggle()
    end

    vim.api.nvim_set_keymap("n", "<leader>jt", "<cmd>lua _jiratui_toggle()<CR>", {noremap = true, silent = true})
EOF
