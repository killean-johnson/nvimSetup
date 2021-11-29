let g:coc_global_extensions = [
  \ 'coc-eslint',
  \ 'coc-phpls',
  \ 'coc-prettier',
  \ 'coc-snippets',
  \ 'coc-svelte',
  \ 'coc-tailwindcss',
  \ 'coc-tsserver',
  \ 'coc-xml',
  \ ]

nnoremap <silent> K :call CocAction('doHover')<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <Leader>t :call CocActionAsync('jumpDefinition', 'tab drop')<CR>

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>

nmap <leader>do <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)
nnoremap <leader>dp :Prettier<CR>

nnoremap <leader>n :cn<CR>
nnoremap <leader>N :cN<CR>

" Go Bindings
nnoremap <leader>gor :GoRun<CR>
nnoremap <leader>got :GoTest<CR>

" Breakpoint, step in, step over, step out, and continue
nnoremap <leader>godb :GoDebugStart<CR>
nnoremap <leader>gob :GoDebugBreakpoint<CR>
nnoremap <leader>goh :GoDebugStep<CR>
nnoremap <leader>goj :GoDebugNext<CR>
nnoremap <leader>gok :GoDebugStepOut<CR>
nnoremap <leader>gol :GoDebugContinue<CR>

command! -nargs=0 Prettier :CocCommand prettier.formatFile
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

" tab auto complete
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
 inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif 

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300


" mapping for snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
