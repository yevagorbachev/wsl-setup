colo desert
syntax on

highlight LineNr ctermfg=grey

set rnu
set nu
set scrolloff=15
set tabstop=4
set shiftwidth=4
set regexpengine=1
set textwidth=80

cnoreabbrev X w
cnoreabbrev addsnips UltiSnipsAddFiletypes
cnoreabbrev esnip UltiSnipsEdit

nnoremap <space> za
nnoremap <C-p> :set paste
nnoremap <Tab> >>
nnoremap <S-Tab> <<

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
let g:UltiSnipsEditSplit="vertical"

Plug 'jiangmiao/auto-pairs'
Plug 'lervag/vimtex'
let g:vimtex_compiler_enabled=0
call plug#end()
