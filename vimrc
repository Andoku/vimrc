"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'cdelledonne/vim-cmake'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'joshdick/onedark.vim'
Plug 'psliwka/vim-smoothie'
call plug#end()

let g:plug_window = 'tabnew'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

set updatetime=100

" Remap VIM 0 to first non-blank character
map 0 ^

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" fast edit .vimrc
map <leader>e :e! $MYVIMRC<cr>

" Open splits below
set splitbelow

" Switch between .cpp and .h files
nnoremap <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" Navigate quickfix list
nmap <C-n> :cn<cr>
nmap <C-p> :cp<cr>

" Disable search highlight
map <silent> <leader><cr> :noh<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Max number of items in pop-up menu
set pumheight=10

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set wildignore+=*/build,*/__pycache__/*

" A buffer becomes hidden when it is abandoned
set hidden

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" Open help in tab
augroup FiletypeHelp
    autocmd!
    autocmd BufWinEnter * if &l:buftype ==# 'help' | execute "normal \<C-W>T" | endif
augroup end

" Open quickfix downside
augroup DragQuickfixWindowDown
    autocmd!
    autocmd FileType qf wincmd J
augroup end

" Hide signcolumn in diff mode
augroup TurnOffSignColumn
    autocmd!
    autocmd OptionSet diff setlocal signcolumn=no | setlocal foldcolumn=0
    autocmd BufEnter * if !&diff | setlocal signcolumn=yes | endif 
augroup end

" Equal splits on resize
autocmd VimResized * wincmd =


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors, Fonts and GUI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

" Set font according to system
if has("mac") 
    set gfn=Blex\ Mono\ Nerd\ Font\ Complete\ Mono:h16,
                \IBM\ Plex\ Mono:h16,
                \Hack:h16,Source\ Code\ Pro:h16,Menlo:h16
else
    set gfn=IBM\ Plex\ Mono\ 16,
                \:Hack\ 16,Source\ Code\ Pro\ 16,
                \Bitstream\ Vera\ Sans\ Mono\ 16
endif

" Disable scrollbars (real hackers don't use scrollbars for navigation!)
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Set extra options when running in GUI mode
set guioptions-=T
set guioptions-=e
set guioptions-=m
set t_Co=256
set guitablabel=%M\ %t

set background=dark

" Change default background color for onedark theme
augroup colorextend
    autocmd!
    autocmd ColorScheme * call onedark#extend_highlight("Normal", { "bg": { "gui": "#202020" }, "fg": { "gui": "#d0d0d0" }})
augroup END

" Turn off background in terminal
if !has("gui_running")
    augroup colorset
        autocmd!
        let s:white = { "gui": "#d0d0d0", "cterm": "145", "cterm16" : "7" }
        autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white })
    augroup END
endif

let g:onedark_terminal_italics = 1
colorscheme onedark

" Enable syntax highlighting
syntax enable 
let g:cpp_simple_highlight = 1
" let g:cpp_member_highlight = 1

" Doxygen highlighting
" let g:load_doxygen_syntax=1

" Set utf8 as standard encoding
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Left columns settings
set number
set signcolumn=yes


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

" Turn persistent undo on means that you can undo even when you close a buffer/VIM
set undodir=~/.vim/undodir
set undofile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>
" Grep after the selected text
vnoremap <silent> <C-g> :call VisualSelection('rg', '')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Specify the behavior when switching between buffers 
set switchbuf=useopen,usetab


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Don't duplicate mode in command line
set noshowmode

" lightline configuration
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['gitbranch', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn off line numbers in Git status
autocmd FileType fugitive setlocal nonumber
" Mapping to open diff in new tab
autocmd User FugitiveIndex nmap <buffer> dt :Gtabedit <Plug><cfile><Bar>Gvdiffsplit<CR>


""""""""""""""""""""""""""""""
" => FZF
""""""""""""""""""""""""""""""
let $BAT_THEME='TwoDark'
let $FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-ignore-vcs --color=always -g "!{build,.git,.svn,.cache}"'
let $FZF_DEFAULT_OPTS='--ansi'
let g:fzf_preview_window = 'up:70%'
let g:fzf_layout = { 'window': 'enew' }

command! -bang -nargs=* Rg
    \ call fzf#vim#grep("rg --line-number --trim --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0) 
nmap <silent> <C-f> :Files<CR>
nmap <silent> <C-b> :Buffers<CR>
nmap <silent> <C-g> :RG<CR>
nmap <silent> <space> :Rg<CR>

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --line-number --trim --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)


""""""""""""""""""""""""""""""
" => Auto-pairs
""""""""""""""""""""""""""""""
let g:AutoPairsShortcutFastWrap='<C-e>'
let g:AutoPairsShortcutToggle=''
let g:AutoPairsShortcutJump=''
let g:AutoPairsShortcutBackInsert=''
let g:AutoPairsMultilineClose=0


""""""""""""""""""""""""""""""
" => Coc.nvim
""""""""""""""""""""""""""""""
highlight CocErrorSign guifg=#d1666a

" Auto install extensions
let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-python', 'coc-clangd', 'coc-explorer']

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Coc-explorer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>m :CocCommand explorer --position right<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Coc-git
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" navigate chunks of current buffer
nmap [h <Plug>(coc-git-prevchunk)
nmap ]h <Plug>(coc-git-nextchunk)
" navigate conflicts of current buffer
nmap [c <Plug>(coc-git-prevconflict)
nmap ]c <Plug>(coc-git-nextconflict)
" show chunk diff at current position
nmap gs <Plug>(coc-git-chunkinfo)
" create text object for git chunks
omap ig <Plug>(coc-git-chunk-inner)
xmap ig <Plug>(coc-git-chunk-inner)
omap ag <Plug>(coc-git-chunk-outer)
xmap ag <Plug>(coc-git-chunk-outer)



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Add `:PClint path` command for opening lint errors in quickfix
command! -nargs=0 PClintLoad :call LoadLintErrors()

function! LoadLintErrors()
    let l:preparedErrors = []
    for line in uniq(readfile(expand('%:p')))
        let l = substitute(line, '\', '/', 'g')
        if (len(l) > 3) && (l[0] =~ '^\a\+$')
            call add(l:preparedErrors, l)
        endif
    endfor
    call setqflist([], ' ', {'lines': l:preparedErrors, 'efm': '%f\ \ %l\ \ %m'})
    copen
endfunction 

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'rg'
        call CmdLine("RG " . l:pattern . "\<CR>")
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Autoinstall vimplug if not installed
function! InstallVimPlug()
    let vimplug_exists = expand('~/.vim/autoload/plug.vim')
    if !filereadable(vimplug_exists)
        echo "Installing Vim-Plug..."
        echo ""
        silent !\curl -fLo ~/.vim/autoload/plug.vim 
            \--create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall
    endif
endfunction

call InstallVimPlug()
