-----------------------------------
-- Area: Windurst Waters
--  NPC: Kyume-Romeh
--  Involved In Quest: Making Headlines, Hat in Hand
-- !pos -58 -4 23 238
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
local ID = require("scripts/zones/Windurst_Waters/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    function testflag(set,flag)
        return (set % (2*flag) >= flag)
    end

    local hatstatus = player:getQuestStatus(WINDURST,HAT_IN_HAND);
    local MakingHeadlines = player:getQuestStatus(WINDURST,MAKING_HEADLINES);
    local WildcatWindurst = player:getVar("WildcatWindurst");

    if (player:getCurrentMission(COP) == THE_ROAD_FORKS and player:getVar("MEMORIES_OF_A_MAIDEN_Status")==4) then
        player:startEvent(873);
    elseif (player:getQuestStatus(WINDURST,LURE_OF_THE_WILDCAT_WINDURST) == QUEST_ACCEPTED and player:getMaskBit(WildcatWindurst,14) == false) then
        player:startEvent(939);
    elseif ((hatstatus == 1  or player:getVar("QuestHatInHand_var2") == 1) and testflag(tonumber(player:getVar("QuestHatInHand_var")),16) == false) then
        player:startEvent(60); -- Show Off Hat
    elseif (MakingHeadlines == 1) then
        local prog = player:getVar("QuestMakingHeadlines_var");
        --  Variable to track if player has talked to 4 NPCs and a door
        --  1 = Kyume
        -- 2 = Yujuju
        -- 4 = Hiwom
        -- 8 = Umumu
        -- 16 = Mahogany Door
        if (testflag(tonumber(prog),1) == false) then
            player:startEvent(668); -- Quest progress
        else
            player:startEvent(669); -- Quest not furthered
        end
    else
        local rand = math.random(1,2);
        if (rand == 1) then
            player:startEvent(604); -- Standard Conversation
        else
            player:startEvent(393); -- Standard Conversation
        end
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 668) then
        prog = player:getVar("QuestMakingHeadlines_var");
        player:addKeyItem(dsp.ki.WINDURST_WATERS_SCOOP);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.WINDURST_WATERS_SCOOP);
        player:setVar("QuestMakingHeadlines_var",prog+1);
    elseif (csid == 60) then  -- Show Off Hat
        player:setVar("QuestHatInHand_var",player:getVar("QuestHatInHand_var")+16);
        player:setVar("QuestHatInHand_count",player:getVar("QuestHatInHand_count")+1);
    elseif (csid == 873) then
        player:setVar("MEMORIES_OF_A_MAIDEN_Status",5);
    elseif (csid == 939) then
        player:setMaskBit(player:getVar("WildcatWindurst"),"WildcatWindurst",14,true);
    end
end;
