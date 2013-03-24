"------------------------------------------------------------
" * Vundle Plugin
"------------------------------------------------------------
set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
" My Bundles here:
"
" vim-scripts repos
" Bundle "rails.vim"
Bundle "The-NERD-Commenter"
Bundle "AutoClose"
Bundle "quickhl.vim"
Bundle "endwise.vim"
Bundle "ruby-matchit"
Bundle "Vim-Rspec"

" original repos on github
" Bundle "tpope/vim-fugitive"
Bundle "vim-ruby/vim-ruby"
Bundle "tpope/vim-rails"
Bundle "tpope/vim-fugitive"
Bundle "tpope/vim-surround"
Bundle "Lokaltog/vim-powerline"
Bundle "Shougo/neocomplcache"
Bundle "Shougo/neosnippet"
Bundle "Shougo/unite.vim"
Bundle "Shougo/vimfiler"
Bundle "honza/snipmate-snippets"
Bundle "Lokaltog/vim-easymotion"
Bundle "mattn/zencoding-vim"
Bundle "rhysd/clever-f.vim"
Bundle "glidenote/memolist.vim"
Bundle "thinca/vim-quickrun"
Bundle "monochromegane/unite-script"

" non github repos
" Bundle "git://git.wincent.com/command-t.git"
Bundle "git://github.com/Shougo/vimproc"

filetype plugin indent on     " required!

"------------------------------------------------------------
" * 基本の設定
"------------------------------------------------------------

" Vi互換モードをオフ（Vimの拡張機能を有効）
set nocompatible

" ファイル名と内容によってファイルタイプを判別し、ファイルタイププラグインを有効にする
filetype indent plugin on

" 色づけをオン
syntax on

" バッファを保存しなくても他のバッファを表示できるようにする
set hidden
 
" コマンドライン補完を便利に
set wildmenu

" タイプ途中のコマンドを画面最下行に表示
set showcmd

" 検索語を強調表示（<Esc><Esc>を押すと現在の強調表示を解除する）
set hlsearch
 
" 検索時に大文字・小文字を区別しない。ただし、検索後に大文字小文字が
" 混在しているときは区別する
set ignorecase
set smartcase

" オートインデント、改行、インサートモード開始直後にバックスペースキーで
" 削除できるようにする
set backspace=indent,eol,start

" オートインデント
set autoindent

" 移動コマンドを使ったとき、行頭に移動しない
set nostartofline

" 画面最下行にルーラーを表示する
set ruler

" ステータスラインを常に表示する
set laststatus=2

" バッファが変更されているとき、コマンドをエラーにするのでなく、保存する
" かどうか確認を求める
set confirm

" ビープの代わりにビジュアルベル（画面フラッシュ）を使う
set visualbell

" そしてビジュアルベルも無効化する
set t_vb=

" 全モードでマウスを有効化
set mouse=a

" コマンドラインの高さを2行に
set cmdheight=2

" 行番号を表示
set number

" キーコードはすぐにタイムアウト。マッピングはタイムアウトしない
set notimeout ttimeout ttimeoutlen=200

" <F11>キーで'paste'と'nopaste'を切り替える
set pastetoggle=<F11>

" タブ文字の代わりにスペース2個を使う
set shiftwidth=2
set softtabstop=2
set expandtab

"256色を有効にする
set t_Co=256

"colorschemeを設定する
colorscheme default

"カーソル行の強調表示
set cursorline

"スワップファイルをつくらない
set noswapfile

" 文字、改行コードを自動判別する
:set encoding=utf-8
:set fileencodings=default,euc-jp,sjis,utf-8
:set fileformats=unix,dos,mac


"------------------------------------------------------------
" * 基本のキーマッピング
"------------------------------------------------------------

" Yの動作をDやCと同じにする
map Y y$

" <Esc><Esc>で検索後の強調表示を解除する
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" 前後のバッファへ移動
nnoremap <C-k> :bp<CR>
nnoremap <C-j> :bn<CR>
" バッファを削除
nnoremap ,D :bd<CR>


"------------------------------------------------------------
" * autocmd
"------------------------------------------------------------
if has("autocmd")
  autocmd FileType php setlocal sw=4 sts=4 ts=4 et
endif


"------------------------------------------------------------
" * neocomplcache 
"------------------------------------------------------------
 
let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 0
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3

" tabで候補を移動 & snippetsを展開
imap <expr><tab> neocomplcache#sources#snippets_complete#expandable() ? "\<plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><c-l> neocomplcache#complete_common_string()
inoremap <expr><c-y> neocomplcache#close_popup()
inoremap <expr><c-c> neocomplcache#cancel_popup()
inoremap <expr><BS>  neocomplcache#smart_close_popup()."\<c-h>"
inoremap <expr><c-h> neocomplcache#smart_close_popup()."\<c-h>"
" Ctrl+j, k で候補を移動
inoremap <expr><c-j> pumvisible() ? "\<C-n>" : "\<c-j>"
inoremap <expr><c-k> pumvisible() ? "\<C-p>" : "\<c-k>"

" 補完ポップアップのカラー設定
hi Pmenu ctermbg=8
hi PmenuSel ctermbg=3
hi PmenuSbar ctermbg=0


"------------------------------------------------------------
" * Unite.vim
"------------------------------------------------------------

" insert modeで開始
let g:unite_enable_start_insert=1

" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" uniteのbufferを表示する

" 全部乗せ
nnoremap <silent> ,a  :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
" ファイル一覧
nnoremap <silent> ,f  :<C-u>Unite -buffer-name=files file<CR>
" Everything検索
nnoremap <silent> ,e  :<C-u>Unite file_rec<CR>
" バッファ一覧
nnoremap <silent> ,v  :<C-u>Unite buffer<CR>
" 常用セット
nnoremap <silent> ,u  :<C-u>Unite buffer file_rec<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,m  :<C-u>Unite file_mru<CR>
" 現在のバッファのカレントディレクトリからファイル一覧
nnoremap <silent> ,d  :<C-u>UniteWithBufferDir file<CR>
" find検索
nnoremap <silent> ,s  :<C-u>Unite find<CR>
" grep検索
nnoremap <silent> ,g  :<C-u>Unite grep -buffer-name=search-buffer<CR>
" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>
" chrome bookmark
nnoremap <silent> ,b  :<C-u>Unite script:osascript:~/.vim/bundle/unite-script/examples/chrome_bookmarks.scpt<CR>

" ,cで終了する
au FileType unite nnoremap <silent> <buffer> ,c :q<CR>
au FileType unite inoremap <silent> <buffer> ,c <ESC>:q<CR>

" unite mode でのキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  imap <silent><buffer> <C-k> <C-p>
  imap <silent><buffer> <C-j> <C-n>
endfunction


"------------------------------------------------------------
" * VimFiler
"------------------------------------------------------------

" Space で起動
nnoremap <Space> :<C-u>VimFiler<CR>
let g:vimfiler_as_default_explorer=1
let g:vimfiler_safe_mode_by_default=0
autocmd! FileType vimfiler call g:my_vimfiler_settings()
function! g:my_vimfiler_settings()
  nmap     <buffer><expr><Cr> vimfiler#smart_cursor_map("\<Plug>(vimfiler_execute)", "\<Plug>(vimfiler_edit_file)")
endfunction

"------------------------------------------------------------
" * EasyMotion
"------------------------------------------------------------

" M で起動
let g:EasyMotion_leader_key="M"
" ホームポジションに近いキーを使う
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
" 1 ストローク選択を優先する
let g:EasyMotion_grouping=1
" カラー設定変更
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue

" J, K で前後の行移動
nmap J Mj
nmap K Mk


"------------------------------------------------------------
" * memolist.vim
"------------------------------------------------------------
nnoremap <silent> mn :<C-u>MemoNew<CR>
nnoremap <silent> ml :<C-u>Unite file:<C-r>=expand(g:memolist_path."/")<CR><CR>
nnoremap <silent> mg :<C-u>Unite grep:<C-r>=expand(g:memolist_path."/")<CR><CR>
nnoremap <silent> mf :<C-u>VimFiler <C-r>=expand(g:memolist_path."/")<CR><CR> 


"------------------------------------------------------------
" * vim-fugitive
"------------------------------------------------------------

nnoremap <silent> gb :Gblame<CR>
nnoremap <silent> gd :Gdiff<CR>
nnoremap <silent> gs :Gstatus<CR>
" Gstatus mode での操作
"  D -> git diff with vimdiff
"  - -> toggle stage, unstage
"  C -> commit
"  q -> close Gstatus window

" ggでGstatus modeのvimdiffを終了
nnoremap <silent> gg <C-w><C-o>  

"------------------------------------------------------------
" * zen-coding
"------------------------------------------------------------

" codaのデフォルトと一緒にする
imap <C-E> <C-Y>,
let g:user_zen_leader_key = '<C-Y>'
" 言語別に対応させる
let g:user_zen_settings = {
      \  'lang' : 'ja',
      \  'html' : {
      \    'filters' : 'html',
      \    'indentation' : '  ',
      \    'snippets' : {
      \      'jq' : "<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js\"></script>\n<script>\n\\$(document).ready(function() {\n\t|\n});\n</script>",
      \    },
      \  },
      \  'javascript' : {
      \    'snippets' : {
      \      'jq' : "\\$(document).ready(function() {\n\t\\${cursor}\\${child}\n});",
      \      'jq:json' : "\\$.getJSON(\"${cursor}\", function(data) {\n\t\\${child}\n});",
      \      'jq:each' : "\\$.each(data, function(index, item) {\n\t\\${child}\n});",
      \      'fn' : "(function() {\n\t\\${cursor}\n})();",
      \      'tm' : "setTimeout(function() {\n\t\\${cursor}\n}, 100);",
      \    },
      \    'use_pipe_for_cursor' : 0,
      \  },
      \  'css' : {
      \    'filters' : 'fc',
      \  },
      \}

"------------------------------------------------------------
" * vim-quickrun
"------------------------------------------------------------

silent! nmap <C-r> <Plug>(quickrun)
" 実行結果を下に表示
" 実行後に出力バッファにカーソルを移動(qで閉じる)
let g:quickrun_config = {
  \ "*" : { 'split' : ''},
  \ "_" : { "outputter/buffer/into" : 1,},}
set splitbelow

" markdownをMarkedで開く
let g:quickrun_config.markdown = {
      \ 'outputter' : 'null',
      \ 'command'   : 'open',
      \ 'cmdopt'    : '-a',
      \ 'args'      : 'Marked',
      \ 'exec'      : '%c %o %a %s',
      \ }

