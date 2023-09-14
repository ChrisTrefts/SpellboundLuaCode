ab = {}
ab.click_function = 'clicked'
ab.function_owner = self
ab.label = ''
ab.position = {0,1,0}
ab.rotation = {0,180,0}
ab.width = 400
ab.height = 200
ab.font_size = 200

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

nmaNO = {}
nmaNO.function_owner = self
nmaNO.click_function = 'nmaNOlul'
nmaNO.label = 'Without Musical Armarment'
nmaNO.position = {0,5,0.13}
nmaNO.rotation = {0,180,0}
nmaNO.width = 700
nmaNO.height = 120
nmaNO.font_size = 50
nmaNO.font_color = {255, 255, 0}
nmaNO.color = {0,0,0}

wmaNO = {}
wmaNO.click_function = 'wmaNOlul'
wmaNO.function_owner = self
wmaNO.label = 'With Musical Armarment'
wmaNO.position = {0,5,-0.13}
wmaNO.rotation = {0,180,0}
wmaNO.width = 700
wmaNO.height = 120
wmaNO.font_size = 50
wmaNO.font_color = {255, 255, 0}
wmaNO.color = {0,0,0}


function clicked(clicked_object, playerColorClicked)
    printToAll('Noah used Mana Reaction Sever, now will he use Musical Armarment alongside it!' , playerColorClicked)
    self.removeButton(0)
    self.createButton(nmaNO)
    self.createButton(wmaNO)
end

function nmaNOlul(clicked_object, playerColorClicked)
    blunt = getObjectFromGUID("9ae24d")
    turn = tonumber(blunt.getName())

    this_guid = self.getGUID()
    d = getObjectFromGUID(this_guid)
    dam = tonumber(d.getGMNotes())

    printToAll('By using Reaction Sever, Noah has decreased the AGI of some poor chap by ' .. dam, playerColorClicked)
    printToAll('Reaction Sever will be off cooldown on turn ' .. turn + 9)
    eChecker = turn + 4

    reset.label = 'Off Cooldown\n Turn ' .. (turn + 9)
    checker = turn + 9

    self.removeButton(1)
    self.removeButton(0)
    self.createButton(reset)
    self.createButton(oh)
end

function wmaNOlul(clicked_object, playerColorClicked)
    blunt = getObjectFromGUID("9ae24d")
    turn = tonumber(blunt.getName())

    this_guid = self.getGUID()
    d = getObjectFromGUID(this_guid)
    dam = tonumber(d.getGMNotes())

    printToAll('By using Reaction Sever, Noah has decreased the AGI of some poor chap by ' .. dam, playerColorClicked)
    printToAll('Reaction Sever will be off cooldown on turn ' .. turn + 12 .. ' due to Musical Armarment!')
    eChecker = turn + 4

    reset.label = 'Off Cooldown\n Turn ' .. (turn + 12)
    checker = turn + 12

    self.removeButton(1)
    self.removeButton(0)
    self.createButton(reset)
    self.createButton(oh)
end

function check(clicked_object, playerColorClicked)
    printToAll('Gotta wait for Reaction Sever to be off cooldown', playerColorClicked)
end

function GoBack()
    checker = 999
    printToAll('Manually resetting cooldown of Windswept Lightning')
    self.removeButton(1)
    self.removeButton(0)
    self.createButton(ab)

    if eChecker ~= 999 then
        printToAll("Whether it was misclick or a  up whoever Reaction Sever was cast needs their AGI back.")
    end
end

function resetCD()
    blunt = getObjectFromGUID("9ae24d")
    turn = tonumber(blunt.getName())
    if turn >= tonumber(checker) then
        checker = 999
        printToAll('Reaction Sever is off cooldown')
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

    if eChecker ~= 999 then
        eChecker = 999
        printToAll('Due to combat ending the effects of Reaction Sever has ended')
    end

    self.createButton(ab)
end

function effectEnd()
    blunt = getObjectFromGUID("9ae24d")
    turn = tonumber(blunt.getName())
    if turn >= tonumber(eChecker) then
        eChecker = 999
        printToAll('The effects of Reaction Sever have concluded and someone need their AGI back!')
    end
end

function onload()
    self.createButton(ab)
    checker = 999
    eChecker = 999
end
