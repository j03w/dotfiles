set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'kien/ctrlp.vim'
Bundle 'roman/golden-ratio'
Bundle 'briancollins/vim-jst'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/nuvola.vim'
Bundle 'majutsushi/tagbar'
Bundle 'bling/vim-airline'
Bundle 'tpop/vim-bundler'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-endwise'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
Bundle 'noahfrederick/vim-hemisu'
Bundle 'tpope/vim-haml'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'pangloss/vim-javascript'
Bundle 'mxw/vim-jsx'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-ruby'
Bundle 'tpope/vim-surround'
Bundle 'godlygeek/tabular'
Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Bundle 'tpope/vim-unimpaired'

filetype on
filetype plugin indent on
syntax enable
highlight MatchParen ctermbg=4

let mapleader=","
set autoread
set encoding=utf-8
set showcmd
set showmode
set foldmethod=manual
set directory-=.
set wildmenu
set wildmode=list:longest,full
set mouse=a
set backspace=2
set number
set ruler
set ignorecase
set incsearch
set hlsearch
set nohidden
set clipboard=unnamed
set laststatus=2
set list
set listchars=tab:▸\ ,trail:▫
set vb t_vb=

if version >= 700
   set spl=en spell
   set nospell
endif

colorscheme default

set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
if has("autocmd")
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType haml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType coffee setlocal ts=2 sts=2 sw=2 expandtab

  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType html setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab

  autocmd BufNewFile,BufRead *.rss set filetype=xml
  autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  au BufNewFile,BufRead *.ejs so $HOME/.vim/bundle/jst.vim
endif

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Restore cursor position to where it was before
augroup JumpCursorOnEdit
   au!
   autocmd BufReadPost *
            \ if expand("<afile>:p:h") !=? $TEMP |
            \   if line("'\"") > 1 && line("'\"") <= line("$") |
            \     let JumpCursorOnEdit_foo = line("'\"") |
            \     let b:doopenfold = 1 |
            \     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
            \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
            \        let b:doopenfold = 2 |
            \     endif |
            \     exe JumpCursorOnEdit_foo |
            \   endif |
            \ endif
   " Need to postpone using "zv" until after reading the modelines.
   autocmd BufWinEnter *
            \ if exists("b:doopenfold") |
            \   exe "normal zv" |
            \   if(b:doopenfold > 1) |
            \       exe  "+".1 |
            \   endif |
            \   unlet b:doopenfold |
            \ endif
augroup END

let g:Tex_DefaultTargetFormat = "pdf"
let g:Tex_ViewRule_pdf = "kpdf"

" Don't know what this is for...
set grepprg=grep\ -nH\ $*
"
" ---------------------------------------------------------
"
" Functions
" Open URL in browser
function! Browser ()
   let line = getline (".")
   let line = matchstr (line, "http[^   ]*")
   exec "!konqueror ".line
endfunction

" Paste Toggle
let paste_mode = 0 " 0 = normal, 1 = paste

func! Paste_on_off()
   if g:paste_mode == 0
      set paste
      let g:paste_mode = 1
   else
      set nopaste
      let g:paste_mode = 0
   endif
   return
endfunc
"
" ---------------------------------------------------------
"
" Key Mappings
" map <Leader>w :call Browser ()<CR>                          " Open Url on this line with the browser \w
nnoremap <silent> <F10> :call Paste_on_off()<CR>
set pastetoggle=<F10>
nnoremap <silent> <F9> :%s/$//g<CR>:%s// /g<CR>             " for DOS apparently

:imap ;; <Esc>
noremap <silent> <C-l> <C-w>l
noremap <silent> <C-h> <C-w>h
noremap <silent> <C-k> <C-w>k
noremap <silent> <C-j> <C-w>j
noremap <silent> <C-t> :tabnew<CR>
noremap <silent> <Leader>k :tabprevious<CR>
noremap <silent> <Leader>j :tabnext<CR>

nnoremap <silent> <Leader>ev :tabnew<CR>:e ~/.vimrc<CR>
nnoremap <silent> <Leader>gv :tabnew<CR>:e ~/.gvimrc<CR>

" Up and down are more logical with g..
nnoremap <silent> k gk
nnoremap <silent> j gj
inoremap <silent> <Up> <Esc>gka
inoremap <silent> <Down> <Esc>gja

nnoremap <silent> <Home> i <Esc>r
nnoremap <silent> <End> a <Esc>r

nnoremap <silent> <Leader>o o<Esc>
nnoremap <silent> <Leader>O O<Esc>

nnoremap <space> za

map N Nzz
map n nzz

nnoremap ; :
nnoremap : ;

" Fix email paragraphs
nnoremap <Leader>par :%s/^>$//<CR>

" Shortcut to rapidly toggle set list
nnoremap <Leader>l :set list!<CR>

nnoremap <Leader>R :w<CR>:!ruby %<CR>
" nnoremap <Leader>w :update<CR>
" nnoremap <Leader>W :update<CR> :bd<CR>

" Testing
set completeopt=longest,menuone,preview

" Reload .vimrc
nnoremap <silent> <Leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
"
" ---------------------------------------------------------
"
" Plugins
" Enable NERDtree
autocmd vimenter * if !argc() | NERDTree | endif
nnoremap <C-n> :NERDTreeToggle<CR>
let NERDTreeChDirMode=0

" Set runtime path for ctrl-p
set runtimepath^=~/.vim/bundle/ctrlp.vim

nnoremap <Leader>g :GitGutterToggle<CR>
nnoremap <Leader>[ :TagbarToggle<CR>

let g:ctrlp_match_window = 'order:ttb,max:20'
let g:NERDSpaceDelims=1
let g:gitgutter_enabled = 1
autocmd FileType eRuby setlocal sw=2 sts=2 ts=2 expandtab

nnoremap <Leader>e :Tabularize /=<CR>
nnoremap <Leader>f :Tabularize /:\zs<CR>
