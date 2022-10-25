local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local config = {
  options = {
    component_separators = '|',
    -- section_separators = { left = '', right = '' },
    theme = 'auto',
    disabled_filetypes = { 'packer', 'NvimTree', 'NeoTree' },
    globalstatus = true,
  },
  sections = {
    lualine_a = {
      {
        'mode',
        -- separator = { left = '' },
        -- right_padding = 2
      },
    },
    lualine_b = { 'filename', 'branch' },
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      {
        'location',
        -- separator = { right = '' },
        -- left_padding = 2
      },
    },
    lualine_c = { 'filesize' },
    lualine_x = { { 'diagnostics', sources = { 'nvim_diagnostic' },
      symbols = { error = ' ', warn = ' ', info = ' ' }, }, },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_y = {},
    lualine_x = {},
    lualine_c = {},
    lualine_z = { 'location' },
  },
}

local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

ins_left {
  'diff',
}

local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_right {
  -- Lsp server name .
  function()
    local msg = 'No Active LSP'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = ' LSP:',
}

lualine.setup(config)

-- local hide_in_width = function()
-- 	return vim.fn.winwidth(0) > 80
-- end

-- local diagnostics = {
-- 	"diagnostics",
-- 	sources = { "nvim_diagnostic" },
-- 	sections = { "error", "warn" },
-- 	symbols = { error = " ", warn = " " },
-- 	colored = false,
-- 	update_in_insert = false,
-- 	always_visible = true,
-- }
--
-- local diff = {
-- 	"diff",
-- 	colored = false,
-- 	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
--   cond = hide_in_width
-- }
--
-- local mode = {
-- 	"mode",
-- 	fmt = function(str)
-- 		return "-- " .. str .. " --"
-- 	end,
-- }
--
-- local filetype = {
-- 	"filetype",
-- 	icons_enabled = false,
-- 	icon = nil,
-- }
--
-- local branch = {
-- 	"branch",
-- 	icons_enabled = true,
-- 	icon = "",
-- }
--
-- local location = {
-- 	"location",
-- 	padding = 0,
-- }
--
-- -- cool function for progress
-- local progress = function()
-- 	local current_line = vim.fn.line(".")
-- 	local total_lines = vim.fn.line("$")
-- 	local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
-- 	local line_ratio = current_line / total_lines
-- 	local index = math.ceil(line_ratio * #chars)
-- 	return chars[index]
-- end
--
-- local spaces = function()
-- 	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
-- end
