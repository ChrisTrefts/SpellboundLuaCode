--Shakester code
--Start
ab = {}
ab.click_function = 'clicked'
ab.function_owner = self
ab.label = ''
ab.position = {0,1,0.4}
ab.rotation = {0,180,0}
ab.width = 400
ab.height = 50
ab.font_size = 200
ab.color = {255,0,0}
--End


NOTECARD = {}

-- Load and Save data

function onLoad(saved_data)
	self.setDescription(" ")

	if saved_data ~= "" then
		NOTECARD = JSON.decode(saved_data)
		if NOTECARD.description == nil then
			defaults()
		end
	else
		defaults()
	end
	createFields()
	loadData()

	--Kruc's Code
	self.createButton(ab)
    eChecker = 999

	twenty = false
	forty = false
	sixty = false
	eighty = false
	hundred = false
end

function updateSave()
    saved_data = JSON.encode(NOTECARD)
    self.script_state = saved_data
end

function onSave()
	self.setDescription(" ")
	return JSON.encode(NOTECARD)
end

function defaults()
	NOTECARD = {
		description = { "" },
		fontsize = { 250 },
		pagenumber = 1,
		maxpagenumber = 1,
		locked = false,
		input_description = 0,
		input_pagenumber = 1,
		button_lock = 0,
		button_incfont = 1,
		button_decfont = 2,
		button_pageup = 3,
		button_pagedown = 4
	}
end


-- Populate fields

function createFields()
	self.createInput({input_function = "inputDescription", function_owner = self, label = " 1. Name field controls the header\n 2. This text field controls the description\n 3. Click Arrows to change page number\n 4. Click [b]+[/b] or [b]-[/b] to change the font size\n 5. You can Lock or Unlock the Notecard\n 6. [b]BBCode[/b] also [u]works[/u][FF0000]![-]\n\n\n\n", position = {0.032, 2.5, -0.045}, rotation = {0, 180, 0}, scale = {0.1, 0.1, 0.14}, width = 4500, height = 2600, font_size = 250, tooltip = "Description", alignment = 2})
	self.createInput({input_function = "inputPageNumber", function_owner = self, label = "Page Number", position = {-0.468, 2.5, -0.046}, rotation = {0, 270, 0}, scale = {0.1, 0.1, 0.1}, width = 2720, height = 310, font_size = 287, tooltip = "Page Number", alignment = 3, value = "Page Number"})

	local lock_label = "Unlocked"
	if NOTECARD.locked then lock_label = "Locked" end
	self.createButton({click_function = "clickLockUnlock", function_owner = self, label = lock_label, position = {0.368, 2.5, -0.461}, rotation = {0, 180, 0}, scale = {0.1, 0.1, 0.1}, width = 1300, height = 390, font_size = 240, tooltip = "Lock / Unlock"})
	self.createButton({click_function = "clickIncreaseFont", function_owner = self, label = "+", position = {-0.24, 2.5, -0.461}, rotation = {0, 180, 0}, scale = {0.1, 0.1, 0.1}, width = 400, height = 390, font_size = 400, tooltip = "Increase Font Size"})
	self.createButton({click_function = "clickDecreaseFont", function_owner = self, label = "-", position = {-0.155, 2.5, -0.461}, rotation = {0, 180, 0}, scale = {0.1, 0.1, 0.1}, width = 400, height = 390, font_size = 400, tooltip = "Decrease Font Size"})
	self.createButton({click_function = "clickPageUp", function_owner = self, label = "▲", position = {-0.468, 2.5, 0.286}, rotation = {0, 180, 0}, scale = {0.1, 0.1, 0.1}, width = 340, height = 500, font_size = 300, tooltip = "Previous Page"})
	self.createButton({click_function = "clickPageDown", function_owner = self, label = "▼", position = {-0.468, 2.5, -0.378}, rotation = {0, 180, 0}, scale = {0.1, 0.1, 0.1}, width = 340, height = 500, font_size = 300, tooltip = "Next Page"})
end

function loadData()
	local pageNum = NOTECARD.pagenumber
	if NOTECARD.description[pageNum] ~= nil then
		modifyInput(NOTECARD.input_description, NOTECARD.description[pageNum])
		modifyInput(NOTECARD.input_description, NOTECARD.fontsize[pageNum], "font_size")
	else
		addPage()
		loadData(pageNum)
	end
	updatePage()
end


-- Helpers

function modifyInput(i, v, n)
	if n then
		self.editInput({index = i, [n] = v})
	else
		self.editInput({index = i, value = v})
	end
end

function modifyButton(i, v, n)
	if n then
		self.editButton({index = i, [n] = v})
	else
		self.editButton({index = i, label = v})
	end
end


-- Page Functions

function addPage()
	NOTECARD.maxpagenumber = NOTECARD.maxpagenumber + 1
	NOTECARD.description[NOTECARD.maxpagenumber] = ""
	NOTECARD.fontsize[NOTECARD.maxpagenumber] = 250
	updateSave()
end

function removePage()
	NOTECARD.description[NOTECARD.maxpagenumber] = nil
	NOTECARD.fontsize[NOTECARD.maxpagenumber] = nil
	NOTECARD.maxpagenumber = NOTECARD.maxpagenumber - 1
	updateSave()
end

function getPageNum()
	return "" .. NOTECARD.pagenumber .. "    /    " .. NOTECARD.maxpagenumber .. ""
end

function updatePage()
	modifyInput(NOTECARD.input_pagenumber, getPageNum())
end


-- Click events

function clickLockUnlock(btn, colw)
	NOTECARD.locked = not NOTECARD.locked
	if NOTECARD.locked then
		modifyButton(NOTECARD.button_lock, "Locked")
	else
		modifyButton(NOTECARD.button_lock, "Unlocked")
	end
end

function clickIncreaseFont(btn, col)
	if NOTECARD.locked then
		alertLocked(col)
		return
	end
	NOTECARD.fontsize[NOTECARD.pagenumber] = NOTECARD.fontsize[NOTECARD.pagenumber] + 10
	updateSave()
	loadData()
end

function clickDecreaseFont(btn, col)
	if NOTECARD.locked then
		alertLocked(col)
		return
	end
	NOTECARD.fontsize[NOTECARD.pagenumber] = NOTECARD.fontsize[NOTECARD.pagenumber] - 10
	updateSave()
	loadData()
end

function clickPageUp(btn, col)
	if NOTECARD.description[NOTECARD.maxpagenumber] == "" and #NOTECARD.description > 1 then
		removePage()
	end
	if NOTECARD.pagenumber > 1 then
		NOTECARD.pagenumber = NOTECARD.pagenumber - 1
		loadData()
	end
end

function clickPageDown(btn, col)
	if NOTECARD.pagenumber == NOTECARD.maxpagenumber then
		addPage()
	end
	NOTECARD.pagenumber = NOTECARD.pagenumber + 1
	loadData()
end


-- Input events

function inputDescription(btn, col, val, sel)
	if NOTECARD.locked then
		alertLocked(col)
		return NOTECARD.description[NOTECARD.pagenumber]
	end
	NOTECARD.description[NOTECARD.pagenumber] = val
	updateSave()
end
function inputPageNumber(btn, col, val, sel)
	return getPageNum()
end


-- Misc

function alertLocked(col)
	broadcastToColor("What the did you just say about me, you little bitch? I’ll have you know I graduated top of my class in the Navy Seals, and I’ve been involved in numerous secret raids on Al-Quaeda, and I have over 300 confirmed kills!", col, {1,0,0})
end

--Unable to edit. Notecard is locked.
--What the did you just say about me, you little bitch? I’ll have you know I graduated top of my class in the Navy Seals, and I’ve been involved in numerous secret raids on Al-Quaeda, and I have over 300 confirmed kills.

-- My Code (Shakester 1/27/21)
twe = {}
twe.click_function = 'hn'
twe.function_owner = self
twe.label = '20%'
twe.position = {0.25,9,-0.67}
twe.rotation = {7,180,0}
twe.width = 270
twe.height = 200
twe.font_size = 80
twe.font_color = {255, 255, 0}
twe.color = {0,0,0}

fort = {}
fort.click_function = 'ha'
fort.function_owner = self
fort.label = '40%'
fort.position = {-0.25,9,-0.67}
fort.rotation = {0,180,0}
fort.width = 270
fort.height = 200
fort.font_size = 80
fort.font_color = {255, 255, 0}
fort.color = {0,0,0}

sixt = {}
sixt.click_function = 'he'
sixt.function_owner = self
sixt.label = '60%'
sixt.position = {0.25,9,-1.02}
sixt.rotation = {0,180,0}
sixt.width = 270
sixt.height = 200
sixt.font_size = 80
sixt.font_color = {255, 255, 0}
sixt.color = {0,0,0}

eigt = {}
eigt.click_function = 'hf'
eigt.function_owner = self
eigt.label = '80%'
eigt.position = {-0.25,9,-1.02}
eigt.rotation = {0,180,0}
eigt.width = 270
eigt.height = 200
eigt.font_size = 80
eigt.font_color = {255, 255, 0}
eigt.color = {0,0,0}

hund = {}
hund.click_function = 'hg'
hund.function_owner = self
hund.label = '100%'
hund.position = {0.25,9,-1.37}
hund.rotation = {0,180,0}
hund.width = 270
hund.height = 200
hund.font_size = 80
hund.font_color = {255, 255, 0}
hund.color = {0,0,0}

other = {}
other.click_function = 'ho'
other.function_owner = self
other.label = 'Nvm'
other.position = {-0.25,9,-1.37}
other.rotation = {0,180,0}
other.width = 270
other.height = 200
other.font_size = 80
other.font_color = {255, 255, 0}
other.color = {0,0,0}

bm = {}
bm.click_function = 'bigMode'
bm.function_owner = self
bm.label = 'GO \nBIG \nMODE'
bm.position = {0,9,-0.8}
bm.rotation = {0,180,0}
bm.width = 300
bm.height = 300
bm.font_size = 80
bm.font_color = {255, 255, 0}
bm.color = {0,0,0}

lr = {}
lr.click_function = 'longR'
lr.function_owner = self
lr.label = 'Have you long rested?'
lr.position = {0,9,-0.7}
lr.rotation = {0,180,0}
lr.width = 500
lr.height = 200
lr.font_size = 50
lr.font_color = {255, 255, 0}
lr.color = {0,0,0}

function clicked(clicked_object, playerColorClicked)
    printToAll('Oh dang, Enji\'s using REMOVAL, but what percent?' , playerColorClicked)
    self.removeButton(5)
    self.createButton(hund)
    self.createButton(fort)
    self.createButton(sixt)
    self.createButton(eigt)
    self.createButton(twe)
    self.createButton(other)
end

--20%
function hn(clicked_object, playerColorClicked)
	self.removeButton(10)
    self.removeButton(9)
    self.removeButton(8)
    self.removeButton(7)
    self.removeButton(6)
    self.removeButton(5)
    printToAll("20% Percent Choosen", playerColorClicked)

	blunt = getObjectFromGUID("9ae24d")
    turn = tonumber(blunt.getName())

	twenty = true

	str = getObjectFromGUID("f409f5")
    strStat = tonumber(str.getGMNotes())
	inStrStat = strStat * 1.2
	inStrStat = math.floor(inStrStat + 0.5)
	str.setName(inStrStat)

	mag = getObjectFromGUID("36f64d")
    magStat = tonumber(mag.getGMNotes())
	inMagStat = magStat * 1.2
	inMagStat = math.floor(inMagStat + 0.5)
	mag.setName(inMagStat)

	def = getObjectFromGUID("29c7d2")
    defStat = tonumber(def.getGMNotes())
	inDefStat = defStat * 1.2
	inDefStat = math.floor(inDefStat + 0.5)
	def.setName(inDefStat)

	agi = getObjectFromGUID("0e33a8")
    agiStat = tonumber(agi.getGMNotes())
	inAgiStat = agiStat * 1.2
	inAgiStat = math.floor(inAgiStat + 0.5)
	agi.setName(inAgiStat)

	ski = getObjectFromGUID("71b79b")
    skiStat = tonumber(ski.getGMNotes())
	inSkiStat = skiStat * 1.2
	inSkiStat = math.floor(inSkiStat + 0.5)
	ski.setName(inSkiStat)

	eChecker = turn + 4

	self.createButton(bm)
end

--40%
function ha(clicked_object, playerColorClicked)
	self.removeButton(10)
    self.removeButton(9)
    self.removeButton(8)
    self.removeButton(7)
    self.removeButton(6)
    self.removeButton(5)
    printToAll("Dis be for da 40%", playerColorClicked)

	blunt = getObjectFromGUID("9ae24d")
    turn = tonumber(blunt.getName())

	forty = true

	str = getObjectFromGUID("f409f5")
    strStat = tonumber(str.getGMNotes())
	inStrStat = strStat * 1.4
	inStrStat = math.floor(inStrStat + 0.5)
	str.setName(inStrStat)

	mag = getObjectFromGUID("36f64d")
    magStat = tonumber(mag.getGMNotes())
	inMagStat = magStat * 1.4
	inMagStat = math.floor(inMagStat + 0.5)
	mag.setName(inMagStat)

	def = getObjectFromGUID("29c7d2")
    defStat = tonumber(def.getGMNotes())
	inDefStat = defStat * 1.4
	inDefStat = math.floor(inDefStat + 0.5)
	def.setName(inDefStat)

	agi = getObjectFromGUID("0e33a8")
    agiStat = tonumber(agi.getGMNotes())
	inAgiStat = agiStat * 1.4
	inAgiStat = math.floor(inAgiStat + 0.5)
	agi.setName(inAgiStat)

	ski = getObjectFromGUID("71b79b")
    skiStat = tonumber(ski.getGMNotes())
	inSkiStat = skiStat * 1.4
	inSkiStat = math.floor(inSkiStat + 0.5)
	ski.setName(inSkiStat)

	eChecker = turn + 4

	self.createButton(bm)
end

--60%
function he(clicked_object, playerColorClicked)
	self.removeButton(10)
    self.removeButton(9)
    self.removeButton(8)
    self.removeButton(7)
    self.removeButton(6)
    self.removeButton(5)
    printToAll("Dis be for da 60%", playerColorClicked)

	blunt = getObjectFromGUID("9ae24d")
    turn = tonumber(blunt.getName())

	sixty = true

	str = getObjectFromGUID("f409f5")
    strStat = tonumber(str.getGMNotes())
	inStrStat = strStat * 1.6
	inStrStat = math.floor(inStrStat + 0.5)
	str.setName(inStrStat)

	mag = getObjectFromGUID("36f64d")
    magStat = tonumber(mag.getGMNotes())
	inMagStat = magStat * 1.6
	inMagStat = math.floor(inMagStat + 0.5)
	mag.setName(inMagStat)

	def = getObjectFromGUID("29c7d2")
    defStat = tonumber(def.getGMNotes())
	inDefStat = defStat * 1.6
	inDefStat = math.floor(inDefStat + 0.5)
	def.setName(inDefStat)

	agi = getObjectFromGUID("0e33a8")
    agiStat = tonumber(agi.getGMNotes())
	inAgiStat = agiStat * 1.6
	inAgiStat = math.floor(inAgiStat + 0.5)
	agi.setName(inAgiStat)

	ski = getObjectFromGUID("71b79b")
    skiStat = tonumber(ski.getGMNotes())
	inSkiStat = skiStat * 1.6
	inSkiStat = math.floor(inSkiStat + 0.5)
	ski.setName(inSkiStat)

	eChecker = turn + 4

	self.createButton(bm)
end

--80%
function hf(clicked_object, playerColorClicked)
	self.removeButton(10)
    self.removeButton(9)
    self.removeButton(8)
    self.removeButton(7)
    self.removeButton(6)
    self.removeButton(5)
	printToAll("Dis be for da 80%", playerColorClicked)

	blunt = getObjectFromGUID("9ae24d")
    turn = tonumber(blunt.getName())

	eighty = true

	str = getObjectFromGUID("f409f5")
    strStat = tonumber(str.getGMNotes())
	inStrStat = strStat * 1.8
	inStrStat = math.floor(inStrStat + 0.5)
	str.setName(inStrStat)

	mag = getObjectFromGUID("36f64d")
    magStat = tonumber(mag.getGMNotes())
	inMagStat = magStat * 1.8
	inMagStat = math.floor(inMagStat + 0.5)
	mag.setName(inMagStat)

	def = getObjectFromGUID("29c7d2")
    defStat = tonumber(def.getGMNotes())
	inDefStat = defStat * 1.8
	inDefStat = math.floor(inDefStat + 0.5)
	def.setName(inDefStat)

	agi = getObjectFromGUID("0e33a8")
    agiStat = tonumber(agi.getGMNotes())
	inAgiStat = agiStat * 1.8
	inAgiStat = math.floor(inAgiStat + 0.5)
	agi.setName(inAgiStat)

	ski = getObjectFromGUID("71b79b")
    skiStat = tonumber(ski.getGMNotes())
	inSkiStat = skiStat * 1.8
	inSkiStat = math.floor(inSkiStat + 0.5)
	ski.setName(inSkiStat)

	eChecker = turn + 4

	self.createButton(bm)
end

--100%
function hg(clicked_object, playerColorClicked)
	self.removeButton(10)
    self.removeButton(9)
    self.removeButton(8)
    self.removeButton(7)
    self.removeButton(6)
    self.removeButton(5)
    printToAll("You seem to hear your father's voice in your head. ENJI MY SON, if not prepared theres a good chance your limbs will spolsh off your body, but hey what dosen't kill you makes you SUPER STRONGER AND BASSDASSSSS!", playerColorClicked)
	self.createButton(ab)

	--hundred = true
end

--Go Back
function ho(clicked_object, playerColorClicked)
    self.removeButton(10)
    self.removeButton(9)
    self.removeButton(8)
    self.removeButton(7)
    self.removeButton(6)
    self.removeButton(5)
	printToAll("     _", playerColorClicked)
	printToAll("   _| |", playerColorClicked)
	printToAll(" _| | |", playerColorClicked)
	printToAll(" | | | |", playerColorClicked)
	printToAll(" | | | | __", playerColorClicked)
	printToAll(" | | | |/  \\", playerColorClicked)
	printToAll(" |       /\\ \\", playerColorClicked)
	printToAll(" |      /  \\/", playerColorClicked)
	printToAll(" |      \\  /\\", playerColorClicked)
	printToAll(" |       \\/ /", playerColorClicked)
	printToAll("  \\        /", playerColorClicked)
	printToAll("   |     /", playerColorClicked)
	printToAll("   |    |", playerColorClicked)

	self.createButton(ab)
end

function effectEnd()
    blunt = getObjectFromGUID("9ae24d")
    turn = tonumber(blunt.getName())

    if turn >= tonumber(eChecker) then
		self.removeButton(5)
        eChecker = 999

        this_guid = self.getGUID()
        d = getObjectFromGUID(this_guid)
        dam = tonumber(d.getGMNotes())

        if twenty == true then
			str = getObjectFromGUID("f409f5")
		    strStat = tonumber(str.getGMNotes())
			deStrStat = strStat - (strStat * 0.1)
			deStrStat = math.floor(deStrStat + 0.5)
			str.setName(deStrStat)

			mag = getObjectFromGUID("36f64d")
		    magStat = tonumber(mag.getGMNotes())
			deMagStat = magStat - (magStat * 0.1)
			deMagStat = math.floor(deMagStat + 0.5)
			mag.setName(deMagStat)

			def = getObjectFromGUID("29c7d2")
		    defStat = tonumber(def.getGMNotes())
			deDefStat = defStat - (defStat * 0.1)
			deDefStat = math.floor(deDefStat + 0.5)
			def.setName(deDefStat)

			agi = getObjectFromGUID("0e33a8")
		    agiStat = tonumber(agi.getGMNotes())
			deAgiStat = agiStat - (agiStat * 0.1)
			deAgiStat = math.floor(deAgiStat + 0.5)
			agi.setName(deAgiStat)

			ski = getObjectFromGUID("71b79b")
		    skiStat = tonumber(ski.getGMNotes())
			deSkiStat = skiStat - (skiStat * 0.1)
			deSkiStat = math.floor(deSkiStat + 0.5)
			ski.setName(deSkiStat)

            printToAll('No longer being able to handle to the strain of 20% Removal any longer, Enji\'s body shall suffer a -10% decrease to his stats (barring HP) until he takes a long rest!')
		elseif forty == true then
			str = getObjectFromGUID("f409f5")
		    strStat = tonumber(str.getGMNotes())
			deStrStat = strStat - (strStat * 0.2)
			deStrStat = math.floor(deStrStat + 0.5)
			str.setName(deStrStat)

			mag = getObjectFromGUID("36f64d")
		    magStat = tonumber(mag.getGMNotes())
			deMagStat = magStat - (magStat * 0.2)
			deMagStat = math.floor(deMagStat + 0.5)
			mag.setName(deMagStat)

			def = getObjectFromGUID("29c7d2")
		    defStat = tonumber(def.getGMNotes())
			deDefStat = defStat - (defStat * 0.2)
			deDefStat = math.floor(deDefStat + 0.5)
			def.setName(deDefStat)

			agi = getObjectFromGUID("0e33a8")
		    agiStat = tonumber(agi.getGMNotes())
			deAgiStat = agiStat - (agiStat * 0.2)
			deAgiStat = math.floor(deAgiStat + 0.5)
			agi.setName(deAgiStat)

			ski = getObjectFromGUID("71b79b")
		    skiStat = tonumber(ski.getGMNotes())
			deSkiStat = skiStat - (skiStat * 0.2)
			deSkiStat = math.floor(deSkiStat + 0.5)
			ski.setName(deSkiStat)

            printToAll('No longer being able to handle to the strain of 40% Removal any longer, Enji\'s body shall suffer a -20% decrease to his stats (barring HP) until he takes a long rest!')

		elseif sixty == true then
			str = getObjectFromGUID("f409f5")
		    strStat = tonumber(str.getGMNotes())
			deStrStat = strStat - (strStat * 0.3)
			deStrStat = math.floor(deStrStat + 0.5)
			str.setName(deStrStat)

			mag = getObjectFromGUID("36f64d")
		    magStat = tonumber(mag.getGMNotes())
			deMagStat = magStat - (magStat * 0.3)
			deMagStat = math.floor(deMagStat + 0.5)
			mag.setName(deMagStat)

			def = getObjectFromGUID("29c7d2")
		    defStat = tonumber(def.getGMNotes())
			deDefStat = defStat - (defStat * 0.3)
			deDefStat = math.floor(deDefStat + 0.5)
			def.setName(deDefStat)

			agi = getObjectFromGUID("0e33a8")
		    agiStat = tonumber(agi.getGMNotes())
			deAgiStat = agiStat - (agiStat * 0.3)
			deAgiStat = math.floor(deAgiStat + 0.5)
			agi.setName(deAgiStat)

			ski = getObjectFromGUID("71b79b")
		    skiStat = tonumber(ski.getGMNotes())
			deSkiStat = skiStat - (skiStat * 0.3)
			deSkiStat = math.floor(deSkiStat + 0.5)
			ski.setName(deSkiStat)

            printToAll('No longer being able to handle to the strain of 60% Removal any longer, Enji\'s body shall suffer a -30% decrease to his stats (barring HP) until he takes a long rest!')

		elseif eighty == true then
			str = getObjectFromGUID("f409f5")
			strStat = tonumber(str.getGMNotes())
			deStrStat = strStat - (strStat * 0.5)
			deStrStat = math.floor(deStrStat + 0.5)
			str.setName(deStrStat)

			mag = getObjectFromGUID("36f64d")
			magStat = tonumber(mag.getGMNotes())
			deMagStat = magStat - (magStat * 0.5)
			deMagStat = math.floor(deMagStat + 0.5)
			mag.setName(deMagStat)

			def = getObjectFromGUID("29c7d2")
			defStat = tonumber(def.getGMNotes())
			deDefStat = defStat - (defStat * 0.5)
			deDefStat = math.floor(deDefStat + 0.5)
			def.setName(deDefStat)

			agi = getObjectFromGUID("0e33a8")
			agiStat = tonumber(agi.getGMNotes())
			deAgiStat = agiStat - (agiStat * 0.5)
			deAgiStat = math.floor(deAgiStat + 0.5)
			agi.setName(deAgiStat)

			ski = getObjectFromGUID("71b79b")
			skiStat = tonumber(ski.getGMNotes())
			deSkiStat = skiStat - (skiStat * 0.5)
			deSkiStat = math.floor(deSkiStat + 0.5)
			ski.setName(deSkiStat)

			printToAll('No longer being able to handle to the strain of 80% Removal any longer, Enji\'s body shall suffer a -50% decrease to his stats (barring HP) until he takes a long rest!')

		end
		self.createButton(lr)
    end
end

function longR(clicked_object, playerColorClicked)

	self.removeButton(5)

	if twenty == true then
		str = getObjectFromGUID("f409f5")
		strStat = tonumber(str.getGMNotes())
		str.setName(strStat)

		mag = getObjectFromGUID("36f64d")
		magStat = tonumber(mag.getGMNotes())
		mag.setName(magStat)

		def = getObjectFromGUID("29c7d2")
		defStat = tonumber(def.getGMNotes())
		def.setName(defStat)

		agi = getObjectFromGUID("0e33a8")
		agiStat = tonumber(agi.getGMNotes())
		agi.setName(agiStat)

		ski = getObjectFromGUID("71b79b")
		skiStat = tonumber(ski.getGMNotes())
		ski.setName(skiStat)

		printToAll('After a long rest Enji\'s the after effects of the 20% Removal have subsided from Enji!')

		twenty = false
	elseif forty == true then
		str = getObjectFromGUID("f409f5")
		strStat = tonumber(str.getGMNotes())
		str.setName(strStat)

		mag = getObjectFromGUID("36f64d")
		magStat = tonumber(mag.getGMNotes())
		mag.setName(magStat)

		def = getObjectFromGUID("29c7d2")
		defStat = tonumber(def.getGMNotes())
		def.setName(defStat)

		agi = getObjectFromGUID("0e33a8")
		agiStat = tonumber(agi.getGMNotes())
		agi.setName(agiStat)

		ski = getObjectFromGUID("71b79b")
		skiStat = tonumber(ski.getGMNotes())
		ski.setName(skiStat)

		printToAll('After a long rest Enji\'s the after effects of the 40% Removal have subsided from Enji!')

		forty = false

	elseif sixty == true then
		str = getObjectFromGUID("f409f5")
		strStat = tonumber(str.getGMNotes())
		str.setName(strStat)

		mag = getObjectFromGUID("36f64d")
		magStat = tonumber(mag.getGMNotes())
		mag.setName(magStat)

		def = getObjectFromGUID("29c7d2")
		defStat = tonumber(def.getGMNotes())
		def.setName(defStat)

		agi = getObjectFromGUID("0e33a8")
		agiStat = tonumber(agi.getGMNotes())
		agi.setName(agiStat)

		ski = getObjectFromGUID("71b79b")
		skiStat = tonumber(ski.getGMNotes())
		ski.setName(skiStat)

		printToAll('After a long rest Enji\'s the after effects of the 60% Removal have subsided from Enji!')

		sixty = false

	elseif eighty == true then
		str = getObjectFromGUID("f409f5")
		strStat = tonumber(str.getGMNotes())
		str.setName(strStat)

		mag = getObjectFromGUID("36f64d")
		magStat = tonumber(mag.getGMNotes())
		mag.setName(magStat)

		def = getObjectFromGUID("29c7d2")
		defStat = tonumber(def.getGMNotes())
		def.setName(defStat)

		agi = getObjectFromGUID("0e33a8")
		agiStat = tonumber(agi.getGMNotes())
		agi.setName(agiStat)

		ski = getObjectFromGUID("71b79b")
		skiStat = tonumber(ski.getGMNotes())
		ski.setName(skiStat)

		printToAll('After a long rest Enji\'s the after effects of the 60% Removal have subsided from Enji!')

		eighty = false
	end

	self.createButton(ab)
end

function bigMode(clicked_object, playerColorClicked)
	printToAll('Go Ham Enji!', playerColorClicked)
end
