if has("gui_running")
  set guifont=Ubuntu\ Mono\ 12

  " Start without toolbar or scrollbars
  set guioptions-=T
  set guioptions-=r
  set guioptions-=R
  set guioptions-=l
  set guioptions-=L
  set guioptions-=m

  " yank to the system clipboard
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

  " persistent undo!
  set undodir=~/.vim/undo
  set undofile
endif

if has("gui_macvim")
  set guifont=Menlo\ Regular:h14
  "set guifont=monofur:h18
  "set guifont=Anonymous\ Pro:h16
  set transparency=3

  " Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert

  " Command-Return for fullscreen
  macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>

  " Command-Shift-A for Ack
  map <D-A> :Ack<space>

  " Command-Option-ArrowKey to switch viewports
  map <D-M-Up> <C-w>k
  imap <D-M-Up> <Esc> <C-w>k
  map <Leader>k <C-w>k
  map <D-M-Down> <C-w>j
  imap <D-M-Down> <Esc> <C-w>j
  map <Leader>j <C-w>j
  map <D-M-Right> <C-w>l
  imap <D-M-Right> <Esc> <C-w>l
  map <Leader>l <C-w>l
  map <D-M-Left> <C-w>h
  imap <D-M-Left> <C-w>h
  map <Leader>h <C-w>h

  nnoremap p "*p
  vnoremap p "*p  

  " close buffer but leave window alone
  nnoremap <D-w> :Bclose<CR>
  inoremap <D-w> <ESC>:Bclose<CR>

  " HIG related shift + special movement key mappings
  nn   <S-D-Left>     <S-Home>
  vn   <S-D-Left>     <S-Home>
  ino  <S-D-Left>     <S-Home>
  nn   <S-M-Left>     <S-C-Left>
  vn   <S-M-Left>     <S-C-Left>
  ino  <S-M-Left>     <S-C-Left>

  nn   <S-D-Right>    <S-End>
  vn   <S-D-Right>    <S-End>
  ino  <S-D-Right>    <S-End>
  nn   <S-M-Right>    <S-C-Right>
  vn   <S-M-Right>    <S-C-Right>
  ino  <S-M-Right>    <S-C-Right>

  nn   <S-D-Up>       <S-C-Home>
  vn   <S-D-Up>       <S-C-Home>
  ino  <S-D-Up>       <S-C-Home>

  nn   <S-D-Down>     <S-C-End>
  vn   <S-D-Down>     <S-C-End>
  ino  <S-D-Down>     <S-C-End>
endif


" Default gui color scheme
color solarized  
set background=dark
