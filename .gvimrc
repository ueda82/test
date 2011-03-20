"KeyMap ============================

"gvimrcを使用中に変更するコマンド
nnoremap <Space>. :<C-u>edit ~/.gvimrc<Enter>
nnoremap <Space>s. :<C-u>source ~/.gvimrc<Enter>
"Rubyをコマンドとして実行
" nnoremap <Space>r :w<CR>:!ruby %<CR>
"<F10>でバッファのRubyスクリプトを実行し、結果をプレビュー表示
vmap <silent> <F10> :call Ruby_eval_vsplit()<CR>
nmap <silent> <F10> mzggVG<F10>`z
map  <silent> <S-F10> :pc<CR>
nnoremap <Space>t :!refe String
" 画面の移動と大きさ変更

nnoremap <Space>k <C-W>k
nnoremap <Space>j <C-W>j
nnoremap <Space>h <C-W>h
nnoremap <Space>l <C-W>l
nnoremap <Space>i <C-W>_
nnoremap <Space>m <C-W>1_
nnoremap <UP> <C-W>-
nnoremap <DOWN> <C-W>+
" 移動を入れ替え
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j
" コマンドモードで貼り付け
cnoremap <C-p> <C-R>"
"←→でバッファ移動
map <LEFT> <ESC>:bp<CR>
map <RIGHT> <ESC>:bn<CR>
" 選択してTABボタンを入れるとインデント入れる
" vnoremap <TAB> :s/^/\t/<return> :nohlsearch<return>
vnoremap <TAB> >><ESC>
vnoremap <RIGHT> >><ESC>
vnoremap <Space><TAB> <<<ESC>
vnoremap <LEFT> <<<ESC>
nnoremap <TAB> >><ESC>
nnoremap <Space><TAB> <<<ESC>
" ============================
"smartcharプラグイン設定
noremap <expr>  f<TAB>  smartchr#loop('function(){ ', 'f')
" ============================
" フォント設定
" set guifont=Osaka－等幅\ 14
set guifont=ゆたぽん（コーディング）\ 14
" カラースキーマ設定
colorscheme evening 
filetype plugin indent on
syntax enable
set wildmode=list,full
"ヘルプ検索の日本語の優先順位を上げる
set helplang=ja,en
set backspace=eol,indent,start
"検索の場合は大文字小文字を区別しない
set ignorecase
" ただし、大文字小文字が同時入力された場合は有効にする
set smartcase
"バックアップファイルを作るディレクトリ
set backupdir=~/vimbackup
"クリップボードをWindowsと連携
set clipboard=unnamed
"Vi互換をオフ
set nocompatible
"スワップファイル用のディレクトリ
set directory=~/vimbackup
" 初期ディレクトリの場所
set browsedir=buffer
"タブの代わりに空白文字を挿入する
set expandtab
"変更中のファイルでも、保存しないで他のファイルを表示
set hidden
"インクリメンタルサーチを行う
set incsearch
"タブ文字、行末など不可視文字を表示する
"set list
"listで表示される文字のフォーマットを指定する
"set listchars=eol:$,tab:>\ ,extends:<
"行番号を表示する
set number
" カレントディレクトリを自動で移動
set autochdir
"シフト移動幅
set shiftwidth=4
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
"検索時に大文字を含んでいたら大/小を区別
set smartcase
"新しい行を作ったときに高度な自動インデントを行う
set smartindent
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab
"ファイル内の <Tab> が対応する空白の数
set tabstop=4

"ウィンドウを最大化して起動
"au GUIEnter * simalt ~x

".gvimrc カラー設定
"カラー設定した後にCursorIMを定義する方法
if has('multi_byte_ime')
  highlight Cursor guifg=NONE guibg=Green
  highlight CursorIM guifg=NONE guibg=Purple
endif
"入力モード時、ステータスラインのカラーを変更
augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END

"日本語入力をリセット
au BufNewFile,BufRead * set iminsert=0
"タブ幅をリセット
au BufNewFile,BufRead * set tabstop=4 shiftwidth=4

".txtファイルで自動的に日本語入力ON
au BufNewFile,BufRead *.txt set iminsert=2
".rhtmlと.rbでタブ幅を変更
au BufNewFile,BufRead *.rhtml   set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.rb  set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.haml set nowrap tabstop=2 shiftwidth=2

"全角スペースを視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

"taglist 
let Tlist_Ctags_Cmd = 'C:/Windows/vim72/ctags'    "ctagsのパス 
let Tlist_Show_One_File = 1               "現在編集中のソースのタグしか表示しない 
let Tlist_Exit_OnlyWindow = 1             "taglistのウィンドーが最後のウィンドーならばVimを閉じる 
let Tlist_Use_Right_Window = 1            "右側でtaglistのウィンドーを表示 

" if &l:omnifunc == ''
    " setlocal omnifunc=syntaxcomplete#Complete
" endif
" setlocal omnifunc=syntaxcomplete#Complete

" autocmd Filetype *    let g:AutoComplPop_CompleteOption='.,w,b,u,t,i'
" autocmd Filetype java let g:AutoComplPop_CompleteOption='.,w,b,u,t,i,k~/.vim/dict/j2se14.dict'
" autocmd Filetype c    let g:AutoComplPop_CompleteOption='.,w,b,u,t,i,k~/.vim/dict/c.dict'
" autocmd FileType ruby let g:AutoComplPop_CompleteOption = '.,w,b,u,t,i,k~/.vim/dict/ruby.dict'
" autocmd FileType javascript let g:AutoComplPop_CompleteOption = '.,w,b,u,t,i,k~/.vim/dict/javascript.dict'
" autocmd FileType ruby :set dictionary=C:/vim72/runtime/syntax/ruby.vim
" autocmd FileType ruby :set dictionary+=C:/vim72/dict/ruby.dict


"setlocal omnifunc=rubycomplete#Complete
""<TAB>で補完
"" {{{ Autocompletion using the TAB key
"" This function determines, wether we are on the start of the line text (then tab indents) or
"" if we want to try autocompletion
"function! InsertTabWrapper()
"    let col = col('.') - 1
"    if !col || getline('.')[col - 1] !~ '\k'
"        return "\<TAB>"
"    else
"        if pumvisible()
"            return "\<C-N>"
"        else
"            return "\<C-N>\<C-P>"
"        end
"    endif
"endfunction
"" Remap the tab key to select action with InsertTabWrapper
"inoremap <tab> <c-r>=InsertTabWrapper()<cr>
"" Autocompletion using the TAB key
"" ポップアップメニューのカラーを設定
"hi Pmenu guibg=#666666
"hi PmenuSel guibg=#8cd0d3 guifg=#666666
"hi PmenuSbar guibg=#333333

"---------------------------------------------------------------------
" コメントトグル 
" 元ネタ：http://d.hatena.ne.jp/cooldaemon/20070126/1169795080
"---------------------------------------------------------------------
nmap cc <Plug>CommentOut
nnoremap <Plug>CommentOut :<C-u>call CommentOut()<Return>

vmap cc <Plug>CommentOutV
vnoremap <Plug>CommentOutV :call CommentOut()<Return>

function! CommentOut()
    " comment type # 
    if &l:filetype ==# 'perl' || &l:filetype ==# 'ruby' || &l:filetype ==# 'sh' || &l:filetype ==# 'yaml'
        if getline('.') =~ '^\s*#'
            s/^\(\s*\)#\+ \?/\1/
        else	
            s/^\s*/\0# /
        endif
        " comment type //
    elseif &l:filetype ==# 'javascript'
        if getline('.') =~ '^\s*\/\/'
            s/^\(\s*\)\/\/\+ \?/\1/
        else
            s/^\s*/\0\/\/ /
        endif

        " comment type "
    elseif &l:filetype ==# 'vim'
        if getline('.') =~ '^\s*"'
            s/^\(\s*\)"\+ \?/\1/
        else	
            s/^\s*/\0" /
        endif
        " other
    else
        if getline('.') =~ '^\s*\/\/'
            s/^\(\s*\)\/\/\+ \?/\1/
        else
            s/^\s*/\0\/\/ /
        endif
    endif
    :nohlsearch
endf
"---------------------------------------------------------------------

" preview interpreter's output(Tip #1244)
"function! Ruby_eval_vsplit() range
"    if &filetype == "ruby"
"        let src = tempname()
"        let dst = "Ruby Output"
"        " put current buffer's content in a temp file
"        silent execute ": " . a:firstline . "," . a:lastline . "w " . src
"        " open the preview window
"        silent execute ":pedit! " . dst
"        " change to preview window
"        wincmd P
"        " set options
"        setlocal buftype=nofile
"        setlocal noswapfile
"        setlocal syntax=none
"        setlocal bufhidden=delete
"        " replace current buffer with ruby's output
"        silent execute ":%! ruby " . src . " 2>&1 "
"        " change back to the source buffer
"        wincmd p
"    endif
"endfunction
" ============================================
" neocomplcache
" ============================================
let g:NeoComplCache_EnableAtStartup = 1
set complete=.,w,b,u,t,k
let g:NeoComplCache_KeywordCompletionStartLength = 1 
let g:NeoComplCache_PluginCompletionLength = { 
  \ 'snipMate_complete' : 1,
  \ 'buffer_complete' : 1,
  \ 'include_complete' : 2,
  \ 'syntax_complete' : 2,
  \ 'filename_complete' : 2,
  \ 'keyword_complete' : 2,
  \ 'omni_complete' : 1 
  \ }
let g:NeoComplCache_MinKeywordLength = 2 
let g:NeoComplCache_MinSyntaxLength = 2 
let g:NeoComplCache_SmartCase = 1 
let g:NeoComplCache_PartialCompletionStartLength = 2 
let g:NeoComplCache_PreviousKeywordCompletion = 1 
let g:NeoComplCache_EnableCamelCaseCompletion = 1 
let g:NeoComplCache_EnableUnderbarCompletion = 1 
let g:NeoComplCache_EnableSkipCompletion = 0 
let g:NeoComplCache_SnippetsDir = $HOME . '/.vim/snippets'
let g:NeoComplCache_DictionaryFileTypeLists = { 
  \ 'default' : '', 
  \ 'objc' : $HOME . '/.vim/dict/objectivec.dict',
  \ 'javascript' : $HOME . '/.vim/dict/javascript.dict',
  \ 'ruby' : $HOME . '/.vim/dict/ruby.dict',
  \ 'perl' : $HOME . '/.vim/dict/perl.dict',
  \ }
let g:NeoComplCache_SameFileTypeLists = { 
  \ 'perl' : 'man',
  \ 'erlang' : 'man',
  \ }

" neocon keybindings
"------------------
" <TAB> completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" snippets expand key
imap <silent> <C-e> <Plug>(neocomplcache_snippets_expand)
smap <silent> <C-e> <Plug>(neocomplcache_snippets_expand)
"" ポップアップメニューのカラーを設定
hi Pmenu guibg=#666666
hi PmenuSel guibg=#8cd0d3 guifg=#666666
hi PmenuSbar guibg=#333333
" ============================================

