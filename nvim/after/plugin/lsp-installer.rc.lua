local status, lsp_installer = pcall(require, "nvim-lsp-installer")
if (not status) then return end

lsp_installer.setup({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})
