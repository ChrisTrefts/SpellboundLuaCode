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
    blunt = getObjectFromGUID("9ae24d")
    turn = tonumber(blunt.getName())

    printToAll('Enji used Will-O-Wisp', playerColorClicked)

    ail = math.random(1,10)

    if ail <= 2 then
    printToAll('With a ' .. ail .. ' the target has been Ignited!', playerColorClicked)
    else
    printToAll('With a ' .. ail .. ' the target is not Ignited', playerColorClicked)
    end

    printToAll('Will-O-Wisp will be off cooldown on turn ' .. turn + 1)

    reset.label = 'Off Cooldown\n Turn ' .. (turn + 1)
    checker = turn + 1

    self.removeButton(0)
    self.createButton(reset)
    self.createButton(oh)
end

function check(clicked_object, playerColorClicked)
    printToAll('Gotta wait for Will-O-Wisp to be off cooldown', playerColorClicked)
end

function GoBack()
    checker = 999
    printToAll('Manually resetting cooldown of Will-O-Wisp')
    self.removeButton(1)
    self.removeButton(0)
    self.createButton(ab)
end

function resetCD()
    blunt = getObjectFromGUID("9ae24d")
    turn = tonumber(blunt.getName())
    if turn >= tonumber(checker) then
        checker = 999
        printToAll('Will-O-Wisp is off cooldown')
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
