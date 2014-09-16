
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
	finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
	set nobackup		" do not keep a backup file, use versions instead
else
	set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
	set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
	syntax on
	set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

	" Enable file type detection.
	" Use the default filetype settings, so that mail gets 'tw' set to 72,
	" 'cindent' is on in C files, etc.
	" Also load indent files, to automatically do language-dependent indenting.
	filetype plugin indent on

	" Put these in an autocmd group, so that we can delete them easily.
	augroup vimrcEx
		au!

		" For all text files set 'textwidth' to 78 characters.
		autocmd FileType text setlocal textwidth=78

		" When editing a file, always jump to the last known cursor position.
		" Don't do it when the position is invalid or when inside an event handler
		" (happens when dropping a file on gvim).
		" Also don't do it when the mark is in the first line, that is the default
		" position when opening a file.
		autocmd BufReadPost *
					\ if line("'\"") > 1 && line("'\"") <= line("$") |
					\   exe "normal! g`\"" |
					\ endif

	augroup END

else

	set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
				\ | wincmd p | diffthis
endif

" defalutカラースキーム変更
colorscheme ron 

" シンタックス
syntax on

" インデント
set autoindent
set smartindent

" 行番号表示
set number

" ステータスライン表示
set laststatus=2
" <TAB>の対応する空白の数
set tabstop=4
set shiftwidth=4
set softtabstop=4

" カーソルを行頭末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,l]
" 大文字小文字を区別しない
set ignorecase

" キーマップ タブ
nnoremap to :tabnew<space>
nnoremap <silent> tn :tabnext<cr>
nnoremap <silent> tt :tabnext<cr>
nnoremap <silent> tp :tabprevious<cr>

" コマンドライン補完
set wildmode=list,full

" 色設定
highlight Constant ctermfg=Yellow

" 文字列検索後のハイライトを消す
nmap <ESC><ESC> :nohlsearch<CR><ESC>

" 挿入モードでCtr-D Delete
inoremap <C-D> <Delete>


nnoremap j gj
nnoremap k gk

" 保存時に行末の空白を除去する
" autocmd BufWritePre * :%s/\s\+$//ge
" 全角スペースを目立たせる
function! ZenkakuSpace()
	highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
	augroup ZenkakuSpace
		autocmd!
		autocmd ColorScheme       * call ZenkakuSpace()
		autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
	augroup END
	call ZenkakuSpace()
endif

"""""" NeoBundle
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

syntax on
filetype on
filetype plugin indent on

" neobundleの更新
NeoBundle 'Shougo/neobundle.vim'

" neocomplete スニペット作成
" NeoBundle 'Shougo/neocomplete.vim'

""" neocomplete 各種設定
" 読み込み時にneocompleteを有効
" let g:neocomplete#enable_at_startup=1
" 大文字を最初に入力したら検索しない
let g:neocomplete#enable_smart_case=1
" 大文字小文字を無視
let g:neocomplete#enable_ignore_case=1
" 最小のシンタックスキーワード
let g:neocomplete#sources#syntax#min_keyword_length=4
let g:neocomplete#lock_buffer_name_pattern='\*ku\*'
" オートセレクト
let g:neocomplete#enable_auto_select=1
" ファイルの区切りを自動で検出
let g:neocomplete#enable_auto_delimiter=1
" 辞書の位置
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
	\ }

NeoBundle 'kana/vim-surround'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'rking/ag.vim'

""" emmet.vim 各種設定
NeoBundle 'mattn/emmet-vim'
let g:user_emmet_settings = {'lang' : 'ja'}

" css3-syntax
NeoBundle 'hail2u/vim-css3-syntax'
" シンタックスチェック
NeoBundle 'scrooloose/syntastic'
" let g:syntastic_enable_signs=1
" let g:syntastic_auto_loc_list=2

" window保存
" 保存したいディレクトリで 
" mkdir .vimsessions
" vimを開いて :SaveSession
NeoBundle 'xolox/vim-session', { 'depends':'xolox/vim-misc' }
" 現在のディレクトリ直下の .vimsessions/ を取得 
let s:local_session_directory = xolox#misc#path#merge(getcwd(), '.vimsessions')
" ディレクトリがあれば
if isdirectory(s:local_session_directory)
  " session保存ディレクトリをそのディレクトリの設定
  let g:session_directory = s:local_session_directory
  " vimを辞める時に自動保存
  let g:session_autosave = 'yes'
  " 引数なしでvimを起動した時にsession保存ディレクトリのdefault.vimを開く
  let g:session_autoload = 'yes'
else
  let g:session_autosave = 'no'
  let g:session_autoload = 'no'
endif
unlet s:local_session_directory

"" ColorScheme
" solarized カラースキーム
NeoBundle 'altercation/vim-colors-solarized'
" mustang カラースキーム
NeoBundle 'croaker/mustang-vim'
" wombat カラースキーム
NeoBundle 'jeffreyiacono/vim-colors-wombat'
" jellybeans カラースキーム
NeoBundle 'nanotech/jellybeans.vim'
" lucius カラースキーム
NeoBundle 'vim-scripts/Lucius'
" zenburn カラースキーム
NeoBundle 'vim-scripts/Zenburn'
" mrkn256 カラースキーム
NeoBundle 'mrkn/mrkn256.vim'
" railscasts カラースキーム
NeoBundle 'jpo/vim-railscasts-theme'
" pyte カラースキーム
NeoBundle 'therubymug/vim-pyte'
" molokai カラースキーム
NeoBundle 'tomasr/molokai'

" カラースキーム一覧表示に Unite.vim を使う
NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'

NeoBundle 'scrooloose/nerdtree'
