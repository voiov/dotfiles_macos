call plug#begin()
"Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'Shougo/denite.nvim'
"Plug 'rust-lang/rust.vim'
Plug 'airblade/vim-gitgutter'
 " Select multiple same items
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'ryanoasis/vim-devicons'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'cespare/vim-toml'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'Lokaltog/vim-easymotion'
Plug 'SirVer/ultisnips'
Plug 'Yggdroot/indentLine'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'editorconfig/editorconfig-vim'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
Plug 'liuchengxu/vista.vim'
Plug 'mhinz/vim-startify'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'lifepillar/vim-gruvbox8'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'rizzatti/dash.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
" Show error hints and highlights
Plug 'vim-syntastic/syntastic'
"Plug 'lervag/vimtex'
"Plug 'voldikss/vim-floaterm'
"debug tool
"Plug  'puremourning/vimspector'
call plug#end()            " required

let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_install_gadgets = [ 'CodeLLDB' ]

source $HOME/.local/config/vim/vimrc

"colorscheme gruvbox
"let g:airline_theme='gruvbox'
colorscheme nord
let g:airline_theme='nord'

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

let g:airline_powerline_fonts = 1
" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
"let g:vista#renderer#icons  = {
"\	 'global variable':"𝘎",
"\	 'struct field':"♋︎",
"\	 'struct':"𝒮",
"\	 'trait':"☣︎",
"\	 'type alias':"⎌",
"\	 'typeparameter':"☯︎",
"\    'augroup': "\ufb44",
"\    'class': "\uf0e8",
"\    'const': "𝐶",
"\    'constant': "𝐶",
"\    'default': "\uf29c",
"\    'enum': "❄︎",
"\    'enummember': "✢",
"\    'enumerator': "ℰ",
"\    'field': "⚦",
"\    'fields': "⚣",
"\    'func': "ℱ",
"\    'function': "ℱ",
"\    'functions':"ℱ",
"\    'implementation': "✏︎",
"\    'interface':"⎃" ,
"\    'macro': "♎︎",
"\    'macros': "♎︎",
"\    'maps': "⎂",
"\    'member': "\uf02b",
"\    'method': "☭",
"\    'module': "⏣",
"\    'modules': "🄼",
"\    'namespace': "\uf475",
"\    'package': "📦",
"\    'packages': "📦",
"\    'property': "\ufab6",
"\    'subroutine': "\uf9af",
"\    'target': "\uf893",
"\    'type': "🅃",
"\    'typedef': "🅃",
"\    'types': "🅃",
"\    'union': "\ufacd",
"\    'var': "♲",
"\    'variable':"♲",
"\    'variables':"♲",
"\}
"nmap <C-]> <Plug>(coc-definition)
"let g:go_def_mapping_enabled = 0

"EditorConfig 
let g:indentLine_char_list = ['┊', '┆', '¦', '|']
let g:indentLine_setColors = 1
let g:indentLine_leadingSpaceEnabled = 1
"let g:indentLine_leadingSpaceChar = '˽'
"let g:indentLine_leadingSpaceChar = '✂︎'

let g:syntastic_rust_checkers = ['cargo']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:EasyMotion_smartcase = 1
" <Leader>f{char} to move to {char}
nmap <Leader>f <Plug>(easymotion-overwin-f)
nmap <Leader>L <Plug>(easymotion-overwin-line)

"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)
let g:NERDTreeShowBookmarks = 1
"map <silent> <F1> :NERDTreeToggle<CR>
let g:vista_default_executive='coc'

let g:clap_theme = 'nord'
"let g:clap_theme = 'gruvbox'
"let g:clap_theme = 'solarized_dark'
"let g:clap_theme = 'material_design_dark'
let g:clap_provider_alias={'rg':'grep'}
let g:clap_layout = { 'relative': 'editor' }
"let g:clap_enable_background_shadow = v:false

nnoremap <silent> <C-p> :Clap<CR>
source $HOME/.local/config/vim/coc.vimrc

" MarkdownPreview Config
"=============================================================================="
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']
nmap <C-s> <Plug>MarkdownPreview
nmap <M-s> <Plug>MarkdownPreviewStop
"nmap <C-p> <Plug>MarkdownPreviewToggle

" Remaps
nmap <Leader>p :Rg<CR>
nmap <Leader>h :History<CR>
nmap <Leader>n :NERDTreeToggle<CR>
autocmd FileType markdown	noremap <buffer> <Leader>t :Vista toc<CR>
autocmd FileType rust,go,javascript,css,typescript noremap <buffer> <Leader>t :Vista!!<CR>
