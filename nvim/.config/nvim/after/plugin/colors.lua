-- switch between gruvbox and tokyonight
vim.g.waterline_colorscheme = "tokyonight"

require("catppuccin").setup({
    transparent_background = false;
});

function ColorMyPencils()
    vim.g.gruvbox_contrast_dark = 'hard'
    vim.cmd("colorscheme " .. vim.g.waterline_colorscheme)
    vim.opt.background = "dark"

    local hl = function(things, opts)
        vim.api.nvim_set_hl(0, things, opts)
    end

    hl("SignColumn", {
        bg = "none",
    })

    hl("ColorColumn", {
        ctermbg = 0,
        bg = "#2B79A0",
    })

end

ColorMyPencils()
