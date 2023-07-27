local present, trevj = pcall(require, "trevj")

if not present then
    return
end

trevj.setup {
    containers = {
        lua = {
            table_constructor = { final_separator = ',', final_end_line = true },
            arguments = { final_separator = false, final_end_line = true },
            parameters = { final_separator = false, final_end_line = true },
        },
        python = {
            list = { final_separator = false, final_end_line = true },
            set = { final_separator = false, final_end_line = true },
            dictionary = { final_separator = false, final_end_line = true },
            arguments = { final_separator = false, final_end_line = true },
            parameters = { final_separator = false, final_end_line = true },
        }
    },
}
