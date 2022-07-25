-- Sair com 'q' , se usar gravação de macros altere para <C-q> → Ctrl + q
vim.cmd([[ map q :q<CR> ]])

-- Para Salvar com 'Ctrl + S' nos modos: Normal, Inserção e Visual
-- Precisa adicionar a linha: stty -ixon , ao seu ~/.bashrc
vim.cmd([[ nnoremap <C-s> :w<CR> ]])
vim.cmd([[ inoremap <C-s> <Esc>:w<CR>l ]])
vim.cmd([[ vnoremap <C-s> <Esc>:w<CR> ]])

--Undo modification
vim.cmd([[ nnoremap <C-z> :undo<CR> ]])
vim.cmd([[ inoremap <C-z> <Esc>:undo<CR>l ]])
vim.cmd([[ vnoremap <C-z> <Esc>:undo<CR> ]])

-- Float terminal
vim.cmd([[ nnoremap <C-\><C-n> :FloatermToggle<CR> ]])
vim.cmd([[ inoremap <C-\><C-n> <Esc>:FloatermToggle<CR>l ]])
vim.cmd([[ vnoremap <C-\><C-n> <Esc>:FloatermToggle<CR> ]])

-- Selecionar tudo com 'Ctrl + A'
vim.cmd([[ map <C-a> ggVG ]])

-- BASH - Auto preenche arquivos .sh que não existirem com a SheBang
vim.cmd([[ autocmd BufNewFile *.sh :call append(0, '#!/usr/bin/env bash') ]])

-- NvimTree
vim.cmd([[ nnoremap <C-n> :NvimTreeToggle<CR> ]])
vim.cmd([[ inoremap <C-n> <Esc>:NvimTreeToggle<CR>l ]])
vim.cmd([[ vnoremap <C-n> <Esc>:NvimTreeToggle<CR> ]])

--vim.cmd([[]])
vim.cmd([[ let g:move_key_modifier = 'C' ]]) -- Use o 'C' porque o 'S' já é do Surround


-- Telescope keymaps
--
-- find text in files
vim.cmd([[ vnoremap <C-f> <Esc>:Telescope live_grep<CR> ]])
vim.cmd([[ inoremap <C-f> <Esc>:Telescope live_grep<CR>1 ]])
vim.cmd([[ nnoremap <C-f> :Telescope live_grep<CR> ]])

-- Find files
--
vim.cmd([[ vnoremap <C-p> <Esc>:Telescope find_files<CR> ]])
vim.cmd([[ inoremap <C-p> <Esc>:Telescope find_files<CR>1 ]])
vim.cmd([[ nnoremap <C-p> :Telescope find_files<CR> ]])
