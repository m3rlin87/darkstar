-----------------------------------
-- Area: Cape Teriggan
--  MOB: Greater Manticore
-- Note: Place Holder for Frostmane
-----------------------------------
local ID = require("scripts/zones/Cape_Teriggan/IDs");
require("scripts/globals/regimes")
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 108, 2, dsp.regime.type.FIELDS)
end;

function onMobDespawn(mob)
    phOnDespawn(mob,ID.mob.FROSTMANE_PH,5,math.random(3600,21600)); -- 1 to 6 hours
end;
