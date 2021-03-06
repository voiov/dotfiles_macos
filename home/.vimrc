call plug#begin()
Plug 'cespare/vim-toml'
Plug 'editorconfig/editorconfig-vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mattn/webapi-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'bling/vim-airline'
Plug 'buoto/gotests-vim'
Plug 'fatih/vim-go',{ 'tag': '*' ,'do':':GoUpdateBinaries'}
Plug 'majutsushi/tagbar'
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf', {'do':{ ->fzf#install()}} 
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'Yggdroot/indentLine'

Plug 'mbbill/undotree'
Plug 'mhinz/vim-startify'
Plug 'plasticboy/vim-markdown'
Plug 'rizzatti/dash.vim'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
"Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-gruvbox8'
Plug 'vim-syntastic/syntastic'
call plug#end()            " required

source $HOME/.local/config/vim/vimrc

"EasyMotion Config
let g:EasyMotion_smartcase = 1
" <Leader>f{char} to move to {char}
nmap <Leader>f <Plug>(easymotion-overwin-f)
nmap <Leader>L <Plug>(easymotion-overwin-line)

"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)

" general customizations
"colorscheme solarized
let g:gruvbox_italic=1
colorscheme gruvbox8
syntax on

"EditorConfig 
let g:indentLine_char_list = ['┊', '┆', '¦', '|']
let g:indentLine_setColors = 1
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '˽'

"set leaderF
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1

" make YCM compatible with UltiSnips (using supertab)
"let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<C-n>'
"let g:ycm_key_invoke_completion = '<C-z>'
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger="<C-E>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"


"syntastic set
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" vim go
" disable open browser after posting snippet
let g:go_play_open_browser = 0
" enable goimports
let g:go_fmt_command = "goimports"
" enable additional highlighting
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

" vim-airline
set laststatus=2
let g:bufferline_echo = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'dark'


let g:startify_session_before_save = [
			\ 'echo "Cleaning up before saving.."',
			\ 'silent! NERDTreeClose'
			\ ]

augroup zaki
	au!
	" show a list of interfaces which is implemented by the type under your cursor
	"au FileType go nmap <Leader>s <Plug>(go-implements)
	" show type info for the word under your cursor
	au FileType go nmap <Leader>gi <Plug>(go-info)
	" open the relevant Godoc for the word under the cursor
	au FileType go nmap <Leader>gd <Plug>(go-doc)
	au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
	" run Go commands
	au FileType go nmap <leader>r <Plug>(go-run)
	au FileType go nmap <leader>b <Plug>(go-build)
	au FileType go nmap <leader>t <Plug>(go-test)
	au FileType go nmap <leader>c <Plug>(go-coverage)
	au FileType go nmap <leader>i <Plug>(go-install)
	" open the definition/declaration in a new vertical, horizontal or tab for the
	" word under your cursor
	au FileType go nmap <Leader>ds <Plug>(go-def-split)
	au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
	au FileType go nmap <Leader>dt <Plug>(go-def-tab)
	" rename the identifier under the cursor to a new name
	au FileType go nmap <Leader>e <Plug>(go-rename)
	"rust tagbar
	let g:rust_use_custom_ctags_defs = 1  " if using rust.vim
	let g:tagbar_type_rust = {
				\ 'ctagsbin' : '/usr/local/bin/ctags',
				\ 'ctagstype' : 'rust',
				\ 'kinds' : [
				\ 'n:modules',
				\ 's:structures:1',
				\ 'i:interfaces',
				\ 'c:implementations',
				\ 'f:functions:1',
				\ 'g:enumerations:1',
				\ 't:type aliases:1:0',
				\ 'v:constants:1:0',
				\ 'M:macros:1',
				\ 'm:fields:1:0',
				\ 'e:enum variants:1:0',
				\ 'P:methods:1',
				\ ],
				\ 'sro': '::',
				\ 'kind2scope' : {
				\ 'n': 'module',
				\ 's': 'struct',
				\ 'i': 'interface',
				\ 'c': 'implementation',
				\ 'f': 'function',
				\ 'g': 'enum',
				\ 't': 'typedef',
				\ 'v': 'variable',
				\ 'M': 'macro',
				\ 'm': 'field',
				\ 'e': 'enumerator',
				\ 'P': 'method',
				\ },
				\ }
augroup end

map <F1> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
let g:fzf_preview_window = ''

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 ,'border':'sharp'} }

nnoremap <C-p> :<C-u>FZF<CR>
source $HOME/.local/config/vim/coc.vimrc
