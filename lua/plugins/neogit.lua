local present, neogit = pcall(require, "neogit")

if not present then
   return
end

neogit.setup {
    kind = "tab",
    commit_popup = "split",
    signs = {
        -- { CLOSED, OPENED }
        section = { "", "" },
        item = { "", "" },
        hunk = { "", "" },
    },
}
