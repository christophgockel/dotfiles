set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Bundle 'thoughtbot/vim-rspec'
"Bundle 'tpope/vim-dispatch'
Bundle 'jgdavey/tslime.vim'
call vundle#end()

set runtimepath^=~/.vim/bundle/ctrlp.vim

set number
set history=1000
set noswapfile

filetype plugin on
filetype indent on

set autoread

set ruler
set so=7
set cmdheight=2

set hid

"proper backspace
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase
set smartcase

set lazyredraw
set magic

set showmatch
set mat=2

"no sounds. at all.
set noerrorbells
set novisualbell
set t_vb=
set tm=500

syntax enable
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-default "desert
set background=dark

set encoding=utf8

set expandtab
set smarttab
set ai "auto indent
set si "smart indent
set wrap "wrap lines
set tabstop=2
set shiftwidth=2


"on german keyboards "\" as a leader is painful
let mapleader = ","
let g:mapleader = ","


" convenience
nmap <leader>w :w!<cr>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab
autocmd FileType ruby set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType php set tabstop=4|set shiftwidth=4|set expandtab

" tab navigation like firefox
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

" easier movement between splits
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

"tab mappings
map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt
map <D-6> 6gt
map <D-7> 7gt
map <D-8> 8gt
map <D-9> 9gt
map <D-t> :tabnew<CR>
map <D-w> :tabclose<CR>

execute pathogen#infect()

" navigate from line to line even when the line exceeds the split's width
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>

nnoremap <leader>t :w<CR>:!clear;rspec -c -f d *_spec.rb<CR>
" RSpec.vim mappings
"map <Leader>t :call RunCurrentSpecFile()<CR>
"map <Leader>s :call RunNearestSpec()<CR>
"map <Leader>l :call RunLastSpec()<CR>
"map <Leader>a :call RunAllSpecs()<CR>
""let g:rspec_command = "Dispatch rspec -c -f d {spec}"
""let g:rspec_command = "!clear;rspec -c -f d {spec}"
""let g:rspec_command = 'call Send_to_Tmux("clear; rspec -c -f d {spec}\n")'
"let g:rspec_command = 'call Send_to_iTerm("clear; rspec -c -f d {spec}\n")'
"let g:rspec_runner = "os_x_iterm"


function! ExecuteTestInPipe(file)
  let l:command = ':silent :!echo "clear; rspec --color --format documentation '.a:file.'" > test-commands'
  exec l:command

  call SetLastSpecCommand(l:command)

  exec ':redraw!'
endfunction

function! ExecuteAllTestsInPipe()
  exec ':w'
  exec ':silent :!echo "clear; rspec --color %" > test-commands'
  exec ':redraw!'
endfunction
map <leader>r :call ExecuteAllTestsInPipe()<cr>

function! ExecuteCurrentSpecFile()
 silent !clear
 let l:file = expand('%')
 exec ':w'
  if match(l:file,"spec") >= 0
   call ExecuteTestInPipe(l:file)
  else
    let l:alternative = GetAlternativeFile(l:file)
    call ExecuteTestInPipe(l:alternative)
  endif
endfunction

function! ExecuteAllTestsInPipe()
  exec ':w'
  call ExecuteTestInPipe("spec")
endfunction

function! ExecuteSingleLineInCurrentSpecFile()
  silent !clear
  exec ':w'
  let file = expand('%')
  let line = line('.')
  call ExecuteTestInPipe(file.":".line)
endfunction


function! SetLastSpecCommand(spec)
  let s:last_spec_command = a:spec
endfunction

function! RunLastSpec()
  if exists("s:last_spec_command")
    call RunSpecs(s:last_spec_command)
  endif
endfunction

map <leader>A :call OpenAlternativeFile()<cr>
map <leader>r :call ExecuteAllTestsInPipe()<cr>
map <leader>t :call ExecuteCurrentSpecFile()<cr>
map <leader>s :call ExecuteSingleLineInCurrentSpecFile()<cr>

function! GetAlternativeFile(input)
  if match(a:input,"spec") >= 0
    let l:alternative_file = substitute(a:input, "_spec.rb", ".rb", "")
    return substitute(l:alternative_file , "spec", "lib", "")
  else
    let l:alternative_file = substitute(a:input, ".rb", "_spec.rb", "")
    return substitute(l:alternative_file, "lib", "spec", "")
  endif
endfunction

function! OpenAlternativeFile()
   silent !clear
   let l:current_file = expand('%')
   let l:alternative_file = GetAlternativeFile(l:current_file)
   exec ':w'
   exec ':vsp '.l:alternative_file
   exec ':redraw!'
endfunction
