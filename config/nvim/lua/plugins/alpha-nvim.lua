return {
  "goolord/alpha-nvim",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    dashboard.section.header.val = {
      "█▄ ▄       ▓ ▄▄██   ▓█▄▄██    █▀▒   █▓  ██▓  ███▄ ▄█▀█▓",
      " ██ ▀█   █  ▓█   ▀  ▓██▒  ██▓ ▓██░   █▒ ▓▐█▒ ▓██▒▀█▀ ██▒",
      "▓██  ▀█ ██▒ ▒█ █    ▒██░  ██▒  ▓▀▄  █▒░ ▒ █▒ ▓██    ▓█ ░",
      "▓██▒  ▐ ██▒ ▒▓█  ▄  ▒██  ▄▀▒░   ▒██ █░░ ░▐ ░ ▒██    ▒   ",
      "▒██░   ▓██░ ░▒████▒ ░ █▀▀ ▓▒░    ▒▀█ ░  ░▐█░ ▒▄█▒   ░ █▒",
      "░ ▒░   ▒ ▓  ░░ ▒░ ░ ░ ▒░▓░▓░     ░ ▐ ░  ░▓   ░ ▒░   ░  ░",
      "░ ░░   ░ ▒░  ░ ░  ░   ░ ▒ ▒░     ░ ░░    ▒ ░ ░  ░      ░",
      "   ░   ░ ░     ░    ░ ░ ░ ▒        ░░    ▒ ░ ░      ░   ",
      "         ░     ░  ░     ░ ░         ░    ░          ░   ",
      "                                   ░                    ",
    }
    dashboard.section.header.opts.hl = "AlphaHeaderCustom"
    vim.api.nvim_set_hl(0, "AlphaHeaderCustom", { fg = "#cba6f7" })
    alpha.setup(dashboard.config)
  end,
}
