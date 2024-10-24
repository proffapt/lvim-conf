local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED
vim.keymap.set("n", "<leader>a", function()
  harpoon:list():add()
  vim.notify("Added to harpoon")
end)

local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

vim.keymap.set("n", "<leader>ph", function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon window" })

local function open_menu()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end

vim.keymap.set("n", "<leader>oh", function() open_menu() end,
    { desc = "Open harpoon menu" })
