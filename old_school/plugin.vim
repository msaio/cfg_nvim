call plug#begin()

" Files explorer
Plug 'preservim/nerdtree'
Plug 'unkiwii/vim-nerdtree-sync'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'chengzeyi/fzf-preview.vim'

" Edit helpers
" - Commenter
Plug 'preservim/nerdcommenter'
" - Snippet
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'junegunn/vim-emoji' " alias + manually to convert
" Plug 'https://gitlab.com/gi1242/vim-emoji-ab.git' " real deal,...perhaps

"Themes
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'lilydjwg/colorizer'

"Ultilities
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-obsession'
Plug 'APZelos/blamer.nvim'
Plug 'Asheq/close-buffers.vim'


call plug#end()
