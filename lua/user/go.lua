local status_ok, go = pcall(require, "go")
if not status_ok then
  return
end

go.setup(
  {
    goimport = 'gopls', -- goimport command, can be gopls[default] or goimport
    fillstruct = 'gopls',
    tag_transform = 'camelcase',
  }
)
