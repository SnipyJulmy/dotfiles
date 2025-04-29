local capabilities = require("snipy.lsp.capabilities")
local metals_config = require("metals").bare_config()
local on_attach = require("snipy.lsp.on_attach")

metals_config.settings = {
  showImplicitArguments = true,
  showImplicitConversionsAndClasses = true,
  showInferredType = true,
  fallbackScalaVersion = "3.3.5",
  excludedPackages = {
    "akka.actor.typed.javadsl",
    "com.github.swagger.akka.javadsl",
    "akka.stream.javadsl",
    "akka.http.javadsl",
  },
  serverVersion = "latest.release",
}

metals_config.init_options = {
  statusBarProvider = "off",
  icons = "unicode",
}
metals_config.capabilities = capabilities
metals_config.on_attach = function(client, bufnr)
  -- require("metals").setup_dap()
  on_attach(client, bufnr)
  return metals_config
end

vim.api.nvim_create_autocmd({ "FileType" }, {
  group = vim.api.nvim_create_augroup("metals", { clear = true }),
  pattern = { "scala", "sbt", "java" },
  callback = function()
    require("metals").initialize_or_attach(metals_config)
  end,
})
