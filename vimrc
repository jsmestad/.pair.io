call pathogen#infect('~/.dotfiles/vimfiles/bundle')
syntax on
filetype plugin indent on

" Force 256 Color support
set t_Co=256

set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab

set number

color jellybeans+

" Add Rails, Fugitive, and RVM info to statusline
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%{rbenv#statusline()}%=%-14.(%l,%c%V%)\ %P

" map to bufexplorer
nnoremap <C-B> :BufExplorer<cr>
let g:bufExplorerShowRelativePath=1

" Disable Syntastic for SASS/SCSS
let g:syntastic_disabled_filetypes = ['sass', 'scss']

" Disable persisting yankring
let g:yankring_persist=0

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
  let NERDTreeDirArrows = 0
  let NERDChristmasTree = 1
  let NERDTreeHighlightCursorline = 1
  let NERDTreeShowBookmarks = 1
  let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '\.rbc$', '\.class$', '\.o', '\~$']
  let NERDTreeChDirMode = 2
  nmap <F2> :NERDTreeToggle<CR>
  map nt :NERDTreeToggle<CR>
" }}}

" NERDCommenter
let NERDSpaceDelims = 1
let NERDRemoveAltComs = 0

" Syntastic
let g:syntastic_enable_signs = 1
let g:syntastic_quiet_warnings = 0
let g:syntastic_auto_loc_list = 2

" Gist
let g:gist_clip_command = 'pbcopy'

" I dont want backups.
set nobackup
set nowritebackup
set noswapfile
set backupdir=$TEMP,$TMP,.

" automatically remove trailing whitespace before write
function! StripTrailingWhitespace()
  normal mZ
  %s/\s\+$//e
  if line("'Z") != line(".")
    echo "Stripped whitespace\n"
  endif
  normal `Z
endfunction
autocmd BufWritePre *.bldr,*.md,*.coffee,*.rake,*.js,*.rb,*.css,*.sass,*.scss,*.haml,*.erb,*.cpp,*.hpp,*.i :call StripTrailingWhitespace()

set suffixesadd=.rb
set path+=lib/**,test/**

if has("ruby") " assume system has ruby
  " Add stdlib of environment's ruby to path
  let stdlib = system('ruby -rrbconfig -e"print RbConfig::CONFIG[\"rubylibdir\"]"')
  let &l:path = &path . "," . stdlib
endif

autocmd User Rails Rnavcommand fabricator spec/fabricators -suffix=_fabricator.rb -default=model()

au BufRead,BufNewFile *.bldr set filetype=ruby

" Spell check some filetypes
autocmd FileType html,tex,pandoc,markdown setlocal spelllang=en_us spell

" Open NERDTree if no file specified
autocmd vimenter * if !argc() | NERDTree | endif

" hint to keep lines short                                                      
if exists('+colorcolumn')                                                       
  set colorcolumn=80                                                            
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif 
