RegisterServerEvent("bank:balance")
AddEventHandler("bank:balance", function()

    local src = source
    local ident = PlayerIdentifier("license", src)
    local name = GetPlayerName(src)

    print("bank:balance works!!!")

    MySQL.Async.fetchAll("SELECT * FROM banktabel",{}, 
    function(result)
            local source = src
            local sendid = result[1].id
            local sendfn = result[1].firstName
            local sendln = result[1].lastName
            local sendbal = result[1].balance
            local sendACNum = result[1].UID
            print(source, sendid, sendfn, sendln, sendbal, sendACNum)
            -- TriggerClientEvent("bank:SData", source, sendid, sendfn, sendln, sendbal)
    end) 
end)

function PlayerIdentifier(type, id)
    local identifiers = {}
    local numIdentifiers = GetNumPlayerIdentifiers(id)

    for a = 0, numIdentifiers do
        table.insert(identifiers, GetPlayerIdentifier(id, a))
    end

    for b = 1, #identifiers do
        if string.find(identifiers[b], type, 1) then
            return identifiers[b]
        end
    end
    return false
end

