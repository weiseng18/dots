local git_files = require("telescope.builtin").git_files
local keymap = vim.api.nvim_set_keymap

--- Is cwd in git repo
local is_git_repo = function()
  local cmd = "git rev-parse --is-inside-work-tree"
  local git_check = vim.fn.systemlist(cmd)[1]
  return git_check == "true"
end

-- Find file in repo
local find_in_repo = function()
  if not is_git_repo() then
    return
  end
  git_files({
    cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1],
    prompt_title = "Search in repo",
    search = "",
  })
end

-- mode, command, function
keymap("n", "<Space>fr", "", { noremap = true, callback = find_in_repo })

-- telescope
--nnoremap <leader>ff <cmd>Telescope find_files<cr>
--nnoremap <leader>fg <cmd>Telescope live_grep<cr>
