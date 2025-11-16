---@type LazySpec
------
local function cpu_load()
  local f = io.open("/proc/loadavg", "r")
  if not f then return "" end
  local content = f:read "*l"
  f:close()
  local load = tonumber(content:match "^(%S+)") or 0
  return string.format(" %.2f", load)
end

return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "gruvbox_dark",
      },
      sections = {
        lualine_x = { cpu_load, "encoding", "fileformat", "filetype" },
      },
    },
  },
}
