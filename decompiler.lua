local Decompiler = {}

function Decompiler.Decompile(scriptObj)
    if not scriptObj then return "-- nil" end
    local ok, result = pcall(function()
        if scriptObj:IsA("LocalScript") or scriptObj:IsA("ModuleScript") or scriptObj:IsA("Script") then
            return scriptObj.Source
        end
        return nil
    end)
    if ok and result and result ~= "" then
        return result
    end
    return "-- Unable to read source\n-- Class: " .. scriptObj.ClassName .. "\n-- Name: " .. scriptObj.Name .. "\n-- Path: " .. scriptObj:GetFullName()
end

function Decompiler.GetAllScripts()
    local list = {}
    for _,obj in ipairs(game:GetDescendants()) do
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
