return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local capabilities = cmp_nvim_lsp.default_capabilities()
    -- 1. Setup Keymaps (Modern Autocommand approach)
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        local keymap = vim.keymap

        opts.desc = "Show LSP references"
        keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)

        opts.desc = "Go to declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

        opts.desc = "Show LSP definitions"
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

        opts.desc = "Show LSP type definitions"
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

        opts.desc = "See available code actions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

        opts.desc = "Go to next diagnostic"
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

        opts.desc = "Show documentation"
        keymap.set("n", "<leader>h", vim.lsp.buf.hover, opts)

        keymap.set("n", "<leader>t", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", opts)

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)

        keymap.set("n", "<space>f", function()
          vim.lsp.buf.format({ async = true })
        end, opts)
      end,
    })

    -- 2. Diagnostic Symbols
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- 3. Define Servers and their specific configs
    local servers = {
      "html",
      "cssls",
      "tailwindcss",
      "svelte",
      "prismals",
      "graphql",
      "emmet_ls",
      "pyright",
      "jsonls",
      "terraformls",
    }

    -- Standard enabling for simple servers
    for _, lsp in ipairs(servers) do
      vim.lsp.enable(lsp)
    end

    -- 4. Custom Configurations (using the new vim.lsp.config)

    -- TypeScript (Fixing the tsserver rename)
    vim.lsp.config("ts_ls", {
      options = {
        capabilities = capabilities,
        -- Set your memory limit here if needed by the server
        settings = { maxTsServerMemory = 16000 },
      },
    })
    vim.lsp.enable("ts_ls")

    -- Lua
    vim.lsp.config("lua_ls", {
      options = {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
            },
          },
        },
      },
    })
    vim.lsp.enable("lua_ls")
  
    -- Tailwind (Restoring your custom filetypes)
    vim.lsp.config("tailwindcss", {
      options = {
        capabilities = capabilities,
        filetypes = {
          "aspnetcorerazor",
          "astro",
          "astro-markdown",
          "blade",
          "django-html",
          "edge",
          "eelixir",
          "ejs",
          "erb",
          "eruby",
          "gohtml",
          "haml",
          "handlebars",
          "hbs",
          "html",
          "html-eex",
          "heex",
          "jade",
          "leaf",
          "liquid",
          "mdx",
          "mustache",
          "njk",
          "nunjucks",
          "razor",
          "slim",
          "twig",
          "css",
          "less",
          "postcss",
          "sass",
          "scss",
          "stylus",
          "sugarss",
          "javascriptreact",
          "reason",
          "rescript",
          "typescriptreact",
          "vue",
          "svelte",
        },
      },
    })
    vim.lsp.enable("tailwindcss")

    -- Emmet
    vim.lsp.config("emmet_ls", {
      options = {
        capabilities = capabilities,
        filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
      },
    })
    vim.lsp.enable("emmet_ls")

    -- GraphQL
    vim.lsp.config("graphql", {
      options = {
        capabilities = capabilities,
        filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
      },
    })
    vim.lsp.enable("graphql")
  end,
}
