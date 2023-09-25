vim.api.nvim_create_user_command("Format", ":!yarn prettier --write % && yarn eslint --fix %", { nargs="?" })

vim.api.nvim_create_user_command("Prettier", ":!yarn prettier --write %", { nargs="?" })
