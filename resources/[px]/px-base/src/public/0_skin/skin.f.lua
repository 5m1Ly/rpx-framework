Px.skin = {}
Px.skin.data = {
    ["face"] 					= { item = 0, 	texture = 0, defaultItem = 0, 	defaultTexture = 0, },
    ["pants"] 					= { item = 0, 	texture = 0, defaultItem = 0, 	defaultTexture = 0, },
    ["hair"] 					= { item = 0, 	texture = 0, defaultItem = 0, 	defaultTexture = 0, },
    ["eyebrows"] 				= { item = -1, 	texture = 1, defaultItem = -1, 	defaultTexture = 1, },
    ["beard"] 					= { item = -1, 	texture = 1, defaultItem = -1, 	defaultTexture = 1, },
    ["blush"] 					= { item = -1, 	texture = 1, defaultItem = -1, 	defaultTexture = 1, },
    ["lipstick"] 				= { item = -1, 	texture = 1, defaultItem = -1, 	defaultTexture = 1, },
    ["makeup"] 					= { item = -1, 	texture = 1, defaultItem = -1, 	defaultTexture = 1, },
    ["ageing"] 					= { item = -1, 	texture = 0, defaultItem = -1, 	defaultTexture = 0, },
    ["arms"] 					= { item = 0, 	texture = 0, defaultItem = 0, 	defaultTexture = 0, },
    ["t-shirt"] 				= { item = 15, 	texture = 0, defaultItem = 1, 	defaultTexture = 0, },
    ["torso2"] 					= { item = 0, 	texture = 0, defaultItem = 0, 	defaultTexture = 0, },
    ["vest"] 					= { item = 0, 	texture = 0, defaultItem = 0, 	defaultTexture = 0, },
    ["bag"] 					= { item = 0, 	texture = 0, defaultItem = 0, 	defaultTexture = 0, },
    ["shoes"] 					= { item = 0, 	texture = 0, defaultItem = 1, 	defaultTexture = 0, },
    ["mask"] 					= { item = 0, 	texture = 0, defaultItem = 0, 	defaultTexture = 0, },
    ["hat"] 					= { item = -1, 	texture = 0, defaultItem = -1, 	defaultTexture = 0, },
    ["glass"] 					= { item = 0, 	texture = 0, defaultItem = 0, 	defaultTexture = 0, },
    ["ear"] 					= { item = -1, 	texture = 0, defaultItem = -1, 	defaultTexture = 0, },
    ["watch"] 					= { item = -1, 	texture = 0, defaultItem = -1, 	defaultTexture = 0, },
    ["bracelet"] 				= { item = -1, 	texture = 0, defaultItem = -1, 	defaultTexture = 0, },
    ["accessory"] 				= { item = 0, 	texture = 0, defaultItem = 0, 	defaultTexture = 0, },
    ["decals"] 					= { item = 0, 	texture = 0, defaultItem = 0, 	defaultTexture = 0, },
    ["eye_color"] 				= { item = -1, 	texture = 0, defaultItem = -1, 	defaultTexture = 0, },
    ["moles"] 					= { item = 0, 	texture = 0, defaultItem = -1, 	defaultTexture = 0, },
    ["nose_0"] 					= { item = 0, 	texture = 0, defaultItem = 0, 	defaultTexture = 0, },
    ["nose_1"] 					= { item = 0, 	texture = 0, defaultItem = 0, 	defaultTexture = 0, },
    ["nose_2"] 					= { item = 0, 	texture = 0, defaultItem = 0, 	defaultTexture = 0, },
    ["nose_3"] 					= { item = 0, 	texture = 0, defaultItem = 0, 	defaultTexture = 0, },
    ["nose_4"] 					= { item = 0, 	texture = 0, defaultItem = 0, 	defaultTexture = 0, },
    ["nose_5"] 					= { item = 0, 	texture = 0, defaultItem = 0, 	defaultTexture = 0, },
    ["cheek_1"] 				= { item = 0, 	texture = 0, defaultItem = 0, 	defaultTexture = 0, },
    ["cheek_2"] 				= { item = 0, 	texture = 0, defaultItem = 0, 	defaultTexture = 0, },
    ["cheek_3"] 				= { item = 0, 	texture = 0, defaultItem = 0, 	defaultTexture = 0, },
    ["eye_opening"] 			= { item = 0, 	texture = 0, defaultItem = 0, 	defaultTexture = 0, },
    ["lips_thickness"] 			= { item = 0, 	texture = 0, defaultItem = 0, 	defaultTexture = 0, },
    ["jaw_bone_width"] 			= { item = 0, 	texture = 0, defaultItem = 0, 	defaultTexture = 0, },
    ["eyebrown_high"] 			= { item = 0, 	texture = 0, defaultItem = 0, 	defaultTexture = 0, },
    ["eyebrown_forward"] 		= { item = 0, 	texture = 0, defaultItem = 0, 	defaultTexture = 0, },
    ["jaw_bone_back_lenght"] 	= { item = 0, 	texture = 0, defaultItem = 0, 	defaultTexture = 0, },
    ["chimp_bone_lowering"] 	= { item = 0, 	texture = 0, defaultItem = 0, 	defaultTexture = 0, },
    ["chimp_bone_lenght"] 		= { item = 0, 	texture = 0, defaultItem = 0, 	defaultTexture = 0, },
    ["chimp_bone_width"] 		= { item = 0, 	texture = 0, defaultItem = 0, 	defaultTexture = 0, },
    ["chimp_hole"] 				= { item = 0, 	texture = 0, defaultItem = 0, 	defaultTexture = 0, },
    ["neck_thikness"] 			= { item = 0, 	texture = 0, defaultItem = 0, 	defaultTexture = 0, },
}

function Px.skin.setVariation(data)

    local ped = PlayerPedId()
    local clothingCategory = data.clothingType
    local type = data.type
    local item = data.articleNumber

    if clothingCategory == "pants" then
        if type == "item" then
            SetPedComponentVariation(ped, 4, item, 0, 0)
            Px.skin.data["pants"].item = item
        elseif type == "texture" then
            local curItem = GetPedDrawableVariation(ped, 4)
            SetPedComponentVariation(ped, 4, curItem, item, 0)
            Px.skin.data["pants"].texture = item
        end
    elseif clothingCategory == "face" then
        if type == "item" then
            SetPedHeadBlendData(ped, tonumber(item), tonumber(item), tonumber(item), Px.skin.data["face"].texture, Px.skin.data["face"].texture, Px.skin.data["face"].texture, 1.0, 1.0, 1.0, true)
            Px.skin.data["face"].item = item
        elseif type == "texture" then
            SetPedHeadBlendData(ped, Px.skin.data["face"].item, Px.skin.data["face"].item, Px.skin.data["face"].item, item, item, item, 1.0, 1.0, 1.0, true)
            Px.skin.data["face"].texture = item
        end
    elseif clothingCategory == "hair" then
        SetPedHeadBlendData(ped, Px.skin.data["face"].item, Px.skin.data["face"].item, Px.skin.data["face"].item, Px.skin.data["face"].texture, Px.skin.data["face"].texture, Px.skin.data["face"].texture, 1.0, 1.0, 1.0, true)
        if type == "item" then
            SetPedComponentVariation(ped, 2, item, 0, 0)
            Px.skin.data["hair"].item = item
        elseif type == "texture" then
            SetPedHairColor(ped, item, item)
            Px.skin.data["hair"].texture = item
        end
    elseif clothingCategory == "eyebrows" then
        if type == "item" then
            SetPedHeadOverlay(ped, 2, item, 1.0)
            Px.skin.data["eyebrows"].item = item
        elseif type == "texture" then
            SetPedHeadOverlayColor(ped, 2, 1, item, 0)
            Px.skin.data["eyebrows"].texture = item
        end
    elseif clothingCategory == "beard" then
        if type == "item" then
            SetPedHeadOverlay(ped, 1, item, 1.0)
            Px.skin.data["beard"].item = item
        elseif type == "texture" then
            SetPedHeadOverlayColor(ped, 1, 1, item, 0)
            Px.skin.data["beard"].texture = item
        end
    elseif clothingCategory == "blush" then
        if type == "item" then
            SetPedHeadOverlay(ped, 5, item, 1.0)
            Px.skin.data["blush"].item = item
        elseif type == "texture" then
            SetPedHeadOverlayColor(ped, 5, 1, item, 0)
            Px.skin.data["blush"].texture = item
        end
    elseif clothingCategory == "lipstick" then
        if type == "item" then
            SetPedHeadOverlay(ped, 8, item, 1.0)
            Px.skin.data["lipstick"].item = item
        elseif type == "texture" then
            SetPedHeadOverlayColor(ped, 8, 1, item, 0)
            Px.skin.data["lipstick"].texture = item
        end
    elseif clothingCategory == "makeup" then
        if type == "item" then
            SetPedHeadOverlay(ped, 4, item, 1.0)
            Px.skin.data["makeup"].item = item
        elseif type == "texture" then
            SetPedHeadOverlayColor(ped, 4, 1, item, 0)
            Px.skin.data["makeup"].texture = item
        end
    elseif clothingCategory == "ageing" then
        if type == "item" then
            SetPedHeadOverlay(ped, 3, item, 1.0)
            Px.skin.data["ageing"].item = item
        elseif type == "texture" then
            SetPedHeadOverlayColor(ped, 3, 1, item, 0)
            Px.skin.data["ageing"].texture = item
        end
    elseif clothingCategory == "arms" then
        if type == "item" then
            SetPedComponentVariation(ped, 3, item, 0, 2)
            Px.skin.data["arms"].item = item
        elseif type == "texture" then
            local curItem = GetPedDrawableVariation(ped, 3)
            SetPedComponentVariation(ped, 3, curItem, item, 0)
            Px.skin.data["arms"].texture = item
        end
     elseif clothingCategory == "eye_color" then
        if type == "item" then
            -- SetPedEyeColor(ped, 12, item, 0, 2)
            -- Px.skin.data["arms"].item = item
            SetPedEyeColor(ped, item)
            Px.skin.data["eye_color"].item = item
        elseif type == "texture" then
            -- local curItem = GetPedDrawableVariation(ped, 1)
            -- SetPedEyeColor(ped, item)
            -- Px.skin.data["eye_color"].texture = item
        end
    elseif clothingCategory == "moles" then
        if type == "item" then
            -- print(item)
            -- SetPedHeadOverlay(ped, 3, item, 1.0)
            -- print(item)
            SetPedHeadOverlay(ped, 9, item, 1.0)
            Px.skin.data["moles"].item = item
        elseif type == "texture" then
            local curItem = GetPedDrawableVariation(ped, 9)
            -- (data['moles'].texture / 10) + 0.0
            -- local curItem = GetPedDrawableVariation(ped, 9)
            local newitem = (item / 10)
            -- print(newitem)
            SetPedHeadOverlayColor(ped, 9, curItem, newitem)
            Px.skin.data["moles"].texture = item
        end
    elseif clothingCategory == "nose_0" then
        if type == "item" then
            local newitem = (item / 10)
            -- print(newitem)
            SetPedFaceFeature(ped, 0, newitem)
            Px.skin.data["nose_0"].item = item
        elseif type == "texture" then
        end

    elseif clothingCategory == "nose_1" then
        if type == "item" then
            local newitem = (item / 10)
            -- print(newitem)
            SetPedFaceFeature(ped, 1, newitem)
            Px.skin.data["nose_1"].item = item
        elseif type == "texture" then

        end
    elseif clothingCategory == "nose_2" then
        if type == "item" then
            -- SetPedEyeColor(ped, 12, item, 0, 2)
            -- Px.skin.data["arms"].item = item
            local newitem = (item / 10)
            -- print(newitem)
            SetPedFaceFeature(ped, 2, newitem)
            Px.skin.data["nose_2"].item = item
        elseif type == "texture" then
            -- local curItem = GetPedDrawableVariation(ped, 1)

        end
    elseif clothingCategory == "nose_3" then
        if type == "item" then
            -- SetPedEyeColor(ped, 12, item, 0, 2)
            -- Px.skin.data["arms"].item = item
            local newitem = (item / 10)
            -- print(newitem)
            SetPedFaceFeature(ped, 3, newitem)
            Px.skin.data["nose_3"].item = item
        elseif type == "texture" then
            -- local curItem = GetPedDrawableVariation(ped, 1)

        end
    elseif clothingCategory == "nose_4" then
        if type == "item" then
            -- SetPedEyeColor(ped, 12, item, 0, 2)
            -- Px.skin.data["arms"].item = item
            local newitem = (item / 10)
            -- print(newitem)
            SetPedFaceFeature(ped, 4, newitem)
            Px.skin.data["nose_4"].item = item
        elseif type == "texture" then
            -- local curItem = GetPedDrawableVariation(ped, 1)

        end
    elseif clothingCategory == "nose_5" then
        if type == "item" then
            -- SetPedEyeColor(ped, 12, item, 0, 2)
            -- Px.skin.data["arms"].item = item
            local newitem = (item / 10)
            -- print(newitem)
            SetPedFaceFeature(ped, 5, newitem)
            Px.skin.data["nose_5"].item = item
        elseif type == "texture" then
            -- local curItem = GetPedDrawableVariation(ped, 1)

        end
    elseif clothingCategory == "eyebrown_high" then
        if type == "item" then
            -- SetPedEyeColor(ped, 12, item, 0, 2)
            -- Px.skin.data["arms"].item = item
            local newitem = (item / 10)
            -- print(newitem)
            SetPedFaceFeature(ped, 6, newitem)
            Px.skin.data["eyebrown_high"].item = item
        elseif type == "texture" then
            -- local curItem = GetPedDrawableVariation(ped, 1)

        end
    elseif clothingCategory == "eyebrown_forward" then
        if type == "item" then
            -- SetPedEyeColor(ped, 12, item, 0, 2)
            -- Px.skin.data["arms"].item = item
            local newitem = (item / 10)
            -- print(newitem)
            SetPedFaceFeature(ped, 7, newitem)
            Px.skin.data["eyebrown_forward"].item = item
        elseif type == "texture" then
            -- local curItem = GetPedDrawableVariation(ped, 1)

        end
    elseif clothingCategory == "cheek_1" then
        if type == "item" then
            -- SetPedEyeColor(ped, 12, item, 0, 2)
            -- Px.skin.data["arms"].item = item
            local newitem = (item / 10)
            -- print(newitem)
            SetPedFaceFeature(ped, 8, newitem)
            Px.skin.data["cheek_1"].item = item
        elseif type == "texture" then

            -- local curItem = GetPedDrawableVariation(ped, 1)

        end
    elseif clothingCategory == "cheek_2" then
        if type == "item" then
            -- SetPedEyeColor(ped, 12, item, 0, 2)
            -- Px.skin.data["arms"].item = item
            local newitem = (item / 10)
            -- print(newitem)
            SetPedFaceFeature(ped, 9, newitem)
            Px.skin.data["cheek_1"].item = item
        elseif type == "texture" then
            -- local curItem = GetPedDrawableVariation(ped, 1)

        end
    elseif clothingCategory == "cheek_3" then
        if type == "item" then
            -- SetPedEyeColor(ped, 12, item, 0, 2)
            -- Px.skin.data["arms"].item = item
            local newitem = (item / 10)
            -- print(newitem)
            SetPedFaceFeature(ped, 10, newitem)
            Px.skin.data["cheek_3"].item = item
        elseif type == "texture" then
            -- local curItem = GetPedDrawableVariation(ped, 1)

        end
    elseif clothingCategory == "eye_opening" then
        if type == "item" then
            -- SetPedEyeColor(ped, 12, item, 0, 2)
            -- Px.skin.data["arms"].item = item
            local newitem = (item / 10)
            -- print(newitem)
            SetPedFaceFeature(ped, 11, newitem)
            Px.skin.data["eye_opening"].item = item
        elseif type == "texture" then
            -- local curItem = GetPedDrawableVariation(ped, 1)

        end
    elseif clothingCategory == "lips_thickness" then
        if type == "item" then
            -- SetPedEyeColor(ped, 12, item, 0, 2)
            -- Px.skin.data["arms"].item = item
            local newitem = (item / 10)
            -- print(newitem)
            SetPedFaceFeature(ped, 12, newitem)
            Px.skin.data["lips_thickness"].item = item
        elseif type == "texture" then
            -- local curItem = GetPedDrawableVariation(ped, 1)

        end
    elseif clothingCategory == "jaw_bone_width" then
        if type == "item" then
            -- SetPedEyeColor(ped, 12, item, 0, 2)
            -- Px.skin.data["arms"].item = item
            local newitem = (item / 10)
            -- print(newitem)
            SetPedFaceFeature(ped, 13, newitem)
            Px.skin.data["jaw_bone_width"].item = item
        elseif type == "texture" then
            -- local curItem = GetPedDrawableVariation(ped, 1)

        end
    elseif clothingCategory == "jaw_bone_back_lenght" then
        if type == "item" then
            -- SetPedEyeColor(ped, 12, item, 0, 2)
            -- Px.skin.data["arms"].item = item
            local newitem = (item / 10)
            -- print(newitem)
            SetPedFaceFeature(ped, 14, newitem)
            Px.skin.data["jaw_bone_back_lenght"].item = item
        elseif type == "texture" then
            -- local curItem = GetPedDrawableVariation(ped, 1)

        end
    elseif clothingCategory == "chimp_bone_lowering" then
        if type == "item" then
            -- SetPedEyeColor(ped, 12, item, 0, 2)
            -- Px.skin.data["arms"].item = item
            local newitem = (item / 10)
            -- print(newitem)
            SetPedFaceFeature(ped, 15, newitem)
            Px.skin.data["chimp_bone_lowering"].item = item
        elseif type == "texture" then
            -- local curItem = GetPedDrawableVariation(ped, 1)

        end
    elseif clothingCategory == "chimp_bone_lenght" then
        if type == "item" then
            -- SetPedEyeColor(ped, 12, item, 0, 2)
            -- Px.skin.data["arms"].item = item
            local newitem = (item / 10)
            -- print(newitem)
            SetPedFaceFeature(ped, 16, newitem)
            Px.skin.data["chimp_bone_lenght"].item = item
        elseif type == "texture" then
            -- local curItem = GetPedDrawableVariation(ped, 1)

        end
    elseif clothingCategory == "chimp_bone_width" then
        if type == "item" then
            -- SetPedEyeColor(ped, 12, item, 0, 2)
            -- Px.skin.data["arms"].item = item
            local newitem = (item / 10)
            -- print(newitem)
            SetPedFaceFeature(ped, 17, newitem)
            Px.skin.data["chimp_bone_width"].item = item
        elseif type == "texture" then
            -- local curItem = GetPedDrawableVariation(ped, 1)

        end
    elseif clothingCategory == "chimp_hole" then
        if type == "item" then
            -- SetPedEyeColor(ped, 12, item, 0, 2)
            -- Px.skin.data["arms"].item = item
            local newitem = (item / 10)
            -- print(newitem)
            SetPedFaceFeature(ped, 18, newitem)
            Px.skin.data["chimp_hole"].item = item
        elseif type == "texture" then
            -- local curItem = GetPedDrawableVariation(ped, 1)

        end
    elseif clothingCategory == "neck_thikness" then
        if type == "item" then
            -- SetPedEyeColor(ped, 12, item, 0, 2)
            -- Px.skin.data["arms"].item = item
            local newitem = (item / 10)
            -- print(newitem)
            SetPedFaceFeature(ped, 19, newitem)
            Px.skin.data["chimp_hole"].item = item
        elseif type == "texture" then
            -- local curItem = GetPedDrawableVariation(ped, 1)

        end
    elseif clothingCategory == "t-shirt" then
        if type == "item" then
            SetPedComponentVariation(ped, 8, item, 0, 2)
            Px.skin.data["t-shirt"].item = item
        elseif type == "texture" then
            local curItem = GetPedDrawableVariation(ped, 8)
            SetPedComponentVariation(ped, 8, curItem, item, 0)
            Px.skin.data["t-shirt"].texture = item
        end
    elseif clothingCategory == "vest" then
        if type == "item" then
            SetPedComponentVariation(ped, 9, item, 0, 2)
            Px.skin.data["vest"].item = item
        elseif type == "texture" then
            SetPedComponentVariation(ped, 9, Px.skin.data["vest"].item, item, 0)
            Px.skin.data["vest"].texture = item
        end
    elseif clothingCategory == "bag" then
        if type == "item" then
            SetPedComponentVariation(ped, 5, item, 0, 2)
            Px.skin.data["bag"].item = item
        elseif type == "texture" then
            SetPedComponentVariation(ped, 5, Px.skin.data["bag"].item, item, 0)
            Px.skin.data["bag"].texture = item
        end
    elseif clothingCategory == "decals" then
        if type == "item" then
            SetPedComponentVariation(ped, 10, item, 0, 2)
            Px.skin.data["decals"].item = item
        elseif type == "texture" then
            SetPedComponentVariation(ped, 10, Px.skin.data["decals"].item, item, 0)
            Px.skin.data["decals"].texture = item
        end
    elseif clothingCategory == "accessory" then
        if type == "item" then
            SetPedComponentVariation(ped, 7, item, 0, 2)
            Px.skin.data["accessory"].item = item
        elseif type == "texture" then
            SetPedComponentVariation(ped, 7, Px.skin.data["accessory"].item, item, 0)
            Px.skin.data["accessory"].texture = item
        end
    elseif clothingCategory == "torso2" then
        if type == "item" then
            SetPedComponentVariation(ped, 11, item, 0, 2)
            Px.skin.data["torso2"].item = item
        elseif type == "texture" then
            local curItem = GetPedDrawableVariation(ped, 11)
            SetPedComponentVariation(ped, 11, curItem, item, 0)
            Px.skin.data["torso2"].texture = item
        end
    elseif clothingCategory == "shoes" then
        if type == "item" then
            SetPedComponentVariation(ped, 6, item, 0, 2)
            Px.skin.data["shoes"].item = item
        elseif type == "texture" then
            local curItem = GetPedDrawableVariation(ped, 6)
            SetPedComponentVariation(ped, 6, curItem, item, 0)
            Px.skin.data["shoes"].texture = item
        end
    elseif clothingCategory == "mask" then
        if type == "item" then
            SetPedComponentVariation(ped, 1, item, 0, 2)
            Px.skin.data["mask"].item = item
        elseif type == "texture" then
            local curItem = GetPedDrawableVariation(ped, 1)
            SetPedComponentVariation(ped, 1, curItem, item, 0)
            Px.skin.data["mask"].texture = item
        end
    elseif clothingCategory == "hat" then
        if type == "item" then
            if item ~= -1 then
                SetPedPropIndex(ped, 0, item, Px.skin.data["hat"].texture, true)
            else
                ClearPedProp(ped, 0)
            end
            Px.skin.data["hat"].item = item
        elseif type == "texture" then
            SetPedPropIndex(ped, 0, Px.skin.data["hat"].item, item, true)
            Px.skin.data["hat"].texture = item
        end
    elseif clothingCategory == "glass" then
        if type == "item" then
            if item ~= -1 then
                SetPedPropIndex(ped, 1, item, Px.skin.data["glass"].texture, true)
                Px.skin.data["glass"].item = item
            else
                ClearPedProp(ped, 1)
            end
        elseif type == "texture" then
            SetPedPropIndex(ped, 1, Px.skin.data["glass"].item, item, true)
            Px.skin.data["glass"].texture = item
        end
    elseif clothingCategory == "ear" then
        if type == "item" then
            if item ~= -1 then
                SetPedPropIndex(ped, 2, item, Px.skin.data["ear"].texture, true)
            else
                ClearPedProp(ped, 2)
            end
            Px.skin.data["ear"].item = item
        elseif type == "texture" then
            SetPedPropIndex(ped, 2, Px.skin.data["ear"].item, item, true)
            Px.skin.data["ear"].texture = item
        end
    elseif clothingCategory == "watch" then
        if type == "item" then
            if item ~= -1 then
                SetPedPropIndex(ped, 6, item, Px.skin.data["watch"].texture, true)
            else
                ClearPedProp(ped, 6)
            end
            Px.skin.data["watch"].item = item
        elseif type == "texture" then
            SetPedPropIndex(ped, 6, Px.skin.data["watch"].item, item, true)
            Px.skin.data["watch"].texture = item
        end
    elseif clothingCategory == "bracelet" then
        if type == "item" then
            if item ~= -1 then
                SetPedPropIndex(ped, 7, item, Px.skin.data["bracelet"].texture, true)
            else
                ClearPedProp(ped, 7)
            end
            Px.skin.data["bracelet"].item = item
        elseif type == "texture" then
            SetPedPropIndex(ped, 7, Px.skin.data["bracelet"].item, item, true)
            Px.skin.data["bracelet"].texture = item
        end
    end

    -- GetMaxValues()
end

function Px.skin:set(skin)

	local ped = PlayerPedId()
	local model = GetHashKey(skin)

	Citizen.CreateThread(function()

		Px.models:load(model)

		SetPlayerModel(PlayerId(), model)
		SetPedComponentVariation(PlayerPedId(), 0, 0, 0, 2)

		for k, v in pairs(Px.skin.data) do
			if skin == "mp_m_freemode_01" or skin == "mp_f_freemode_01" then
				Px.skin.setVariation({
					clothingType = k,
					articleNumber = v.defaultItem,
					type = "item",
				})
			else
				if k ~= "face" and k ~= "hair" then
					Px.skin.setVariation({
						clothingType = k,
						articleNumber = v.defaultItem,
						type = "item",
					})
				end
			end

			if skin == "mp_m_freemode_01" or skin == "mp_f_freemode_01" then
				Px.skin.setVariation({
					clothingType = k,
					articleNumber = v.defaultTexture,
					type = "texture",
				})
			else
				if k ~= "face" and k ~= "hair" then
					Px.skin.setVariation({
						clothingType = k,
						articleNumber = v.defaultTexture,
						type = "texture",
					})
				end
			end
		end

	end)

end