ab = {}
ab.click_function = 'clicked'
ab.function_owner = self
ab.label = ''
ab.position = {0,1,0}
ab.rotation = {0,180,0}
ab.width = 400
ab.height = 200
ab.font_size = 200

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
    printToAll('Noah used Placebo Strength, please select who you would like to use it on!' , playerColorClicked)
    self.removeButton(0)
    self.createButton(gao)
    self.createButton(arthur)
    self.createButton(enji)
    self.createButton(feather)
    self.createButton(noah)
    self.createButton(other)
end

function nmaNOlul(clicked_object, playerColorClicked)
    blunt = getObjectFromGUID("9ae24d")
    turn = tonumber(blunt.getName())

    this_guid = self.getGUID()
    d = getObjectFromGUID(this_guid)
    dam = tonumber(d.getGMNotes())

    if bnoah == true then
        stat = getObjectFromGUID("a81a86")
        baseDice = tonumber(stat.getName())
        totalDice = baseDice + dam

        printToAll('By using Placebo Strength, Noah increased his Str from a D' .. baseDice .. ' to a D' .. totalDice .. '!', playerColorClicked)
        printToAll('Placebo Strength will be off cooldown on turn ' .. turn + 6)
        eChecker = turn + 4

        stat.setName(totalDice)

        reset.label = 'Off Cooldown\n Turn ' .. (turn + 6)
        checker = turn + 6
    elseif barthur == true then
        stat = getObjectFromGUID("7f263a")
        baseDice = tonumber(stat.getName())
        totalDice = baseDice + dam

        printToAll('By using Placebo Strength, Noah increased Arthur\'s Str from a D' .. baseDice .. ' to a D' .. totalDice .. '!', playerColorClicked)
        printToAll('Placebo Strength will be off cooldown on turn ' .. turn + 6)
        eChecker = turn + 4

        stat.setName(totalDice)

        reset.label = 'Off Cooldown\n Turn ' .. (turn + 6)
        checker = turn + 6
    elseif bgao == true then
        stat = getObjectFromGUID("87e01c")
        baseDice = tonumber(stat.getName())
        totalDice = baseDice + dam

        printToAll('By using Placebo Strength, Noah increased Gao\'s Str from a D' .. baseDice .. ' to a D' .. totalDice .. '!', playerColorClicked)
        printToAll('Placebo Strength will be off cooldown on turn ' .. turn + 6)
        eChecker = turn + 4

        stat.setName(totalDice)

        reset.label = 'Off Cooldown\n Turn ' .. (turn + 6)
        checker = turn + 6
    elseif bfeather == true then
        stat = getObjectFromGUID("f8b03c")
        baseDice = tonumber(stat.getName())
        totalDice = baseDice + dam

        printToAll('By using Placebo Strength, Noah increased Feather\'s Str from a D' .. baseDice .. ' to a D' .. totalDice .. '!', playerColorClicked)
        printToAll('Placebo Strength will be off cooldown on turn ' .. turn + 6)
        eChecker = turn + 4

        stat.setName(totalDice)

        reset.label = 'Off Cooldown\n Turn ' .. (turn + 6)
        checker = turn + 6
    elseif benji == true then
        stat = getObjectFromGUID("f409f5")
        baseDice = tonumber(stat.getName())
        totalDice = baseDice + dam

        printToAll('By using Placebo Strength, Noah increased Enji\'s Str from a D' .. baseDice .. ' to a D' .. totalDice .. '!', playerColorClicked)
        printToAll('Placebo Strength will be off cooldown on turn ' .. turn + 6)
        eChecker = turn + 4

        stat.setName(totalDice)

        reset.label = 'Off Cooldown\n Turn ' .. (turn + 6)
        checker = turn + 6
    else
        printToAll('By using Placebo Strength, Noah increased someone\'s Str by a D' .. dam .. '!', playerColorClicked)
        printToAll('Placebo Strength will be off cooldown on turn ' .. turn + 6)
        eChecker = turn + 4

        reset.label = 'Off Cooldown\n Turn ' .. (turn + 6)
        checker = turn + 6
    end

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

    if bnoah == true then
        stat = getObjectFromGUID("a81a86")
        baseDice = tonumber(stat.getName())
        totalDice = baseDice + dam

        printToAll('By using Placebo Strength, Noah increased his Str from a D' .. baseDice .. ' to a D' .. totalDice .. '!', playerColorClicked)
        printToAll('Placebo Strength will be off cooldown on turn ' .. turn + 9 .. ' due to Musical Armarment')
        eChecker = turn + 4

        stat.setName(totalDice)

        reset.label = 'Off Cooldown\n Turn ' .. (turn + 9)
        checker = turn + 9
    elseif barthur == true then
        stat = getObjectFromGUID("7f263a")
        baseDice = tonumber(stat.getName())
        totalDice = baseDice + dam

        printToAll('By using Placebo Strength, Noah increased Arthur\'s Str from a D' .. baseDice .. ' to a D' .. totalDice .. '!', playerColorClicked)
        printToAll('Placebo Strength will be off cooldown on turn ' .. turn + 9 .. ' due to Musical Armarment')
        eChecker = turn + 4

        stat.setName(totalDice)

        reset.label = 'Off Cooldown\n Turn ' .. (turn + 9)
        checker = turn + 9
    elseif bgao == true then
        stat = getObjectFromGUID("87e01c")
        baseDice = tonumber(stat.getName())
        totalDice = baseDice + dam

        printToAll('By using Placebo Strength, Noah increased Gao\'s Str from a D' .. baseDice .. ' to a D' .. totalDice .. '!', playerColorClicked)
        printToAll('Placebo Strength will be off cooldown on turn ' .. turn + 9 .. ' due to Musical Armarment')
        eChecker = turn + 4

        stat.setName(totalDice)

        reset.label = 'Off Cooldown\n Turn ' .. (turn + 9)
        checker = turn + 9
    elseif bfeather == true then
        stat = getObjectFromGUID("f8b03c")
        baseDice = tonumber(stat.getName())
        totalDice = baseDice + dam

        printToAll('By using Placebo Strength, Noah increased Feather\'s Str from a D' .. baseDice .. ' to a D' .. totalDice .. '!', playerColorClicked)
        printToAll('Placebo Strength will be off cooldown on turn ' .. turn + 9 .. ' due to Musical Armarment')
        eChecker = turn + 4

        stat.setName(totalDice)

        reset.label = 'Off Cooldown\n Turn ' .. (turn + 9)
        checker = turn + 9
    elseif benji == true then
        stat = getObjectFromGUID("f409f5")
        baseDice = tonumber(stat.getName())
        totalDice = baseDice + dam

        printToAll('By using Placebo Strength, Noah increased Enji\'s Str from a D' .. baseDice .. ' to a D' .. totalDice .. '!', playerColorClicked)
        printToAll('Placebo Strength will be off cooldown on turn ' .. turn + 9 .. ' due to Musical Armarment')
        eChecker = turn + 4

        stat.setName(totalDice)

        reset.label = 'Off Cooldown\n Turn ' .. (turn + 9)
        checker = turn + 9
    else
        printToAll('By using Placebo Strength, Noah increased someone\'s Str by a D' .. dam .. '!', playerColorClicked)
        printToAll('Placebo Strength will be off cooldown on turn ' .. turn + 9 .. ' due to Musical Armarment')
        eChecker = turn + 4

        reset.label = 'Off Cooldown\n Turn ' .. (turn + 9)
        checker = turn + 9
    end

    self.removeButton(1)
    self.removeButton(0)
    self.createButton(reset)
    self.createButton(oh)
end

function check(clicked_object, playerColorClicked)
    printToAll('Gotta wait for Placebo Strength to be off cooldown', playerColorClicked)
end

function GoBack()
    checker = 999
    printToAll('Manually resetting cooldown of Placebo Strength')
    if eChecker ~= 999 then
        this_guid = self.getGUID()
        d = getObjectFromGUID(this_guid)
        dam = tonumber(d.getGMNotes())

        if bnoah == true then
            stat = getObjectFromGUID("a81a86")
            baseDice = tonumber(stat.getName())
            totalDice = baseDice - dam

            printToAll('Because the ability was reset, Placebo Strength\'s effect has disappeared from Noah!')

            stat.setName(totalDice)
        elseif barthur == true then
            stat = getObjectFromGUID("7f263a")
            baseDice = tonumber(stat.getName())
            totalDice = baseDice - dam

            printToAll('Because the ability was reset, Placebo Strength\'s effect has disappeared from Arthur!')

            stat.setName(totalDice)
        elseif bgao == true then
            stat = getObjectFromGUID("87e01c")
            baseDice = tonumber(stat.getName())
            totalDice = baseDice - dam

            printToAll('Because the ability was reset, Placebo Strength\'s effect has disappeared from Gao!')

            stat.setName(totalDice)
        elseif bfeather == true then
            stat = getObjectFromGUID("f8b03c")
            baseDice = tonumber(stat.getName())
            totalDice = baseDice - dam

            printToAll('Because the ability was reset, Placebo Strength\'s effect has disappeared from Feather!')

            stat.setName(totalDice)
        elseif benji == true then
            stat = getObjectFromGUID("f409f5")
            baseDice = tonumber(stat.getName())
            totalDice = baseDice - dam

            printToAll('Because the ability was reset, Placebo Strength\'s effect has disappeared from Enji!')

            stat.setName(totalDice)
        else
            printToAll('Because the ability was reset, Placebo Strength\'s effect has disappeared from whoever it was used on!')
        end
    end


    bfeather = false
    benji = false
    bgao = false
    barthur = false
    bnoah = false

    self.removeButton(1)
    self.removeButton(0)
    self.createButton(ab)
end

function resetCD()
    blunt = getObjectFromGUID("9ae24d")
    turn = tonumber(blunt.getName())
    if turn >= tonumber(checker) then
        checker = 999
        printToAll('Placebo Strength is off cooldown')
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
        this_guid = self.getGUID()
        d = getObjectFromGUID(this_guid)
        dam = tonumber(d.getGMNotes())

        if bnoah == true then
            stat = getObjectFromGUID("a81a86")
            baseDice = tonumber(stat.getName())
            totalDice = baseDice - dam

            printToAll('Because combat has ended, Placebo Strength\'s effect has disappeared from Noah!')

            stat.setName(totalDice)
        elseif barthur == true then
            stat = getObjectFromGUID("7f263a")
            baseDice = tonumber(stat.getName())
            totalDice = baseDice - dam

            printToAll('Because combat has ended, Placebo Strength\'s effect has disappeared from Arthur!')

            stat.setName(totalDice)
        elseif bgao == true then
            stat = getObjectFromGUID("87e01c")
            baseDice = tonumber(stat.getName())
            totalDice = baseDice - dam

            printToAll('Because combat has ended, Placebo Strength\'s effect has disappeared from Gao!')

            stat.setName(totalDice)
        elseif bfeather == true then
            stat = getObjectFromGUID("f8b03c")
            baseDice = tonumber(stat.getName())
            totalDice = baseDice - dam

            printToAll('Because combat has ended, Placebo Strength\'s effect has disappeared from Feather!')

            stat.setName(totalDice)
        elseif benji == true then
            stat = getObjectFromGUID("f409f5")
            baseDice = tonumber(stat.getName())
            totalDice = baseDice - dam

            printToAll('Because combat has ended, Placebo Strength\'s effect has disappeared from Enji!')

            stat.setName(totalDice)
        else
            printToAll('Because combat has ended, Placebo Strength\'s effect has disappeared from whoever it was used on!')
        end
    end

    bfeather = false
    benji = false
    bgao = false
    barthur = false
    bnoah = false

    self.createButton(ab)
end

function effectEnd()
    blunt = getObjectFromGUID("9ae24d")
    turn = tonumber(blunt.getName())

    if turn >= tonumber(eChecker) then
        eChecker = 999

        this_guid = self.getGUID()
        d = getObjectFromGUID(this_guid)
        dam = tonumber(d.getGMNotes())

        if bnoah == true then
            stat = getObjectFromGUID("a81a86")
            baseDice = tonumber(stat.getName())
            totalDice = baseDice - dam

            printToAll('The effects Placebo Strength have disappeared from Noah!')

            stat.setName(totalDice)
        elseif barthur == true then
            stat = getObjectFromGUID("7f263a")
            baseDice = tonumber(stat.getName())
            totalDice = baseDice - dam

            printToAll('The effects Placebo Strength have disappeared from Arthur!')

            stat.setName(totalDice)
        elseif bgao == true then
            stat = getObjectFromGUID("87e01c")
            baseDice = tonumber(stat.getName())
            totalDice = baseDice - dam

            printToAll('The effects Placebo Strength have disappeared from Gao!')

            stat.setName(totalDice)
        elseif bfeather == true then
            stat = getObjectFromGUID("f8b03c")
            baseDice = tonumber(stat.getName())
            totalDice = baseDice - dam

            printToAll('The effects Placebo Strength have disappeared from Feather!')

            stat.setName(totalDice)
        elseif benji == true then
            stat = getObjectFromGUID("f409f5")
            baseDice = tonumber(stat.getName())
            totalDice = baseDice - dam

            printToAll('The effects Placebo Strength have disappeared from Enji!')

            stat.setName(totalDice)
        else
            printToAll('The effects Placebo Strength have disappeared from whoever it was used on!')
        end
        bfeather = false
        benji = false
        bgao = false
        barthur = false
        bnoah = false
    end
end

function hn(clicked_object, playerColorClicked)
    bnoah = true
    self.removeButton(5)
    self.removeButton(4)
    self.removeButton(3)
    self.removeButton(2)
    self.removeButton(1)
    self.removeButton(0)
    self.createButton(nmaNO)
    self.createButton(wmaNO)
end

function hg(clicked_object, playerColorClicked)
    bgao = true
    self.removeButton(5)
    self.removeButton(4)
    self.removeButton(3)
    self.removeButton(2)
    self.removeButton(1)
    self.removeButton(0)
    self.createButton(nmaNO)
    self.createButton(wmaNO)
end

function ha(clicked_object, playerColorClicked)
    barthur = true
    self.removeButton(5)
    self.removeButton(4)
    self.removeButton(3)
    self.removeButton(2)
    self.removeButton(1)
    self.removeButton(0)
    self.createButton(nmaNO)
    self.createButton(wmaNO)
end

function he(clicked_object, playerColorClicked)
    benji = true
    self.removeButton(5)
    self.removeButton(4)
    self.removeButton(3)
    self.removeButton(2)
    self.removeButton(1)
    self.removeButton(0)
    self.createButton(nmaNO)
    self.createButton(wmaNO)
end

function hf(clicked_object, playerColorClicked)
    bfeather = true
    self.removeButton(5)
    self.removeButton(4)
    self.removeButton(3)
    self.removeButton(2)
    self.removeButton(1)
    self.removeButton(0)
    self.createButton(nmaNO)
    self.createButton(wmaNO)
end

function ho(clicked_object, playerColorClicked)
    self.removeButton(5)
    self.removeButton(4)
    self.removeButton(3)
    self.removeButton(2)
    self.removeButton(1)
    self.removeButton(0)
    self.createButton(nmaNO)
    self.createButton(wmaNO)
end

function onload()
    self.createButton(ab)
    checker = 999
    eChecker = 999
    bnoah = false
    bfeather = false
    barthur = false
    benji = false
    bgao = false
end
