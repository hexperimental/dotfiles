" this is so the backspace work as expected
set backspace=indent,eol,start
set encoding=utf-8
set nocompatible              " be iMproved, required
set mouse=a


" Only do this part when compiled with support for autocommands
if has("autocmd")
" Enable file type detection
 filetype on
 "Strips Trailing Whitespaces when writing the file
 autocmd BufWritePre *.module,*.js,*.inc,*.php,*.install :call Preserve("%s/\\s\\+$//e")
endif


"Flags Whitespace
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"TODO: Have isort to run before every :w
 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim Plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()

Plug '~/.vim/myplugins/vim-hxdraft'
"""""""""""""""""""""""""""""""""""""""
" Editor 
"
Plug 'vim-airline/vim-airline'
Plug 'flazz/vim-colorschemes'
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'kien/rainbow_parentheses.vim'
"""""""""""""""""""""""""""""""""""""""
" File Navigation
"
Plug 'scrooloose/nerdtree'
"Plug 'ctrlpvim/ctrlp.vim'
"Plug 'dkprice/vim-easygrep'
"Plug 'vim-ctrlspace/vim-ctrlspace'

"Plug 'xolox/vim-easytags'
"Plug 'xolox/vim-misc'
"""""""""""""""""""""""""""""""""""""""
" Code Style
"
Plug 'dense-analysis/ale'
"Plug 'prabirshrestha/vim-lsp'
"Plug 'Rhysd/vim-lsp-ale'
"Plugin 'vim-scripts/indentpython.vim'
Plug 'vim-python/python-syntax'
"Plugin 'nvie/vim-flake8'

"""""""""""""""""""""""""""""""""""""""
" Testing
Plug 'vim-test/vim-test'

"Plugin 'puremourning/vimspector' "Debugger

"""""""""""""""""""""""""""""""""""""""
" Utilities
"
Plug 'tpope/vim-fugitive'
Plug 'ubaldot/vim-outline'
Plug 'fisadev/FixedTaskList.vim'
"Plugin 'adinapoli/vim-markmultiple'
Plug 'scrooloose/nerdcommenter'
"Plugin 'easymotion/vim-easymotion'
"Plugin 'Raimondi/delimitMate'
"Plugin 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'python-mode/python-mode'


if has('python3')
    Plug 'fisadev/vim-isort'
endif

"POTENTIAL
"Plug 'Vimjas/vim-python-pep8-indent'
"Plug 'puremourning/vimspector'

"Plugin 'jremmen/vim-ripgrep'
"Plugin 'davidhalter/jedi-vim'
"
"Plugin 'justinmk/vim-sneak'

"DEPRECATED
"Plugin 'vim-airline/vim-airline-themes'

call plug#end()

" Brief help
" :PlugList       - lists configured plugins
" :PlugInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PlugSearch foo - searches for foo; append `!` to ref resh local cache
" :PlugClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General settings 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set yank registers to use systems clipboard
set clipboard=unnamedplus
" Coloring stuff
let g:solarized_termcolors=256
syntax on
set background=dark
"colorscheme solarized
colorscheme molokai

setlocal spell spelllang=en_us
autocmd BufRead,BufNewFile *.md,*.txt setlocal spell  " enable spell check for certain files

set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set history=1000

set ignorecase "Ignore case when searching
set smartcase
set incsearch "Make search act like search in modern browsers
set hlsearch
let @/ = "" " clear the fearch registry so shits no hl when loading file
set nolazyredraw "Don't redraw while executing macros 
set showmatch "Show matching bracets when text indicator is over them
if !has('nvim')
set ttyscroll=3 " speed up scrolling
endif
set ttyfast " Optimize for fast terminal connections
set lazyredraw " to avoid scrolling problems
set number
set nowrap "No wrapping.

set t_Co=256
set foldmethod=indent
set foldlevel=99

nnoremap <space> za


"Highlight the 80, 120 columns
"=============================
highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn="80,".join(range(120,999),",")
set listchars=tab:▸\ ,eol:¬
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
"highlight clear SignColumn
highlight SignColumn ctermbg=black
highlight LineNr ctermbg=0
" Setting up wrapping with linebreaks
set wrap linebreak nolist

" Replacing grep with ack
"set grepprg=ack

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab "Maintain indentation.

set ai "Auto indent
set si "Smart indet
set fileformat=unix

" Filetypes
au BufRead,BufNewFile *.swift set filetype=swift
au BufRead,BufNewFile *.module set filetype=php
au BufRead,BufNewFile *.inc set filetype=php
au BufRead,BufNewFile *.js set filetype=javascript
au BufRead,BufNewFile *.php set filetype=php
au BufRead,BufNewFile *.css set filetype=css
au BufRead,BufNewFile *.install set filetype=php
au BufRead,BufNewFile *.rss, *.atom set filetype=xml

autocmd Filetype html set tabstop=4
autocmd Filetype html set softtabstop=4 
autocmd Filetype html set shiftwidth=4

autocmd Filetype css set tabstop=4
autocmd Filetype css set softtabstop=4 
autocmd Filetype css set shiftwidth=4

autocmd Filetype php set tabstop=4
autocmd Filetype php set softtabstop=4 
autocmd Filetype php set shiftwidth=4

autocmd Filetype python set ruler
"autocmd Filetype python set textwidth=79  " lines longer than 79 columns will be broken
autocmd Filetype python set shiftround    " round indent to multiple of 'shiftwidth'
autocmd Filetype python set autoindent    " align the new line indent with the previous line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key Mappings  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
let mapleader = ","

nmap <leader>v :tabedit $MYVIMRC<CR>

nnoremap y "+y
vnoremap y "+y

" Mapping F5 to delete white spaces
nnoremap <silent> <F2> :%s/\r\(\n\)/\1/g<CR>
" Mapping F5 to delete white spaces
"nnoremap <silent> <F4> :UltiSnipsEdit<CR>
"nnoremap <silent> <F5> :FufFile<CR>
"nnoremap <silent> <F6> :FufBuffer<CR>
"nnoremap <silent> <F5> :call Preserve("%s/\\s\\+$//e")<CR>
"nnoremap <silent> <F6> :call PhpCsFixerFixFile()<CR>
"nnoremap <silent> <F8> :source $MYVIMRC<CR>
nnoremap <leader>hl :nohl<CR>

"Moving splits with control+ hjkl
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Mapping W and Q
:command! W w
:command! Q q

nnoremap J 5j
nnoremap K 5k
nnoremap H 5h
nnoremap L 5l

" Remaping the Caps-Lock to act like ESC
" Remap Caps Lock to Escape in Vim
if has('gui_running')
  " GUI Vim-specific settings (optional)
else
  " For terminal Vim
  nmap <C-]> <Esc>
  imap <C-]> <Esc>
  vmap <C-]> <Esc>
  cmap <C-]> <Esc>
endif


"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>


"Fix this: Works half-assed won't select  anything after the curso
map ww :call Preserve("normal vi'")<CR>
 

nmap <leader>] :call Preserve(">>")<CR>
nmap <leader>[ :call Preserve("<<")<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => HxDrafts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Define the path to your script directory
let g:scripts_dir = '~/scripts/'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Outline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Default mappings
nmap <silent> <F8> <Plug>OutlineToggle
nmap <silent> <leader>ol <Plug>OutlineRefresh
nmap <silent> <leader>oo <Plug>OutlineGoToOutline

let g:outline_buf_name = "Outline!"
let g:outline_win_size = &columns / 4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Indent Guides
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=NONE
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=black
let g:indent_guides_start_level = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NerdTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
nmap <leader>n :NERDTreeToggle<CR>
"nnoremap <C-n> :NERDTree<CR>
"nnoremap <C-t> :NERDTreeToggle<CR>
"nnoremap <C-f> :NERDTreeFind<CR>
function! NERDTreeHighlightFile(extension, fg, bg)
exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'.a:extension .'$#'
exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg.' ctermfg='. a:fg .' guibg='. a:bg .' guifg='. a:fg
endfunction
call NERDTreeHighlightFile('.py', 'green', 'black')
call NERDTreeHighlightFile('.yaml', 'blue', 'black')
call NERDTreeHighlightFile('.yml', 'blue', 'black')
call NERDTreeHighlightFile('.json', 'blue', 'black')
call NERDTreeHighlightFile('.toml', 'blue', 'black')
call NERDTreeHighlightFile('.xlm', 'blue', 'black')
call NERDTreeHighlightFile('.pem', 'black', 'red')
" call NERDTreeHighlightFile('.xml', 'gray', 'black')
" call NERDTreeHighlightFile('.css', 'green', 'black')
" call NERDTreeHighlightFile('.json', 'darkred', 'black')
call NERDTreeHighlightFile('.html', 'white', 'black')
let g:netrw_banner = 0
let g:netrw_liststyle=3

let NERDTreeShowHidden=1
let NERDTreeHijackNetrw=1
let NERDTreeIgnore=['\.pyc$','\~$'] "Ignore files


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Airline (Status bar)  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
let g:Powerline_symbols = 'fancy'
"let g:airline_theme='base16'
let g:airline_powerline_fonts = 0 
" this is to always show the status bar
set laststatus=2
"branch parts
let g:airline_enable_branch=1
""seperators ◀▶  « »  〈 〉 ◂▸◀ ◄◄  ⫷ ⫸  ◂▸  ❯❮
let g:airline_left_sep = '▸'
let g:airline_right_sep = '◂'
"modes
let g:airline_section_y=""
let g:airline_section_gutter=""
let g:airline_detect_whitespace=0
  
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git Gutter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"https://github.com/airblade/vim-gitgutter
let g:gitgutter_max_signs = -1   " default value (otherwise)
let g:gitgutter_set_sign_backgrounds = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Testing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
let test#python#runner='pytest'
let test#strategy='vimterminal'
let test#python#pytest#executable='pytest -p no:warnings -s'

nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-a> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-v> :TestVisit<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Python mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"python with virtualenv support

"let python_highlight_all=1

let g:pymode_options_max_line_length = 119
let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 6
let g:pymode_indent = 1
let g:pymode_doc_bind = 'M'
let g:pymode_run_bind = '<leader>r'
let g:pymode_breakpoint_bind = '<leader>b'
let g:pymode_lint_on_write = 1
let g:pymode_lint_unmodified = 0
let g:pymode_lint_on_fly = 0
let g:pymode_lint_message = 1
let g:pymode_lint_checkers = ['pyflakes', 'pycodestyle', 'mccabe']
let g:pymode_lint_ignore = ["E501", "W",]
let g:pymode_lint_select = ["E501", "W0011", "W430"]
let g:pymode_lint_sort = []
let g:pymode_lint_cwindow = 1
let g:pymode_lint_signs = 1
let g:pymode_lint_todo_symbol = 'WW'
let g:pymode_lint_comment_symbol = 'CC'
let g:pymode_lint_visual_symbol = 'RR'
let g:pymode_lint_error_symbol = 'EE'
let g:pymode_lint_info_symbol = 'II'
let g:pymode_lint_pyflakes_symbol = 'FF'

"let g:pymode_rope_refix = '<C-f>'
"let g:pymode_rope_show_doc_bind = '<C-c>d'
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 1
"let g:pymode_rope_completion_bind = '<C-Space><Space>'

"let g:pymode_rope_goto_definition_bind = '<C-g>g'
"let g:pymode_rope_goto_definition_cmd = 'new'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ISort
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-i> :Isort<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => LSP Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" LSP configurations for vim-lsp

"if executable('ruff')
"    au User lsp_setup call lsp#register_server({
"        \ 'name': 'ruff',
"        \ 'cmd': {server_info->['ruff', 'server']},
"        \ 'allowlist': ['python'],
"        \ 'workspace_config': {},
"        \ })
"endif
"let g:lsp_use_native_client = 1
"let g:lsp_diagnostics_enabled = 1
"let g:lsp_document_highlight_enabled = 1
"highlight lspReference ctermfg=red guifg=red ctermbg=green guibg=green
"
"nnoremap <silent> gd :LspDefinition<CR>
"nnoremap <silent> gr :LspReferences<CR>
"nnoremap <silent> I :LspHover<CR>
"nnoremap <silent> <C-k> :LspSignatureHelp<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ale
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""",

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc
let g:ale_completion_autoimport = 0
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

" Linters
let g:ale_linters = { "python": ["ruff", "flake8"] }
" Fixers
let g:ale_fixers = { "python": ["ruff", "ruff_format","black"] }
"
" Enable ALE as an LSP client
let g:ale_set_quickfix = 1
let g:ale_lsp_enabled = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ctrl Space
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"set hidden
"set showtabline=1
"nnoremap <silent><C-p> :CtrlSpace O<CR>

"if executable('rg')
    "let g:CtrlSpaceGlobCommand = 'rg --color=never --files'
"elseif executable('fd')
    "let g:CtrlSpaceGlobCommand = 'fd --type=file --color=never'
"elseif executable('ag')
    "let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
"endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ctrl+P
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"nmap <silent><space>b :CtrlPMRU<CR>
"nmap <silent><space>f :CtrlP<CR>

"set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
"set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
"
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"let g:ctrlp_custom_ignore = {
  "\ 'dir':  '\v[\/]\.(git|hg|svn)$',
  "\ 'file': '\v\.(exe|so|dll)$',
  "\ 'link': 'some_bad_symbolic_links',
  "\ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Python Syntax
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
let g:python_highlight_all = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Rainbow Parentheses
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => TaskList
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
map <leader>t <Plug>TaskList
let g:tlWindowPosition = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Easymotion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Prettier
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
autocmd FileType javascript set formatprg=prettier\ --stdin
nnoremap <silent> <F4> :normal gggqG\<C-o>\<C-o><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Search n Find
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

function! Preserve(command)
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  let @/=_s
  call cursor(l, c)
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Backups  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
set backupcopy=yes
set backup
set undofile 
set noswapfile

set undodir=~/.vim/tmp/undo/
set backupdir=~/.vim/tmp/backup/
set directory=~/.vim/tmp/swap/

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
 call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
 call mkdir(expand(&directory), "p")
endif




