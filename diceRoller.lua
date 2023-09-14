roll_parameters = {}
roll_parameters.click_function = 'clicked'
roll_parameters.function_owner = self
roll_parameters.label = 'Roll'
roll_parameters.position = {0,0.3,0.3}
roll_parameters.rotation = {0,180,0}
roll_parameters.width = 220
roll_parameters.height = 120
roll_parameters.font_size = 100

function clicked(clicked_object, playerColorClicked)
    this_guid = self.getGUID()
    d = getObjectFromGUID(this_guid)


    name = d.getName()
    rando = math.random(1, tonumber(name))
    d.setValue(rando)
    printToAll(Player[playerColorClicked].steam_name .. ' rolled a ' .. rando .. ' on a D' .. name .. '!', playerColorClicked)
end

function onload()
    self.createButton(roll_parameters)
end
