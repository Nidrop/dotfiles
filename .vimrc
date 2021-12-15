"""""""""""
" General
"""""""""""
"load defaults.vim located at /usr/share/vim/ (for Vim 8.0 in Arch)
"included: nocompatible,[ruler,showcmd,wildmenu],incsearch,mouse,indent,syntax
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

"filetype plugin indent on "Включает определение типа файла, загрузку соответствующих ему плагинов и файлов отступов
"set encoding=utf-8 "Ставит кодировку UTF-8
"set guifont=имя_вашего_шрифта_в_системе:h16
"set nocompatible "Отключает обратную совместимость с Vi
"syntax on "Включает подсветку синтаксиса

"set guioptions=0 "Отключаем панели прокрутки в GUI
"set showtabline=0 "Отключаем панель табов (окошки FTW)

"number показывает справа номера строк
"relativenumber - нумерацию строк относительно положения курсора
set number relativenumber "А это гибридный вариант

"wrap заставляет переносить строчки без их разделения
"nowrap рендерит строчки за границами экрана
set wrap linebreak nolist "Данная вариация работает как wrap но переносит строчки не посимвольно, а по словам

set cursorline "А так мы можем подсвечивать строку с курсором
set cursorcolumn

set hlsearch	" Highlight all search results
"set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally

set mouse=a			"для переключения между окнами пользоваться мышкой
"Если вы используете обычный терминальный Вим, а не NeoVim, то для изменения курсора в разных режимах используйте это:
"set ttimeoutlen=10 "Понижаем задержку ввода escape последовательностей
let &t_SI = "\<Esc>[6 q" "SI = режим вставки
let &t_SR = "\<Esc>[4 q" "SR = режим замены
let &t_EI = "\<Esc>[2 q" "EI = нормальный режим
"1 - это мигающий прямоугольник
"2 - обычный прямоугольник
"3 - мигающее подчёркивание
"4 - просто подчёркивание
"5 - мигающая вертикальная черта
"6 - просто вертикальная черта

"let &t_ut='' 	"fixing scrolling color background for kitty terminal

"""""""""""
" vim-plug
"""""""""""

if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

"todo: async, git, ctags(global[,cscope]), tagbar(taglist) ,rus-keymap, tasklist, [ale], vim-vsnip(vim-vsnip-integ), vim-sneak
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'		"Project and file navigation
"Plug 'majutsushi/tagbar'		"Class/module browser
"Plug 'fisadev/FixedTaskList.vim'	"Pending tasks list
"Plug 'itchyny/vim-cursorword', {'for': 'python'}
"Plug 'fmoralesc/vim-pad', {'on': 'Pad'}
Plug 'itchyny/lightline.vim'		"status line
Plug 'sheerun/vim-polyglot'		"many languages highlight
Plug 'prabirshrestha/vim-lsp'		"client to lsp autocomplete servers
Plug 'mattn/vim-lsp-settings'		"easy settings lsp servers
Plug 'prabirshrestha/asyncomplete.vim'	"alternative to standard omnicompletion (required by vim-lsp-settings, pure vim-lsp can use omnicomplete)
Plug 'prabirshrestha/asyncomplete-lsp.vim'	"connect asyncomplete with lsp
"Plug 'puremourning/vimspector'		"debug

"Plug 'vim-syntastic/syntastic'		"syntax checker, linting
"Plug 'dart-lang/dart-vim-plugin'	"dart highlight
"Plug 'natebosch/vim-lsc'		"autocomplete server
"Plug 'natebosch/vim-lsc-dart'		"config server to dart
"Plug 'thosakwe/vim-flutter'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}	"plugin for various languages autocomplete servers

"Color themes
Plug 'tomasr/molokai'
"Plug 'morhetz/gruvbox'
"Plug 'sonph/onehalf', { 'rtp': 'vim' }
"Plug 'dracula/vim', { 'as': 'dracula' }
"Plug 'chriskempson/base16-vim'
"Plug 'gosukiwi/vim-atom-dark'
"Plug 'sjl/badwolf'
"Plug 'nanotech/jellybeans.vim'
"Plug 'jacoborus/tender.vim'
"Plug 'drewtempelmeyer/palenight.vim'
"Plug 'ayu-theme/ayu-vim'
"Plug 'mhartington/oceanic-next'
"Plug 'rakr/vim-one'
"Plug 'kyoz/purify', { 'rtp': 'vim' }
"Plug 'freeo/vim-kalisi'
call plug#end()

"Theme
colorscheme molokai

" lightline
set laststatus=2
set noshowmode
let g:lightline = { 'colorscheme': 'molokai' }

" nerdtree
"autocmd vimenter * NERDTree	"автозапуск
map <C-t> :NERDTreeToggle<CR>

" syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_go_checkers=['golint']

" vim-lsp-settings
"let g:lsp_settings_servers_dir = "~/.vim/vim-lsp-settings/servers"
"let g:lsp_settings_servers_dir = "~/data_HDD/vim-lsp-settings/servers"
let g:lsp_settings = {
    \ 'analysis-server-dart-snapshot': {
    \     'cmd': [
    \         'dart',
    \         '~/flutter/bin/cache/dart-sdk/bin/snapshots/analysis_server.dart.snapshot',
    \         '--lsp'
    \     ],
    \ },
\ }
"let g:lsp_log_verbose = 1
"let g:lsp_log_file = expand('~/vim-lsp.log')

"let g:asyncomplete_auto_popup = 1

" vim-lsc
"let g:lsc_server_commands = {'dart': 'dart_language_server'}
"let g:lsc_auto_map = v:true
"let g:lsc_dart_sdk_path = '~/flutter/bin/cache/dart-sdk'

" coc
"dart
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)

" vim-flutter
"nnoremap <leader>fa :FlutterRun<cr>
"nnoremap <leader>fq :FlutterQuit<cr>
"nnoremap <leader>fr :FlutterHotReload<cr>
"nnoremap <leader>fR :FlutterHotRestart<cr>
"nnoremap <leader>fD :FlutterVisualDebug<cr>
