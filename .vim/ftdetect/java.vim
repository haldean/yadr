
" Google style has width 100 normally and 80 for comments.
function! GetGoogleJavaTextWidth()
    if !exists('g:java_normal_text_width')
        let normal_text_width = 100
    else
        let normal_text_width = g:java_normal_text_width
    endif

    if !exists('g:java_comment_text_width')
        let comment_text_width = 79
    else
        let comment_text_width = g:java_comment_text_width
    endif


    " TODO(pwilson): base this on the first non-blank character of the line, not
    " the cursor position.
    let cur_syntax = synIDattr(synIDtrans(synID(line("."), col("."), 0)), "name")
    if cur_syntax == "Comment"
        return comment_text_width
    endif
    return normal_text_width
endfunction

augroup google_java_textwidth
    au!
    autocmd InsertEnter,CursorMoved *.java :let &l:textwidth=GetGoogleJavaTextWidth()
augroup END

