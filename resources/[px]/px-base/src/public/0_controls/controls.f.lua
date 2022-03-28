keyTypes = {
    ['default'] = Control:new({
        keys = {12, 13, 14, 15, 16, 17, 56, 57, 80, 99, 100, 115, 116, 117, 118, 121, 157, 158, 159, 160, 161, 162, 163, 164, 165, 261, 261},
        inControl = true
    }),
    ['movement'] = Control:new({
        keys = {21, 22, 23, 26, 30, 31, 32, 33, 34, 35, 36},
        inControl = true
    }),
    ['combat'] = Control:new({
        keys = {24, 25, 37, 38, 39, 40, 41, 42, 43, 44, 45, 47, 50, 58, 68, 69, 70, 91, 92, 140, 141, 142, 143, 257, 263, 264},
        inControl = true
    })
}

Px.keys = {}

function Px.keys:toggle(which)
    which = type(which) == 'table' and which or { which }
    for i = 1, #which do
        if keyTypes[which[i]] ~= nil then
            if keyTypes[which[i]].inControl then
                keyTypes[which[i]]:disable()
                print(which[i]..' disabled')
            else
                keyTypes[which[i]]:enable()
                print(which[i]..' enabled')
            end
        else
            print('key type doesn\'t exist')
        end
    end
end