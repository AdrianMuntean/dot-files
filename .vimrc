" Before using the colors cheme you need to download it (https://github.com/sjl/badwolf/blob/master/colors/badwolf.vim) and place it under ~/.vim/colors/ 
colorscheme badwolf
syntax enable
set cursorline
set lazyredraw
set wrap
" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>
" Display different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" General
set number      " Show line numbers
set linebreak   " Break lines at word (requires Wrap lines)
set showbreak=+++       "Wrap-broken line prefix
set textwidth=100       " Line wrap (number of cols)
set showmatch   " Highlight matching brace
set visualbell  " Use visual bell (no beeping)

set hlsearch    " Highlight all search results
set smartcase   " Enable smart-case search
set ignorecase  " Always case-insensitive
set incsearch   " Searches for strings incrementally

set autoindent  " Auto-indent new lines
set shiftwidth=4        " Number of auto-indent spaces
set smartindent " Enable smart-indent
set smarttab    " Enable smart-tabs
set softtabstop=4       " Number of spaces per Tab

" Advanced
set ruler       " Show row and column ruler information

set undolevels=1000     " Number of undo levels
set backspace=indent,eol,start  " Backspace behaviour
set showtabline=2
