function! ToggleSyntax()
   if exists("g:syntax_on")
      syntax off
   else
      syntax enable
   endif
endfunction

call plug#begin()
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'itchyny/lightline.vim'
call plug#end()


set nu
nmap <silent>  ;s  :call ToggleSyntax()<CR>




" Open nerdtree automatically
autocmd VimEnter * NERDTree

" quits nerdtree and file together.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" allow nerdtree to create/delete files. press m in nerdtree
set modifiable

nmap <F6> :NERDTreeToggle<CR>

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

