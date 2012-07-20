call pathogen#infect()
syntax on
filetype plugin indent on

let mapleader = ","

color solarized
set background=dark

"pyfile ~/.vim/scripts.py

" make selected split big
"set winwidth=84
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
set winheight=5
set winminheight=5
set winheight=999

" better search behavior
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

" misc
set number
set ruler
set encoding=utf-8
"set statusline=  " clear for when vimrc is reloaded
"set statusline=\ %-3.3n\ %t%m%r%h%w\ %y\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]%=\[%5l/%5L\,\ %3c\]\ %3P\  
set cursorline      " show a highlight on the cursor line
"set showmode        " shows current mode (INSERT/etc)
"set showcmd         " shows some extra info about the current cmd in bottom right
set ttyfast
set hidden          " allow hidden modified buffers
set wildmenu
set wildmode=list:longest
set mouse=a
set laststatus=2    " show status line
set scrolloff=3     " minimum lines before/after cursor
set shm=IatT        " hide intro message
set autoread        " automatically reload changed files
set selectmode=""   " don't use selectmode at all
set visualbell                    " don't beep
set fcs+=vert:\                   " change vertical split character
set viewoptions=folds

" line wrapping
set wrap
set textwidth=79
set formatoptions=qrn1

" textmate refugee whitespace chars
set listchars=tab:▸\ ,eol:¬,trail:·
set nolist
" arrow keys wrap to other lines
set whichwrap+=<,>,[,]

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Shift + special movement key (<S-Left>, etc.) and mouse starts insert mode
set keymodel=startsel,stopsel

" disable swap
set nobackup
set nowritebackup
set noswapfile


"""""""""""""""""""""""""""""""""""
" OS-SPECIFIC SETUP
"""""""""""""""""""""""""""""""""""

" osx iterm2
if has("macunix")
  " iterm2 vim settings
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  nnoremap <silent> <C-s> :w<CR>
  inoremap <silent> <C-s> <ESC>:w<CR>
  nnoremap <silent> <C-w>w :bd<CR>
  inoremap <silent> <C-w>w <ESC>:bd<CR>
  set undodir=~/.vim/undo
  set undofile

  " yank to system clipboard
  nnoremap y "+y
  nnoremap Y "+y$
  nnoremap d "+d
  nnoremap D "+D
  nnoremap p "+p
  vnoremap y "+y
  vnoremap Y "+y$
  vnoremap d "+d
  vnoremap D "+D
  vnoremap p "+p  
endif

" cygwin
if has("win32unix")
  " mintty settings
  " mode dependent cursor
  let &t_ti.="\e[1 q"
  let &t_SI.="\e[5 q"
  let &t_EI.="\e[1 q"
  let &t_te.="\e[0 q"

  nnoremap <silent> <C-s> :w<CR>
  inoremap <silent> <C-s> <ESC>:w<CR>
  nnoremap <silent> <C-w>w :bd<CR>
  inoremap <silent> <C-w>w <ESC>:bd<CR>

  vnoremap <silent> <C-c> :w !cat > /dev/clipboard<CR> 
endif


"""""""""""""""""""""""""""""""""""
" MAPPINGS
"""""""""""""""""""""""""""""""""""

call togglebg#map("<F5>")         " toggle background (solarized)

" use ; instead of :
nnoremap ; :
vnoremap ; :

" jump back
nnoremap <leader><leader> <C-^>


" Adjust viewports to the same size
map <Leader>= <C-w>=
imap <Leader>= <Esc> <C-w>=

" search
nnoremap / /\v
vnoremap / /\v
nnoremap <CR> :noh<cr>
vnoremap <C-r> "hy:%s/<C-r>h//<left>
nnoremap n nzzzv:call PulseCursorLine()<cr>
nnoremap N Nzzzv:call PulseCursorLine()<cr>

" move by screen line instead of file line
nnoremap j gj
nnoremap k gk

" jump between brackets with tab
nnoremap <tab> %
vnoremap <tab> %

" split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" map jj to ESC
inoremap jj <ESC>

" open new vertical split and switch to it
nnoremap <leader>w <C-w>v<C-w>l

" convert from mac to unix line endings
nmap <leader>fml :g/\r/s/\r/\r/<CR>

" quickly edit vimrc
nnoremap <leader>ev :e ~/.vimrc<cr>
nnoremap <leader>egv :e ~/.gvimrc<cr>

" space replays q macro
:nnoremap <Space> @q

" toggle set list
nmap <leader>i :set list!<CR>

" toggle spell check
nmap <Leader>s :setlocal spell!<CR>


"""""""""""""""""""""""""""""""""""
" AUTOCOMMANDS
"""""""""""""""""""""""""""""""""""

" save folds
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

" .cljs is clojure
au BufNewFile,BufRead *.cljs set ft=clojure

" actionscript
au BufNewFile,BufRead *.as setf actionscript
autocmd FileType actionscript setlocal sw=4 ts=4 sts=4

autocmd VimEnter * set vb t_vb=   " disable blinking error cursor


"""""""""""""""""""""""""""""""""""
" PLUGIN CONFIGURATION
"""""""""""""""""""""""""""""""""""

" NETRW
let g:netrw_silent=1
let g:netrw_liststyle=3
let g:netrw_winsize=25
let g:netrw_browse_split=2
let g:netrw_altv = 1
"function! ToggleVExplorer()
  "if exists("t:expl_buf_num")
      "let expl_win_num = bufwinnr(t:expl_buf_num)
      "if expl_win_num != -1
          "let cur_win_nr = winnr()
          "exec expl_win_num . 'wincmd w'
          "close
          "exec cur_win_nr . 'wincmd w'
          "unlet t:expl_buf_num
      "else
          "unlet t:expl_buf_num
      "endif
  "else
      "exec '1wincmd w'
      "Vexplore
      "let t:expl_buf_num = bufnr("%")
  "endif
"endfunction
"map <silent> <leader>n :call ToggleVExplorer()<CR>
map <silent> <leader>n :Vexplore ":pwd"<CR>


" GIST
let g:gist_use_password_in_gitconfig = 1

" SLIMV
let g:slimv_swank_clojure = '! startswank'
"let g:slimv_swank_clojure = '! xterm -e lein swank &'
"let g:slimv_swank_clojure = '!osascript -e "tell application \"iTerm\" to do script \"lein swank\""'
let g:slimv_leader = '\'
let g:paredit_shortmaps = 1

" VIMWIKI
function! VimwikiWeblinkHandler(weblink)
    let browser = '/Applications/Google Chrome.app'
    execute ':silent !open -a "'.browser.'" ' . a:weblink
endfunction
let g:vimwiki_folding = 1
let g:vimwiki_fold_lists = 1
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/'}]

" TAGBAR
let g:tagbar_usearrows = 1
let g:tagbar_ctags_bin = "/usr/local/bin/ctags"
nnoremap <leader>l :TagbarToggle<CR>

" CTRLP
let g:ctrlp_working_path_mode = 0
" fix ctrl-p mappings and get ctrl-t back
imap <C-p> <esc>:CtrlP<CR>
nmap <C-t> :CtrlP<CR>
"iunmap <C-t>


"""""""""""""""""""""""""""""""""""
" FUNCTIONS
"""""""""""""""""""""""""""""""""""

" AUTOJUMP
function! AutoJump(path)
  let path = substitute(system('autojump ' . a:path), "\n", "", "")
  execute "cd " . fnameescape(empty(path) ? '.' : path)
endfunction
command -nargs=1 -complete=file J call AutoJump(<f-args>)

" Pulse cursor line on matches when searching
function! PulseCursorLine()
    let current_window = winnr()

    windo set nocursorline
    execute current_window . 'wincmd w'

    setlocal cursorline

    redir => old_hi
        silent execute 'hi CursorLine'
    redir END
    let old_hi = split(old_hi, '\n')[0]
    let old_hi = substitute(old_hi, 'xxx', '', '')

    hi CursorLine guibg=#2a2a2a ctermbg=233
    redraw
    sleep 20m

    hi CursorLine guibg=#333333 ctermbg=235
    redraw
    sleep 20m

    hi CursorLine guibg=#3a3a3a ctermbg=237
    redraw
    sleep 20m

    hi CursorLine guibg=#444444 ctermbg=239
    redraw
    sleep 20m

    hi CursorLine guibg=#3a3a3a ctermbg=237
    redraw
    sleep 20m

    hi CursorLine guibg=#333333 ctermbg=235
    redraw
    sleep 20m

    hi CursorLine guibg=#2a2a2a ctermbg=233
    redraw
    sleep 20m

    execute 'hi ' . old_hi

    windo set cursorline
    execute current_window . 'wincmd w'
endfunction

" eval vimscript regions with e
fun! EvalVimScriptRegion(s,e)
  let lines = getline(a:s,a:e)
  let file = tempname()
  cal writefile(lines,file)
  redir @e
  silent exec ':source '.file
  cal delete(file)
  redraw
  redir END
  echo "Region evaluated."

  if strlen(getreg('e')) > 0
    10new
    redraw
    silent file "EvalResult"
    setlocal noswapfile  buftype=nofile bufhidden=wipe
    setlocal nobuflisted nowrap cursorline nonumber fdc=0
    " syntax init
    set filetype="eval"
    syn match ErrorLine +^E\d\+:.*$+
    hi link ErrorLine Error
    silent $put =@e
  endif
endf
augroup VimEval
  au!
  au filetype vim :command! -range Eval  :cal EvalVimScriptRegion(<line1>,<line2>)
  au filetype vim :vnoremap <silent> e   :Eval<CR>
augroup END
