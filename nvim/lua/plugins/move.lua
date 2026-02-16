return {
  "fedepujol/move.nvim",
  keys = {
    -- Normal Mode
    { "<A-j>", ":MoveLine(1)<CR>", desc = "Move Line Up", silent = true },
    { "<A-k>", ":MoveLine(-1)<CR>", desc = "Move Line Down", silent = true},
    { "<A-h>", ":MoveHChar(-1)<CR>", desc = "Move Character Left", silent = true},
    { "<A-l>", ":MoveHChar(1)<CR>", desc = "Move Character Right", silent = true },
    { "<leader>wf", ":MoveWord(-1)<CR>", mode = { "n" }, desc = "Move Word Left", silent = true },
    { "<leader>wb", ":MoveWord(1)<CR>", mode = { "n" }, desc = "Move Word Right", silent = true },
    -- Visual Mode
    { "<A-j>", ":MoveBlock(1)<CR>", mode = { "v" }, desc = "Move Block Up", silent = true },
    { "<A-k>", ":MoveBlock(-1)<CR>", mode = { "v" }, desc = "Move Block Down", silent = true },
    { "<A-h>", ":MoveHBlock(-1)<CR>", mode = { "v" }, desc = "Move Block Left", silent = true },
    { "<A-l>", ":MoveHBlock(1)<CR>", mode = { "v" }, desc = "Move Block Right", silent = true },
  },
  opts = {
      -- Config here
    line = {
        enable = true, -- Enables line movement
        indent = true  -- Toggles indentation
    },
    block = {
        enable = true, -- Enables block movement
        indent = true  -- Toggles indentation
    },
    word = {
        enable = true, -- Enables word movement
    },
    char = {
        enable = true -- Enables char movement
    }
  }
}


-- Testing code block

