" vi互換モード無効
set nocompatible

"--------------------------------------
" Bundle Settings
"--------------------------------------
filetype off
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'windows' : 'echo "Sorry, cannot update vimproc binary file in Windows."',
  \     'cygwin'  : 'make -f make_cygwin.mak',
  \     'mac'     : 'make -f make_mac.mak',
  \     'unix'    : 'make -f make_unix.mak',
  \    },
  \ }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'thinca/vim-ref'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tyru/caw.vim'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'vim-scripts/yanktmp.vim'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'buftabs'
NeoBundle 'kana/vim-tabpagecd'

let &termencoding = &encoding
set encoding=utf-8
set fileencodings=utf-8,euc-jp,iso-2022-jp,cp932

set ambiwidth=double

" 現在のモードを(最下段に)表示
set showmode
set showcmd
set title
" 行番号を表示
set number
" ルーラ無効
set ruler
" ステータスライン表示 (0:非表示, 1:ウィンドウが2つ以上ある場合に表示, 2:常時表示)
set laststatus=2
" ステータスラインの表示要素
" %=    左右の区切り位置指定
" %m    編集済の場合は[+]を表示. 編集不可の場合は[-]を表示
" %r    readonlyの場合には[RO]を表示
" %h    ヘルプ表示時は[help]を表示
" %w    プレビュー表示時は[Preview]を表示
" &fenc ファイルエンコーディング
" &enc  エンコーディング
" &ff   ファイルフォーマット
" %l    行番号
" %c    列番号
" %V    マルチバイト文字などを含む場合の仮想列番号 (通常時と同じ場合は表示しない)
" %8P   表示部分が全体の何%に位置するか(8桁表示)
set statusline=%=%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}\ %l/%L,%c%V%8P
" 不可視文字(タブ, 行末など)を表示する
set list
" listでの各要素の表示方法を指定する
" tab:      タブ(空白2文字)
" extends:  折り返し無効の場合にウィンドウ外に省略された文字がある場合の表示
" trail:    行末空白
set listchars=tab:\ \ ,extends:<,trail:-

"--------------------------------------
" Search Settings
"--------------------------------------
" インクリメンタルサーチ有効
set incsearch
" 検索結果をハイライト
set hlsearch
" 大文字/小文字は無視して検索
set ignorecase
" 大文字で始めた場合には大文字/小文字を区別する
set smartcase

" 新しい行のインデントを現在の行と同じにする
set autoindent
" 括弧やコメント, 予約語のある行などで自動インデント
set smartindent
" C言語的な自動インデント
set cindent
" BackSpaceでインデントや改行などを削除可能にする
set backspace=indent,eol,start
set matchtime=1
" 対応する括弧を表示
set showmatch
set wildmenu
set shortmess+=I

" タブをスペースで置き換える
set expandtab
" タブ文字を空白2文字で表示する
set tabstop=2
" 自動インデントやシフト(>>, <<)での挿入数
set shiftwidth=2
" <Tab>キーを押した場合の挿入数 (0の場合はtabstopと同じ)
set softtabstop=2
set shiftround
set smarttab
set hidden
" バックアップを作成しない
set nobackup
" ファイル末尾まで検索したら先頭に戻る
set wrapscan
" カーソル行の強調表示
set cursorline
" 未編集時に外部で編集された場合には自動的に再読込
set autoread
set scroll=3
set scrolloff=15
" 指定キーでは行頭/行末の回り込みを許可
" b, s          BackSpace, Space (Normal/Visual)
" h, l          h, l (Normal/Visual)
" <, >          Left, Right (Normal/Visual)
" [, ]          Left, Right (Insert/Replace)
set whichwrap=b,s,h,l,<,>,[,]
" クリップボードを共有
set clipboard+=unnamed,autoselect
set visualbell t_vb=

" ファイルタイプ毎のインデント有効化
filetype indent on
" ファイルタイプ毎のプラグイン有効化
filetype plugin on
" シンタックスカラーリング有効化
syntax on

set t_Co=256
" カラースキーマ
colorscheme desert
hi Pmenu ctermbg=cyan ctermfg=black
hi PmenuSel ctermbg=blue
hi PmenuSbar ctermbg=cyan
hi Folded	ctermfg=blue ctermbg=darkgrey cterm=bold term=bold
hi MatchParen term=standout ctermbg=Black ctermfg=Red guibg=Black guifg=Red

" autocmd
if has("autocmd")
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  autocmd QuickFixCmdPost vimgrep cw
endif

"--------------------------------------
" ZenCoding
"--------------------------------------
let g:use_zen_complete_tag = 1

"--------------------------------------
" NeoComplcache
"--------------------------------------
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_dictionary_filetype_lists = {
  \ 'default' : '',
  \ 'vimshell' : $HOME.'/.vimshell_hist',
  \ 'scheme' : $HOME.'/.gosh_completions'
  \ }
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
let g:neocomplcache_enable_cursor_hold_i = 1
let g:neocomplcache_enable_insert_char_pre  = 1
let g:neocomplcache_enable_auto_select = 0
if !exists('g:neocomplcache_source_rank')
  let g:neocomplcache_source_rank = {}
endif
let g:neocomplcache_source_rank.buffer_complete = 90

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><CR>    pumvisible() ? neocomplcache#close_popup() : "\<CR>"
inoremap <expr><Right> pumvisible() ? neocomplcache#cancel_popup() : "\<Right>"
inoremap <expr><TAB>   pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><BS>   neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-h>  neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
inoremap <expr><C-g>  neocomplcache#undo_completion()
inoremap <expr><C-l>  neocomplcache#complete_common_string()

"--------------------------------------
" Buftabs
"--------------------------------------
let g:buftabs_only_basename=1
let g:buftabs_in_statusline=1
let g:buftabs_active_highlight_group="Visual"

nnoremap <Space>   :bnext<CR>
nnoremap <S-Space> :bprev<CR>

"--------------------------------------
" NERD_comments
"--------------------------------------
let NERDSpaceDelims = 1
let NERDShutUp = 1

"--------------------------------------
" YankTmp
"--------------------------------------
map <silent> sy :call YanktmpYank()<CR>
map <silent> sp :call YanktmpPaste_p()<CR>
map <silent> sP :call YanktmpPaste_P()<CR>

"--------------------------------------
" caw
"--------------------------------------
nmap <Leader>c <Plug>(caw:I:toggle)
vmap <Leader>c <Plug>(caw:I:toggle)

"--------------------------------------
" unite.vim
"--------------------------------------
let g:unite_enable_start_insert=1
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

"--------------------------------------
" VimFiler
"--------------------------------------
cmap vf VimFiler -split -simple -winwidth=30 -no-quit

"--------------------------------------
" ref.vim
"--------------------------------------
let g:ref_use_vimproc=1
let g:ref_phpmanual_path=$HOME ."/Documents/refs/php-chunked-xhtml"
let g:ref_source_webdict_sites = {
\   'alc': {
\     'url': 'http://eow.alc.co.jp/search?q=%s',
\   },
\   'wikipedia': {
\     'url': 'http://ja.wikipedia.org/wiki/%s',
\   },
\ }
function! g:ref_source_webdict_sites.alc.filter(output)
  return join(split(a:output, "\n")[42 :], "\n")
endfunction
function! g:ref_source_webdict_sites.wikipedia.filter(output)
  return join(split(a:output, "\n")[17 :], "\n")
endfunction
nnoremap ,rr :<C-u>Ref refe<Space>
nnoremap ,rp :<C-u>Ref phpmanual<Space>
nnoremap ,ra :<C-u>Ref webdict alc<Space>
nnoremap ,rw :<C-u>Ref webdict wikipedia<Space>
au FileType ref nnoremap <silent> <buffer> <ESC><ESC> :q<CR>

"--------------------------------------
" Other key maps
"--------------------------------------
" <Esc>キー2回で検索結果ハイライトを無効化
nmap <Esc><Esc> <Esc>:nohlsearch<CR><Esc>
vmap _ :w !nkf -Ws\|pbcopy<CR><CR>
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l
nnoremap j gjzz
nnoremap k gkzz
" 大文字でも保存/終了コマンドを受け付ける
cmap W w
cmap Q q
cmap WQ wq

" 英字キーボードでの ; -> : 変換
nnoremap ; :
" 挿入モードでも jj でノーマルモードに遷移する
inoremap jj <ESC>

