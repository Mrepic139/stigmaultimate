--[[
    decompiler.lua
    Better simple decompiler / source viewer
]]

local Decompiler = {}

function Decompiler.Decompile(scriptObj)
    if not scriptObj then return "-- nil script" end

    local source = ""
    local ok, result = pcall(function()
        if scriptObj:IsA("LocalScript") or scriptObj:IsA("ModuleScript") or scriptObj:IsA("Script") then
            -- try to get source if available
            return scriptObj.Source
        end
        return nil
    end)

    if ok and result and result ~= "" then
        source = result
    else
        source = "-- Unable to read source (protected or empty)\n"
        source = source .. "-- Class: " .. scriptObj.ClassName .. "\n"
        source = source .. "-- Name: " .. scriptObj.Name .. "\n"
        source = source .. "-- Path: " .. scriptObj:GetFullName() .. "\n"
    end

    return source
end

function Decompiler.GetAllScripts()
    local list = {}
    for _, obj in ipairs(game:GetDescendants()) do
        if obj:IsA("LocalScript") or obj:IsA("ModuleScript") or obj:IsA("Script") then
            table.insert(list, obj)
        end
    end
    return list
end

function Decompiler.Dump(scriptObj)
    local src = Decompiler.Decompile(scriptObj)
    print("========== DECOMPILE ==========")
    print(src)
    print("===============================")
    return src
end

return Decompiler
