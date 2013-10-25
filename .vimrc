let mapleader=","
set autoread
set encoding=utf-8

set guifont=Menlo:h14
"{{{ Auto Commands

" Automatically cd into the directory that the file is in
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

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

" Theme Rotating
let themeindex=0
function! RotateColorTheme()
   let y = -1
   while y == -1
      let colorstring = "inkpot#ron#blue#elflord#evening#koehler#murphy#pablo#desert#torte#"
      let x = match( colorstring, "#", g:themeindex )
      let y = match( colorstring, "#", x + 1 )
      let g:themeindex = x + 1
      if y == -1
         let g:themeindex = 0
      else
         let themestring = strpart(colorstring, x + 1, y - x - 1)
         return ":colorscheme ".themestring
      endif
   endwhile
endfunction

"}}}


"Misc Settings
" ---------------------------------------------------------
" Necesary  for lots of cool vim things
set nocompatible

" This shows what you are typing as a command.
set showcmd
set showmode

" Folding
set foldmethod=manual

" Needed for Syntax Highlighting and stuff
filetype on
filetype plugin indent on
syntax enable
set grepprg=grep\ -nH\ $*

" Set all whitespace to default to 4 columns and use space instead of tab
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" Set tab size based on file type
" Only do this part when compiled with support for autocommands
if has("autocmd")
  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

  " Customisations based on house-style (arbitrary)
  autocmd FileType html setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab

  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss setfiletype xml

  " fdoc is yaml
  autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
  " md is markdown
  autocmd BufRead,BufNewFile *.md set filetype=markdown
endif

" Use english for spellchecking, but don't spellcheck by default
if version >= 700
   set spl=en spell
   set nospell
endif

" Real men use gcc
compiler gcc

" Don't store swapfile in the current dir
set directory-=.

" Cool tab completion stuff
set wildmenu
set wildmode=list:longest,full

" Enable mouse support in console
set mouse=a

" Got backspace?
set backspace=2

" Line Numbers
set number
set ruler

" Ignoring case
set ignorecase

" Incremental searching is sexy
set incsearch

" Highlight things that we find with the search
set hlsearch

" When I close a tab, remove the buffer
set nohidden

" Set off the other paren
highlight MatchParen ctermbg=4


" yank and paste with the system clipboard
set clipboard=unnamed

"Status line gnarliness
set laststatus=2
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]

" Show trailing whitespaces
set list
set listchars=tab:▸\ ,trail:▫
" ---------------------------------------------------------


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

let g:Tex_DefaultTargetFormat = "pdf"
let g:Tex_ViewRule_pdf = "kpdf"
" ---------------------------------------------------------


" Key Mappings

" Open Url on this line with the browser \w
map <Leader>w :call Browser ()<CR>

" Next Tab
noremap <silent> <C-k> <C-w>l

" Previous Tab
noremap <silent> <C-j> <C-w>h

" New Tab
noremap <silent> <C-t> :tabnew<CR>
noremap <silent> <Leader>k :tabprevious<CR>
noremap <silent> <Leader>j :tabnext<CR>

" Rotate Color Scheme <F8>
nnoremap <silent> <F8> :execute RotateColorTheme()<CR>

" DOS is for fools.
nnoremap <silent> <F9> :%s/$//g<CR>:%s// /g<CR>

" Paste Mode!  Dang! <F10>
nnoremap <silent> <F10> :call Paste_on_off()<CR>
set pastetoggle=<F10>

" Edit vimrc \ev
nnoremap <silent> <Leader>ev :tabnew<CR>:e ~/.vimrc<CR>

" Edit gvimrc \gv
nnoremap <silent> <Leader>gv :tabnew<CR>:e ~/.gvimrc<CR>

" Up and down are more logical with g..
nnoremap <silent> k gk
nnoremap <silent> j gj
inoremap <silent> <Up> <Esc>gka
inoremap <silent> <Down> <Esc>gja

" Good call Benjie (r for i)
nnoremap <silent> <Home> i <Esc>r
nnoremap <silent> <End> a <Esc>r

" Create Blank Newlines and stay in Normal mode
nnoremap <silent> <Leader>o o<Esc>
nnoremap <silent> <Leader>O O<Esc>

" Space will toggle folds!
nnoremap <space> za

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
map N Nzz
map n nzz

" Swap ; and :  Convenient.
nnoremap ; :
nnoremap : ;

" re-map jj to esc
inoremap jj <Esc>
nnoremap JJJJ <Nop>

" Fix email paragraphs
nnoremap <Leader>par :%s/^>$//<CR>

" Shortcut to rapidly toggle set list
nnoremap <Leader>l :set list!<CR>

nnoremap <Leader>R :w<CR>:!ruby %<CR>
" Testing
set completeopt=longest,menuone,preview

" Reload .vimrc
nnoremap <silent> <Leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
" ---------------------------------------------------------


" Plugins stuffs
" ---------------------------------------------------------
" Pathogen for Vim plugins
execute pathogen#infect()

" Enable NERDtree
autocmd vimenter * if !argc() | NERDTree | endif
nnoremap <C-n> :NERDTreeToggle<CR>

" Set runtime path for ctrl-p
set runtimepath^=~/.vim/bundle/ctrlp.vim

nnoremap <Leader>g :GitGutterToggle<CR>
nnoremap <Leader>[ :TagbarToggle<CR>

let g:ctrlp_match_window = 'order:ttb,max:20'
let g:NERDSpaceDelims=1
let g:gitgutter_enabled = 1


" Color and background are here so we can use color installed by pathogen
set background=light
colorscheme solarized
" ---------------------------------------------------------
