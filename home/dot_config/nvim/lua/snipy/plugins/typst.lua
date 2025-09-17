return {
  {
    "chomosuke/typst-preview.nvim",
    ft = "typst",
    version = "1.*",
    opts = {
      debug = false,
      open_cmd = nil,
      invert_colos = "never",
      follow_cursor = true,
      dependencies_bin = {
        ["tinymist"] = nil,
        ["websocat"] = nil,
      },
      extra_args = nil,
      get_root = function(main_file)
        local root = os.getenv("TYPST_ROOT")
        if root then
          return root
        end
        return vim.fn.fnamemodify(main_file, ":p:h")
      end,
      get_main_file = function(buffer)
        return buffer
      end,
    },
  },
}
