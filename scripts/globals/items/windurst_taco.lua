-----------------------------------------
-- ID: 5172
-- Item: windurst_taco
-- Food Effect: 30Min, All Races
-----------------------------------------
-- MP 20
-- Vitality -1
-- Agility 5
-- MP Recovered While Healing 1
-- Ranged Accuracy % 8 (cap 10)
-- Ranged Attack +1
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if target:hasStatusEffect(dsp.effect.FOOD) or target:hasStatusEffect(dsp.effect.FIELD_SUPPORT_FOOD) then
        result = 246
    end
    return result
end

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5172)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.MP, 20)
    target:addMod(dsp.mod.VIT, -1)
    target:addMod(dsp.mod.AGI, 5)
    target:addMod(dsp.mod.MPHEAL, 1)
    target:addMod(dsp.mod.RATT, 1)
    target:addMod(dsp.mod.FOOD_RACCP, 8)
    target:addMod(dsp.mod.FOOD_RACC_CAP, 10)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.MP, 20)
    target:delMod(dsp.mod.VIT, -1)
    target:delMod(dsp.mod.AGI, 5)
    target:delMod(dsp.mod.MPHEAL, 1)
    target:delMod(dsp.mod.RATT, 1)
    target:delMod(dsp.mod.FOOD_RACCP, 8)
    target:delMod(dsp.mod.FOOD_RACC_CAP, 10)
end
