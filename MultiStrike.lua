ab = {}
ab.click_function = 'clicked'
ab.function_owner = self
ab.label = ''
ab.position = {0,1,0}
ab.rotation = {0,180,0}
ab.width = 400
ab.height = 200
ab.font_size = 100

reset = {}
reset.click_function = 'check'
reset.function_owner = self
reset.label = 'Off Cooldown:\n Turn '
reset.position = {0,5,0}
reset.rotation = {0,180,0}
reset.width = 400
reset.height = 120
reset.font_size = 55
reset.font_color = {255, 255, 0}
reset.color = {0,0,0}

oh  = {}
oh.click_function = 'GoBack'
oh.function_owner = self
oh.label = ''
oh.position = {-0.4,5,-0.4}
oh.rotation = {0,180,0}
oh.width = 100
oh.height = 100
oh.color = {0,0,0}

function clicked(clicked_object, playerColorClicked)
    blunt = getObjectFromGUID("9ae24d")
    turn = tonumber(blunt.getName())

    this_guid = self.getGUID()
    d = getObjectFromGUID(this_guid)
    dam = tonumber(d.getGMNotes())

    stat = getObjectFromGUID("36f64d")
    totalDice = stat.getName()
    rando = math.random(1, totalDice)


    if rando == 1 then
        printToAll('While attempting to perform Fire Ball Quartet, with a NAT 1 ' .. Player[playerColorClicked].steam_name .. " has gotten a CRIT FAIL!", playerColorClicked)
        printToAll('Fire Ball Quartet will be off cooldown on turn ' .. turn + 10)
    else
        if rando == tonumber(totalDice) then
            rando = (rando * 2)
            printToAll('CRIT')
        end

        total = rando + dam
        printToAll('On a D' .. totalDice .. ' ' .. Player[playerColorClicked].steam_name .. ' rolled a ' .. rando .. ' to hit with Fire Ball Quartet. This will deal ' .. total .. ' damage!', playerColorClicked)

        printToAll('Fire Ball Quartet will be off cooldown on turn ' .. turn + 10)
    end

    reset.label = 'Off Cooldown\n Turn ' .. (turn + 10)
    checker = turn + 10

    self.removeButton(0)
    self.createButton(reset)
    self.createButton(oh)
end

function check(clicked_object, playerColorClicked)
    printToAll('Gotta wait for Fire Ball Quartet to be off cooldown', playerColorClicked)
end

function GoBack()
    checker = 999
    printToAll('Manually resetting cooldown of Fire Ball Quartet')
    self.removeButton(1)
    self.removeButton(0)
    self.createButton(ab)
end

function resetCD()
    blunt = getObjectFromGUID("9ae24d")
    turn = tonumber(blunt.getName())
    if turn >= tonumber(checker) then
        checker = 999
        printToAll('Fire Ball Quartet is off cooldown')
        self.removeButton(1)
        self.removeButton(0)
        self.createButton(ab)
    end
end

function combatReset()
    checker = 999
    buttons = self.getButtons()
    for index, data in ipairs(buttons) do
        self.removeButton(index - 1)
    end

    self.createButton(ab)
end

function onload()
    self.createButton(ab)
    checker = 999
end
