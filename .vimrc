call pathogen#infect()

set tabstop=2
set shiftwidth=2
set expandtab
set autochdir
set cursorcolumn
set cursorline
set number

filetype on
filetype plugin indent on
syntax enable

" Highlight search results
set hlsearch
" Show command at bottom
set showcmd
set visualbell
" Auto indent
" set cindent

au! BufWritePost .vimrc source %
au! BufWritePost .gvimrc source %

" map jk and kj to leaving insert mode
inoremap jk <ESC>
inoremap kj <ESC>

" undo highlighting when hitting escape
nnoremap <silent> <BS> :noh<return><esc>

" use system keyboard
set clipboard=unnamed

set backupdir=~/.vim/backup/
set directory=~/.vim/backup/

set colorcolumn=81,82,83
set textwidth=80

set guifont=ProggySquareTT\ 12
set guioptions=ace

" auto complete braces
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" expand some java imports
inoremap j.u import<Space>java.util.

" file associations
au BufNewFile,BufRead *.pde set filetype=c

set background=dark
colorscheme solarized

" Bda -  Delete all open buffers.

command! -nargs=0 -bang Bda :call BufDeleteAll('<bang>')

function! BufDeleteAll(bang)
    let last_buffer = bufnr('$')

    let n = 1
    while n <= last_buffer
        if a:bang == '' && getbufvar(n, '&modified')
            echohl ErrorMsg
            echomsg 'No write since last change for buffer'
                        \ n '(add ! to override)'
            echohl None
            return 0
        endif
        let n = n+1
    endwhile

    let delete_count = 0
    let n = 1
    while n <= last_buffer
        if buflisted(n)
            silent exe 'bdel' . a:bang . ' ' . n
            if ! buflisted(n)
                let delete_count = delete_count+1
            endif
        endif
        let n = n+1
    endwhile

    if delete_count == 1
        echomsg delete_count "buffer deleted"
    elseif delete_count > 1
        echomsg delete_count "buffers deleted"
    endif

endfunction

" ex command for toggling hex mode - define mapping if desired
command -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
function ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction
