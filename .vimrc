set nocompatible

" do things right
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
"nnoremap j gj
"nnoremap k gk

" mouse
set mousemodel=popup 

nmap <PageUp> <C-S-U><C-S-U>
imap <PageUp> <C-O><C-S-U><C-O><C-S-U>
nmap <PageDown> <C-S-D><C-S-D>
imap <PageDown> <C-O><C-S-D><C-O><C-S-D>      

"Windows
colorscheme desert
"colorscheme inkpot
"colorscheme midnight2
"colorscheme bluegreen
"colorscheme dusk
"colorscheme oceandeep
"colorscheme camo

" Unix
"colorscheme desert
"colorscheme edo_sea
"colorscheme blackdust
"colorscheme neon

"colorscheme z

" Keep cursor column
set nostartofline 

" Match "word" case-insensitive and "Word" case-sensitive
set smartcase

" Reload gvimrc
map <C-F10> :source ~/.gvimrc<CR>
 
" Vertical blocks using mouse
noremap <M-LeftMouse> <LeftMouse><Esc><C-V>
noremap <M-LeftDrag> <LeftDrag>
 
" Remap TAB to keyword completion 
function! InsertTabWrapper(direction) 
    let col = col('.') - 1 
    if !col || getline('.')[col - 1] !~ '\k' 
        return "\<tab>" 
    elseif "backward" == a:direction 
        return "\<c-p>" 
    elseif "forward" == a:direction 
        return "\<c-n>" 
    else 
        return "\<c-x>\<c-k>" 
    endif 
endfunction 

"inoremap <tab> <c-r>=InsertTabWrapper ("forward")<cr> 
"inoremap <s-tab> <c-r>=InsertTabWrapper ("backward")<cr> 
"inoremap <c-tab> <c-r>=InsertTabWrapper ("startkey")<cr> 


" toggle tab completion 
function! ToggleTabCompletion() 
    if mapcheck("\<tab>", "i") != "" 
        :iunmap <tab> 
        :iunmap <s-tab> 
        :iunmap <c-tab> 
        echo "tab completion off" 
    else 
        :imap <tab> <c-n> 
        :imap <s-tab> <c-p> 
        :imap <c-tab> <c-x><c-l> 
        echo "tab completion on" 
    endif 
endfunction 

map <Leader>tc :call ToggleTabCompletion()<cr> 

" tell complete to look in the dictionary 
set complete-=k complete+=k 

" load the dictionary according to syntax 
:au BufReadPost * if exists("b:current_syntax") 
:au BufReadPost *   let &dictionary = substitute("C:\\vim\\vimfiles\\dict\\FT.dict", "FT", b:current_syntax, "") 
:au BufReadPost * endif

au FileType haskell,vhdl,ada            let b:comment_leader = '-- ' 
au FileType vim                         let b:comment_leader = '" ' 
au FileType c,cpp,java                  let b:comment_leader = '// ' 
au FileType sh,make                     let b:comment_leader = '# ' 
au FileType tex                         let b:comment_leader = '% ' 
noremap <silent> ,c :<C-B>sil <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:noh<CR> 
noremap <silent> ,u :<C-B>sil <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:noh<CR>

set guicursor=n:block-blinkon0-Cursor,v:block-blinkon0-VisualCursor,c-i-ci:ver25-blinkon0-Cursor,r-cr:hor16-blinkon0-Cursor

"let g:uname = system("uname")
"if v:shell_error
"    let g:uname = 'unknown system'
"else
"   if g:uname =~ "SunOS"
"       echo g:uname
"   else
"       echo "Other: " . g:uname
"   endif
"endif

set laststatus=2


if has("gui_gtk2")
"    set guifont=Console\ 10
"    set guifont=Fixed\ 10
    set guifont=Lucida\ Console\ Semi-Condensed\ 9
"    set guifont=LucidaTypewriter\ 9
else
    set guifont=Lucida\_Console:h10:cRUSSIAN
"    set guifont=ter-c12n:h10
endif

if has('gui_running')
"   if g:uname =~ "SunOS"
"       set lines=55
"       set columns=95
"   else
        set lines=65
        set columns=81
"   endif
else
    set lines=60
    set columns=80
endif


"flag problematic whitespace (trailing and spaces before tabs)
"Note you get the same by doing let c_space_errors=1 but
"this rule really applys to everything.

"highlight RedundantSpaces term=standout ctermbg=red guibg=red
"match RedundantSpaces /\s\+$\| \+\ze\t/

"map <PageUp> <C-U>
"map <PageDown> <C-D>
"imap <PageUp> <C-U>
"imap <PageDown> <C-D>

" EOF

