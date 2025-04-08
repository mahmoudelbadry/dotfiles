return {
  {
    "mfussenegger/nvim-jdtls",
    opts = function (_, opts)
      local utils = require "astrocore"
      -- use this function notation to build some variables
      local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle", ".project" }
      local root_dir = require("jdtls.setup").find_root(root_markers)
      -- calculate workspace dir
      local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
      local workspace_dir = vim.fn.stdpath "data" .. "/site/java/workspace-root/" .. project_name
      vim.fn.mkdir(workspace_dir, "p")

      -- validate operating system
      if not (vim.fn.has "mac" == 1 or vim.fn.has "unix" == 1 or vim.fn.has "win32" == 1) then
        utils.notify("jdtls: Could not detect valid OS", vim.log.levels.ERROR)
      end
      return utils.extend_tbl({
        cmd = {
          "$HOME/.sdkman/candidates/java/17.0.1-tem/bin/java",
          "-Declipse.application=org.eclipse.jdt.ls.core.id1",
          "-Dosgi.bundles.defaultStartLevel=4",
          "-Declipse.product=org.eclipse.jdt.ls.core.product",
          "-Dlog.protocol=true",
          "-Dlog.level=ALL",
          "-javaagent:" .. vim.fn.expand "$MASON/share/jdtls/lombok.jar",
          "-Xms1g",
          "--add-modules=ALL-SYSTEM",
          "--add-opens",
          "java.base/java.util=ALL-UNNAMED",
          "--add-opens",
          "java.base/java.lang=ALL-UNNAMED",
          "-jar",
          vim.fn.expand "$MASON/share/jdtls/plugins/org.eclipse.equinox.launcher.jar",
          "-configuration",
          vim.fn.expand "$MASON/share/jdtls/config",
          "-data",
          workspace_dir,
        },
      }, opts)
    end
  }
}
