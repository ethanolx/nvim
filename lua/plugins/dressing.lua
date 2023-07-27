local present, dressing = pcall(require, "dressing")

if not present then
    return
end

require("core.utils").load_highlights(
    function(colour_palette)
        return {
            FloatTitle = {
                fg = colour_palette.black,
                bg = colour_palette.yellow,
            },
        }
    end
)

dressing.setup {
    input = {
        win_options = {
            winblend = 0,
        },
        prompt_align = "center",
        default_prompt = "Input",
        relative = "editor",
        prefer_width = 80,
        get_config = function(_)
        end
    },
    select = {},
}
