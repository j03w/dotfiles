set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'

Plugin 'Yggdroot/indentLine'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'godlygeek/tabular'
Plugin 'jparise/vim-graphql'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kern/vim-es7'
Plugin 'kien/ctrlp.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'lokaltog/vim-easymotion'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'mxw/vim-jsx'
Plugin 'noahfrederick/vim-hemisu'
Plugin 'pangloss/vim-javascript'
Plugin 'rizzatti/dash.vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-vinegar'
Plugin 'vim-ruby/vim-ruby'

call vundle#end()

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

set splitbelow
set splitright

colorscheme default

let &colorcolumn=join(range(95,999),",")
highlight ColorColumn guibg=#efefef ctermbg=7

if version >= 700
   set spl=en spell
   set nospell
endif

set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
if has("autocmd")
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab

  autocmd BufNewFile,BufRead *.rss set filetype=xml
  autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufNewFile,BufRead *.json set ft=javascript

  " Remove any trailing whitespace that is in the file
  autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
endif

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

" Key Mappings
:imap ;; <Esc>
noremap <silent> <C-l> <C-w>l
noremap <silent> <C-h> <C-w>h
noremap <silent> <C-k> <C-w>k
noremap <silent> <C-j> <C-w>j
noremap <silent> <C-t> :tabnew<CR>
noremap <silent> <Leader>j :tabprevious<CR>
noremap <silent> <Leader>k :tabnext<CR>
noremap <silent> <Leader>l :nohls<CR><ESC>
nnoremap <silent> <Leader>ev :tabnew<CR>:e ~/.vimrc<CR>
nnoremap <silent> <Leader>gv :tabnew<CR>:e ~/.gvimrc<CR>
nnoremap <silent> <Leader>cc :copen<CR>

" Up and down are more logical with g..
nnoremap <silent> k gk
nnoremap <silent> j gj
inoremap <silent> <Up> <Esc>gka
inoremap <silent> <Down> <Esc>gja

nnoremap <silent> <Home> i <Esc>r
nnoremap <silent> <End> a <Esc>r

nnoremap <silent> <Leader>o o<Esc>
nnoremap <silent> <Leader>O O<Esc>


nnoremap <silent> <Leader>c :noh

nnoremap <space> za

map N Nzz
map n nzz

nnoremap ; :
nnoremap : ;

" http://vim.wikia.com/wiki/Moving_lines_up_or_down
nnoremap <D-J> :m .+1<CR>==
nnoremap <D-K> :m .-2<CR>==

nnoremap <Leader>W :update<CR> :bd<CR>

" Testing
set completeopt=longest,menuone,preview

" Reload .vimrc
nnoremap <silent> <Leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>


" Plugins

" Set runtime path for ctrl-p
set runtimepath^=~/.vim/bundle/ctrlp.vim
nnoremap <Leader>b :CtrlPBuffer<CR>

let g:ctrlp_match_window = 'order:ttb,max:20'
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$|\v[\/](node_modules|build|log|\.webpack|\.serverless)$',
      \ 'file': '\v\.(exe|so|dll|DS_Store)$'
      \ }

nnoremap <Leader>e :Tabularize /=<CR>
nnoremap <Leader>f :Tabularize /\|<CR>
nnoremap <Leader>: :Tabularize /\:<CR>

" let g:netrw_liststyle=3
let g:rspec_runner = 'os_x_iterm2'

" let g:rspec_command = 'be rspec {spec}'

nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>
nnoremap <Leader>a :call RunAllSpecs()<CR>

set guifont=Menlo:h12
set guitablabel=%t
set guioptions-=T
set guioptions-=m
set guioptions-=r
set guioptions-=l
set guioptions-=L
set guioptions+=c
set vb

colorscheme solarized
set background=light
