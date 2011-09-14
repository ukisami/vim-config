" General {
    filetype plugin indent on " load filetype plugins/indent settings
    "set autochdir " always switch to the current file directory
    set backspace=indent,eol,start " make backspace a more flexible
    set directory=~/.vim/tmp " directory to place swap files in
    set fileformats=mac,unix,dos " support all three, in this order
    set iskeyword+=_,$,@,%,# " none of these are word dividers
    set mouse=a " use mouse everywhere
    set noerrorbells " don't make noise
    set novisualbell  " No blinking .
    set whichwrap=b,s,<,>,~,[,] " everything wraps

    set wildmenu " turn on command line completion wild style
    " ignore these list file extensions
    set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,
                    \*.jpg,*.gif,*.png
    set wildmode=list:longest " turn on wild mode huge list


    set history=50 " keep 50 lines of command line history
    set ruler " show the cursor position all the time
    set showcmd " display incomplete commands
    set incsearch " do incremental searching

    if &t_Co > 2 || has("gui_running")
        syntax on
        set hlsearch
    endif

    " Show tabs and trailing characters
    set list

    set lcs=tab:\ \ ,eol:$,trail:~,extends:>,precedes:<

    " CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
    " so that you can undo CTRL-U after inserting a line break.
    inoremap <C-U> <C-G>u<C-U>
" }

" Autocommands {
    " General {

        " Put these in an autocmd group, so that we can delete them easily.
        augroup vimGen
            au!

            " For all text files set 'textwidth' to 78 characters.
            au FileType text setlocal textwidth=78

            au BufReadPost *
                \ if line("'\"") > 1 && line("'\"") <= line("$") |
                \   exe "normal! g`\"" |
                \ endif
        augroup END
    " }

    " Ruby {
        " ruby standard 2 spaces, always
        au BufRead,BufNewFile *.rb,*.rhtml,*.erb set shiftwidth=2
        au BufRead,BufNewFile *.rb,*.rhtml,*.erb set softtabstop=2
    " }

    " C {
        au BufRead,BufNewFile *.c,*.h set cinoptions=:0,p0,t0
        au BufRead,BufNewFile *.c,*.h set cinwords=if,else,while,do,for,switch,case
        au BufRead,BufNewFile *.c,*.h set cindent
    " }
" }

" GUI Settings {
    if has("gui_running")
        " Basics {
            set columns=100 " perfect size for me
            set guifont=Consolas:h10 " My favorite font
            set guioptions=ce
            set lines=55 " perfect size for me
            set mousehide " hide the mouse cursor when typing
        " }
    endif
" }

" Plugin Settings {
    " Minibuffer Explorer {
        let g:miniBufExplMapWindowNavVim = 1
        let g:miniBufExplMapWindowNavArrows = 1
        let g:miniBufExplMapCTabSwitchBufs = 1
        let g:miniBufExplModSelTarget = 1
        let g:miniBufExplSplitBelow=1
    " }

    " Rails.vim {
        " Add recently accessed projects menu (project plugin)
        set viminfo^=!

        " alt+n or alt+p to navigate between entries in QuickFix
        map <silent> <m-p> :cp <cr>
        map <silent> <m-n> :cn <cr>

        " Change which file opens after executing :Rails command
        let g:rails_default_file='config/database.yml'
    " }
" }


" Custom {
    set laststatus=2  " Always show status line.
    set nocompatible " explicitly get out of vi-compatible mode
    set noexrc " don't use local version of .(g)vimrc, .exrc
    " set background=dark " we plan to use a dark background
    colorscheme busybee
    set nu " show line numbers
    set smartindent
    set expandtab
    set tabstop=4
    set shiftwidth=4
    set showcmd
    set showmatch
" }

" Commands {

    " Convenient command to see the difference between the current buffer and the
    " file it was loaded from, thus the changes you made.
    " Only define it when not defined already.
    if !exists(":DiffOrig")
      command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
              \ | wincmd p | diffthis
    endif
" }

