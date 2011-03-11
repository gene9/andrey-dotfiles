
" mark 81st column with color
if version > 702
	set colorcolumn=81
endif

" Alt-N to switch between tabs
map <M-1> :tabn 1<CR>
map <M-2> :tabn 2<CR>
map <M-3> :tabn 3<CR>
map <M-4> :tabn 4<CR>
map <M-5> :tabn 5<CR>
map <M-6> :tabn 6<CR>

" enable nerd tree - C-F12
imap <C-F12> <esc>:NERDTreeToggle<CR><ins>
map <C-F12> :NERDTreeToggle<CR>

" Set omni menu colors
hi Pmenu guibg=#333333
hi PmenuSel guibg=#555555 guifg=#ffffff

" It's not vi
set nocompatible

" UTF stuff

if has("multi_byte")
    " avoid messing up the keyboard encoding
    if &termencoding == ""
        let &termencoding = &encoding
    endif

    " if "printencoding" is supported, avoid messing it up
    if exists("+printencoding") && (&printencoding == "")
        let &printencoding = &encoding
    endif

    " make sure that existing Unicode files will be recognised when possible
    set fileencodings-=ucs-bom
    set fileencodings-=utf-8
    if (&fileencodings == "") && (&encoding != "utf-8")
        let &fileencodings = &encoding
    endif
    set fileencodings^=ucs-bom,utf-8

    " the following is the switchover itself
    set encoding=utf-8

    " everything from here onwards in optional
    " The settings below are recommended;
    " you may change them or comment them out.

    " to have newly created files use UTF-8 encoding
    setglobal fileencoding=utf-8

    " to use a BOM with newly created Unicode files
    "setglobal bomb
endif

" end of UTF stuff

function! BlogColumnLength()
python << EOF
import vim
lines = "".join(vim.current.buffer)
print "%d chars, %d words" % (len(lines), len("".join(lines).split()))
EOF
endfunction

if has("multi_byte")
     set encoding=utf-8
     setglobal fileencoding=utf-8
     set bomb
     set termencoding=iso-8859-15
     set fileencodings=ucs-bom,utf-8,iso-8859-15 
else
     echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif 

" disable BOM     
set nobomb

" taglist
"map <C-T> :TlistToggle<CR>
"imap <C-T> <esc>:TlistToggle<CR><ins>
 
" Just a note - C-W-f - open file under cursor in new window
" and gf - open in current window

" S-INS - insert from clipboard
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" window resizing
map <C-kplus> :res +1<CR>
imap <C-kplus> <esc>:res +1<CR><ins>
map <C-kminus> :res -1<CR>
imap <C-kminus> <esc>:res -1<CR><ins>
 
"set viminfo='20,\"1000,%,n~/.viminfo

set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif 

"set statusline=%<%f%=\ [%1*%M%*%n%R%H]\ \ %-25(%3l,%c%03V\ \ %P\ (%L)%)%12o'%03b'
set statusline=%=%f\ \"%F\"\ %m%R\ [%4l(%3p%%):%3c-(0x%2B),%Y]

" expand tab
set noet

" do not expand tabs to spaces for makefiles
au FileType make set noet

" set linespace (allows to show more lines of code iwth the same font)
set lsp=0

" 4
set softtabstop=4
set shiftwidth=4
set tabstop=4

" allow free cursor placement
set virtualedit=all

set wildchar=<Tab>

" turn off error bells and whistles
set noeb

" turn on visual bell
set vb

" fix solaris backspace problem
set backspace=indent,eol,start

" switch between windows
imap <C-Tab> <ESC><C-w><C-w><INS>
map <C-Tab> <C-w><C-w>

" save on F2
imap <F2> <ESC>:w<CR><INS><RIGHT>
map <F2> :w<CR>

" turn off gui decoration
set guioptions=-M
set guioptions=-R
set guioptions=-L
set guioptions=-t

" syntex
syntax on

" no wrap
set nowrap

" Shortcut to select all text
imap <silent> <C-a> <C-o>gg<c-o>vG<end>

"flag problematic whitespace (trailing and spaces before tabs)
"Note you get the same by doing let c_space_errors=1 but
"this rule really applys to everything.
"highlight RedundantSpaces term=standout ctermbg=red guibg=red
"match RedundantSpaces /\s\+$\| \+\ze\t/

" set color of selected tab
hi TabLineSel	guifg=#ff0000	guibg=NONE	gui=NONE
"hi TabLineFill	guifg=#ff0000	guibg=NONE	gui=NONE

" EOF
            
