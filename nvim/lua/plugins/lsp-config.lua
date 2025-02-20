return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "clangd", "pyright", "ts_ls", "cmake" }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")
            local configs = require("lspconfig/configs")
            local util = require("lspconfig/util")
            local servers = require("mason-lspconfig").get_installed_servers()

            -- Setup every server automatically
            for _, lsp in ipairs(servers) do
                lspconfig[lsp].setup {
                    capabilities = capabilities
                }
            end

            -- Pyright venv stuff!
            local path = util.path

            local function get_python_path(workspace)
                -- Use activated virtualenv.
                if vim.env.VIRTUAL_ENV then
                    return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
                end

                -- Find and use virtualenv in workspace directory.
                for _, pattern in ipairs({'*', '.*'}) do
                    local match = vim.fn.glob(path.join(workspace, pattern, 'pyvenv.cfg'))
                    if match ~= '' then
                        return path.join(path.dirname(match), 'bin', 'python')
                    end
                end

                -- Fallback to system Python.
                return exepath('python3') or exepath('python') or 'python'
            end

            -- Pyright setup with dynamic settings
            lspconfig.pyright.setup {
                capabilities = capabilities,
                before_init = function(_, config)
                    config.settings.python.pythonPath = get_python_path(config.root_dir)

                    -- local project_root = util.root_pattern(".git", "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile")(params.root_dir)

                    -- if project_root then
                    --     -- Default to venv/bin/python
                    --     local venv_path = project_root .. "/venv/bin/python"
                    --
                    --     -- If venv doesn't exist, check for project_root/project_root_name/bin/python
                    --     if vim.fn.filereadable(venv_path) == 0 then
                    --         local project_root_name = vim.fn.fnamemodify(project_root, ":t") -- Get the folder name
                    --         venv_path = project_root .. "/" .. project_root_name .. "/lib/python3.13/site-packages"
                    --     end
                    --
                    --     params.settings = params.settings or {}
                    --     params.settings.python = params.settings.python or {}
                    --     params.settings.python.pythonPath = venv_path
                    --     params.settings.python.analysis = params.settings.python.analysis or {}
                    --     params.settings.python.analysis.extraPaths = { project_root }
                    -- else
                        -- Fallback to a default virtual environment path if project root is not found
                        -- local root_dir_name = vim.fn.fnamemodify(params.root_dir, ":t") -- Get the root dir name
                        -- local fallback_venv_path = params.root_dir .. "/" .. root_dir_name .. "/bin/python"
                        --
                        -- params.settings = params.settings or {}
                        -- params.settings.python = params.settings.python or {}
                        -- params.settings.python.pythonPath = fallback_venv_path
                        -- params.settings.python.analysis = params.settings.python.analysis or {}
                        -- params.settings.python.analysis.extraPaths = { util.path.dirname(params.root_dir) }
                    -- end
                end,
            }

 
            -- Check if VULKAN_SDK is set
            local vulkan_sdk = os.getenv("VULKAN_SDK")
            local vulkan_include = vulkan_sdk and ("-I" .. vulkan_sdk .. "/include") or ""

            -- Homebrew paths
            local homebrew_prefix = "/opt/homebrew" -- Silicon
            if vim.fn.has("macunix") == 1 and vim.fn.system("uname -m") == "x86_64\n" then
                homebrew_prefix = "/usr/local" -- Intel
            end

            local homebrew_include = "-I" .. homebrew_prefix .. "/include"
            local homebrew_lib = "-L" .. homebrew_prefix .. "/lib"

            -- Uncomment the Homebrew lines if you want to use homebrew packages (e.g. SDL3)
            -- I prefer not to do this, but rather have the libraries in each project
            -- Make sure you have set(CMAKE_EXPORT_COMPILE_COMMANDS on) in your CMakeLists.txt
            lspconfig.clangd.setup {
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--completion-style=bundled",
                    "--pch-storage=memory",
                    "--header-insertion=iwyu",
                    "--header-insertion-decorators",
                    "--compile-commands-dir=build",
                },
                capabilities = capabilities,
                root_dir = util.root_pattern("CMakeLists.txt", "compile_commands.json", ".git"),
                init_options = {
                    compilationDatabasePath = "build",
                    fallbackFlags = {
                        "-std=c++20",
                        vulkan_include,
                        -- homebrew_include, -- Add Homebrew include path
                        -- homebrew_lib, -- Add Homebrew lib path
                        "-Ilib",
                        "-I/usr/include/c++/v1",
                        "-I/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include"
                    }
                },
                on_attach = function(client, bufnr)
                    local bufopts = { noremap=true, silent=true, buffer=bufnr }
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
                    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, bufopts)
                    vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, bufopts)
                    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
                end
            }
        end
    }
}
