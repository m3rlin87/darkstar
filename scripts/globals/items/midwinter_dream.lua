-----------------------------------------
-- ID: 5543
-- Item: midwinter_dream
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- TODO: Group Effect
-- HP 10
-- MP 8% Cap 60
-- Intelligence 2
-- HP Recovered while healing 2
-- MP Recovered while healing 2
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,5543)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.HP, 10)
    target:addMod(dsp.mod.INT, 2)
    target:addMod(dsp.mod.FOOD_MPP, 8)
    target:addMod(dsp.mod.FOOD_MP_CAP, 60)
    target:addMod(dsp.mod.HPHEAL, 2)
    target:addMod(dsp.mod.MPHEAL, 2)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 10)
    target:delMod(dsp.mod.INT, 2)
    target:delMod(dsp.mod.FOOD_MPP, 8)
    target:delMod(dsp.mod.FOOD_MP_CAP, 60)
    target:delMod(dsp.mod.HPHEAL, 2)
    target:delMod(dsp.mod.MPHEAL, 2)
end
