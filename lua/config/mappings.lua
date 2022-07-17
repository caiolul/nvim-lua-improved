-- Sair com 'q' , se usar gravação de macros altere para <C-q> → Ctrl + q
vim.cmd([[ map q :q<CR> ]])

-- Para Salvar com 'Ctrl + S' nos modos: Normal, Inserção e Visual
-- Precisa adicionar a linha: stty -ixon , ao seu ~/.bashrc
vim.cmd([[ nnoremap <C-s> :w<CR> ]])
vim.cmd([[ inoremap <C-s> <Esc>:w<CR>l ]])
vim.cmd([[ vnoremap <C-s> <Esc>:w<CR> ]])

-- Selecionar tudo com 'Ctrl + A'
vim.cmd([[ map <C-a> ggVG ]])

-- BASH - Auto preenche arquivos .sh que não existirem com a SheBang
vim.cmd([[ autocmd BufNewFile *.sh :call append(0, '#!/usr/bin/env bash') ]])

-- NvimTree
vim.cmd([[ nnoremap <C-n> :NvimTreeOpen<CR> ]])
vim.cmd([[ inoremap <C-n> <Esc>:NvimTreeOpen<CR>l ]])
vim.cmd([[ vnoremap <C-n> <Esc>:NvimTreeOpen<CR> ]])

--vim.cmd([[]])
vim.cmd([[ let g:move_key_modifier = 'C' ]]) -- Use o 'C' porque o 'S' já é do Surround
