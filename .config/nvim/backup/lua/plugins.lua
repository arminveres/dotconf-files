local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
	vim.api.nvim_command 'packadd packer.nvim'
end


vim.cmd [[packadd packer.nvim]]

-- add packages

require('packer').startup(function()

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    requires = {'williamboman/nvim-lsp-installer'}
  }

  use {
    'hrsh7th/nvim-cmp',
    requires = {{'hrsh7th/cmp-buffer'}, {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-nvim-lsp'}, {'hrsh7th/cmp-nvim-lua'},
      {'hrsh7th/cmp-vsnip'}, { 'hrsh7th/cmp-cmdline' }
    }
  }

end)

-- manage packages

-- setup CMP
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
   mapping = {
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = 'nvim-lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'vsnip' }
  })
})


cmp.setup.cmdline(':', {
  sources = {
    { name = 'cmdline' }
  }
})

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- The following example advertise capabilities to `clangd`.
require'lspconfig'.clangd.setup {
  capabilities = capabilities,
}
