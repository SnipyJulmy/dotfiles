return {
  {
    "nosduco/remote-sshfs.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    opts = {},
    config = function()
      require("remote-sshfs").setup({
        connections = {
          ssh_configs = {
            vim.fn.expand("$HOME") .. "/.ssh/config",
          },
          sshfs_args = {
            "-o reconnect",
            "-o ConnectTimeout=5",
          },
        },
        mounts = {
          base_dir = vim.fn.expand("$HOME") .. "/.local/state/sshfs/",
          umount_on_exit = true,
        },
      })
      require("telescope").load_extension("remote-sshfs")
    end,
  },
}
