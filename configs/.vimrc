colo desert
syntax on

highlight LineNr ctermfg=grey

set rnu
set nu
set hlsearch
set scrolloff=10
set tabstop=4
set shiftwidth=4
set regexpengine=1
set textwidth=120

cnoreabbrev X w
" cnoreabbrev addsnips UltiSnipsAddFiletypes
" cnoreabbrev esnip UltiSnipsEdit

nnoremap <space> za
nnoremap <C-p> :set paste
nnoremap <Tab> >>
nnoremap <S-Tab> <<
nnoremap <CR> i<CR><Esc>

au BufNewFile,BufRead *.cls set filetype=tex
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
