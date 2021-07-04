set number
set tabstop=4

call plug#begin()
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
call plug#end()

nmap <F3> :NERDTreeToggle<CR>

nmap <C-n> :tabnew<CR>
nmap <C-o> :tabnew<CR><F3>
