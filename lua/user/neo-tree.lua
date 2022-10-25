local status_ok, neotree = pcall(require, "neo-tree")
if not status_ok then
  return
end

neotree.setup({
  window = {
    position = "left",
    width = 34,
  },
  filesystem = {
    filtered_items = {
      visible = true, -- when true, they will just be displayed differently than normal items
      hide_dotfiles = false,
      hide_gitignored = false,
      never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
        ".git",
      },
    }
  }
})
