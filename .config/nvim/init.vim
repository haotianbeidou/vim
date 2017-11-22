" 定义快捷键的前缀，即<Leader>
let mapleader=","

" 一些按键映射"
" ,q强制不保存退出
noremap <Leader>q :q!<CR>
" ,fs强制保存
noremap <leader>fs :w!<CR>
" ,fw强制保存后退出
noremap <Leader>fw :wq!<CR>
" jj退出编辑模式，回到正常模式
inoremap jj <esc>
" 快速切换 split 窗口
nnoremap <Leader>wj <C-W><C-J>
nnoremap <Leader>wk <C-W><C-K>
nnoremap <Leader>wl <C-W><C-L>
nnoremap <Leader>wh <C-W><C-H>
" 缓冲区标签操作
" 打开下一个缓冲区
nnoremap <leader>bj :bn<CR>
" 打开上一个缓冲区
nnoremap <leader>bk :bN<CR>
" 关闭当前缓冲区
nnoremap <leader>bc :bd<CR>
nnoremap <leader>t :terminal<CR>i
" 打开quickfix
noremap <leader>wo :copen<CR>
" 关闭quickfix
noremap <leader>wc :cclose<CR>

" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" vim 自身命令行模式智能补全
set wildmenu

" 禁止光标闪烁
set gcr=a:block-blinkon0
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T
" 总是显示状态栏
" set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
" set number
" 开启相对行号显示
set relativenumber
" 高亮显示当前行/列
set cursorline
" set cursorcolumn
" 高亮显示搜索结果
set hlsearch
" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4

" 基于缩进或语法进行代码折叠
set foldmethod=indent
" set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

" 设置默认文件编码
set fileencoding=utf-8



" dein设置
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/haotianbeidou/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/haotianbeidou/.cache/dein')
  call dein#begin('/Users/haotianbeidou/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/haotianbeidou/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
"  call dein#add('Shougo/neosnippet.vim')
"  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('vim-airline/vim-airline')
  call dein#add('scrooloose/nerdtree')
  call dein#add('w0rp/ale')
  call dein#add('Yggdroot/indentLine')
  call dein#add('skywind3000/asyncrun.vim')
  call dein#add('altercation/vim-colors-solarized')
"  call dein#add('Valloric/YouCompleteMe', {'merged': 0})
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('terryma/vim-multiple-cursors')
  call dein#add('mbbill/undotree')
  " You can specify revision/branch/tag.
  " call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
" 配色方案
set background=dark
colorscheme solarized



" vim-airline配置
let g:airline_powerline_fonts = 1
" 是否启用顶部tabline
let g:airline#extensions#tabline#enabled = 1
" 顶部tabline显示方式
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'




" NERDTree配置
" ,fl开启和关闭树
map <leader>fl :NERDTreeToggle<CR>
let NERDTreeChDirMode=1
" 显示书签
let NERDTreeShowBookmarks=1
" 设置忽略文件类型
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1


" ale配置
" 保持侧边栏可见
let g:ale_sign_column_always = 1
" 在错误信息之间跳转的快捷键
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)



" indentLine缩进指示线实现配置"
" 缩进指示线"
let g:indentLine_char='┆'
let g:indentLine_enabled = 1



" 一键运行python文件
nnoremap <F5> :call <SID>compile_and_run()<CR>

" AsynRun设置
augroup NVIM_ASYNCRUN
	autocmd!
	" 检测是否执行了AsyncRunStart,如果执行了则自动打开 quickfix window
	autocmd User AsyncRunStart call asyncrun#quickfix_toggle(15, 1)
augroup END

function! s:compile_and_run()
	exec 'w'
	if &filetype ==? 'c'
		exec 'AsyncRun! gcc % -o %<; time ./%<'
	elseif &filetype ==? 'cpp'
	   exec 'AsyncRun! g++ -std=c++11 % -o %<; time ./%<'
	elseif &filetype ==? 'java'
	   exec 'AsyncRun! javac %; time java %<'
	elseif &filetype ==? 'sh'
	   exec 'AsyncRun! time bash %'
	elseif &filetype ==? 'python'
	   exec 'AsyncRun! time python3 %'
	endif
endfunction



" " YCM 补全菜单配色
" " 菜单
" highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" " 选中项
" highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
" " 补全功能在注释中同样有效
" let g:ycm_complete_in_comments=1
" " 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
" let g:ycm_confirm_extra_conf=0
" " 开启 YCM 标签补全引擎
" let g:ycm_collect_identifiers_from_tags_files=1
" " 引入 C++ 标准库tags
" set tags+=/data/misc/software/misc./vim/stdcpp.tags
" " YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
" inoremap <leader>; <C-x><C-o>
" " 补全内容不以分割子窗口形式出现，只显示补全列表
" set completeopt-=preview
" " 从第一个键入字符就开始罗列匹配项
" let g:ycm_min_num_of_chars_for_completion=1
" " 禁止缓存匹配项，每次都重新生成匹配项
" let g:ycm_cache_omnifunc=0
" " 语法关键字补全			
" let g:ycm_seed_identifiers_with_syntax=1




" nerdcommenter配置"
" <leader>cc 添加注释
" <leader>c<space> 自动注释:添加注释或取消注释,有注释的取消注释
" <leader>ci 反注释:有注释的取消,没注释的添加注释 
" 注释的时候自动加个空格
let g:NERDSpaceDelims=1



" vim-multiple-cursors配置
" 关闭默认快捷键映射
let g:multi_cursor_use_default_mapping=0
" 默认快捷键
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'



" undotree配置
nnoremap <leader>u :UndotreeToggle<cr>
if has("persistent_undo")
    set undodir=~/.cache/.undodir/
    set undofile
endif
