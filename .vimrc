"设置文件的代码形式 
set encoding=utf-8 
set termencoding=utf-8 
set fileencoding=utf-8 
set fileencodings=ucs-bom,utf-8,chinese,cp936 
"vim的菜单乱码解决： 
source $VIMRUNTIME/delmenu.vim 
source $VIMRUNTIME/menu.vim 
"vim提示信息乱码的解决 
" disable vi compatibility
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" ----------------------------------------
" Bundles here:
"
" Themes
Bundle 'junegunn/seoul256.vim'

"taglist  代码结构浏览
" Bundle 'vim-scripts/taglist.vim'

" VIM enhancements
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
"NERDTree 所有tabs 都有
Bundle 'jistr/vim-nerdtree-tabs'
" Bundle 'mileszs/ack.vim'
Bundle 'davidhalter/jedi-vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'bufexplorer.zip'
" !!!!!!!!!!!!!
" Bundle 'kien/ctrlp.vim'
" Zen coding
Bundle 'mattn/emmet-vim'
" Tab list panel
Bundle 'kien/tabman.vim'
" Pending tasks list
Bundle 'fisadev/FixedTaskList.vim'
" Surround
Bundle 'tpope/vim-surround'

" 微信小程序插件
Bundle 'chemzqm/wxapp.vim'
" Git ignore syntax HL

" nginx
" Bundle 'vim-scripts/nginx.vim'

" Javascript & HTML5
Bundle 'othree/html5.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'elzr/vim-json'
" js beautify
Bundle 'maksimr/vim-jsbeautify'

" Latex/XML/HTML tags navigation
Bundle 'vim-scripts/matchit.zip'

" CSS
" Bundle 'skammer/vim-css-color'
Bundle 'vim-scripts/Css-Pretty'
Bundle 'hail2u/vim-css3-syntax'

" css/less/sass/html color preview for vim
Bundle 'gorodinskiy/vim-coloresque'

" Python
Bundle 'hynek/vim-python-pep8-indent'
" Automatically sort python imports
" Bundle 'fisadev/vim-isort'
" Python and PHP Debugger
Bundle 'fisadev/vim-debug.vim'
Bundle 'scrooloose/syntastic'

" Markdown
Bundle 'plasticboy/vim-markdown'

" TOML files
" Bundle cespare/vim-toml

" vue 高亮
  Bundle 'posva/vim-vue'
" Bundle 'Command-T' native extension segfaults
" ----------------------------------------
call vundle#end()            " required
filetype plugin indent on    " required


set encoding=utf-8

" ----------------------------------------------------------------------------
"  Text Formatting
" ----------------------------------------------------------------------------

set autoindent             " automatic indent new lines
set smartindent            " be smart about it
inoremap # X<BS>#
" set nowrap                 " do not wrap lines
set softtabstop=2          " yep, two
set shiftwidth=2           " ..
set tabstop=4
set expandtab              " expand tabs to spaces
set nosmarttab             " fuck tabs
set formatoptions+=n       " support for numbered/bullet lists
set textwidth=80           " wrap at 80 chars by default
set colorcolumn=+1         " color column 81
set virtualedit=block      " allow virtual edit in visual block ..

" ----------------------------------------------------------------------------
"  Remapping
" ----------------------------------------------------------------------------

" lead with ,
let mapleader = ","

" exit to normal mode with 'jj'
inoremap jj <ESC>

" exit to normal mode with ':w<CR>'
inoremap :w<CR> <ESC>:w<CR>i


" reflow paragraph with Q in normal and visual mode
nnoremap Q gqap
vnoremap Q gq

" sane movement with wrap turned on
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" ----------------------------------------------------------------------------
"  UI
" ----------------------------------------------------------------------------

set ruler                  " show the cursor position all the time
set noshowcmd              " don't display incomplete commands
set nolazyredraw           " turn off lazy redraw
set number                 " line numbers
set wildmenu               " turn on wild menu
" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest,full
set ch=2                   " command line height
set backspace=2            " allow backspacing over everything in insert mode
" set whichwrap+=<,>,h,l,[,] " backspace and cursor keys wrap to
set shortmess=filtIoOA     " shorten messages
set report=0               " tell us about changes
set nostartofline          " don't jump to the start of line when scrolling


" ----------------------------------------------------------------------------
" Visual Cues
" ----------------------------------------------------------------------------

set showmatch              " brackets/braces that is
set mat=5                  " duration to show matching brace (1/10 sec)
set incsearch              " do incremental searching
set laststatus=2           " always show the status line
set ignorecase             " ignore case when searching
" set smartcase              " but be case sensitive when there's uppercase chars
set hlsearch               " highlight searches
set visualbell             " shut the fuck up


" ---------------------------------------------------------------------------
"  Strip all trailing whitespace in file
" ---------------------------------------------------------------------------

function! StripWhitespace ()
    exec ':%s/ \+$//gc'
endfunction
map ,s :call StripWhitespace ()<CR>

" ---------------------------------------------------------------------------
"  My Settings
" ---------------------------------------------------------------------------

" filetype detection
filetype plugin on
filetype on
filetype indent on

" auto-complete
"set ofu=syntaxcomplete#Complete
"set completeopt=menuone,longest,preview

" Auto close the preview window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" split and tab navigation

func! GoLeft()
  let oldw = winnr()
  silent! exe "normal! \<c-w>h"
  let neww = winnr()
  if oldw == neww
    exe "normal! \gT"
  endif
endfunction

func! GoRight()
  let oldw = winnr()
  silent! exe "normal! \<c-w>l"
  let neww = winnr()
  if oldw == neww
    exe "normal! \gt"
  endif
endfunction

" window-tab navigation
nnoremap <silent> <C-h> :call GoLeft()<CR>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <silent> <C-l> :call GoRight()<CR>

" NERDTree
let NERDTreeQuitOnOpen = 1
let NERDTreeChDirMode=2
" NERDTree Tabs
map <Leader>n <plug>NERDTreeTabsToggle<CR>

" use currently open buffer
:se switchbuf=usetab

" avoid hidden buffers
" :se nohidden
" js beautify
map <c-f> :call JsBeautify()<cr>
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>

" tab length exceptions on some file types
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
" autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2

" code folding
" set foldmethod=syntax
set foldmethod=indent
nnoremap <Space> za
" set nofoldenable " folds disabled by default
set nofoldenable
" syntax highliting
syntax on

" Unified color scheme (default: dark)
color seoul256
"color desert
set background=dark

" buffer-explorer settings
nmap <Tab> <Leader>be
nmap <S-Tab> <Leader>bs
let g:bufExplorerShowRelativePath=1

" highlight trailing whitespace
highlight ShowTrailingWhitespace ctermbg=DarkRed guibg=DarkRed

" Vim-CtrlSpace Config
hi CtrlSpaceSelected term=reverse ctermfg=187  ctermbg=23  cterm=bold
hi CtrlSpaceNormal   term=NONE    ctermfg=244  ctermbg=232 cterm=NONE
hi CtrlSpaceSearch   ctermfg=220  ctermbg=NONE cterm=bold
hi CtrlSpaceStatus   ctermfg=230  ctermbg=234  cterm=NONE

" jedi-vim
let g:jedi#popup_on_dot = 1
let g:jedi#auto_initialization = 1
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_select_first = 0 
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#usages_command = "<leader>n"
let g:jedi#documentation_command = "K"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "2"
let g:jedi#auto_close_doc = 0
let g:jedi#force_py_version = 3
" YouCompleteMe 
let g:ycm_autoclose_preview_window_after_insertion = 0
let g:ycm_auto_hover="GetDoc"

nmap <leader>jd :YcmCompleter GoTo<CR>

nmap <leader>n :YcmCompleter 
nmap <leader>pr :YcmCompleter GetType<CR>
nmap <leader>dc :YcmCompleter GetDoc<CR>
let g:ycm_collect_identifiers_from_tags_files=1 " 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2

" syntastic
let g:syntastic_auto_loc_list=1

" plasticboy/vim-markdown
let g:vim_markdown_folding_disabled=1

" tab navigation mappings
map tn :tabn<CR>
map tp :tabp<CR>
map tm :tabm
map tt :tabnew
map ts :tab split<CR>
map <C-S-Right> :tabn<CR>
imap <C-S-Right> <ESC>:tabn<CR>
map <C-S-Left> :tabp<CR>
imap <C-S-Left> <ESC>:tabp<CR>

" navigate windows with meta+arrows
map <M-Right> <c-w>l
map <M-Left> <c-w>h
map <M-Up> <c-w>k
map <M-Down> <c-w>j
imap <M-Right> <ESC><c-w>l
imap <M-Left> <ESC><c-w>h
imap <M-Up> <ESC><c-w>k
imap <M-Down> <ESC><c-w>j

set completeopt-=preview

" save as sudo
ca w!! w !sudo tee "%"

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3

" better backup, swap and undos storage
" set directory=$VIM/vimfiles/pubdir/tmp " directory to place swap files in
" set backup " make backup files
" set backupdir=$VIM/vimfiles/pubdir/backups " where to put backup files
" set undofile " persistent undos - undo after you re-open the file
" set undodir=$VIM/vimfiles/pubdir/undos
" set viminfo+=n$VIM/vimfiles/pubdir/viminfo
" store yankring history file there too
" let g:yankring_history_dir = '~/.vim/dirs'

" ============================================================================
" Plugins settings and mappings
" Edit them as you wish.

" Tagbar -----------------------------
" toggle tagbar display
map <F4> :TagbarToggle<CR>

" autofocus on tagbar open
let g:tagbar_autofocus = 1

" NERDTree -----------------------------

" toggle nerdtree display
map <F3> :NERDTreeToggle<CR>

" open nerdtree with the current file selected
nmap ,t :NERDTreeFind<CR>

" don;t show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" Tasklist ------------------------------

" show pending tasks list
" map <F2> :TaskList<CR>

" Vim-debug ------------------------------
" disable default mappings, have a lot of conflicts with oter plugins
let g:vim_debug_disable_mappings = 1


" file finder mapping
let g:ctrlp_map = ',e'

" tags (symbols) in current file finder mapping
nmap ,g :CtrlPBufTag<CR>

" tags (symbols) in all files finder mapping
nmap ,G :CtrlPBufTagAll<CR>

" general code finder in all files mapping
nmap ,f :CtrlPLine<CR>

" recent files finder mapping
nmap ,m :CtrlPMRUFiles<CR>

" commands finder mapping
nmap ,c :CtrlPCmdPalette<CR>

" to be able to call CtrlP with default search text
function! CtrlPWithSearchText(search_text, ctrlp_command_end)
    execute ':CtrlP' . a:ctrlp_command_end
    call feedkeys(a:search_text)
endfunction

" same as previous mappings, but calling with current word as default text
nmap ,wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
nmap ,wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
nmap ,wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
nmap ,we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
nmap ,pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
nmap ,wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
nmap ,wc :call CtrlPWithSearchText(expand('<cword>'), 'CmdPalette')<CR>

" don't change working directory
let g:ctrlp_working_path_mode = 0

" ignore these files and folders on file finder
let g:ctrlp_custom_ignore = {
\ 'dir': '\v[\/](\.git|\.hg|\.svn)$',
\ 'file': '\.pyc$\|\.pyo$',
\ }

" Syntastic ------------------------------

" show list of errors and warnings on the current file
nmap <leader>e :Errors<CR>

" check also when just opened the file
let g:syntastic_check_on_open = 1

" don't put icons on the sign column (it hides the vcs status icons of signify)
let g:syntastic_enable_signs = 1 

" custom icons (enable them if you use a patched font, and enable the previous
" setting)
let g:syntastic_error_symbol = 'er'
let g:syntastic_warning_symbol = 'wr'
let g:syntastic_style_error_symbol = 'Er'
let g:syntastic_style_warning_symbol = 'Wr'

" " don't fold python code on open
let g:pymode_folding = 0
  
" " don't load rope by default. Change to 1 to use rope
" let g:pymode_rope = 0
" 
" TabMan ------------------------------

" mappings to toggle display, and to focus on it
let g:tabman_toggle = 'tl'
let g:tabman_focus = 'tf'

" Autoclose ------------------------------

" mapping to duplicate block
vmap <expr> D DVB_Duplicate()

" nicer colors
highlight DiffAdd cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete cterm=bold ctermbg=none ctermfg=167
highlight DiffChange cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd cterm=bold ctermbg=237 ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237 ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237 ctermfg=227

" taglist
"
let Tlist_Show_One_File=1    "只显示当前文件的tags
let Tlist_WinWidth=40        "设置taglist宽度
let Tlist_Exit_OnlyWindow=1  "tagList窗口是最后一个窗口，则退出Vim
let Tlist_Use_Right_Window=1 "在Vim窗口右侧显示taglist窗口
" 创建python文件 模板
"auto add python header --start
autocmd BufNewFile *.py 0r ~/.vim/vim_template/vim_python_header
autocmd BufNewFile *.py ks|call FileName()|'s
autocmd BufNewFile *.py ks|call CreatedTime()|'s

fun FileName()
  if line("$") > 10
      let l = 10  "这里是字母L 不是数字1
  else
      let l = line("$")
  endif
  exe "1," . l . "g/File Name:.*/s/File Name:.*/File Name: " .expand("%")
     "最前面是数字1，这里的File Name: 要和模板中一致
endfun

fun CreatedTime()
  if line("$") > 10
      let l = 10
  else
      let l = line("$")
  endif
  echo strftime("%Y-%m-%d %T")
  exe "1," . l . "g/Created Time:.*/s/Created Time:.*/Created Time: " .strftime("%Y-%m-%d %X")
      "这里Create Time: 要和模板中一致
endfun

"auto add python header --end
" tasklist todo/fixme/xxx/TODO/FIXME/XXX   !!!: importent
let g:tlTokenList=['TODO', 'FIXME', 'XXX', '!!!', 'MARK']
if has("autocmd")
    if v:version > 701
      autocmd Syntax * call matchadd('Todo', '\W\zs\(TODO\|todo\|FIXME|fixme\|XXX\|xxx\|CHANGED\|BUG\|HACK\|MARK\|!!!\)')
      autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\)')
     endif
endif

" set guifont=Courier_New:h11
set guifont=Consolas:h14
set linespace=-1
map <F9> :w<CR>:!python3 %<CR>
map <F10> :w<CR>
imap <F9> <esc>:w<CR><esc>:!py %<CR>
imap <F10> <esc>:w<CR>
map :sh :!powershell

" vim-vue
" au BufNewFile,BufRead *.vue setf vue
" let g:vue_disable_pre_processors=1
autocmd FileType vue syntax sync fromstart
autocmd FileType vue setlocal et sta sw=2 sts=2
"autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css.less.pug
