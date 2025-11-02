return {
	{
		"ojroques/nvim-osc52",
		config = function()
			local osc52 = require("osc52")
			osc52.setup({
				max_length = 0, -- Maximum length of selection (0 for no limit)
				silent = false, -- Disable message on successful copy
				trim = true, -- Trim surrounding whitespaces before copy
				tmux_passthrough = false, -- Use tmux passthrough (requires tmux: set -g allow-passthrough on)
			})

			-- Using nvim-osc52 as clipboard provider (from documentation)
			-- Note that if you set your clipboard provider like the example above, copying text from outside Neovim and pasting with p won't work. But you can still use the paste shortcut of your terminal emulator (usually ctrl+shift+v).
			-- local function copy(lines, _)
			-- 	require("osc52").copy(table.concat(lines, "\n"))
			-- end

			local function paste()
				return { vim.fn.split(vim.fn.getreg(""), "\n"), vim.fn.getregtype("") }
			end

			vim.g.clipboard = {
				name = "osc52",
				copy = { ["+"] = copy, ["*"] = copy },
				paste = { ["+"] = paste, ["*"] = paste },
			}

			-- Now the '+' register will copy to system clipboard using OSC52
			vim.keymap.set("n", "<leader>c", '"+y')
			vim.keymap.set("n", "<leader>cc", '"+yy')

			-- Advance Usage
			-- to automatically copy the text that was yanked into register +:
			local function copy()
				if vim.v.event.operator == "y" and vim.v.event.regname == "+" then
					require("osc52").copy_register("+")
				end
			end

			vim.api.nvim_create_autocmd("TextYankPost", { callback = copy })
		end,
	},
}
