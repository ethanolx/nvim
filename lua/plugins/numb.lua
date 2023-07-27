local present, numb = pcall(require, "numb")

if not present then
   return
end

numb.setup {}

-- vim.cmd [[
--     autocmd CmdlineChanged *
--     lua local cmd_line = api.nvim_call_function("getcmdline", {})
--     local winnr = api.nvim_get_current_win()
--     local num_str = cmd_line:match("^%d+" .. (opts.number_only and "$" or ""))
--     if num_str then
--         peek(winnr, tonumber(num_str))
--         cmd "redraw"
--     elseif is_peeking(winnr) then
--         unpeek(winnr, false)
--         cmd "redraw"
--     end
-- ]]
