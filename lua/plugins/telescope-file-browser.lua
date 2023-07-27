local present, telescope = pcall(require, "telescope")

if not present then
    return
end

local icons = require("core.icons")

telescope.setup {
    extensions = {
        file_browser = {
            dir_icon = icons.filesystem.closed_folder,
            dir_icon_hl = "NvimTreeFolderIcon",
            hijack_netrw = true,
        }
    }
}

telescope.load_extension "file_browser"
