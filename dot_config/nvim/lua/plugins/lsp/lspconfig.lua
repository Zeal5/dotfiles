return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},

	config = function()
		-- local custom_border = {
		-- 	{ "┌", "FloatBorder" }, -- Top left
		-- 	{ "─", "FloatBorder" }, -- Top
		-- 	{ "┐", "FloatBorder" }, -- Top right
		-- 	{ "│", "FloatBorder" }, -- Left
		-- 	{ "└", "FloatBorder" }, -- Bottom left
		-- 	{ "─", "FloatBorder" }, -- Bottom
		-- 	{ "┘", "FloatBorder" }, -- Bottom right
		-- 	{ "│", "FloatBorder" }, -- Right
		-- }
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness

		local on_attach = function(client, bufnr)
			local opts = { buffer = bufnr, noremap = true, silent = true }
			-- set keybinds
			opts.desc = "Show LSP references"
			keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

			opts.desc = "Go to declaration"
			keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

			opts.desc = "Show LSP definitions"
			keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

			opts.desc = "Show LSP implementations"
			keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

			opts.desc = "Show LSP type definitions"
			keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

			opts.desc = "See available code actions"
			keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

			opts.desc = "Smart rename"
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

			opts.desc = "Show buffer diagnostics"
			keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

			opts.desc = "Show line diagnostics"
			keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

			opts.desc = "Go to previous diagnostic"
			keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

			opts.desc = "Go to next diagnostic"
			keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

			opts.desc = "Show documentation for what is under cursor"
			keymap.set("n", "K", function()
				vim.lsp.buf.hover({ border = "single", max_height = 25, max_width = 120 })
			end, opts)

			-- keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

			opts.desc = "Restart LSP"
			keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		--border around documentation
		-- Add the border on hover and on signature help popup window

		-- Change the Diagnostic symbols in the sign column (gutter)
		vim.diagnostic.config({
			virtual_text = true,
			float = {
				border = "rounded",
				source = "always",
			},
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ", -- Error
					[vim.diagnostic.severity.WARN] = " ", -- Warning
					[vim.diagnostic.severity.INFO] = "ℹ ", -- Info
					[vim.diagnostic.severity.HINT] = " ", -- Hint (using a Nerd Font icon)
				},
				numhl = {
					[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
					[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
					[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
					[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
				},
			},
		})

		local servers = {
			"basedpyright",
			"ruff",
			"solidity",
			"solidity_ls",
			"tsserver",
			"svelte",
			"gopls",
			"html",
			"cssls",
			"ts_ls",
			"jdtls",
			"rust_analyzer",
			"lua_ls",
		}
		-- configure python server
		-- switched from pyright to basedpyright
		vim.lsp.config("basedpyright", {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				basedpyright = {
					analysis = {
						diagnosticSeverityOverrides = {
							reportUnusedImport = "none",
						},
						autoSearchPaths = true,
						typeCheckingMode = "basic", -- "off", "basic", "standard", "strict", "recommended", "all"]
						useLibraryCodeForTypes = true,
						diagnosticMode = "openFilesOnly",
						inlayHints = {
							callArgumentNames = true,
						},
					},
				},
			},
		})

		vim.lsp.config("ruff", {
			init_options = {
				settings = {
					logLovel = "error",
				},
				ignore = {
					"ANN", -- annotations (missing type hints)
					"D", -- docstring errors
					"TCH", -- type checking hints
					"PYI", -- pyi type stub rules
				},
			},
			on_attach = on_attach,
		})

		vim.lsp.config("solidity", {
			cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
			filetypes = { "solidity" },
			capabilities = capabilities,
			single_file_support = true,
			on_attach = on_attach,
			require("lspconfig.util").root_pattern("foundry.toml"),
		})

		vim.lsp.config("svelte", {
			cmd = { "svelteserver", "--stdio" },
			filetypes = { "svelte" },
			capabilities = capabilities,
			on_attach = on_attach,
		})

		vim.lsp.config("gopls", {
			cmd = { "gopls" },
			filetypes = { "go", "gomod", "gowork", "gotmpl" },
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				gopls = {
					gofumpt = true,
					completeUnimported = true,
					usePlaceholders = true,
				},
			},
		})

		vim.lsp.config("html", {

			filetypes = {
				"css",
				"vue",
				"html",
				"xhtml",
				"svelte",
				"typescriptreact",
				"typescript.tsx",
				"javascript",
			},
			capabilities = capabilities,
			on_attach = on_attach,
		})

		vim.lsp.config("cssls", {
			filetypes = { "css", "vue", "svelte", "typescriptreact", "typescript.tsx", "javascript" },
			capabilities = capabilities,
			on_attach = on_attach,
		})

		vim.lsp.config("ts_ls", {
			filetypes = { "typescript", "vue", "typescriptreact", "typescript.tsx", "javascript" },
			capabilities = capabilities,
			on_attach = on_attach,
		})

		vim.lsp.config("jdtls", {
			filetypes = { "java" },
			capabilities = capabilities,
			on_attach = on_attach,
		})

		vim.lsp.config("rust_analyzer", {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				["rust-analyzer"] = {
					cargo = {
						allFeatures = true,
						loadOutDirsFromCheck = true,
						runBuildScripts = true,
					},
					checkOnSave = {
						allFeatures = true,
						command = "clippy",
						extraArgs = { "--no-deps" },
					},
					procMacro = {
						enable = true,
						ignored = {
							["async-trait"] = { "async_trait" },
							["napi-derive"] = { "napi" },
							["async-recursion"] = { "async_recursion" },
						},
					},
				},
			},
		})

		-- configure lua server (with special settings)
		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {

					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
		vim.lsp.enable(servers)
	end,
}

-- !black % formats file (! = terminal command, % file)
-- !prettier % --write (formats json file)
