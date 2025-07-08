local QBCore = exports['vrp-core']:GetCoreObject()

-- Variáveis locais
local service = false
local selecionado = 1
local blips = {}

--Função para verificar a gang do jogador
local function getPlayerGang()
    local PlayerData = QBCore.Functions.GetPlayerData()
    if PlayerData.gang and PlayerData.gang.name then
        return PlayerData.gang.name
    end
    return nil
end

-- Função para verificar o job do jogador
local function getPlayerJob()
    local PlayerData = QBCore.Functions.GetPlayerData()
    if PlayerData.job and PlayerData.job.name then
        return PlayerData.job.name
    end
    return nil
end

CreateThread(function()
    while true do
        Wait(0)
        if not service then
            for _, v in ipairs(Config.Blips) do
                local ped = PlayerPedId()
                local coordPlayer = GetEntityCoords(ped)
                local distance = #(coordPlayer - v[1]) 
                if distance < 3 and distance > 2 then
                    drawText3D(v[1].x, v[1].y, v[1].z, "~r~[ E ]~w~ PARA INICIAR ~r~ROTA~w~") 
                elseif distance < 2 then
                    drawText3D(v[1].x, v[1].y, v[1].z, "~g~[ E ]~w~ PARA INICIAR ~g~ROTA~w~") 
                    if IsControlJustPressed(0, 38) then
                        local jobOrGang = getPlayerJob()
                        local gangOrJob = getPlayerGang()    
                        local alucard                       
                        local k
                        for key, _ in pairs(Config.Rota.Lista) do
                            if Config.Rota.Lista[key].job == jobOrGang or Config.Rota.Lista[key].job == gangOrJob then
                                alucard = Config.Rota.Lista[key].job
                                k = key
                                break
                            end
                        end 
                      ---  print(alucard,jobOrGang,gangOrJob, "gang")
                        if alucard == jobOrGang or alucard == gangOrJob then
                           -- print("iniciou a rota")
                            currentRota = Config.Rota.Lista[k].locais
                            QBCore.Functions.Notify("Você entrou em serviço", "success", 1000)
                            service = true
                            selecionado = 1
                            CriandoBlip(currentRota, selecionado)
                        else
                            QBCore.Functions.Notify('Vc não tem permissão!', 'error' , 5000)
                        end                      
                    end
                end
            end
        end
    end
end)

-- Thread principal para a execução da rota
CreateThread(function()
    while true do
        Wait(0)
        if service and currentRota then
            local ped = PlayerPedId()
            local coordPlayer = GetEntityCoords(ped)
            local distance = #(coordPlayer - vector3(currentRota[selecionado].x, currentRota[selecionado].y, currentRota[selecionado].z))
            if distance < 1 then
                drawText3D(currentRota[selecionado].x, currentRota[selecionado].y, currentRota[selecionado].z, "PRECIONE ~b~[E]~w~ PARA PEGAR AS ~b~PEÇAS~w~")
                if IsControlJustPressed(0, 38) then

                    QBCore.Functions.Progressbar('rotas', 'Coletando Itens', Config.TempoDeColeta, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                    animDict = 'amb@prop_human_parking_meter@female@idle_a',
                        anim = 'idle_a_female',
                        flags = 17,
                    }, {}, {}, function()
                        ClearPedTasks(PlayerPedId())
                        local jobOrGang = getPlayerJob()
                        local gangOrJob = getPlayerGang() 

                        -- print(jobOrGang,gangOrJob,"aopa")
                        for k, _ in pairs(Config.Rota.Lista) do
    
                            local alucard = Config.Rota.Lista[k].job
                            -- print(alucard,"alucard no for")
    
                            TriggerServerEvent("alucardEzera:ganharItem", jobOrGang,gangOrJob, alucard)
    
                        end
                    end)
                  
                    RemoveBlip(blips)
                    selecionado = selecionado + 1
                    if selecionado > #currentRota then
                        selecionado = 1
                    end
                    CriandoBlip(currentRota, selecionado)
                end
            end
        end
    end
end)


-- Thread para sair do serviço
CreateThread(function()
    while true do
        Wait(0)
        if IsControlJustPressed(0, 168) then
            service = false
            currentRota = nil
            QBCore.Functions.Notify("Você saiu de serviço", "error", 1000)
            RemoveBlip(blips)
            selecionado = 1
        end
    end
end)

-- Função para desenhar texto 3D
function drawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())

    SetTextScale(0.34, 0.34)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
end

-- Função para criar o Blip
function CriandoBlip(rota, selecionado)
    blips = AddBlipForCoord(rota[selecionado].x, rota[selecionado].y, rota[selecionado].z)
    SetBlipSprite(blips, 1)
    SetBlipColour(blips, 3)
    SetBlipScale(blips, 0.4)
    SetBlipAsShortRange(blips, false)
    SetBlipRoute(blips, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Entrega")
    EndTextCommandSetBlipName(blips)
end
