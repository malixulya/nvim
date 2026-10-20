return{
	"neovim/nvim-lspconfig",
	config = function()
	vim.lsp.enable('clangd')
	vim.lsp.enable('pylsp')
	vim.lsp.enable('gopls')
	vim.lsp.enable('cssls')
	vim.lsp.enable('html')
	vim.lsp.enable('ts_ls')
	vim.lsp.enable('dockerls')
vim.lsp.config('dockerls', {
      settings = {
          docker = {
  	    languageserver = {
  	        formatter = {
  		    ignoreMultilineInstructions = true,
  		},
  	    },
  	}
      }
  })

  vim.lsp.config('pylsp', {
    settings = {
      pylsp = {
        plugins = {
          pycodestyle = {
            ignore = {'W391'},
            maxLineLength = 100
          }
        }
      }
    }
  })
local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  vim.lsp.config('cssls', {
    capabilities = capabilities,
  })
vim.lsp.config('html', {
    capabilities = capabilities,
  })

vim.lsp.config('gopls', {
      settings = {
        gopls = {
          semanticTokens = false
        }
      }
    })



	vim.diagnostic.config({
  virtual_text = {
    -- source = "always",  -- Or "if_many"
    prefix = '●', -- Could be '■', '▎', 'x'
  },
  severity_sort = true,
  float = {
    source = "always",  -- Or "if_many"
  },
})

	end
}
