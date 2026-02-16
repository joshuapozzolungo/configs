return {
  "windwp/nvim-ts-autotag",
  -- Force it to load immediately for testing
  lazy = false,
  opts = {
    -- v1.0.0 requires the nested 'opts' key
    opts = {
      enable_close = true,
      enable_rename = true,
      enable_close_on_slash = false,
    },
    -- Ensure your filetype is in this list
    filetypes = { 
      "html", "javascript", "typescript", "javascriptreact", 
      "typescriptreact", "svelte", "vue", "xml" 
    },
  },
  config = function(_, opts)
    require('nvim-ts-autotag').setup(opts)
  end,
}
