# Neovim Configuration

![image](/imgs/showcase.png)

This repository contains my personal Neovim configuration, tailored for both macOS and Linux. It’s fairly comprehensive, so feel free to extract only the parts that suit your workflow. A good Neovim setup evolves over time, and I don’t recommend cloning this repository as-is unless you know what you’re doing... **you’ve been warned.**

## 🧩 Plugins

Below is a list of plugins included in this configuration, along with their purposes:

> *(Coming soon — documentation in progress)*

## ⌨️ Keymaps

Below are the keymaps I’ve grown comfortable using. All mappings use the `<leader>` key unless otherwise noted.

### 🪟 Window Management

<div align="center">

| Keymap        | Description               | Command           |
| :------------ | :------------------------ | :---------------- |
| `<C-h>`       | Move to left window       | `<C-w>h`          |
| `<C-j>`       | Move to below window      | `<C-w>j`          |
| `<C-k>`       | Move to above window      | `<C-w>k`          |
| `<C-l>`       | Move to right window      | `<C-w>l`          |
| `<leader>sv`  | Split window vertically   | `<cmd>vsplit<CR>` |
| `<leader>sh`  | Split window horizontally | `<cmd>split<CR>`  |
| `<leader>sx`  | Close current split       | `<cmd>close<CR>`  |
| `<leader>so`  | Close all other splits    | `<cmd>only<CR>`   |

</div>

### 🧠 Git Integration

<div align="center">

| Keymap | Description | Command |
| :------ | :----------- | :-------- |
| `<leader>gs` | Git status | `<cmd>Git<CR>` |
| `<leader>gw` | Stage current file | `<cmd>Gwrite<CR>` |
| `<leader>gc` | Commit changes | `<cmd>Git commit<CR>` |
| `<leader>gpl` | Pull latest changes | `<cmd>Git pull<CR>` |
| `<leader>gpu` | Push changes (in split terminal) | `<cmd>15split \| term git push<CR>` |
| `<leader>gb` | Blame selected line | `<cmd>Git blame<CR>` |
| `<leader>gf` | Prune stale branches | *Custom / Special* |
| `<leader>gbn` | Create new branch | `<cmd>Git fetch<CR>` |
| `<leader>gbd` | Delete branch | `<cmd>Git branch -D<CR>` |

</div>

### 🔭 Telescope

<div align="center">

| Keymap | Description | Command |
| :------ | :----------- | :-------- |
| `<leader>ff` | Find files | `<cmd>Telescope find_files<CR>` |
| `<leader>fg` | Live grep | `<cmd>Telescope live_grep<CR>` |
| `<leader>fb` | Find buffers | `<cmd>Telescope buffers<CR>` |
| `<leader>fh` | Help tags | `<cmd>Telescope help_tags<CR>` |

</div>
