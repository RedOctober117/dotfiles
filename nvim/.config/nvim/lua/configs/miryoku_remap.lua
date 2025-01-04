vim.g.leader = " "

local function bind_miryoku()
	vim.g.current_binding = "miryoku"
	vim.keymap.set("", "n", "<left>", { noremap = true, buffer = true })
	vim.keymap.set("", "o", "<right>", { noremap = true, buffer = true })
	vim.keymap.set("", "i", "<up>", { noremap = true, buffer = true })
	vim.keymap.set("", "e", "<down>", { noremap = true, buffer = true })

	vim.keymap.set("", "h", "n", { noremap = true, buffer = true })
	vim.keymap.set("", "l", "o", { noremap = true, buffer = true })
	vim.keymap.set("", "k", "<insert>", { noremap = true, buffer = true })
	vim.keymap.set("", "j", "e", { noremap = true, buffer = true })
	print("Switched to Miryoku")
end

local function bind_qwerty()
	vim.g.current_binding = "qwerty"
	vim.keymap.set("", "h", "<left>", { noremap = true, buffer = true })
	vim.keymap.set("", "l", "<right>", { noremap = true, buffer = true })
	vim.keymap.set("", "k", "<up>", { noremap = true, buffer = true })
	vim.keymap.set("", "j", "<down>", { noremap = true, buffer = true })

	vim.keymap.set("", "n", "n", { noremap = true, buffer = true })
	vim.keymap.set("", "o", "o", { noremap = true, buffer = true })
	vim.keymap.set("", "i", "<insert>", { noremap = true, buffer = true })
	vim.keymap.set("", "e", "e", { noremap = true, buffer = true })
	print("Switched to Qwerty")
end

local function bind_netrw()
	local current_bind = vim.g.current_binding
	print("Mapping: ", current_bind)
	if current_bind == "miryoku" then
		bind_miryoku()
	elseif current_bind == "qwerty" then
		bind_qwerty()
	else
		print("Error mapping keys")
	end
end

local netrw_bindings = vim.api.nvim_create_augroup("netrw_bindings", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "WinEnter", "BufRead" }, {
	pattern = "*",
	callback = bind_netrw,
	group = netrw_bindings,
})

vim.api.nvim_create_user_command("Miryoku", bind_miryoku, { desc = "Switch to Miryoku" })
vim.api.nvim_create_user_command("Qwerty", bind_qwerty, { desc = "Switch to Qwerty" })
