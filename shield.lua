ab = {}
ab.click_function = 'clicked'
ab.function_owner = self
ab.label = ''
ab.position = {0,1,0}
ab.rotation = {0,180,0}
ab.width = 400
ab.height = 200
ab.font_size = 200

gao = {}
gao.click_function = 'hg'
gao.function_owner = self
gao.label = 'Gao'
gao.position = {0.25,5,-0.35}
gao.rotation = {0,180,0}
gao.width = 270
gao.height = 200
gao.font_size = 80
gao.font_color = {255, 255, 0}
gao.color = {0,0,0}

arthur = {}
arthur.click_function = 'ha'
arthur.function_owner = self
arthur.label = 'Arthur'
arthur.position = {-0.25,5,0.35}
arthur.rotation = {0,180,0}
arthur.width = 270
arthur.height = 200
arthur.font_size = 80
arthur.font_color = {255, 255, 0}
arthur.color = {0,0,0}

enji = {}
enji.click_function = 'he'
enji.function_owner = self
enji.label = 'Enji'
enji.position = {0.25,5,0}
enji.rotation = {0,180,0}
enji.width = 270
enji.height = 200
enji.font_size = 80
enji.font_color = {255, 255, 0}
enji.color = {0,0,0}

feather = {}
feather.click_function = 'hf'
feather.function_owner = self
feather.label = 'Feather'
feather.position = {-0.25,5,0}
feather.rotation = {0,180,0}
feather.width = 270
feather.height = 200
feather.font_size = 80
feather.font_color = {255, 255, 0}
feather.color = {0,0,0}

noah = {}
noah.click_function = 'hn'
noah.function_owner = self
noah.label = 'Noah'
noah.position = {0.25,5,0.35}
noah.rotation = {0,180,0}
noah.width = 270
noah.height = 200
noah.font_size = 80
noah.font_color = {255, 255, 0}
noah.color = {0,0,0}

other = {}
other.click_function = 'ho'
other.function_owner = self
other.label = 'Other'
other.position = {-0.25,5,-0.35}
other.rotation = {0,180,0}
other.width = 270
other.height = 200
other.font_size = 80
other.font_color = {255, 255, 0}
other.color = {0,0,0}

reset = {}
reset.click_function = 'check'
reset.function_owner = self
reset.label = 'Off Cooldown:\n Turn '
reset.position = {0,5,0}
reset.rotation = {0,180,0}
reset.width = 400
reset.height = 80
reset.font_size = 55
reset.font_color = {255, 255, 0}
reset.color = {0,0,0}

oh = {}
oh.click_function = 'GoBack'
oh.function_owner = self
oh.label = ''
oh.position = {-0.4,5,-0.4}
oh.rotation = {0,180,0}
oh.width = 100
oh.height = 100
oh.color = {0,0,0}

function clicked(clicked_object, playerColorClicked)
    printToAll('Noah used Natural Sheild, please select who you would like to use it on!' , playerColorClicked)
    self.removeButton(0)
    self.createButton(gao)
    self.createButton(arthur)
    self.createButton(enji)
    self.createButton(feather)
    self.createButton(noah)
    self.createButton(other)
end

function hn(clicked_object, playerColorClicked)
    hs = getObjectFromGUID("7a30b8")
    sheild = tonumber(hs.getValue())

    blunt = getObjectFromGUID("9ae24d")
    turn = tonumber(blunt.getName())

    this_guid = self.getGUID()
    d = getObjectFromGUID(this_guid)
    dam = tonumber(d.getGMNotes())

    stat = getObjectFromGUID("8c0168")
    totalDice = stat.getName()
    rando = math.random(1, totalDice)

    if rando == 1 then
        printToAll('While attempting to perform Natural Shield, with a NAT 1 ' .. Player[playerColorClicked].steam_name .. " has gotten a CRIT FAIL resulting in no sheild given!", playerColorClicked)
        printToAll('Natural Shield will be off cooldown on turn ' .. turn + 4)
    else
        if rando == tonumber(totalDice) then
            rando = (rando * 2)
            printToAll('CRIT')
        end

        total = rando + dam
        newSheild = sheild + total
        printToAll('On a D' .. totalDice .. ' ' .. Player[playerColorClicked].steam_name .. ' rolled a ' .. rando .. ' Natural Shield will give himself a ' .. total .. ' strength Earth Shield!', playerColorClicked)

        hs.setValue(newSheild)
        printToAll('Natural Shield will be off cooldown on turn ' .. turn + 4)
    end

    reset.label = 'Off Cooldown\n Turn ' .. (turn + 4)
    checker = turn + 4

    self.removeButton(5)
    self.removeButton(4)
    self.removeButton(3)
    self.removeButton(2)
    self.removeButton(1)
    self.removeButton(0)
    self.createButton(reset)
    self.createButton(oh)
end

function hg(clicked_object, playerColorClicked)
    blunt = getObjectFromGUID("9ae24d")
    turn = tonumber(blunt.getName())

    this_guid = self.getGUID()
    d = getObjectFromGUID(this_guid)
    dam = tonumber(d.getGMNotes())

    hs = getObjectFromGUID("4038e7")
    sheild = tonumber(hs.getValue())

    stat = getObjectFromGUID("8c0168")
    totalDice = stat.getName()
    rando = math.random(1, totalDice)

    if rando == 1 then
        printToAll('While attempting to perform Natural Shield, with a NAT 1 ' .. Player[playerColorClicked].steam_name .. " has gotten a CRIT FAIL resulting in no sheild given!", playerColorClicked)
        printToAll('Natural Shield will be off cooldown on turn ' .. turn + 4)
    else
        if rando == tonumber(totalDice) then
            rando = (rando * 2)
            printToAll('CRIT')
        end

        total = rando + dam
        newSheild = sheild + total
        printToAll('On a D' .. totalDice .. ' ' .. Player[playerColorClicked].steam_name .. ' rolled a ' .. rando .. ' Natural Shield will give Gao a ' .. total .. ' strength Earth Shield!', playerColorClicked)

        hs.setValue(newSheild)
        printToAll('Natural Shield will be off cooldown on turn ' .. turn + 4)
    end

    reset.label = 'Off Cooldown\n Turn ' .. (turn + 4)
    checker = turn + 4

    self.removeButton(5)
    self.removeButton(4)
    self.removeButton(3)
    self.removeButton(2)
    self.removeButton(1)
    self.removeButton(0)
    self.createButton(reset)
    self.createButton(oh)
end

function ha(clicked_object, playerColorClicked)
    hs = getObjectFromGUID("51ed45")
    sheild = tonumber(hs.getValue())

    blunt = getObjectFromGUID("9ae24d")
    turn = tonumber(blunt.getName())

    this_guid = self.getGUID()
    d = getObjectFromGUID(this_guid)
    dam = tonumber(d.getGMNotes())

    stat = getObjectFromGUID("8c0168")
    totalDice = stat.getName()
    rando = math.random(1, totalDice)

    if rando == 1 then
        printToAll('While attempting to perform Natural Shield, with a NAT 1 ' .. Player[playerColorClicked].steam_name .. " has gotten a CRIT FAIL resulting in no sheild given!", playerColorClicked)
        printToAll('Natural Shield will be off cooldown on turn ' .. turn + 4)
    else
        if rando == tonumber(totalDice) then
            rando = (rando * 2)
            printToAll('CRIT')
        end

        total = rando + dam
        newSheild = sheild + total
        printToAll('On a D' .. totalDice .. ' ' .. Player[playerColorClicked].steam_name .. ' rolled a ' .. rando .. ' Natural Shield will give Arthur a ' .. total .. ' strength Earth Shield!', playerColorClicked)

        hs.setValue(newSheild)
        printToAll('Natural Shield will be off cooldown on turn ' .. turn + 4)
    end

    reset.label = 'Off Cooldown\n Turn ' .. (turn + 4)
    checker = turn + 4

    self.removeButton(5)
    self.removeButton(4)
    self.removeButton(3)
    self.removeButton(2)
    self.removeButton(1)
    self.removeButton(0)
    self.createButton(reset)
    self.createButton(oh)
end

function he(clicked_object, playerColorClicked)
    hs = getObjectFromGUID("419eb5")
    sheild = tonumber(hs.getValue())

    blunt = getObjectFromGUID("9ae24d")
    turn = tonumber(blunt.getName())

    this_guid = self.getGUID()
    d = getObjectFromGUID(this_guid)
    dam = tonumber(d.getGMNotes())

    stat = getObjectFromGUID("8c0168")
    totalDice = stat.getName()
    rando = math.random(1, totalDice)

    if rando == 1 then
        printToAll('While attempting to perform Natural Shield, with a NAT 1 ' .. Player[playerColorClicked].steam_name .. " has gotten a CRIT FAIL resulting in no sheild given!", playerColorClicked)
        printToAll('Natural Shield will be off cooldown on turn ' .. turn + 4)
    else
        if rando == tonumber(totalDice) then
            rando = (rando * 2)
            printToAll('CRIT')
        end

        total = rando + dam
        newSheild = sheild + total
        printToAll('On a D' .. totalDice .. ' ' .. Player[playerColorClicked].steam_name .. ' rolled a ' .. rando .. ' Natural Shield will give Enji a ' .. total .. ' strength Earth Shield!', playerColorClicked)

        hs.setValue(newSheild)
        printToAll('Natural Shield will be off cooldown on turn ' .. turn + 4)
    end

    reset.label = 'Off Cooldown\n Turn ' .. (turn + 4)
    checker = turn + 4

    self.removeButton(5)
    self.removeButton(4)
    self.removeButton(3)
    self.removeButton(2)
    self.removeButton(1)
    self.removeButton(0)
    self.createButton(reset)
    self.createButton(oh)
end

function hf(clicked_object, playerColorClicked)
    hs = getObjectFromGUID("48ea45")
    sheild = tonumber(hs.getValue())

    blunt = getObjectFromGUID("9ae24d")
    turn = tonumber(blunt.getName())

    this_guid = self.getGUID()
    d = getObjectFromGUID(this_guid)
    dam = tonumber(d.getGMNotes())

    stat = getObjectFromGUID("8c0168")
    totalDice = stat.getName()
    rando = math.random(1, totalDice)

    if rando == 1 then
        printToAll('While attempting to perform Natural Shield, with a NAT 1 ' .. Player[playerColorClicked].steam_name .. " has gotten a CRIT FAIL resulting in no sheild given!", playerColorClicked)
        printToAll('Natural Shield will be off cooldown on turn ' .. turn + 4)
    else
        if rando == tonumber(totalDice) then
            rando = (rando * 2)
            printToAll('CRIT')
        end

        total = rando + dam
        newSheild = sheild + total
        printToAll('On a D' .. totalDice .. ' ' .. Player[playerColorClicked].steam_name .. ' rolled a ' .. rando .. ' Natural Shield will give Feather a ' .. total .. ' strength Earth Shield!', playerColorClicked)

        hs.setValue(newSheild)
        printToAll('Natural Shield will be off cooldown on turn ' .. turn + 4)
    end

    reset.label = 'Off Cooldown\n Turn ' .. (turn + 4)
    checker = turn + 4

    self.removeButton(5)
    self.removeButton(4)
    self.removeButton(3)
    self.removeButton(2)
    self.removeButton(1)
    self.removeButton(0)
    self.createButton(reset)
    self.createButton(oh)
end

function ho(clicked_object, playerColorClicked)
    blunt = getObjectFromGUID("9ae24d")
    turn = tonumber(blunt.getName())

    this_guid = self.getGUID()
    d = getObjectFromGUID(this_guid)
    dam = tonumber(d.getGMNotes())

    stat = getObjectFromGUID("8c0168")
    totalDice = stat.getName()
    rando = math.random(1, totalDice)

    if rando == 1 then
        printToAll('While attempting to perform Natural Shield, with a NAT 1 ' .. Player[playerColorClicked].steam_name .. " has gotten a CRIT FAIL resulting in no sheild given!", playerColorClicked)
        printToAll('Natural Shield will be off cooldown on turn ' .. turn + 4)
    else
        if rando == tonumber(totalDice) then
            rando = (rando * 2)
            printToAll('CRIT')
        end

        total = rando + dam
        printToAll('On a D' .. totalDice .. ' ' .. Player[playerColorClicked].steam_name .. ' rolled a ' .. rando .. ' Natural Shield will give someone a ' .. total .. ' strength Earth Shield!', playerColorClicked)

        printToAll('Natural Shield will be off cooldown on turn ' .. turn + 4)
    end

    reset.label = 'Off Cooldown\n Turn ' .. (turn + 4)
    checker = turn + 4

    self.removeButton(5)
    self.removeButton(4)
    self.removeButton(3)
    self.removeButton(2)
    self.removeButton(1)
    self.removeButton(0)
    self.createButton(reset)
    self.createButton(oh)
end

function check(clicked_object, playerColorClicked)
    printToAll('Gotta wait for Natural Shield to be off cooldown', playerColorClicked)
end

function GoBack()
    checker = 999
    printToAll('Manually resetting cooldown of Natural Shield')
    self.removeButton(1)
    self.removeButton(0)
    self.createButton(ab)
end

function resetCD()
    blunt = getObjectFromGUID("9ae24d")
    turn = tonumber(blunt.getName())
    if turn >= tonumber(checker) then
        checker = 999
        printToAll('Natural Shield is off cooldown')
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
