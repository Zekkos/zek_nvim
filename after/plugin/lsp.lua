local lsp_zero = require('lsp-zero')
local lsp_cfg = require('lspconfig')

lsp_cfg.clangd.setup{
	cmd = { 'clangd', '--query-driver=/usr/bin/arm-none-eabi-gcc' },
}

lsp_cfg.zls.setup{}

lsp_cfg.pyright.setup{}

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({buffer = bufnr})
end)

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
  },
  mapping = {
    ['<Tab>'] = cmp.mapping.confirm({select = true}),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<Up>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
    ['<Down>'] = cmp.mapping.select_next_item({behavior = 'select'}),
    ['<C-p>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item({behavior = 'insert'})
      else
        cmp.complete()
      end
    end),
    ['<C-n>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_next_item({behavior = 'insert'})
      else
        cmp.complete()
      end
    end),
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})

cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)
