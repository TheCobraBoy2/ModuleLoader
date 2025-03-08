--!strict
-- @author VorrikZ
-- @data: 3/7/25
--[[ @description:
    General code for loading parallel module scripts.
]]
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ParallelModuleLoader = require(ReplicatedStorage.ModuleLoader.ParallelModuleLoader)
local actor = script.Parent
actor:BindToMessage("RequireModule", function(module: ModuleScript)
	ParallelModuleLoader.onRequireModule(script, module)
end)

actor:BindToMessage("InitModule", function()
	ParallelModuleLoader.onInitModule(script)
end)

actor:BindToMessage("StartModule", function()
	ParallelModuleLoader.onStartModule(script)
end)

script:SetAttribute("Loaded", true)