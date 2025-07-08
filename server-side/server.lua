local QBCore = exports['vrp-core']:GetCoreObject()

-- Evento para dar o item ao jogador
RegisterNetEvent('alucardEzera:ganharItem')
AddEventHandler('alucardEzera:ganharItem', function(jobOrGang,gangOrJob,alucard)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player and jobOrGang == alucard or gangOrJob == alucard then
        -- print(alucard,"trampo")
        -- print(jobOrGang, "trampo2")
        -- print(gangOrJob, "trampo3")

        for i, rota in ipairs(Config.Rota.Lista) do
            if rota.job == jobOrGang or rota.job == gangOrJob then
                -- print("Rota " .. i .. ":")
                -- print("Job: " .. rota.job)
                for j, item in ipairs(rota.itens) do
                    local count = math.random(item.count[1], item.count[2]) 
                    -- print("Item " .. j .. ": " .. item.item)
                    -- print("Count: " .. count) 
                    Player.Functions.AddItem(item.item, count)
                end
            end
        end
        TriggerClientEvent('QBCore:Notify', src, ('Vc pegou os Itens!'), 'success')
    end
end)


