local present, smart_pairs = pcall(require, "pairs")

if not present then
    return
end

smart_pairs:setup {
    enter = {
        enable_mapping = false,
    },
    space = {
        enable_cond = function ()
            return vim.fn.mode() ~= "R"
        end,
        enable_fallback = function ()
            if vim.fn.mode() == "R" then
                vim.fn.feedkeys(" ", "n")
            end
        end
    },
    delete = {
        enable_cond = function ()
            return vim.fn.mode() ~= "R"
        end,
        enable_fallback = function ()
            if vim.fn.mode() == "R" then
                vim.fn.feedkeys("\b", "n")
            end
        end
    }
}
