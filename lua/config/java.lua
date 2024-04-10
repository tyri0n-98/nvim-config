local jdtls_dir = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
local path_to_jar = jdtls_dir .. "/plugins/org.eclipse.equinox.launcher.gtk.linux.x86_64_1.2.900.v20240129-1338.jar.jar"
local lombok_jar = jdtls_dir .. "/lombok.jar"

-- local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.fn.stdpath("data") .. project_name
os.execute("mkdir " .. workspace_dir)

local config = {
    cmd = {
        "java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xmx1g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens",
        "java.base/java.util=ALL-UNNAMED",
        "--add-opens",
        "java.base/java.lang=ALL-UNNAMED",
        "-javaagent:" .. lombok_jar,
        "-jar", path_to_jar,
        "-configuration", jdtls_dir .. "/config_linux",
        "-data", workspace_dir,
    },
}
return config
