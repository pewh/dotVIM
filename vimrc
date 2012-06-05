" Be IMproved {{{
  set nocompatible
" }}}

" vundle {{{
  filetype off
  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()

  Bundle 'gmarik/vundle'
" }}}
" out-of-the-box {{{
  " Bundle 'majutsushi/tagbar'
  Bundle 'tpope/vim-endwise'
  " Bundle 'tpope/vim-fugitive'
  Bundle 'fugitive.vim'
  Bundle 'delimitMate.vim'
  Bundle 'ZenCoding.vim'
  Bundle 'SearchComplete'
  " Bundle 'SuperTab'
  Bundle 'ZoomWin'
  " Bundle 'Indent-Guides'
  Bundle 'ctrlp.vim'
  Bundle 'repeat.vim'
  " Bundle 'snipMate'
  Bundle 'surround.vim'
  " Bundle 'colorv.vim'
  Bundle 'tComment'
  Bundle 'html5.vim'
  Bundle 'less-syntax'
  Bundle 'tpope/vim-haml'
  Bundle 'kchmck/vim-coffee-script'
  Bundle 'Markdown-syntax'
  Bundle 'ChrisYip/Better-CSS-Syntax-for-Vim'
" }}}
" vim-session {{{
  Bundle 'xolox/vim-session'

  let g:session_default_to_last = 1
" }}}
" neocomplcache {{{
  Bundle 'Shougo/neocomplcache'
  Bundle 'Shougo/neocomplcache-snippets-complete'

  if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
  endif
  let g:neocomplcache_enable_at_startup=1
  let g:neocomplcache_enable_auto_select=1
  let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
  " let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
  " let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
  " let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

  imap <C-k>     <Plug>(neocomplcache_snippets_expand)
  smap <C-k>     <Plug>(neocomplcache_snippets_expand)
  " inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  imap <expr><Tab> neocomplcache#sources#snippets_complete#expandable() ? "<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "<C-n>" : "<Tab>"
  "
" }}}
" nerdtree {{{
  Bundle 'scrooloose/nerdtree'
  Bundle 'jistr/vim-nerdtree-tabs'

  let NERDTreeChDirMode=2
  let NERDTreeIgnore=['\~$', '\.swo$', '\.swp$', '\.git', '\.jpg$', '\.bmp$', '\.gif$', '\.png$', '\.jpeg$', '\.o$', '\.exe$', '\.dll$', '\.manifest$', '\.DS_Store']



  nnoremap <silent><F4> :NERDTreeTabsToggle<cr>
  inoremap <silent><F4> <Esc>:NERDTreeTabsToggle<cr>
" }}}
" vim-powerline {{{
  Bundle 'Lokaltog/vim-powerline'

  let g:Powerline_symbols = 'fancy'
  let g:Powerline_cache_enabled = 1
" }}}
" syntastic {{{
  Bundle 'scrooloose/syntastic'

  let g:syntastic_check_on_open=1
  let g:syntastic_auto_loc_list=2
  let g:syntastic_auto_jump=1
  " let g:syntastic_stl_format='[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'

  " set statusline=[Line\ %l\ of\ %L]
  " set statusline+=%=
  " set statusline+=\ %*
  " set statusline+=\ %f
  " set statusline+=\ %y%m%r%w
  " set statusline+=\ %#warningmsg#
  " set statusline+=\ %{SyntasticStatuslineFlag()}

  nnoremap <silent><F3> :Errors<cr>
  inoremap <silent><F3> <Esc>:Errors<cr>
" }}}
" easy-motion {{{
  Bundle 'EasyMotion'

  let g:EasyMotion_leader_key='<leader>'
" }}}
" tabularize {{{
  Bundle 'Tabular'

  vnoremap <silent><leader><leader>ta           :Tabularize /
  vnoremap <silent><leader><leader>t=           :Tabularize /=<cr>
  vnoremap <silent><leader><leader>t:           :Tabularize /:\zs<cr>
  vnoremap <silent><leader><leader>tc           :Tabularize /:/r0c1l1<cr>
" }}}
" colorscheme {{{
  Bundle 'molokai'

  colorscheme molokai
  set t_Co=256
" }}}

" formatting {{{
set history=256
set encoding=utf-8
set modelines=0
set tabstop=2 shiftwidth=2
set autowrite autoread
set nobackup noswapfile
set smarttab expandtab
set incsearch nohlsearch
set autoindent copyindent
set ignorecase smartcase
set showcmd showmode showmatch
set wildmenu
set wildmode=longest,list,full
set wildignore=.hg,.git,.svn
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest
set wildignore+=*.sw?
set wildignore+=*.DS_Store
" }}}
" visual {{{
set guifont=Inconsolata\ 12
set nowrap
set relativenumber
set visualbell noerrorbells
set backspace=indent,eol,start
set hidden
set scrolloff=3
set laststatus=2
set listchars=tab:▸\ ,trail:~,extends:>,precedes:<,eol:¬
set showbreak=↪
filetype plugin indent on
syntax on
" }}}
" folding {{{
  function! CustomFoldText() " {{{
    let line = getline(v:foldstart)
    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')
    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
  endfunction " }}}

  set foldmethod=marker
  set foldlevelstart=0
  set foldtext=CustomFoldText()
 
  nnoremap <Enter>               za
  vnoremap <Enter>               za
  nnoremap z0                    zCz0
  nnoremap <leader>z             zMzvzz
" }}}
" mapping {{{
  " mapleader {{{
    let mapleader=","
  " }}}
  " switching mode {{{
    noremap  ;        :
    noremap  :        ;
    inoremap jk       <Esc>l
    inoremap jj       <C-o>
    nnoremap <Space>  i
    vnoremap <Space>  <Esc>
  " }}}
  " navigation {{{
    noremap j     gj
    noremap k     gk
    noremap H     ^
    noremap L     $
    noremap mh    H
    noremap ml    L
    " disable arrow keys {{{
      noremap  <Up>                  <nop>
      noremap  <Down>                <nop>
      noremap  <Left>                <nop>
      noremap  <Right>               <nop>
      inoremap <Up>                  <nop>
      inoremap <Down>                <nop>
      inoremap <Left>                <nop>
      inoremap <Right>               <nop>
    " }}}
  " }}}
  " jumping windows {{{
    nnoremap <C-H>    <C-W>h
    nnoremap <C-J>    <C-W>j
    nnoremap <C-K>    <C-W>k
    nnoremap <C-L>    <C-W>l
  " }}}
  " useful tab {{{
    nnoremap >                     >>
    nnoremap <                     <<
    vnoremap <Tab>                 >gv
    vnoremap <S-Tab>               <gv
  " }}}
  " clipboard {{{
    vnoremap <silent><leader>y                 "+y
    vnoremap <silent><leader>d                 "+d
    noremap  <silent><leader>v                 "+gP
  " }}}
  " sourcing {{{
    nnoremap <silent><leader>sv    :source  $MYVIMRC<cr>
    nnoremap <silent><leader>ev    :vsplit  $MYVIMRC<cr>
    nnoremap <silent><leader>lv    ^vg_y:execute @@<cr>
    vnoremap <silent><leader>lv    y:execute @@<cr>
  " }}}
  " for productivity {{{
    nnoremap <silent><leader>q     :q<cr>
    nnoremap <silent><leader>Q     :q!<cr>
    nnoremap <silent><leader>x     :wq!<cr>
    nnoremap <silent><leader>s     :w<cr>
    nnoremap <silent><leader>S     :w !sudo tee > /dev/null %<cr>
    nnoremap <silent><leader>/     :set hlsearch!<cr>
    nnoremap <silent><leader>l     :set list!<cr>
    nnoremap <silent><leader>p     :set wrap!<cr>
    nnoremap <silent><leader>an    :set number<cr>
    nnoremap <silent><leader>rn    :set relativenumber<cr>
    nnoremap <silent><leader>r     :registers<cr>
    nnoremap <silent><leader>m     :marks<cr>
  " }}}
  " paste toggle {{{
    nnoremap <F2>                         :set invpaste paste?<cr>
    set pastetoggle=<F2>
  " }}}
  " ruler limit guide {{{
    nnoremap <silent><leader>\            :hi OverLength ctermbg=red ctermfg=white guifg=#592929<cr> :match OverLength /\%80v.\+/<cr>
    nnoremap <silent><leader><leader>\    :hi OverLength ctermbg=none ctermfg=none guifg=none<cr>    :match OverLength /\%80v.\+/<cr>
  " }}}
  " custom {{{
    inoremap ;<cr>                        <end>;<cr>
    inoremap ,<cr>                        <end>,<cr>
  " }}}
" }}}

if has("autocmd") " {{{
  augroup set_filetypes " {{{
    autocmd!
    autocmd BufEnter           *                              lcd %:p:h
    autocmd BufNewFile,BufRead *.rss,*.atom                   setfiletype xml
  augroup end " }}}
  augroup omnicompletion " {{{
    autocmd!
    autocmd FileType html       set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css        set omnifunc=csscomplete#CompleteCSS
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType xml        set omnifunc=xmlcomplete#CompleteTags
    autocmd FileType php        set omnifunc=phpcomplete#CompletePHP
    autocmd FileType ruby       set omnifunc=rubycomplete#Complete
    autocmd FileType python     set omnifunc=pythoncomplete#Complete
    autocmd FileType c          set omnifunc=ccomplete#Complete
  augroup end " }}}
  augroup cline " {{{
    autocmd!
    autocmd WinLeave * set nocursorline
    autocmd WinEnter * set cursorline
    autocmd InsertEnter * set nocursorline
    autocmd InsertLeave * set cursorline
  augroup end " }}}
  augroup custom " {{{
    autocmd!
    autocmd FocusLost * :silent! wall
    autocmd FileType     html,javascript,markdown,python  setlocal ts=4 sts=4 sw=4
    autocmd FileType     html,haml,css,less,scss,sass     let g:loaded_css_syntax_checker=1
    "autocmd FileType     python                        setlocal noexpandtab
    "autocmd BufWriteCmd  *.html,*.css,*.haml           :call Refresh_browser()
    "autocmd BufRead      *.html                        :normal gg=G
    "function! Refresh_browser()
      "if &modified
        "write
        "silent !xdotool search --class chromium key F5
      "endif
    "endfunction
  augroup end " }}}
endif " }}}
