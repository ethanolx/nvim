local present, treesitter = pcall(require, "nvim-treesitter.configs")

if not present then
    return
end

treesitter.setup {
    textobjects = {
        select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["aF"] = "@function.outer",
                ["iF"] = "@function.inner",
                ["af"] = "@call.outer",
                ["if"] = "@call.inner",
                ["aC"] = "@class.outer",
                ["iC"] = "@class.inner",
                ["aP"] = "@parameter.outer",
                ["iP"] = "@parameter.inner",
                ["ac"] = "@conditional.outer",
                ["ic"] = "@conditional.inner",
                ["al"] = "@loop.outer",
                ["il"] = "@loop.inner",
                ["aS"] = "@statement.outer",
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ["<leader>mn"] = "@parameter.inner",
            },
            swap_previous = {
                ["<leader>mp"] = "@parameter.inner",
            },
        },
        move = {
            enable = true,
            set_jumps = false,
            goto_next_start = {
                ["]F"] = "@function.outer",
                ["]f"] = "@call.outer",
                ["]C"] = "@class.outer",
                ["]p"] = "@parameter.inner",
                ["]P"] = "@parameter.outer",
                ["]c"] = "@conditional.outer",
                ["]S"] = "@statement.outer",
            },
            goto_next_end = {
            },
            goto_previous_start = {
                ["[F"] = "@function.outer",
                ["[f"] = "@call.outer",
                ["[C"] = "@class.outer",
                ["[p"] = "@parameter.inner",
                ["[P"] = "@parameter.outer",
                ["[c"] = "@conditional.outer",
                ["[S"] = "@statement.outer",
            },
            goto_previous_end = {
            },
        },
    },
}
