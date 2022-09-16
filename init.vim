" -------------------------------------
"                plugin
"--------------------------------------

let g:jetpack#optimization=2
runtime */jetpack.vim
call jetpack#begin()
Jetpack 'vim-airline/vim-airline' " 上下にairlineつけるやつ
Jetpack 'vim-airline/vim-airline-themes' " airlineのテーマ
Jetpack 'tpope/vim-commentary' " コメントのトグル
Jetpack 'neoclide/coc.nvim', {'branch': 'release'} " IDE化
Jetpack 'ryanoasis/vim-devicons' "アイコンをつける
Jetpack 'lambdalisue/fern.vim' " ファイルツリーの表示
Jetpack 'lambdalisue/fern-git-status.vim' "ファイルツリーにgitの差分を表示
Jetpack 'lambdalisue/nerdfont.vim' " fernを使うのに必要
Jetpack 'lambdalisue/fern-renderer-nerdfont.vim' " fernを使うのに必要
Jetpack 'lambdalisue/glyph-palette.vim' "fernの機能強化
Jetpack 'vim-jp/vimdoc-ja' " vimのヘルプを日本語化
Jetpack 'terryma/vim-expand-region' " 選択領域の拡大縮小
Jetpack 'kana/vim-textobj-user' " expand-regionで必要
Jetpack 'kana/vim-textobj-line' " expand-regionで必要
Jetpack 'kana/vim-textobj-entire' " expand-regionで必要
Jetpack 'tomasr/molokai' " カラースキーム
Jetpack 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' } " markdownのプレビュー
Jetpack 'cohama/lexima.vim' "閉じかっこの自動挿入
Jetpack 'junegunn/rainbow_parentheses.vim' "括弧に色をつける
" Jetpack 'kassio/neoterm' "terminalコマンドの拡張
Jetpack 'airblade/vim-gitgutter' "ファイルの差分表示

" カーソルの瞬間移動
if exists('g:vscode')
  Jetpack 'asvetliakov/vim-easymotion'
  nmap f <Plug>(easymotion-bd-f)
"  set g:EasyMotion_prompt = ""
else
  Jetpack 'easymotion/vim-easymotion'
  nmap f <Plug>(easymotion-bd-f)
  nmap w <Plug>(easymotion-bd-w)
endif

" Jetpack 'vim-denops/denops.vim'
" Jetpack 'vim-skk/denops-skkeleton.vim'
" Jetpack 'Shougo/ddc.vim'
" Jetpack 'Shougo/ddc-matcher_head'
" Jetpack 'Shougo/ddc-sorter_rank'
" Jetpack 'tomasiser/vim-code-dark'
" Jetpack 'skanehira/jumpcursor.vim'
" Jetpack 'nvim-telescope/telescope.nvim'
" Jetpack 'nvim-lua/plenary.nvim'
" Jetpack 'kyazdani42/nvim-web-devicons'
call jetpack#end()

" Leaderキーをspaceキーに設定
let mapleader = "\<Space>"


"----------------------------------------
"             pluginの設定
"----------------------------------------

" vim-airline/vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme = 'molokai'
nmap <s-Tab> <Plug>AirlineSelectPrevTab
nmap <Tab> <Plug>AirlineSelectNextTab

" tpope/vim-commentary
nmap <C-\> gcc

" neoclide/coc.nvim
nmap <Leader>f <Plug>(coc-format)

" lambdalisue/fern.vim
" Ctrl+eでファイルツリーを表示/非表示する
nnoremap <C-e> :Fern . -reveal=% -drawer -toggle -width=40<CR>
let g:fern#renderer = 'nerdfont'
" アイコンに色をつける
augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

let g:fern_disable_startup_warnings = 1

" vim-jp/vimdoc-ja
set helplang=ja,en

" terryma/vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap <s-v> <Plug>(expand_region_shrink)
let g:expand_region_text_objects = {
      \ 'iw'  :0,
      \ 'iW'  :0,
      \ 'i"'  :1,
      \ 'i''' :1,
      \ 'i]'  :1,
      \ 'ib'  :1,
      \ 'iB'  :1,
      \ 'il'  :1,
      \ 'ip'  :0,
      \ 'ie'  :1,
      \ }

" easymotion/vim-easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1

" junegunn/rainbow_parentheses.vim
augroup rainbow_lisp
  autocmd!
  autocmd VimEnter * RainbowParentheses
augroup END

"kassio/neoterm
" let g:neoterm_size=10
" let g:neoterm_autoscroll=1
" let g:neoterm_default_mod='belowright'
" nnoremap <c-t> :Ttoggle<CR>
" let g:neoterm_autoinsert=1

"airblade/vim-gitgutter
set signcolumn=number
let g:gitgutter_map_keys = 0

"----------------------------------------
"               その他
"----------------------------------------

"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd

" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" シンタックスハイライトの有効化
syntax enable

"undo,redo
nnoremap <c-z> u
nnoremap <c-y> <c-r>
inoremap <c-z> <ESC>:undo<CR>a
inoremap <c-y> <ESC>:redo<CR>a
"行末まで削除
inoremap <c-k> <ESC>lDi
"insertモード中にコピーとか
inoremap <c-c> <ESC>yyi
inoremap <c-x> <ESC>ddi
inoremap <c-v> <ESC>pa
vnoremap <c-c> y
"半画面下
nnoremap j 7j
"半画面上
nnoremap k 7k

nnoremap <Down> gj
nnoremap <Up> gk

"エンターで改行&insert
nnoremap <Enter> o

"クリップボード
set clipboard&
set clipboard^=unnamedplus

"日本語(マルチバイト文字)行の連結時には空白を入力しない
set formatoptions+=mM
"□や○の文字があってもカーソル位置がずれないようにする
set ambiwidth=double
"画面最後の行をできる限り表示する。
set display+=lastline

" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2


" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

colorscheme molokai
let g:rehash256 = 1
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none
highlight Comment ctermfg=103

"タイプライタースクロール
set scrolloff=9999

" 行入れ替え
nnoremap <Leader>k ddp
nnoremap <Leader>i kddpk

"単語移動
nnoremap <c-Right> w
nnoremap <c-Left> b

"ターミナルモードをescで抜ける
:tnoremap <Esc> <C-\><C-n>
"常にinsertモードでターミナルモードを開く
autocmd TermOpen * startinsert
