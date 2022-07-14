local load_core = function()
    require("core.options")
    require("core.packer").bootstrap()
    require("core.autocmds")
    require("core.colorscheme")
    require("core.mappings")
end

load_core()
