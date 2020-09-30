if has("gui_running")
    set lines=999 columns=999
endif

" Open NERDtree on startup
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDtree auto change working dir
let NERDTreeChDirMode=2

" ALE settings
let g:ale_enabled = 1
let g:ale_linters = {'cpp': ['clangd'], 'c': ['clangd']}
let g:ale_cpp_clangd_executable = '/home/anton/clangd_10.0.0/bin/clangd'
let g:ale_c_clangd_executable = '/home/anton/clangd_10.0.0/bin/clangd'
let g:ale_cpp_gcc_options = '-std=c++11 -Wall'
let g:ale_c_parse_compile_commands = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_filetype_changed = 1
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_set_quickfix = 1
let g:ale_lint_delay = 0
let g:ale_completion_enabled = 0
let g:ale_sign_column_always = 1
let g:ale_hover_cursor = 0
let g:ale_set_balloons = 0
autocmd FileType cpp set omnifunc=ale#completion#OmniFunc
set completeopt-=preview

nmap <silent> <leader>] <Plug>(ale_go_to_definition)
nnoremap <silent> <Plug>(ale_find_references_relative) :ALEFindReferences -relative<Return>
nmap <silent> <leader>u <Plug>(ale_find_references_relative)
nmap <silent> <leader>r <Plug>(ale_repeat_selection)
" call ch_logfile(expand('~/channel.log'), 'w')

" CtrlP and NERDTree ignore
let NERDTreeIgnore = ['^build$[[dir]]', '^nbproject$[[dir]]', '^bin$[[dir]]', '^dist$[[dir]]']
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn))|(build|nbproject|bin|dist)$',
  \ 'file': '\v\.(exe|o|so|d|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Switch between .cpp and .h files
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" Left columns settings
set number
set numberwidth=2
set signcolumn=yes
set foldcolumn=0

" Doxygen highlighting
let g:load_doxygen_syntax = 1

" Open hsplit below
set splitbelow

let g:AutoPairsMultilineClose = 0

