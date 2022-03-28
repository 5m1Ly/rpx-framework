--[[

    ['placeholder'] = {
        weight  = number  -> a value of 1 equals 1 gram so 1000 equals 1 kilo,             
        price   = number  -> a value of 1 equals 1 cent so 100 equals 1 dollar,
        usable  = boolean -> should be set to true if the item is usable,
        unique  = boolean -> should be set to true if the item contains unique information,
        combine = boolean -> should be set to true if the item can be combined,
        name    = string  -> should be equal to the table key,
        label   = string  -> the value will be used as the item name within the ui,
        image   = string  -> should be equal to the image name (png file extention will be added automaticly),
        disc    = string  -> the value will be used as the item discription within the ui,
    },

    -- COPY THE LINE BELOW FOR NEW ITEM --
    ['item'] = { weight = 0, price = 0, usable = false, unique = false, combine = false, name = 'item', label = 'Item', image = 'item', discription = 'Item.'},

]]

items = {
    ['water']		= { weight = 50,	price = 15,		usable = true, 	unique = false, combine = false, name = 'water',		label = 'Water',		image = 'water',		discription = 'Lekker flesje vrouwlijke hormonen.'},
    ['tosti']		= { weight = 50,	price = 30,		usable = true, 	unique = false, combine = false, name = 'tosti',		label = 'Tosti',		image = 'tosti',		discription = 'Vette ham kaas tosti.'},
    ['phone']		= { weight = 450,	price = 35000,	usable = false, unique = false, combine = false, name = 'phone',		label = 'Telefoon',		image = 'phone',		discription = 'Geavanceerd apparaat vol kennis.'},
    ['card-id']		= { weight = 0,		price = 4750,	usable = true, 	unique = true, 	combine = false, name = 'card-id',		label = 'Id Kaart',		image = 'card-id',		discription = 'Een pas met je gegevens er op.'},
    ['card-drive']	= { weight = 0,		price = 4750,	usable = true,	unique = true, 	combine = false, name = 'card-drive',	label = 'Rij Bewijs',	image = 'card-drive',	discription = 'Een pas die aangeeft welke voertuigen jij mag besturen.'},
}
