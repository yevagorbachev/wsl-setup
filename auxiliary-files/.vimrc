colo desert
syntax on
set nu
highlight LineNr ctermfg=grey
set tabstop=4
set shiftwidth=4
set regexpengine=1

let g:tex_flavor = "latex"

call plug#begin('~/.vim/plugged')

cnoreabbrev X w
cnoreabbrev addsnips UltiSnipsAddFiletypes
cnoreabbrev esnip UltiSnipsEdit

nnoremap <space> za
nnoremap <C-p> :set paste
nnoremap <Tab> >>
nnoremap <S-Tab> <<

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
