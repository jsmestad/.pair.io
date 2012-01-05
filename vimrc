call pathogen#infect()
syntax on
filetype plugin indent on

color jellybeans+

" Add Rails, Fugitive, and RVM info to statusline
set statusline=%<%f\ %h%m%r%{rails#statusline()}%{fugitive#statusline()}%{rbenv#statusline()}%=%-14.(%l,%c%V%)\ %P

" map to bufexplorer
nnoremap <C-B> :BufExplorer<cr>
let g:bufExplorerShowRelativePath=1

" Set Font
set guifont=PanicSans:h15

" Set map leader
let mapleader = ","

" Create directional shortcuts for moving among between splits
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l
nmap <C-h> <C-W>h

if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
end

" Remap jj or jk or to be the same as Esc to leave Insert mode.
imap ii <Esc>

" NERDTree {{{
  let NERDChristmasTree = 1
  let NERDTreeHighlightCursorline = 1
  let NERDTreeShowBookmarks = 1
  let NERDTreeIgnore = ['.vim$', '\~$', '.svn$', '\.git$', '.DS_Store']
  nmap <F2> :NERDTreeToggle<CR>
  map nt :NERDTreeToggle<CR>
" }}}

" I dont want backups.
set nobackup
set noswapfile

" automatically remove trailing whitespace before write
function! StripTrailingWhitespace()
  normal mZ
  %s/\s\+$//e
  if line("'Z") != line(".")
    echo "Stripped whitespace\n"
  endif
  normal `Z
endfunction
autocmd BufWritePre *.md,*.coffee,*.rake,*.js,*.rb,*.css,*.sass,*.scss,*.haml,*.erb,*.cpp,*.hpp,*.i :call StripTrailingWhitespace()

