colo desert
syntax on

set nocompatible
filetype on
filetype plugin on
filetype indent on

highlight LineNr ctermfg=grey

set nu rnu " set line and relative line numbers
set hlsearch " highlight search
set incsearch " highlight next result while searching
set laststatus=2 " always display statusline
set scrolloff=10 " leave 10 lines up and down
set tabstop=4
set shiftwidth=4
set textwidth=80

cnoreabbrev X x
cnoreabbrev Q q

nnoremap <space> za
nnoremap <Tab> >>
nnoremap <S-Tab> <<
nnoremap <CR> i<CR><Esc>

au BufNewFile,BufRead *.sty set filetype=tex

call plug#begin('~/.vim/plugged')
let g:tex_flavor = "latex"

Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetsDir="/home/yeva/.vim/UltiSnips"
let g:UltiSnipsSpippetDirectories=["/home/yeva/.vim/UltiSnips"]
let g:UltiSnipsEditSplit="horizontal"

Plug 'jiangmiao/auto-pairs'
Plug 'lervag/vimtex'
Plug 'tpope/vim-surround'
let g:vimtex_compiler_enabled=0
call plug#end()
