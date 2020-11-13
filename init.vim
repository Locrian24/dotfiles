call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'pangloss/vim-javascript' " Javascript support
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'peitalin/vim-jsx-typescript'
Plug 'jparise/vim-graphql'
Plug 'styled-components/vim-styled-components'

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'vim-ctrlspace/vim-ctrlspace'

Plug 'airblade/vim-gitgutter'

Plug 'joshdick/onedark.vim'

Plug 'mhinz/vim-startify'
Plug 'tmsvg/pear-tree'

" POPE SHRINE
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

call plug#end()

" Theme settings
syntax on
set t_Co=256
set cursorline
set termguicolors
set hidden
set encoding=utf-8
colorscheme onedark

" Setters
set tabstop=2
set shiftwidth=2
set smartindent
set number relativenumber
let mapleader = "\<Space>"
let g:CtrlSpaceDefaultMappingKey = "<C-space> "

" Poggers
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>

" Windows
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" NERDTREE
nnoremap <leader>ft :NERDTree<CR>
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

" FUGITIVE
nmap <leader>gs :G<cr>
nmap <leader>gj :diffget //3<cr>
nmap <leader>gf :diffget //3<cr>

" GITGUTTER
set signcolumn=yes

nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)

let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-'

" COC
let g:coc_global_extensions = [
			\ 'coc-tsserver',
			\ ]

" inoremap <silent><expr> <Tab> coc#refresh()
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Forces
syntax sync fromstart

" Fix syntax highlighting
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

" TYPESCRIPT REACT THEMING
""""""""""""" Color Schemes """"""""""""""""

highlight Normal guibg=#21242a
highlight MatchParen guifg=#C678DD guibg=#504066
highlight LineNr    guifg=#151822
highlight CursorLineNr guifg=#56B6C2
highlight Error guifg=#f57373 guibg=#804040
highlight vimError guifg=#f57373 guibg=#804040

hi IndentGuidesEven guibg=#21242a guifg=#1f1f28
hi IndentGuidesOdd guibg=#262a36 guifg=#1f1f28
hi Comment cterm=italic guifg=#4a5158
hi String guifg=#98C379 guibg=#2a2e34

""" browns
" function params: numbers and constants
hi Statement guifg=#907161
hi Conditional guifg=#907161
hi Keyword guifg=#56B6C2
hi Function guifg=#56B6C2

" Yellows
hi Number guifg=#E5C07B
hi Special guifg=#E5C07B
hi Boolean guifg=#E5C07B

" purple
hi CtrlPMatch guifg=#ba9ef7
hi Visual guibg=#364652

" medium red: if else operators
hi Preproc guifg=#e86868
hi Type guifg=#e86868

"""""" vim-jsx ONLY
hi Identifier cterm=italic

" Blues
" light blues
hi xmlTagName guifg=#59ACE5
hi xmlTag guifg=#59ACE5

" dark blues
hi xmlEndTag guifg=#2974a1
hi jsxCloseString guifg=#2974a1
hi htmlTag guifg=#2974a1
hi htmlEndTag guifg=#2974a1
hi htmlTagName guifg=#59ACE5
hi jsxAttrib guifg=#1BD1C1

" cyan
hi Constant guifg=#56B6C2
hi typescriptBraces guifg=#56B6C2
hi typescriptEndColons guifg=#56B6C2
hi typescriptRef guifg=#56B6C2
hi typescriptPropietaryMethods guifg=#56B6C2
hi typescriptEventListenerMethods guifg=#56B6C2
hi typescriptFunction guifg=#56B6C2
hi typescriptVars guifg=#56B6C2
hi typescriptParen guifg=#56B6C2
hi typescriptDotNotation guifg=#56B6C2
hi typescriptBracket guifg=#56B6C2
hi typescriptBlock guifg=#56B6C2
hi typescriptJFunctions guifg=#56B6C2
hi typescriptSFunctions guifg=#56B6C2
hi typescriptInterpolationDelimiter guifg=#56B6C2
hi typescriptIdentifier guifg=#907161 cterm=italic

" javascript
hi jsParens guifg=#56B6C2
hi jsObjectBraces guifg=#C678DD
hi jsFuncBraces guifg=#56B6C2
hi jsObjectFuncName guifg=#D19A66
hi jsObjectKey guifg=#56B6C2

hi ReactState guifg=#C176A7
hi ReactProps guifg=#D19A66
hi ApolloGraphQL guifg=#CB886B
hi Events ctermfg=204 guifg=#56B6C2
hi ReduxKeywords ctermfg=204 guifg=#C678DD
hi ReduxHooksKeywords ctermfg=204 guifg=#C176A7
hi WebBrowser ctermfg=204 guifg=#56B6C2
hi ReactLifeCycleMethods ctermfg=204 guifg=#D19A66
