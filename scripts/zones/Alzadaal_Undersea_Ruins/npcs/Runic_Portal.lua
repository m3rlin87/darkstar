-----------------------------------
-- Area: Alzadaal Undersea Ruins
--  NPC: Runic Portal
-- Arrapago Reef Teleporter Back to Aht Urgan Whitegate
-- !pos 206.500 -1.220 33.500 72
-- !pos 206.500 -1.220 6.500 72
-----------------------------------
local ID = require("scripts/zones/Alzadaal_Undersea_Ruins/IDs");
require("scripts/globals/teleports");
require("scripts/globals/missions");
require("scripts/globals/besieged");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local Z = player:getZPos();

    if (Z > 27.5 and Z > 39.5) then
        -- Northern portal.
        if (player:getCurrentMission(TOAU) == IMMORTAL_SENTRIES and player:getVar("AhtUrganStatus") == 1) then
            player:startEvent(121);
        elseif (player:getCurrentMission(TOAU) > IMMORTAL_SENTRIES) then
            if (hasRunicPortal(player,6) == 1) then
                player:startEvent(117);
            else
                player:startEvent(121);
            end
        else
            player:messageSpecial(ID.text.RESPONSE);
        end
    else
        -- Southern portal.
        if (player:getCurrentMission(TOAU) == IMMORTAL_SENTRIES and player:getVar("AhtUrganStatus") == 1) then
            player:startEvent(122);
        elseif (player:getCurrentMission(TOAU) > IMMORTAL_SENTRIES) then
            if (hasRunicPortal(player,6) == 1) then
                player:startEvent(118);
            else
                player:startEvent(122);
            end
        else
            player:messageSpecial(ID.text.RESPONSE);
        end
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if ((csid == 121 or csid == 122) and option == 1) then
        player:addNationTeleport(AHTURHGAN,64);
        dsp.teleport.toChamberOfPassage(player);
    elseif ((csid == 117 or csid == 118) and option == 1) then
        dsp.teleport.toChamberOfPassage(player);
    end

end;