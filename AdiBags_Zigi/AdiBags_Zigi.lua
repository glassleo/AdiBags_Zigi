local AdiBags = LibStub("AceAddon-3.0"):GetAddon("AdiBags")

-- https://wow.tools/dbc/?dbc=mapchallengemode
local ChallengeMap = {
	[2] = "Temple of the Jade Serpent",
	[56] = "Stormstout Brewery",
	[57] = "Gate of the Setting Sun",
	[58] = "Shado-Pan Monastery",
	[59] = "Siege of Niuzao Temple",
	[60] = "Mogu'shan Palace",
	[76] = "Scholomance",
	[77] = "Scarlet Halls",
	[78] = "Scarlet Monastery",
	[161] = "Skyreach",
	[163] = "Bloodmaul Slag Mines",
	[164] = "Auchindoun",
	[165] = "Shadowmoon Burial Grounds",
	[166] = "Grimrail Depot",
	[167] = "Upper Blackrock Spire",
	[168] = "The Everbloom",
	[169] = "Iron Docks",
	[197] = "Eye of Azshara",
	[198] = "Darkheart Thicket",
	[199] = "Black Rook Hold",
	[200] = "Halls of Valor",
	[206] = "Neltharion's Lair",
	[207] = "Vault of the Wardens",
	[208] = "Maw of Souls",
	[209] = "The Arcway",
	[210] = "Court of Stars",
	[227] = "Return to Karazhan: Lower",
	[233] = "Cathedral of Eternal Night",
	[234] = "Return to Karazhan: Upper",
	[239] = "Seat of the Triumvirate",
	[244] = "Atal'Dazar",
	[245] = "Freehold",
	[246] = "Tol Dagor",
	[247] = "The MOTHERLODE!!",
	[248] = "Waycrest Manor",
	[249] = "Kings' Rest",
	[250] = "Temple of Sethraliss",
	[251] = "The Underrot",
	[252] = "Shrine of the Storm",
	[353] = "Siege of Boralus",
	[369] = "Operation: Mechagon - Junkyard",
	[370] = "Operation: Mechagon - Workshop",
	[375] = "Mists of Tirna Scithe",
	[376] = "The Necrotic Wake",
	[377] = "De Other Side",
	[378] = "Halls of Atonement",
	[379] = "Plaguefall",
	[380] = "Sanguine Depths",
	[381] = "Spires of Ascension",
	[382] = "Theater of Pain",
	[391] = "Tazavesh: Streets of Wonder",
	[392] = "Tazavesh: So'leah's Gambit",
}

local StuffItems = {
	--[[ ! Bank Stuff ! ]]--

	[6948] = "BANK", -- Hearthstone
	[138393] = "BANK", -- Essence Swapper


	--[[ ! Stuff ! ]]--

	-- Teleport Item
	[103678] = true, -- Time-Lost Artifact
	[110560] = true, -- Garrison Hearthstone
	[118662] = true, -- Bladespire Relic
	[118663] = true, -- Relic of Karabor
	[118907] = true, -- Pit Fighter's Punching Ring (Alliance)
	[118908] = true, -- Pit Fighter's Punching Ring (Horde)
	[128353] = true, -- Admiral's Compass
	[139590] = true, -- Scroll of Teleport: Ravenholdt
	[140192] = true, -- Dalaran Hearthstone
	[141605] = true, -- Flight Master's Whistle
	[142469] = true, -- Violet Seal of the Grand Magus
	[144341] = true, -- Rechargeable Reaves Battery
	[144391] = true, -- Pugilist's Powerful Punching Ring (Alliance)
	[144392] = true, -- Pugilist's Powerful Punching Ring (Horde)
	[168862] = true, -- G.E.A.R. Tracking Beacon
	[180817] = true, -- Cypher of Relocation
	[32757] = true, -- Blessed Medallion of Karabor
	[37863] = true, -- Direbrew's Remote
	[40585] = true, -- Signet of the Kirin Tor
	[40586] = true, -- Band of the Kirin Tor
	[44935] = true, -- Ring of the Kirin Tor
	[46874] = true, -- Argent Crusader's Tabard
	[48957] = true, -- Etched Signet of the Kirin Tor
	[50287] = true, -- Boots of the Bay
	[52251] = true, -- Jaina's Locket
	[63206] = true, -- Wrap of Unity (Alliance)
	[63207] = true, -- Wrap of Unity (Horde)
	[63352] = true, -- Shroud of Cooperation (Alliance)
	[63353] = true, -- Shroud of Cooperation (Horde)
	[63378] = true, -- Hellscream's Reach Tabard
	[63379] = true, -- Baradin's Wardens Tabard
	[64457] = true, -- The Last Relic of Argus
	[65274] = true, -- Cloak of Coordination (Horde)
	[65360] = true, -- Cloak of Coordination (Alliance)
	[95050] = true, -- The Brassiest Knuckle (Horde)
	[95051] = true, -- The Brassiest Knuckle (Alliance)

	-- Toy
	[111820] = true, -- Swapblaster
	[122124] = true, -- Darkmoon Cannon
	[167860] = true, -- Ancient Tauren Talisman
	[180454] = true, -- Anti-Doom Broom
	[94154] = true, -- Survivor's Bag of Coins

	-- Profession Tool
	[109262] = "Alchemy|Junk#Junk", -- Draenic Philosopher's Stone
	[114943] = true, -- Ultimate Gnomish Army Knife
	[116913] = "Mining", -- Peon's Mining Pick
	[116916] = "Herbalism", -- Gorepetal's Gentle Grasp
	[152839] = "Blacksmithing|Junk#Junk", -- Khaz'gorian Smithing Hammer
	[153290] = "Mining|Junk#Junk", -- Krokul Mining Pick
	[164733] = "Tailoring|Junk#Junk", -- Synchronous Thread
	[164766] = "Enchanting|Junk#Junk", -- Iwen's Enchanting Rod
	[23821] = true, -- Zapthrottle Mote Extractor
	[49040] = true, -- Jeeves
	[67494] = "Herbalism,Mining,Skinning|Junk#Junk", -- Electrostatic Condenser
	[85777] = "Mining|Mining#Tradeskill", -- Ancient Pandaren Mining Pick
	[86566] = "Herbalism,Mining,Skinning|14. Archaeology#Tradeskill", -- Forager's Gloves
	[87213] = "Herbalism,Mining", -- Mist-Piercing Goggles

	-- Miscellaneous
	[113575] = true, -- Secretive Whistle
	[127770] = true, -- Brazier of Awakening
	[141652] = true, -- Mana Divining Stone
	[147315] = true, -- Smelly's Luckydo
	[151131] = true, -- Lamp of Al'Abas
	[151143] = true, -- Shining Lamp of Al'Abas
	[151144] = true, -- Gleaming Lamp of Al'Abas
	[63359] = true, -- Banner of Cooperation (Alliance)
	[64398] = true, -- Standard of Unity (Alliance)
	[64399] = true, -- Battle Standard of Coordination (Alliance)
	[64400] = true, -- Banner of Cooperation (Horde)
	[64401] = true, -- Standard of Unity (Horde)
	[64402] = true, -- Battle Standard of Coordination (Horde)
}

local Keepsakes = {
	--[[ ! Character Specific Stuff ! ]]--

	-- Felguard/Wrathguard Transmog
	[118413] = "Eld-TheVentureCo", -- Flamegrinder
}

local Stuff = AdiBags:RegisterFilter("Stuff", 99)
Stuff.uiName = "Stuff";
Stuff.uiDesc = "Puts teleport items, profession tools and stuff we always want to keep in their own section."

function Stuff:CheckItem(id)
	local value = StuffItems[id]

	if value == true then
		return "Stuff", "Junk"
	elseif value == "BANK" then
		return "Bank Stuff", "Junk"
	elseif value then
		local values, alt = strsplit("|", value)
		values = { strsplit(",", values) }

		local class = select(2, UnitClass("player"))
		local prof1, prof2 = GetProfessions()
		local profession = ""

		if prof1 then
			local name = GetProfessionInfo(prof1)
			if name ~= "Engineering" then
				profession = name
			end
		end
		if prof2 then
			local name = GetProfessionInfo(prof2)
			if name ~= "Engineering" then
				profession = name
			end
		end

		for k, v in ipairs(values) do
			if v == class then
				return "Stuff", "Junk"
			elseif v == profession then
				return "Stuff", "Junk"
			end
		end

		if alt then
			return strsplit("#", alt)
		end
	end

	return false
end

function Stuff:Filter(slotData)
	local id = GetContainerItemID(slotData.bag, slotData.slot)

	if id and Keepsakes[id] then
		local char, realm = UnitFullName("player")
		local characters = { strsplit(",", Keepsakes[id]) }

		for k, v in ipairs(characters) do
			if v == (char .. "-" .. realm) then
				return "Stuff", "Junk"
			end
		end

		return "Stuff", "Junk"
	end

	if id and StuffItems[id] then
		if Stuff:CheckItem(id) then
			if id == 141605 and C_QuestLog.IsQuestFlaggedCompleted(54642) then
				-- Put Flight Master's Whistle in the bank if the Gnome Heritage quest is completed
				return "Bank Stuff", "Junk"
			end

			return Stuff:CheckItem(id)
		end
	end

	return
end


local ZigiItems = {
	-- Section#Category|CLASS,Profession|AltSection#AltCategory or Junk#Junk

	-- Guild Charter
	[5863] = "Guild Charter#Container",

	--[[ ! Mythic Keystone ! ]]--

	[138019] = "Mythic Keystone", -- Mythic Keystone
	[158923] = "Mythic Keystone", -- Mythic Keystone
	[180653] = "Mythic Keystone", -- Mythic Keystone
	[151086] = "Mythic Keystone", -- Mythic Invitational Keystone
	[187786] = "Mythic Keystone", -- Timeworn Keystone


	--[[ ! Zone ! ]]--
	-- Sort by Expansion descending, Level descending

	-- Shadowlands (91)
	-- -- Sepulcher of the First Ones (57)
	-- -- Sanctum of Domination (58)
	-- -- Castle Nathria (59)
	-- -- Tazavesh, the Veiled Market (71)
	[187552] = "9171. Tazavesh, the Veiled Market#Zone", -- Perfectly-Forged Credentials
	[185954] = "9171. Tazavesh, the Veiled Market#Zone", -- Passably-Forged Credentials
	[185953] = "9171. Tazavesh, the Veiled Market#Zone", -- Fraudulent Credentials
	-- -- Sanguine Depths (72)
	-- -- De Other Side (73)
	-- -- Theater of Pain (74)
	-- -- Spires of Ascension (75)
	-- -- Halls of Atonement (76)
	-- -- Mists of Tirna Scithe (77)
	-- -- Plaguefall (78)
	-- -- The Necrotic Wake (79)
	-- -- Zereth Mortis (87)
	-- -- -- Zereth Mortis (01)
	[187728] = "918701. Zereth Mortis#Zone", -- Ephemera Strands
	[188949] = "918701. Zereth Mortis#Zone", -- Mysterious Object (1)
	[188950] = "918701. Zereth Mortis#Zone", -- Mysterious Object (2)
	[189704] = "918701. Zereth Mortis#Zone", -- Dominance Key
	[189767] = "918701. Zereth Mortis#Zone", -- Roaming Repair Tool
	[189768] = "918701. Zereth Mortis#Zone", -- Jiro Hammer
	[189863] = "918701. Zereth Mortis#Zone", -- Spatial Opener
	[190189] = "918701. Zereth Mortis#Zone", -- Sandworn Relic
	[190197] = "918701. Zereth Mortis#Zone", -- Sandworn Chest Key
	[190198] = "918701. Zereth Mortis#Zone", -- Sandworn Chest Key Fragment
	[190657] = "918701. Zereth Mortis#Zone", -- Resonant Rage Fluidic Spheroid
	[190658] = "918701. Zereth Mortis#Zone", -- Resonant Gossamer Fluidic Spheroid
	[190659] = "918701. Zereth Mortis#Zone", -- Resonant Carapace Fluidic Spheroid
	[190660] = "918701. Zereth Mortis#Zone", -- Resonant Mucus Fluidic Spheroid
	[190661] = "918701. Zereth Mortis#Zone", -- Resonant Regrowth Fluidic Spheroid
	[190727] = "918701. Zereth Mortis#Zone", -- Security Override Orb
	-- -- -- Protoform Synthesis (02)
	[187633] = "918702. Protoform Synthesis#Zone", -- Bufonid Lattice
	[187634] = "918702. Protoform Synthesis#Zone", -- Ambystan Lattice
	[187635] = "918702. Protoform Synthesis#Zone", -- Cervid Lattice
	[187636] = "918702. Protoform Synthesis#Zone", -- Aurelid Lattice
	[187885] = "918702. Protoform Synthesis#Zone", -- Honeycombed Lattice
	[188957] = "918702. Protoform Synthesis#Zone", -- Genesis Mote
	[189145] = "918702. Protoform Synthesis#Zone", -- Helicid Lattice
	[189146] = "918702. Protoform Synthesis#Zone", -- Geomental Lattice
	[189147] = "918702. Protoform Synthesis#Zone", -- Leporid Lattice
	[189148] = "918702. Protoform Synthesis#Zone", -- Poultrid Lattice
	[189149] = "918702. Protoform Synthesis#Zone", -- Proto Avian Lattice
	[189150] = "918702. Protoform Synthesis#Zone", -- Raptora Lattice
	[189151] = "918702. Protoform Synthesis#Zone", -- Scarabid Lattice
	[189152] = "918702. Protoform Synthesis#Zone", -- Tarachnid Lattice
	[189153] = "918702. Protoform Synthesis#Zone", -- Unformed Lattice
	[189154] = "918702. Protoform Synthesis#Zone", -- Vespoid Lattice
	[189155] = "918702. Protoform Synthesis#Zone", -- Viperid Lattice
	[189156] = "918702. Protoform Synthesis#Zone", -- Vombata Lattice
	[189157] = "918702. Protoform Synthesis#Zone", -- Glimmer of Animation
	[189158] = "918702. Protoform Synthesis#Zone", -- Glimmer of Cunning
	[189159] = "918702. Protoform Synthesis#Zone", -- Glimmer of Discovery
	[189160] = "918702. Protoform Synthesis#Zone", -- Glimmer of Focus
	[189161] = "918702. Protoform Synthesis#Zone", -- Glimmer of Malice
	[189162] = "918702. Protoform Synthesis#Zone", -- Glimmer of Metamorphosis
	[189163] = "918702. Protoform Synthesis#Zone", -- Glimmer of Motion
	[189164] = "918702. Protoform Synthesis#Zone", -- Glimmer of Multiplicity
	[189165] = "918702. Protoform Synthesis#Zone", -- Glimmer of Predation
	[189166] = "918702. Protoform Synthesis#Zone", -- Glimmer of Renewal
	[189167] = "918702. Protoform Synthesis#Zone", -- Glimmer of Satisfaction
	[189168] = "918702. Protoform Synthesis#Zone", -- Glimmer of Serenity
	[189169] = "918702. Protoform Synthesis#Zone", -- Glimmer of Survival
	[189170] = "918702. Protoform Synthesis#Zone", -- Glimmer of Vigilance
	[189171] = "918702. Protoform Synthesis#Zone", -- Bauble of Pure Innovation
	[189172] = "918702. Protoform Synthesis#Zone", -- Crystallized Echo of the First Song
	[189173] = "918702. Protoform Synthesis#Zone", -- Eternal Ragepearl
	[189174] = "918702. Protoform Synthesis#Zone", -- Lens of Focused Intention
	[189175] = "918702. Protoform Synthesis#Zone", -- Mawforged Bridle
	[189176] = "918702. Protoform Synthesis#Zone", -- Protoform Sentience Crown
	[189177] = "918702. Protoform Synthesis#Zone", -- Revelation Key
	[189178] = "918702. Protoform Synthesis#Zone", -- Tools of Incomprehensible Experimentation
	[189179] = "918702. Protoform Synthesis#Zone", -- Unalloyed Bronze Ingot
	[189180] = "918702. Protoform Synthesis#Zone", -- Wind's Infinite Call
	[189500] = "918702. Protoform Synthesis#Zone", -- Cervid Lattice
	[190388] = "918702. Protoform Synthesis#Zone", -- Lupine Lattice
	-- -- Korthia (88)
	[186685] = "9188. Korthia#Zone", -- Relic Fragment
	[187322] = "9188. Korthia#Zone", -- Crumbling Stone Tablet
	[187457] = "9188. Korthia#Zone", -- Engraved Glass Pane
	[187324] = "9188. Korthia#Zone", -- Gnawed Ancient Idol
	[187323] = "9188. Korthia#Zone", -- Runic Diagram
	[187460] = "9188. Korthia#Zone", -- Strangely Intricate Key
	[187458] = "9188. Korthia#Zone", -- Unearthed Teleporter Sigil
	[187459] = "9188. Korthia#Zone", -- Vial of Mysterious Liquid
	[187465] = "9188. Korthia#Zone", -- Complicated Organism Harmonizer
	[187327] = "9188. Korthia#Zone", -- Encrypted Korthian Journal
	[187463] = "9188. Korthia#Zone", -- Enigmatic Map Fragments
	[187325] = "9188. Korthia#Zone", -- Faded Razorwing Anatomy Illustration
	[187326] = "9188. Korthia#Zone", -- Half-Completed Runeforge Pattern
	[187462] = "9188. Korthia#Zone", -- Scroll of Shadowlands Fables
	[187478] = "9188. Korthia#Zone", -- White Razorwing Talon
	[187336] = "9188. Korthia#Zone", -- Forbidden Weapon Schematics
	[187466] = "9188. Korthia#Zone", -- Korthian Cypher Book
	[187332] = "9188. Korthia#Zone", -- Recovered Page of Voices
	[187328] = "9188. Korthia#Zone", -- Ripped Cosmology Chart
	[187334] = "9188. Korthia#Zone", -- Shattered Void Tablet
	[187330] = "9188. Korthia#Zone", -- Naaru Shard Fragment
	[187329] = "9188. Korthia#Zone", -- Old God Specimen Jar
	[187467] = "9188. Korthia#Zone", -- Perplexing Rune-Cube
	[187331] = "9188. Korthia#Zone", -- Tattered Fae Designs
	[187311] = "9188. Korthia#Zone", -- Azgoth's Tattered Maps
	[187333] = "9188. Korthia#Zone", -- Core of an Unknown Titan
	[187350] = "9188. Korthia#Zone", -- Displaced Relic
	[187335] = "9188. Korthia#Zone", -- Maldraxxus Larva Shell
	[187153] = "9188. Korthia#Zone", -- Tasty Mawshroom
	[187054] = "9188. Korthia#Zone", -- Lost Razorwing Egg
	[186718] = "9188. Korthia#Zone", -- Teleporter Repair Kit
	[186731] = "9188. Korthia#Zone", -- Repaired Riftkey
	[187612] = "9188. Korthia#Zone", -- Key of Flowing Waters
	[187613] = "9188. Korthia#Zone", -- Key of the Inner Chambers
	[186984] = "9188. Korthia#Zone", -- Korthite Crystal Key
	[187614] = "9188. Korthia#Zone", -- Key of Many Thoughts
	-- -- The Maw (89)
	[186603] = "9189. The Maw#Zone", -- Nilganihmaht's Stone Ring
	[186600] = "9189. The Maw#Zone", -- Quartered Ancient Ring
	[186601] = "9189. The Maw#Zone", -- Quartered Ancient Ring
	[186602] = "9189. The Maw#Zone", -- Quartered Ancient Ring
	[186604] = "9189. The Maw#Zone", -- Quartered Ancient Ring
	[186605] = "9189. The Maw#Zone", -- Nilganihmaht's Runed Band
	[186608] = "9189. The Maw#Zone", -- Nilganihmaht's Gold Band
	[186607] = "9189. The Maw#Zone", -- Nilganihmaht's Silver Ring
	[186727] = "9189. The Maw#Zone", -- Seal Breaker Key
	[186606] = "9189. The Maw#Zone", -- Nilganihmaht's Signet Ring
	[182329] = "9189. The Maw#Zone", -- Domination's Calling
	[182326] = "9189. The Maw#Zone", -- Dominion Etching: Pain
	[182327] = "9189. The Maw#Zone", -- Dominion Etching: Loss
	[182328] = "9189. The Maw#Zone", -- Dominion Etching: Grief
	-- -- Revendreth (91)
	-- -- -- The Avowed (98)
	[180451] = "919198. The Avowed#Zone", -- Grand Inquisitor's Sinstone Fragment
	[173795] = "919198. The Avowed#Zone", -- Grand Inquisitor's Sinstone
	[172998] = "919198. The Avowed#Zone", -- Inquisitor Otilia's Sinstone
	[172997] = "919198. The Avowed#Zone", -- Inquisitor Petre's Sinstone
	[172996] = "919198. The Avowed#Zone", -- Inquisitor Sorin's Sinstone
	[172999] = "919198. The Avowed#Zone", -- Inquisitor Traian's Sinstone
	[173006] = "919198. The Avowed#Zone", -- High Inquisitor Dacian's Sinstone
	[173000] = "919198. The Avowed#Zone", -- High Inquisitor Gabi's Sinstone
	[173005] = "919198. The Avowed#Zone", -- High Inquisitor Magda's Sinstone
	[173001] = "919198. The Avowed#Zone", -- High Inquisitor Radu's Sinstone
	[173008] = "919198. The Avowed#Zone", -- Grand Inquisitor Aurica's Sinstone
	[173007] = "919198. The Avowed#Zone", -- Grand Inquisitor Nicu's Sinstone
	[173794] = "919198. The Avowed#Zone", -- High Inquisitor Sinstone
	[173793] = "919198. The Avowed#Zone", -- Inquisitor Sinstone
	[172957] = "919198. The Avowed#Zone", -- Atonement Crypt Key
	-- -- -- Revendreth (99)
	[182744] = "919199. Revendreth#Zone", -- Ornate Belt Buckle
	[182746] = "919199. Revendreth#Zone", -- All-In-One Belt Repair Kit
	[182705] = "919199. Revendreth#Zone", -- Vial of Blue Muck Dye
	[182704] = "919199. Revendreth#Zone", -- Green Muck Dye
	[182703] = "919199. Revendreth#Zone", -- Bubbling Red Muck Dye
	[184446] = "919199. Revendreth#Zone", -- Vial of Blue Muck Dye
	[182702] = "919199. Revendreth#Zone", -- Phial of Black Muck Dye
	[173939] = "919199. Revendreth#Zone", -- Enticing Anima
	[177223] = "919199. Revendreth#Zone", -- Scorched Crypt Key
	-- -- Ardenweald (92)
	[180655] = "9192. Ardenweald#Zone", -- Raw Dream Fibers
	[180656] = "9192. Ardenweald#Zone", -- Enchanted Bough
	[180654] = "9192. Ardenweald#Zone", -- Fae Ornament
	-- -- Maldraxxus (93)
	[175757] = "9193. Maldraxxus#Zone", -- Construct Supply Key
	[183401] = "9193. Maldraxxus#Zone", -- Amethystine Dye
	-- -- Bastion (94)
	[180049] = "9194. Bastion#Zone", -- Steward's Silver Key
	[180285] = "9194. Bastion#Zone", -- Steward's Golden Key
	[178915] = "9194. Bastion#Zone", -- Ripe Purian
	[184759] = "9194. Bastion#Zone", -- Tasty Purian
	[180536] = "9194. Bastion#Zone", -- Broken Kyrian Flute
	-- -- Oribos (99)

	-- Kul Tiras and Zandalar (92)
	-- -- Visions of N'Zoth (79)
	[173363] = "9279. Visions of N'Zoth#Zone", -- Vessel of Horrific Visions
	[174756] = "9279. Visions of N'Zoth#Zone", -- Aqir Relic Fragment
	[174761] = "9279. Visions of N'Zoth#Zone", -- Aqir Relic
	[174764] = "9279. Visions of N'Zoth#Zone", -- Tol'vir Relic Fragment
	[174765] = "9279. Visions of N'Zoth#Zone", -- Tol'vir Relic
	[174758] = "9279. Visions of N'Zoth#Zone", -- Voidwarped Relic Fragment
	[174768] = "9279. Visions of N'Zoth#Zone", -- Cursed Relic
	[174759] = "9279. Visions of N'Zoth#Zone", -- Mogu Relic Fragment
	[174767] = "9279. Visions of N'Zoth#Zone", -- Mogu Relic
	[174760] = "9279. Visions of N'Zoth#Zone", -- Mantid Relic Fragment
	[174766] = "9279. Visions of N'Zoth#Zone", -- Mantid Relic
	[174927] = "9279. Visions of N'Zoth#Zone", -- Zan-Tien Lasso
	[170553] = "9279. Visions of N'Zoth#Zone", -- Void Focus Splinter
	-- -- Nazjatar (88)
	[168802] = "9288. Nazjatar#Zone", -- Nazjatar Battle Commendation
	[167077] = "9288. Nazjatar#Zone", -- Scrying Stone
	[166888] = "9288. Nazjatar#Zone", -- Germinating Seed
	[167012] = "9288. Nazjatar#Zone", -- Brinestone Pickaxe
	[167059] = "9288. Nazjatar#Zone", -- Chum
	[169332] = "9288. Nazjatar#Zone", -- Strange Mineralized Water
	[169333] = "9288. Nazjatar#Zone", -- Strange Volcanic Rock
	[169334] = "9288. Nazjatar#Zone", -- Strange Oceanic Sediment
	-- -- Mechagon (89)
	[167555] = "9289. Mechagon#Zone", -- Pocket-Sized Computation Device
	[169114] = "9289. Mechagon#Zone", -- Personal Time Displacer
	[169868] = "9289. Mechagon#Zone", -- Anti-Gravity Pack
	[168327] = "9289. Mechagon#Zone", -- Chain Ignitercoil
	[168832] = "9289. Mechagon#Zone", -- Galvanic Oscillator
	[169610] = "9289. Mechagon#Zone", -- S.P.A.R.E. Crate
	[166846] = "9289. Mechagon#Zone", -- Spare Parts
	[166971] = "9289. Mechagon#Zone", -- Empty Energy Cell
	[166970] = "9289. Mechagon#Zone", -- Energy Cell
	[167562] = "9289. Mechagon#Zone", -- Ionized Minnow
	[169470] = "9289. Mechagon#Zone", -- Pressure Relief Valve
	[168217] = "9289. Mechagon#Zone", -- Hardened Spring
	[168216] = "9289. Mechagon#Zone", -- Tempered Plating
	[168215] = "9289. Mechagon#Zone", -- Machined Gear Assembly
	[167649] = "9289. Mechagon#Zone", -- Hundred-Fathom Lure
	[168483] = "9289. Mechagon#Zone", -- Protocol Transference Device
	-- -- Vol'dun (91)
	[158915] = "9291. Vol'dun#Zone", -- Polished Ringhorn Hoof
	[158916] = "9291. Vol'dun#Zone", -- Sturdy Redrock Jaw
	[158910] = "9291. Vol'dun#Zone", -- Charged Ranishu Antennae
	-- -- Nazmir (92)
	[157802] = "9292. Nazmir#Zone", -- Nazwathan Relic
	[157801] = "9292. Nazmir#Zone", -- Snapjaw Tail
	[157797] = "9292. Nazmir#Zone", -- Vilescale Pearl
	-- -- Zuldazar (93)
	[156963] = "9293. Zuldazar#Zone", -- Golden Ravasaur Egg
	[157794] = "9293. Zuldazar#Zone", -- Feathered Viper Scale
	-- -- Stormsong Valley (94)
	[169109] = "9294. Stormsong Valley#Zone", -- Beeholder's Goggles
	[162000] = "9294. Stormsong Valley#Zone", -- Pig Nose
	-- -- Drustvar (95)
	[163710] = "9295. Drustvar#Zone", -- Merchant's Key
	[163789] = "9295. Drustvar#Zone", -- Bundle of Wicker Sticks
	[163790] = "9295. Drustvar#Zone", -- Spooky Incantation
	[163791] = "9295. Drustvar#Zone", -- Miniature Stag Skull
	[163796] = "9295. Drustvar#Zone", -- Wolf Pup Spine
	-- -- Tiragarde Sound (96)

	-- Broken Isles and Argus (93)
	-- -- Eredath (88)
	-- -- Antoran Wastes (89)
	[153226] = "9389. Antoran Wastes#Zone", -- Observer's Locus Resonator
	-- -- Krokuun (90)
	-- -- The Vindicaar (91)
	-- -- Broken Shore (92)
	[147451] = "9392. Broken Shore#Zone", -- Armorcrafter's Commendation
	[143559] = "9392. Broken Shore#Zone", -- Wyrmtongue's Cache Key
	[147356] = "9392. Broken Shore#Zone", -- Broken Sentinax Beacon
	[146906] = "9392. Broken Shore#Zone", -- Sentinax Beacon of Carnage
	[146903] = "9392. Broken Shore#Zone", -- Sentinax Beacon of Domination
	[146908] = "9392. Broken Shore#Zone", -- Sentinax Beacon of Engineering
	[146922] = "9392. Broken Shore#Zone", -- Sentinax Beacon of Fel Growth
	[146923] = "9392. Broken Shore#Zone", -- Sentinax Beacon of Petrification
	[147355] = "9392. Broken Shore#Zone", -- Sentinax Beacon of the Bloodstrike
	[146905] = "9392. Broken Shore#Zone", -- Sentinax Beacon of the Firestorm
	[146909] = "9392. Broken Shore#Zone", -- Sentinax Beacon of Torment
	[146907] = "9392. Broken Shore#Zone", -- Sentinax Beacon of Warbeasts
	[146912] = "9392. Broken Shore#Zone", -- Sentinax Beacon of Greater Carnage
	[146910] = "9392. Broken Shore#Zone", -- Sentinax Beacon of Greater Domination
	[146914] = "9392. Broken Shore#Zone", -- Sentinax Beacon of Greater Engineering
	[146911] = "9392. Broken Shore#Zone", -- Sentinax Beacon of the Greater Firestorm
	[146915] = "9392. Broken Shore#Zone", -- Sentinax Beacon of Greater Torment
	[146913] = "9392. Broken Shore#Zone", -- Sentinax Beacon of Greater Warbeasts
	-- -- Suramar (93)
	[139786] = "9393. Suramar#Zone", -- Ancient Mana Crystal
	[143734] = "9393. Suramar#Zone", -- Ancient Mana Crystal Cluster
	[129036] = "9393. Suramar#Zone", -- Ancient Mana Fragment
	[139884] = "9393. Suramar#Zone", -- Ancient Mana Fragments
	[139890] = "9393. Suramar#Zone", -- Ancient Mana Gem
	[129097] = "9393. Suramar#Zone", -- Ancient Mana Gem
	[143733] = "9393. Suramar#Zone", -- Ancient Mana Shards
	[143735] = "9393. Suramar#Zone", -- Ancient Mana Shards
	[129098] = "9393. Suramar#Zone", -- Ancient Mana Stone
	[141655] = "9393. Suramar#Zone", -- Shimmering Ancient Mana Cluster
	[140242] = "9393. Suramar#Zone", -- Astromancer's Compass
	[140239] = "9393. Suramar#Zone", -- Excavated Highborne Artifact
	[140245] = "9393. Suramar#Zone", -- The Tidemistress' Enchanted Pearl
	[140236] = "9393. Suramar#Zone", -- A Mrglrmrl Mlrglr
	[140246] = "9393. Suramar#Zone", -- Arc of Snow
	[140401] = "9393. Suramar#Zone", -- Blue Or'ligai Egg
	[140240] = "9393. Suramar#Zone", -- Enchanted Moonwell Waters
	[140402] = "9393. Suramar#Zone", -- Green Or'ligai Egg
	[140405] = "9393. Suramar#Zone", -- Illusion Matrix Crystal
	[140404] = "9393. Suramar#Zone", -- Intact Guardian Core
	[140403] = "9393. Suramar#Zone", -- Lylandre's Fel Crystal
	[140248] = "9393. Suramar#Zone", -- Master Jeweler's Gem
	[140406] = "9393. Suramar#Zone", -- Primed Arcane Charge
	[140399] = "9393. Suramar#Zone", -- Yellow Or'ligai Egg
	[140243] = "9393. Suramar#Zone", -- Azurefall Essence
	[143748] = "9393. Suramar#Zone", -- Leyscale Koi
	[140949] = "9393. Suramar#Zone", -- Onyx Or'ligai Egg
	[140390] = "9393. Suramar#Zone", -- Red Or'ligai Egg
	[140235] = "9393. Suramar#Zone", -- Small Jar of Arcwine
	[137010] = "9393. Suramar#Zone", -- Half-Full Bottle of Arcwine
	[140234] = "9393. Suramar#Zone", -- Selentia's Mana-Infused Brooch
	-- -- Stormheim (94)
	-- -- Highmountain (95)
	[131809] = "9395. Highmountain#Zone", -- Gleaming Roc Feather
	[131810] = "9395. Highmountain#Zone", -- Derelict Skyhorn Kite
	[131926] = "9395. Highmountain#Zone", -- Delicate Roc Feather
	[131927] = "9395. Highmountain#Zone", -- Shimmering Roc Feather
	-- -- Val'sharah (96)
	-- -- Eye of Azshara (97)
	-- -- Azsuna (98)
	-- -- Dalaran (Broken Isles) (99)

	-- Draenor (94)
	-- -- Hellfire Citadel (57)
	-- -- Blackrock Foundry (58)
	-- -- Highmaul (59)
	-- -- Tanaan Jungle (92)
	[128502] = "9492. Tanaan Jungle#Zone", -- Hunter's Seeking Crystal
	[128503] = "9492. Tanaan Jungle#Zone", -- Master Hunter's Seeking Crystal
	-- -- Nagrand (93)
	-- -- Spires of Arak (94)
	-- -- Talador (96)
	-- -- Gorgrond (97)
	-- -- Frostfire Ridge (98)
	-- -- Shadowmoon Valley (99)

	-- Pandaria (95)
	-- -- Timeless Isle (90)
	-- -- Isle of Thunder (91)
	[94222] = "9591. Isle of Thunder#Zone", -- Key to the Palace of Lei Shen
	-- -- Isle of Giants (92)
	[94288] = "9592. Isle of Giants#Zone", -- Giant Dinosaur Bone
	-- -- Vale of Eternal Blossoms (93)
	[87779] = "9593. Vale of Eternal Blossoms#Zone", -- Ancient Guo-Lai Cache Key
	[86547] = "9593. Vale of Eternal Blossoms#Zone", -- Skyshard
	[86546] = "9593. Vale of Eternal Blossoms#Zone", -- Sky Crystal
	-- -- Dread Wastes (94)
	-- -- Townlong Steppes (95)
	-- -- Kun-Lai Summit (96)
	-- -- Krasarang Wilds (97)
	-- -- Valley of the Four Winds (98)
	-- -- The Jade Forest (99)

	-- Cataclysm (96)

	-- Northrend (97)
	-- -- Icecrown Citadel (52)
	[52025] = "9752. Icecrown Citadel#Zone|ROGUE,DEATHKNIGHT,MAGE,DRUID", -- Vanquisher's Mark of Sanctification
	[52028] = "9752. Icecrown Citadel#Zone|ROGUE,DEATHKNIGHT,MAGE,DRUID", -- Vanquisher's Mark of Sanctification (Heroic)
	[52026] = "9752. Icecrown Citadel#Zone|WARRIOR,HUNTER,SHAMAN", -- Protector's Mark of Sanctification
	[52029] = "9752. Icecrown Citadel#Zone|WARRIOR,HUNTER,SHAMAN", -- Protector's Mark of Sanctification (Heroic)
	[52027] = "9752. Icecrown Citadel#Zone|PALADIN,PRIEST,WARLOCK", -- Conqueror's Mark of Sanctification
	[52030] = "9752. Icecrown Citadel#Zone|PALADIN,PRIEST,WARLOCK", -- Conqueror's Mark of Sanctification (Heroic)

	-- Outland (98)
	-- -- Magister's Terrace (64)
	-- -- The Arcatraz (65)
	-- -- The Mechanar (66)
	-- -- The Botanica (67)
	-- -- Shadow Labyrinth (68)
	-- -- Sethekk Halls (69)
	-- -- Mana-Tombs (70)
	[32092] = "9870. Mana-Tombs#Zone", -- The Eye of Haramad
	[29750] = "9870. Mana-Tombs#Zone", -- Ethereum Stasis Chamber Key
	-- -- The Black Morass (71)
	-- -- Old Hillsbrad Foothills (72)
	-- -- Auchenai Crypts (73)
	-- -- The Steamvault (74)
	-- -- The Underbog (75)
	-- -- The Slave Pens (76)
	-- -- The Shattered Halls (77)
	-- -- The Blood Furnace (78)
	-- -- Hellfire Ramparts (79)

	-- -- Isle of Quel'Danas (91)
	-- -- Netherstorm (92)
	-- -- Shadowmoon Valley (93)
	-- -- Blade's Edge Mountains (94)
	[32569] = "9894. Blade's Edge Mountains#Zone", -- Apexis Shard
	-- -- Nagrand (95)
	-- -- Terokkar Forest (96)
	-- -- Zangarmarsh (97)
	-- -- Hellfire Peninsula (98)
	-- -- Shattrath (99)

	-- Classic (99)
	-- -- Ahn'Qiraj (51)
	[76401] = "9951. Ahn'Qiraj#Zone", -- Scarab Coffer Key
	[76402] = "9951. Ahn'Qiraj#Zone", -- Greater Scarab Coffer Key
	[21229] = "9951. Ahn'Qiraj#Zone", -- Qiraji Lord's Insignia
	[20864] = "9951. Ahn'Qiraj#Zone", -- Bone Scarab
	[20861] = "9951. Ahn'Qiraj#Zone", -- Bronze Scarab
	[20863] = "9951. Ahn'Qiraj#Zone", -- Clay Scarab
	[20862] = "9951. Ahn'Qiraj#Zone", -- Crystal Scarab
	[20859] = "9951. Ahn'Qiraj#Zone", -- Gold Scarab
	[20865] = "9951. Ahn'Qiraj#Zone", -- Ivory Scarab
	[20860] = "9951. Ahn'Qiraj#Zone", -- Silver Scarab
	[20858] = "9951. Ahn'Qiraj#Zone", -- Stone Scarab
	[21232] = "9951. Ahn'Qiraj#Zone", -- Imperial Qiraji Armaments
	[21237] = "9951. Ahn'Qiraj#Zone", -- Imperial Qiraji Regalia
	[20874] = "9951. Ahn'Qiraj#Zone", -- Idol of the Sun
	[20875] = "9951. Ahn'Qiraj#Zone", -- Idol of Night
	[20876] = "9951. Ahn'Qiraj#Zone", -- Idol of Death
	[20877] = "9951. Ahn'Qiraj#Zone", -- Idol of the Sage
	[20878] = "9951. Ahn'Qiraj#Zone", -- Idol of Rebirth
	[20879] = "9951. Ahn'Qiraj#Zone", -- Idol of Life
	[20881] = "9951. Ahn'Qiraj#Zone", -- Idol of Strife
	[20882] = "9951. Ahn'Qiraj#Zone", -- Idol of War
	[20869] = "9951. Ahn'Qiraj#Zone", -- Amber Idol
	[20870] = "9951. Ahn'Qiraj#Zone", -- Jasper Idol
	[20872] = "9951. Ahn'Qiraj#Zone", -- Vermillion Idol
	[20873] = "9951. Ahn'Qiraj#Zone", -- Alabaster Idol
	[20871] = "9951. Ahn'Qiraj#Zone", -- Obsidian Idol
	[20866] = "9951. Ahn'Qiraj#Zone", -- Azure Idol
	[20868] = "9951. Ahn'Qiraj#Zone", -- Lambent Idol
	[20867] = "9951. Ahn'Qiraj#Zone", -- Onyx Idol
	[20928] = "9951. Ahn'Qiraj#Zone|WARRIOR,HUNTER,ROGUE,PRIEST", -- Qiraji Bindings of Command
	[20932] = "9951. Ahn'Qiraj#Zone|PALADIN,SHAMAN,MAGE,WARLOCK,DRUID", -- Qiraji Bindings of Dominance
	[20927] = "9951. Ahn'Qiraj#Zone|WARRIOR,ROGUE,PRIEST,MAGE", -- Ouro's Intact Hide
	[20931] = "9951. Ahn'Qiraj#Zone|PALADIN,HUNTER,SHAMAN,WARLOCK,DRUID", -- Skin of the Great Sandworm
	[20926] = "9951. Ahn'Qiraj#Zone|WARRIOR,PRIEST,MAGE,WARLOCK", -- Vek'nilash's Circlet
	[20930] = "9951. Ahn'Qiraj#Zone|PALADIN,HUNTER,ROGUE,SHAMAN,DRUID", -- Vek'lor's Diadem
	[20933] = "9951. Ahn'Qiraj#Zone|PRIEST,MAGE,WARLOCK,DRUID", -- Husk of the Old God
	[20929] = "9951. Ahn'Qiraj#Zone|WARRIOR,PALADIN,HUNTER,ROGUE,SHAMAN", -- Carapace of the Old God
	[20884] = "9951. Ahn'Qiraj#Zone|WARRIOR,PALADIN,SHAMAN,MAGE,DRUID", -- Qiraji Magisterial Ring
	[20888] = "9951. Ahn'Qiraj#Zone|HUNTER,ROGUE,PRIEST,WARLOCK", -- Qiraji Ceremonial Ring
	[20886] = "9951. Ahn'Qiraj#Zone|WARRIOR,PALADIN,HUNTER,ROGUE,SHAMAN", -- Qiraji Spiked Hilt
	[20890] = "9951. Ahn'Qiraj#Zone|PRIEST,MAGE,WARLOCK,DRUID", -- Qiraji Ornate Hilt
	[20889] = "9951. Ahn'Qiraj#Zone|PALADIN,HUNTER,SHAMAN,WARLOCK,DRUID", -- Qiraji Regal Drape
	[20885] = "9951. Ahn'Qiraj#Zone|WARRIOR,ROGUE,PRIEST,MAGE", -- Qiraji Martial Drape
	-- -- Dire Maul (71)
	[18258] = "9971. Dire Maul#Zone", -- Gordok Ogre Suit
	[18240] = "9971. Dire Maul#Zone", -- Ogre Tannin
	-- -- Gnomeregan (79)
	[9308] = "9979. Gnomeregan#Zone", -- Grime-Encrusted Object

	-- Holidays
	-- -- Darkmoon Faire (89)
	[81055] = "9989. Darkmoon Faire#Zone", -- Darkmoon Ride Ticket
	[71083] = "9989. Darkmoon Faire#Zone", -- Darkmoon Game Token
	[93730] = "9989. Darkmoon Faire#Zone", -- Darkmoon Top Hat
	[171364] = "9989. Darkmoon Faire#Zone", -- Darkmoon Top Hat
	-- -- Trial of Style (90)
	[151134] = "9990. Trial of Style#Zone", -- Trial of Style Token
	-- -- Noblegarden (99)
	[44791] = "9999. Noblegarden#Zone", -- Noblegarden Chocolate
	[44802] = "9999. Noblegarden#Zone", -- Borrowed Egg Basket


	--[[ ! Professions ! ]]--
	-- Sort by Category ascending, Expansion descending

	--! Cloth (01)
	-- -- Shadowlands (91)
	[187703] = "0191. Shadowlands Cloth#Tradeskill", -- Silken Protofiber
	[172439] = "0191. Shadowlands Cloth#Tradeskill", -- Enchanted Lightless Silk
	[173204] = "0191. Shadowlands Cloth#Tradeskill", -- Lightless Silk
	[173202] = "0191. Shadowlands Cloth#Tradeskill", -- Shrouded Cloth
	[177062] = "0191. Shadowlands Cloth#Tradeskill", -- Penumbra Thread
	-- -- Kul Tiras/Zandalar (92)
	[167738] = "0192. Kul Tiras/Zandalar Cloth#Tradeskill", -- Gilded Seaweave
	[159959] = "0192. Kul Tiras/Zandalar Cloth#Tradeskill", -- Nylon Thread
	[152577] = "0192. Kul Tiras/Zandalar Cloth#Tradeskill", -- Deep Sea Satin
	[152576] = "0192. Kul Tiras/Zandalar Cloth#Tradeskill", -- Tidespray Linen
	[158378] = "0192. Kul Tiras/Zandalar Cloth#Tradeskill", -- Embroidered Deep Sea Satin
	-- -- Broken Isles (93)
	[127004] = "0193. Broken Isles Cloth#Tradeskill", -- Imbued Silkweave
	[124437] = "0193. Broken Isles Cloth#Tradeskill", -- Shal'dorei Silk
	[127037] = "0193. Broken Isles Cloth#Tradeskill", -- Runic Catgut
	[127681] = "0193. Broken Isles Cloth#Tradeskill", -- Sharp Spritethorn
	[151567] = "0193. Broken Isles Cloth#Tradeskill", -- Lightweave Cloth
	[146710] = "0193. Broken Isles Cloth#Tradeskill", -- Bolt of Shadowcloth
	[146711] = "0193. Broken Isles Cloth#Tradeskill", -- Bolt of Starweave
	[142335] = "0193. Broken Isles Cloth#Tradeskill", -- Pristine Falcosaur Feather
	-- -- Draenor (94)
	[111556] = "0194. Draenor Cloth#Tradeskill", -- Hexweave Cloth
	[111557] = "0194. Draenor Cloth#Tradeskill", -- Sumptuous Fur
	-- -- Pandaria (95)
	[82447] = "0195. Pandaria Cloth#Tradeskill", -- Imperial Silk
	[98619] = "0195. Pandaria Cloth#Tradeskill", -- Celestial Cloth
	[82441] = "0195. Pandaria Cloth#Tradeskill", -- Bolt of Windwool Cloth
	[92960] = "0195. Pandaria Cloth#Tradeskill", -- Silkworm Cocoon
	[72988] = "0195. Pandaria Cloth#Tradeskill", -- Windwool Cloth
	-- -- Cataclysm (96)
	[54440] = "0196. Cataclysm Cloth#Tradeskill", -- Dreamcloth
	[53010] = "0196. Cataclysm Cloth#Tradeskill", -- Embersilk Cloth
	[53643] = "0196. Cataclysm Cloth#Tradeskill", -- Bolt of Embersilk Cloth
	-- -- Northrend (97)
	[41593] = "0197. Northrend Cloth#Tradeskill", -- Ebonweave
	[41594] = "0197. Northrend Cloth#Tradeskill", -- Moonshroud
	[41595] = "0197. Northrend Cloth#Tradeskill", -- Spellweave
	[41511] = "0197. Northrend Cloth#Tradeskill", -- Bolt of Imbued Frostweave
	[42253] = "0197. Northrend Cloth#Tradeskill", -- Iceweb Spider Silk
	[33470] = "0197. Northrend Cloth#Tradeskill", -- Frostweave Cloth
	[38426] = "0197. Northrend Cloth#Tradeskill", -- Eternium Thread
	[41510] = "0197. Northrend Cloth#Tradeskill", -- Bolt of Frostweave
	-- -- Outland (98)
	[21882] = "0198. Outland Cloth#Tradeskill", -- Soul Essence
	[21845] = "0198. Outland Cloth#Tradeskill", -- Primal Mooncloth
	[24272] = "0198. Outland Cloth#Tradeskill", -- Shadowcloth
	[24271] = "0198. Outland Cloth#Tradeskill", -- Spellcloth
	[21844] = "0198. Outland Cloth#Tradeskill", -- Bolt of Soulcloth
	[21842] = "0198. Outland Cloth#Tradeskill", -- Bolt of Imbued Netherweave
	[21877] = "0198. Outland Cloth#Tradeskill", -- Netherweave Cloth
	[21881] = "0198. Outland Cloth#Tradeskill", -- Netherweb Spider Silk
	[21840] = "0198. Outland Cloth#Tradeskill", -- Bolt of Netherweave
	-- -- Cloth (99)
	[14342] = "0199. Cloth#Tradeskill", -- Mooncloth
	[14048] = "0199. Cloth#Tradeskill", -- Bolt of Runecloth
	[14047] = "0199. Cloth#Tradeskill", -- Runecloth
	[14256] = "0199. Cloth#Tradeskill", -- Felcloth
	[14341] = "0199. Cloth#Tradeskill", -- Rune Thread
	[14227] = "0199. Cloth#Tradeskill", -- Ironweb Spider Silk
	[4339] = "0199. Cloth#Tradeskill", -- Bolt of Mageweave
	[4338] = "0199. Cloth#Tradeskill", -- Mageweave Cloth
	[10285] = "0199. Cloth#Tradeskill", -- Shadow Silk
	[8343] = "0199. Cloth#Tradeskill", -- Heavy Silken Thread
	[4305] = "0199. Cloth#Tradeskill", -- Bolt of Silk Cloth
	[4337] = "0199. Cloth#Tradeskill", -- Thick Spider's Silk
	[4306] = "0199. Cloth#Tradeskill", -- Silk Cloth
	[4291] = "0199. Cloth#Tradeskill", -- Silken Thread
	[2997] = "0199. Cloth#Tradeskill", -- Bolt of Woolen Cloth
	[3182] = "0199. Cloth#Tradeskill", -- Spider's Silk
	[2321] = "0199. Cloth#Tradeskill", -- Fine Thread
	[2592] = "0199. Cloth#Tradeskill", -- Wool Cloth
	[2996] = "0199. Cloth#Tradeskill", -- Bolt of Linen Cloth
	[2589] = "0199. Cloth#Tradeskill", -- Linen Cloth
	[2320] = "0199. Cloth#Tradeskill", -- Coarse Thread
	[7072] = "0199. Cloth#Tradeskill", -- Naga Scale

	--! Leather (02)
	-- -- Shadowlands (91)
	[172438] = "0291. Shadowlands Leather#Tradeskill", -- Enchanted Heavy Callous Hide
	[172089] = "0291. Shadowlands Leather#Tradeskill", -- Desolate Leather
	[172097] = "0291. Shadowlands Leather#Tradeskill", -- Heavy Callous Hide
	[172094] = "0291. Shadowlands Leather#Tradeskill", -- Callous Hide
	[172096] = "0291. Shadowlands Leather#Tradeskill", -- Heavy Desolate Leather
	[172092] = "0291. Shadowlands Leather#Tradeskill", -- Pallid Bone
	[187701] = "0291. Shadowlands Leather#Tradeskill", -- Protogenic Pelt
	-- -- Kul Tiras/Zandalar (92)
	[168649] = "0292. Kul Tiras/Zandalar Leather#Tradeskill", -- Dredged Leather
	[152541] = "0292. Kul Tiras/Zandalar Leather#Tradeskill", -- Coarse Leather
	[154164] = "0292. Kul Tiras/Zandalar Leather#Tradeskill", -- Blood-Stained Bone
	[153050] = "0292. Kul Tiras/Zandalar Leather#Tradeskill", -- Shimmerscale
	[153051] = "0292. Kul Tiras/Zandalar Leather#Tradeskill", -- Mistscale
	[154722] = "0292. Kul Tiras/Zandalar Leather#Tradeskill", -- Tempest Hide
	[154165] = "0292. Kul Tiras/Zandalar Leather#Tradeskill", -- Calcified Bone
	[168650] = "0292. Kul Tiras/Zandalar Leather#Tradeskill", -- Cragscale
	[152542] = "0292. Kul Tiras/Zandalar Leather#Tradeskill", -- Hardened Tempest Hide
	[160059] = "0292. Kul Tiras/Zandalar Leather#Tradeskill", -- Amber Tanning Oil
	-- -- Broken Isles (93)
	[124116] = "0293. Broken Isles Leather#Tradeskill", -- Felhide
	[124113] = "0293. Broken Isles Leather#Tradeskill", -- Stonehide Leather
	[124115] = "0293. Broken Isles Leather#Tradeskill", -- Stormscale
	[151566] = "0293. Broken Isles Leather#Tradeskill", -- Fiendish Leather
	[146712] = "0293. Broken Isles Leather#Tradeskill", -- Wisp-Touched Elderhide
	[146713] = "0293. Broken Isles Leather#Tradeskill", -- Prime Wardenscale
	[124438] = "0293. Broken Isles Leather#Tradeskill", -- Unbroken Claw
	[124439] = "0293. Broken Isles Leather#Tradeskill", -- Unbroken Tooth
	-- -- Draenor (94)
	[110609] = "0294. Draenor Leather#Tradeskill", -- Raw Beast Hide
	[110611] = "0294. Draenor Leather#Tradeskill", -- Burnished Leather
	-- -- Pandaria (95)
	[72163] = "0295. Pandaria Leather#Tradeskill", -- Magnificent Hide
	[98617] = "0295. Pandaria Leather#Tradeskill", -- Hardened Magnificent Hide
	[79101] = "0295. Pandaria Leather#Tradeskill", -- Prismatic Scale
	[72120] = "0295. Pandaria Leather#Tradeskill", -- Exotic Leather
	[72162] = "0295. Pandaria Leather#Tradeskill", -- Sha-Touched Leather
	-- -- Cataclysm (96)
	[52976] = "0296. Cataclysm Leather#Tradeskill", -- Savage Leather
	[52980] = "0296. Cataclysm Leather#Tradeskill", -- Pristine Hide
	[56516] = "0296. Cataclysm Leather#Tradeskill", -- Heavy Savage Leather
	[52979] = "0296. Cataclysm Leather#Tradeskill", -- Blackened Dragonscale
	[52982] = "0296. Cataclysm Leather#Tradeskill", -- Deepsea Scale
	-- -- Northrend (97)
	[38425] = "0297. Northrend Leather#Tradeskill", -- Heavy Borean Leather
	[44128] = "0297. Northrend Leather#Tradeskill", -- Arctic Fur
	[38557] = "0297. Northrend Leather#Tradeskill", -- Icy Dragonscale
	[38561] = "0297. Northrend Leather#Tradeskill", -- Jormungar Scale
	[33568] = "0297. Northrend Leather#Tradeskill", -- Borean Leather
	[38558] = "0297. Northrend Leather#Tradeskill", -- Nerubian Chitin
	-- -- Outland (98)
	[25707] = "0298. Outland Leather#Tradeskill", -- Fel Hide
	[21887] = "0298. Outland Leather#Tradeskill", -- Knothide Leather
	[25700] = "0298. Outland Leather#Tradeskill", -- Fel Scales
	[29547] = "0298. Outland Leather#Tradeskill", -- Wind Scales
	[25708] = "0298. Outland Leather#Tradeskill", -- Thick Clefthoof Leather
	[29539] = "0298. Outland Leather#Tradeskill", -- Cobra Scales
	[29548] = "0298. Outland Leather#Tradeskill", -- Nether Dragonscales
	[25649] = "0298. Outland Leather#Tradeskill", -- Knothide Leather Scraps
	[25699] = "0298. Outland Leather#Tradeskill", -- Crystal Infused Leather
	[23793] = "0298. Outland Leather#Tradeskill", -- Heavy Knothide Leather
	-- -- Leather (99)
	[183955] = "0299. Leather#Tradeskill", -- Curing Salt
	[17012] = "0299. Leather#Tradeskill", -- Core Leather
	[15410] = "0299. Leather#Tradeskill", -- Scale of Onyxia
	[15414] = "0299. Leather#Tradeskill", -- Red Dragonscale
	[15416] = "0299. Leather#Tradeskill", -- Black Dragonscale
	[12810] = "0299. Leather#Tradeskill", -- Enchanted Leather
	[15408] = "0299. Leather#Tradeskill", -- Heavy Scorpid Scale
	[15415] = "0299. Leather#Tradeskill", -- Blue Dragonscale
	[15412] = "0299. Leather#Tradeskill", -- Green Dragonscale
	[8165] = "0299. Leather#Tradeskill", -- Worn Dragonscale
	[8154] = "0299. Leather#Tradeskill", -- Scorpid Scale
	[8150] = "0299. Leather#Tradeskill", -- Deeprock Salt
	[8172] = "0299. Leather#Tradeskill", -- Cured Thick Hide
	[8167] = "0299. Leather#Tradeskill", -- Turtle Scale
	[5785] = "0299. Leather#Tradeskill", -- Thick Murloc Scale
	[4236] = "0299. Leather#Tradeskill", -- Cured Heavy Hide
	[4461] = "0299. Leather#Tradeskill", -- Raptor Hide
	[4233] = "0299. Leather#Tradeskill", -- Cured Medium Hide
	[5784] = "0299. Leather#Tradeskill", -- Slimy Murloc Scale
	[4289] = "0299. Leather#Tradeskill", -- Salt
	[4231] = "0299. Leather#Tradeskill", -- Cured Light Hide
	[2934] = "0299. Leather#Tradeskill", -- Ruined Leather Scraps
	[8170] = "0299. Leather#Tradeskill", -- Rugged Leather
	[2319] = "0299. Leather#Tradeskill", -- Medium Leather
	[4234] = "0299. Leather#Tradeskill", -- Heavy Leather
	[4304] = "0299. Leather#Tradeskill", -- Thick Leather
	[2318] = "0299. Leather#Tradeskill", -- Light Leather
	[15419] = "0299. Leather#Tradeskill", -- Warbear Leather
	[4235] = "0299. Leather#Tradeskill", -- Heavy Hide
	[4232] = "0299. Leather#Tradeskill", -- Medium Hide
	[783] = "0299. Leather#Tradeskill", -- Light Hide
	[15407] = "0299. Leather#Tradeskill", -- Cured Rugged Hide
	[15417] = "0299. Leather#Tradeskill", -- Devilsaur Leather
	[7392] = "0299. Leather#Tradeskill", -- Green Whelp Scale
	[6471] = "0299. Leather#Tradeskill", -- Perfect Deviate Scale
	[8171] = "0299. Leather#Tradeskill", -- Rugged Hide
	[7286] = "0299. Leather#Tradeskill", -- Black Whelp Scale
	[8169] = "0299. Leather#Tradeskill", -- Thick Hide
	[6470] = "0299. Leather#Tradeskill", -- Deviate Scale
	[5082] = "0299. Leather#Tradeskill", -- Thin Kodo Leather
	[5635] = "0299. Leather#Tradeskill", -- Sharp Claw
	[5637] = "0299. Leather#Tradeskill", -- Large Fang
	[17056] = "0299. Leather#Tradeskill", -- Light Feather

	--! Metal & Stone (03)
	-- -- Shadowlands (91)
	[171428] = "0391. Shadowlands Metal & Stone#Tradeskill", -- Shadowghast Ingot
	[187700] = "0391. Shadowlands Metal & Stone#Tradeskill", -- Progenium Ore
	[171833] = "0391. Shadowlands Metal & Stone#Tradeskill", -- Elethium Ore
	[171829] = "0391. Shadowlands Metal & Stone#Tradeskill", -- Solenium Ore
	[171830] = "0391. Shadowlands Metal & Stone#Tradeskill", -- Oxxein Ore
	[171831] = "0391. Shadowlands Metal & Stone#Tradeskill", -- Phaedrum Ore
	[171832] = "0391. Shadowlands Metal & Stone#Tradeskill", -- Sinvyr Ore
	[171828] = "0391. Shadowlands Metal & Stone#Tradeskill", -- Laestrite Ore
	[177061] = "0391. Shadowlands Metal & Stone#Tradeskill", -- Twilight Bark
	[171840] = "0391. Shadowlands Metal & Stone#Tradeskill", -- Porous Stone
	[171841] = "0391. Shadowlands Metal & Stone#Tradeskill", -- Shaded Stone
	[180733] = "0391. Shadowlands Metal & Stone#Tradeskill", -- Luminous Flux
	-- -- Kul Tiras/Zandalar (92)
	[152513] = "0392. Kul Tiras/Zandalar Metal & Stone#Tradeskill", -- Platinum Ore
	[168185] = "0392. Kul Tiras/Zandalar Metal & Stone#Tradeskill", -- Osmenite Ore
	[152579] = "0392. Kul Tiras/Zandalar Metal & Stone#Tradeskill", -- Storm Silver Ore
	[152512] = "0392. Kul Tiras/Zandalar Metal & Stone#Tradeskill", -- Monelite Ore
	[160298] = "0392. Kul Tiras/Zandalar Metal & Stone#Tradeskill", -- Durable Flux
	-- -- Broken Isles (93)
	[124444] = "0393. Broken Isles Metal & Stone#Tradeskill", -- Infernal Brimstone
	[124461] = "0393. Broken Isles Metal & Stone#Tradeskill", -- Demonsteel Bar
	[151564] = "0393. Broken Isles Metal & Stone#Tradeskill", -- Empyrium
	[123919] = "0393. Broken Isles Metal & Stone#Tradeskill", -- Felslate
	[123918] = "0393. Broken Isles Metal & Stone#Tradeskill", -- Leystone Ore
	[124436] = "0393. Broken Isles Metal & Stone#Tradeskill", -- Foxflower Flux
	-- -- Draenor (94)
	[109119] = "0394. Draenor Metal & Stone#Tradeskill", -- True Iron Ore
	[108257] = "0394. Draenor Metal & Stone#Tradeskill", -- Truesteel Ingot
	[109118] = "0394. Draenor Metal & Stone#Tradeskill", -- Blackrock Ore
	[115508] = "0394. Draenor Metal & Stone#Tradeskill", -- Draenic Stone
	-- -- Pandaria (95)
	[72095] = "0395. Pandaria Metal & Stone#Tradeskill", -- Trillium Bar
	[72103] = "0395. Pandaria Metal & Stone#Tradeskill", -- White Trillium Ore
	[72094] = "0395. Pandaria Metal & Stone#Tradeskill", -- Black Trillium Ore
	[72104] = "0395. Pandaria Metal & Stone#Tradeskill", -- Living Steel
	[72093] = "0395. Pandaria Metal & Stone#Tradeskill", -- Kyparite
	[72096] = "0395. Pandaria Metal & Stone#Tradeskill", -- Ghost Iron Bar
	[72092] = "0395. Pandaria Metal & Stone#Tradeskill", -- Ghost Iron Ore
	[94111] = "0395. Pandaria Metal & Stone#Tradeskill", -- Lightning Steel Ingot
	[98717] = "0395. Pandaria Metal & Stone#Tradeskill", -- Balanced Trillium Ingot
	-- -- Cataclysm (96)
	[58480] = "0396. Cataclysm Metal & Stone#Tradeskill", -- Truegold
	[51950] = "0396. Cataclysm Metal & Stone#Tradeskill", -- Pyrium Bar
	[52183] = "0396. Cataclysm Metal & Stone#Tradeskill", -- Pyrite Ore
	[53039] = "0396. Cataclysm Metal & Stone#Tradeskill", -- Hardened Elementium Bar
	[52186] = "0396. Cataclysm Metal & Stone#Tradeskill", -- Elementium Bar
	[52185] = "0396. Cataclysm Metal & Stone#Tradeskill", -- Elementium Ore
	[65365] = "0396. Cataclysm Metal & Stone#Tradeskill", -- Folded Obsidium
	[54849] = "0396. Cataclysm Metal & Stone#Tradeskill", -- Obsidium Bar
	[53038] = "0396. Cataclysm Metal & Stone#Tradeskill", -- Obsidium Ore
	-- -- Northrend (97)
	[37663] = "0397. Northrend Metal & Stone#Tradeskill", -- Titansteel Bar
	[41163] = "0397. Northrend Metal & Stone#Tradeskill", -- Titanium Bar
	[36910] = "0397. Northrend Metal & Stone#Tradeskill", -- Titanium Ore
	[36913] = "0397. Northrend Metal & Stone#Tradeskill", -- Saronite Bar
	[36912] = "0397. Northrend Metal & Stone#Tradeskill", -- Saronite Ore
	[36916] = "0397. Northrend Metal & Stone#Tradeskill", -- Cobalt Bar
	[36909] = "0397. Northrend Metal & Stone#Tradeskill", -- Cobalt Ore
	-- -- Outland (98)
	[35128] = "0398. Outland Metal & Stone#Tradeskill", -- Hardened Khorium
	[23449] = "0398. Outland Metal & Stone#Tradeskill", -- Khorium Bar
	[23426] = "0398. Outland Metal & Stone#Tradeskill", -- Khorium Ore
	[23448] = "0398. Outland Metal & Stone#Tradeskill", -- Felsteel Bar
	[23447] = "0398. Outland Metal & Stone#Tradeskill", -- Eternium Bar
	[23427] = "0398. Outland Metal & Stone#Tradeskill", -- Eternium Ore
	[23573] = "0398. Outland Metal & Stone#Tradeskill", -- Hardened Adamantite Bar
	[23446] = "0398. Outland Metal & Stone#Tradeskill", -- Adamantite Bar
	[23425] = "0398. Outland Metal & Stone#Tradeskill", -- Adamantite Ore
	[23445] = "0398. Outland Metal & Stone#Tradeskill", -- Fel Iron Bar
	[23424] = "0398. Outland Metal & Stone#Tradeskill", -- Fel Iron Ore
	-- -- Metal & Stone (99)
	[17771] = "0399. Metal & Stone#Tradeskill", -- Enchanted Elementium Bar
	[18562] = "0399. Metal & Stone#Tradeskill", -- Elementium Ingot
	[18567] = "0399. Metal & Stone#Tradeskill", -- Elemental Flux
	[17203] = "0399. Metal & Stone#Tradeskill", -- Sulfuron Ingot
	[12809] = "0399. Metal & Stone#Tradeskill", -- Guardian Stone
	[12655] = "0399. Metal & Stone#Tradeskill", -- Enchanted Thorium Bar
	[11371] = "0399. Metal & Stone#Tradeskill", -- Dark Iron Bar
	[12359] = "0399. Metal & Stone#Tradeskill", -- Thorium Bar
	[12644] = "0399. Metal & Stone#Tradeskill", -- Dense Grinding Stone
	[12360] = "0399. Metal & Stone#Tradeskill", -- Arcanite Bar
	[10620] = "0399. Metal & Stone#Tradeskill", -- Thorium Ore
	[11370] = "0399. Metal & Stone#Tradeskill", -- Dark Iron Ore
	[12365] = "0399. Metal & Stone#Tradeskill", -- Dense Stone
	[22203] = "0399. Metal & Stone#Tradeskill", -- Large Obsidian Shard
	[22202] = "0399. Metal & Stone#Tradeskill", -- Small Obsidian Shard
	[3860] = "0399. Metal & Stone#Tradeskill", -- Mithril Bar
	[7966] = "0399. Metal & Stone#Tradeskill", -- Solid Grinding Stone
	[3857] = "0399. Metal & Stone#Tradeskill", -- Coal
	[3486] = "0399. Metal & Stone#Tradeskill", -- Heavy Grinding Stone
	[2841] = "0399. Metal & Stone#Tradeskill", -- Bronze Bar
	[3478] = "0399. Metal & Stone#Tradeskill", -- Coarse Grinding Stone
	[3470] = "0399. Metal & Stone#Tradeskill", -- Rough Grinding Stone
	[2838] = "0399. Metal & Stone#Tradeskill", -- Heavy Stone
	[3858] = "0399. Metal & Stone#Tradeskill", -- Mithril Ore
	[2772] = "0399. Metal & Stone#Tradeskill", -- Iron Ore
	[7912] = "0399. Metal & Stone#Tradeskill", -- Solid Stone
	[2835] = "0399. Metal & Stone#Tradeskill", -- Rough Stone
	[3859] = "0399. Metal & Stone#Tradeskill", -- Steel Bar
	[2771] = "0399. Metal & Stone#Tradeskill", -- Tin Ore
	[2775] = "0399. Metal & Stone#Tradeskill", -- Silver Ore
	[2836] = "0399. Metal & Stone#Tradeskill", -- Coarse Stone
	[2770] = "0399. Metal & Stone#Tradeskill", -- Copper Ore
	[3575] = "0399. Metal & Stone#Tradeskill", -- Iron Bar
	[2840] = "0399. Metal & Stone#Tradeskill", -- Copper Bar
	[2776] = "0399. Metal & Stone#Tradeskill", -- Gold Ore
	[6037] = "0399. Metal & Stone#Tradeskill", -- Truesilver Bar
	[3577] = "0399. Metal & Stone#Tradeskill", -- Gold Bar
	[2842] = "0399. Metal & Stone#Tradeskill", -- Silver Bar
	[7911] = "0399. Metal & Stone#Tradeskill", -- Truesilver Ore
	[3576] = "0399. Metal & Stone#Tradeskill", -- Tin Bar
	[8150] = "0399. Metal & Stone#Tradeskill", -- Deeprock Salt
	[3466] = "0399. Metal & Stone#Tradeskill", -- Strong Flux
	[2880] = "0399. Metal & Stone#Tradeskill", -- Weak Flux

	--! Cooking (04)
	-- -- Shadowlands (91)
	[172052] = "0491. Shadowlands Cooking#Tradeskill", -- Aethereal Meat
	[179314] = "0491. Shadowlands Cooking#Tradeskill", -- Creeping Crawler Meat
	[172055] = "0491. Shadowlands Cooking#Tradeskill", -- Phantasmal Haunch
	[179315] = "0491. Shadowlands Cooking#Tradeskill", -- Shadowy Shank
	[172053] = "0491. Shadowlands Cooking#Tradeskill", -- Tenebrous Ribs
	[172054] = "0491. Shadowlands Cooking#Tradeskill", -- Raw Seraphic Wing
	[187704] = "0491. Shadowlands Cooking#Tradeskill", -- Protoflesh
	[173036] = "0491. Shadowlands Cooking#Tradeskill", -- Spinefin Piranha
	[173033] = "0491. Shadowlands Cooking#Tradeskill", -- Iridescent Amberjack
	[173034] = "0491. Shadowlands Cooking#Tradeskill", -- Silvergill Pike
	[173037] = "0491. Shadowlands Cooking#Tradeskill", -- Elysian Thade
	[173035] = "0491. Shadowlands Cooking#Tradeskill", -- Pocked Bonefish
	[173032] = "0491. Shadowlands Cooking#Tradeskill", -- Lost Sole
	[172058] = "0491. Shadowlands Cooking#Tradeskill", -- Smuggled Azerothian Produce
	[172059] = "0491. Shadowlands Cooking#Tradeskill", -- Rich Grazer Milk
	[178786] = "0491. Shadowlands Cooking#Tradeskill", -- Lusterwheat Flour
	[172056] = "0491. Shadowlands Cooking#Tradeskill", -- Medley of Transplanar Spices
	[172057] = "0491. Shadowlands Cooking#Tradeskill", -- Inconceivably Aged Vinegar
	[187702] = "0491. Shadowlands Cooking#Tradeskill", -- Precursor Placoderm
	[187812] = "0491. Shadowlands Cooking#Tradeskill", -- Empty Kettle
	-- -- Kul Tiras/Zandalar (92)
	[162515] = "0492. Kul Tiras/Zandalar Cooking#Tradeskill", -- Midnight Salmon
	[152631] = "0492. Kul Tiras/Zandalar Cooking#Tradeskill", -- Briny Flesh
	[154898] = "0492. Kul Tiras/Zandalar Cooking#Tradeskill", -- Meaty Haunch
	[154897] = "0492. Kul Tiras/Zandalar Cooking#Tradeskill", -- Stringy Loins
	[154899] = "0492. Kul Tiras/Zandalar Cooking#Tradeskill", -- Thick Paleo Steak
	[163782] = "0492. Kul Tiras/Zandalar Cooking#Tradeskill", -- Cursed Haunch
	[152547] = "0492. Kul Tiras/Zandalar Cooking#Tradeskill", -- Great Sea Catfish
	[160711] = "0492. Kul Tiras/Zandalar Cooking#Tradeskill", -- Aromatic Fish Oil
	[152544] = "0492. Kul Tiras/Zandalar Cooking#Tradeskill", -- Slimy Mackerel
	[160400] = "0492. Kul Tiras/Zandalar Cooking#Tradeskill", -- Foosaka
	[160399] = "0492. Kul Tiras/Zandalar Cooking#Tradeskill", -- Wild Flour
	[152543] = "0492. Kul Tiras/Zandalar Cooking#Tradeskill", -- Sand Shifter
	[152549] = "0492. Kul Tiras/Zandalar Cooking#Tradeskill", -- Redtail Loach
	[152546] = "0492. Kul Tiras/Zandalar Cooking#Tradeskill", -- Lane Snapper
	[160709] = "0492. Kul Tiras/Zandalar Cooking#Tradeskill", -- Fresh Potato
	[174353] = "0492. Kul Tiras/Zandalar Cooking#Tradeskill", -- Questionable Meat
	[152545] = "0492. Kul Tiras/Zandalar Cooking#Tradeskill", -- Frenzied Fangtooth
	[152548] = "0492. Kul Tiras/Zandalar Cooking#Tradeskill", -- Tiragarde Perch
	[168303] = "0492. Kul Tiras/Zandalar Cooking#Tradeskill", -- Rubbery Flank
	[168302] = "0492. Kul Tiras/Zandalar Cooking#Tradeskill", -- Viper Fish
	[160398] = "0492. Kul Tiras/Zandalar Cooking#Tradeskill", -- Choral Honey
	[174328] = "0492. Kul Tiras/Zandalar Cooking#Tradeskill", -- Aberrant Voidfin
	[174327] = "0492. Kul Tiras/Zandalar Cooking#Tradeskill", -- Malformed Gnasher
	[160712] = "0492. Kul Tiras/Zandalar Cooking#Tradeskill", -- Powdered Sugar
	[168645] = "0492. Kul Tiras/Zandalar Cooking#Tradeskill", -- Moist Fillet
	[168646] = "0492. Kul Tiras/Zandalar Cooking#Tradeskill", -- Mauve Stinger
	[160710] = "0492. Kul Tiras/Zandalar Cooking#Tradeskill", -- Wild Berries
	-- -- Broken Isles (93)
	[124119] = "0493. Broken Isles Cooking#Tradeskill", -- Big Gamy Ribs
	[124120] = "0493. Broken Isles Cooking#Tradeskill", -- Leyblood
	[124121] = "0493. Broken Isles Cooking#Tradeskill", -- Wildfowl Egg
	[124117] = "0493. Broken Isles Cooking#Tradeskill", -- Lean Shank
	[124118] = "0493. Broken Isles Cooking#Tradeskill", -- Fatty Bearsteak
	[133680] = "0493. Broken Isles Cooking#Tradeskill", -- Slice of Bacon
	[142336] = "0493. Broken Isles Cooking#Tradeskill", -- Falcosaur Egg
	[124112] = "0493. Broken Isles Cooking#Tradeskill", -- Black Barracuda
	[124110] = "0493. Broken Isles Cooking#Tradeskill", -- Stormray
	[124109] = "0493. Broken Isles Cooking#Tradeskill", -- Highmountain Salmon
	[133607] = "0493. Broken Isles Cooking#Tradeskill", -- Silver Mackerel
	[124107] = "0493. Broken Isles Cooking#Tradeskill", -- Cursed Queenfish
	[124111] = "0493. Broken Isles Cooking#Tradeskill", -- Runescale Koi
	[133589] = "0493. Broken Isles Cooking#Tradeskill", -- Dalapeño Pepper
	[124108] = "0493. Broken Isles Cooking#Tradeskill", -- Mossgill Perch
	[133591] = "0493. Broken Isles Cooking#Tradeskill", -- River Onion
	[133590] = "0493. Broken Isles Cooking#Tradeskill", -- Muskenbutter
	[133593] = "0493. Broken Isles Cooking#Tradeskill", -- Royal Olive
	[133588] = "0493. Broken Isles Cooking#Tradeskill", -- Flaked Sea Salt
	[133592] = "0493. Broken Isles Cooking#Tradeskill", -- Stonedark Snail
	-- -- Draenor (94)
	[109131] = "0494. Draenor Cooking#Tradeskill", -- Raw Clefthoof Meat
	[109136] = "0494. Draenor Cooking#Tradeskill", -- Raw Boar Meat
	[109133] = "0494. Draenor Cooking#Tradeskill", -- Rylak Egg
	[109137] = "0494. Draenor Cooking#Tradeskill", -- Crescent Saberfish Flesh
	[109135] = "0494. Draenor Cooking#Tradeskill", -- Raw Riverbeast Meat
	[109132] = "0494. Draenor Cooking#Tradeskill", -- Raw Talbuk Meat
	[109142] = "0494. Draenor Cooking#Tradeskill", -- Sea Scorpion Segment
	[109141] = "0494. Draenor Cooking#Tradeskill", -- Fire Ammonite Tentacle
	[109134] = "0494. Draenor Cooking#Tradeskill", -- Raw Elekk Meat
	[109140] = "0494. Draenor Cooking#Tradeskill", -- Blind Lake Sturgeon Flesh
	[109138] = "0494. Draenor Cooking#Tradeskill", -- Jawless Skulker Flesh
	[109143] = "0494. Draenor Cooking#Tradeskill", -- Abyssal Gulper Eel Flesh
	[118565] = "0494. Draenor Cooking#Tradeskill", -- Savage Piranha
	[128499] = "0494. Draenor Cooking#Tradeskill", -- Fel Egg
	[109139] = "0494. Draenor Cooking#Tradeskill", -- Fat Sleeper Flesh
	[128500] = "0494. Draenor Cooking#Tradeskill", -- Fel Ham
	[109144] = "0494. Draenor Cooking#Tradeskill", -- Blackwater Whiptail Flesh
	-- -- Pandaria (95)
	[86425] = "0495. Pandaria Cooking#Tradeskill", -- Cooking School Bell
	[74841] = "0495. Pandaria Cooking#Tradeskill", -- Juicycrunch Carrot
	[74839] = "0495. Pandaria Cooking#Tradeskill", -- Wildfowl Breast
	[74833] = "0495. Pandaria Cooking#Tradeskill", -- Raw Tiger Steak
	[74660] = "0495. Pandaria Cooking#Tradeskill", -- Pandaren Peach
	[75014] = "0495. Pandaria Cooking#Tradeskill", -- Raw Crocolisk Belly
	[74853] = "0495. Pandaria Cooking#Tradeskill", -- 100 Year Soy Sauce
	[74845] = "0495. Pandaria Cooking#Tradeskill", -- Ginseng
	[74846] = "0495. Pandaria Cooking#Tradeskill", -- Witchberries
	[74838] = "0495. Pandaria Cooking#Tradeskill", -- Raw Crab Meat
	[74837] = "0495. Pandaria Cooking#Tradeskill", -- Raw Turtle Meat
	[74854] = "0495. Pandaria Cooking#Tradeskill", -- Instant Noodles
	[74848] = "0495. Pandaria Cooking#Tradeskill", -- Striped Melon
	[74834] = "0495. Pandaria Cooking#Tradeskill", -- Mushan Ribs
	[74843] = "0495. Pandaria Cooking#Tradeskill", -- Scallions
	[85583] = "0495. Pandaria Cooking#Tradeskill", -- Needle Mushrooms
	[74847] = "0495. Pandaria Cooking#Tradeskill", -- Jade Squash
	[74851] = "0495. Pandaria Cooking#Tradeskill", -- Rice
	[74852] = "0495. Pandaria Cooking#Tradeskill", -- Yak Milk
	[102541] = "0495. Pandaria Cooking#Tradeskill", -- Aged Balsamic Vinegar
	[74844] = "0495. Pandaria Cooking#Tradeskill", -- Red Blossom Leek
	[74840] = "0495. Pandaria Cooking#Tradeskill", -- Green Cabbage
	[102543] = "0495. Pandaria Cooking#Tradeskill", -- Aged Mogu'shan Cheese
	[85584] = "0495. Pandaria Cooking#Tradeskill", -- Silkworm Pupa
	[74842] = "0495. Pandaria Cooking#Tradeskill", -- Mogu Pumpkin
	[74662] = "0495. Pandaria Cooking#Tradeskill", -- Rice Flour
	[74832] = "0495. Pandaria Cooking#Tradeskill", -- Barley
	[85585] = "0495. Pandaria Cooking#Tradeskill", -- Red Beans
	[74849] = "0495. Pandaria Cooking#Tradeskill", -- Pink Turnip
	[102542] = "0495. Pandaria Cooking#Tradeskill", -- Ancient Pandaren Spices
	[74850] = "0495. Pandaria Cooking#Tradeskill", -- White Turnip
	[74661] = "0495. Pandaria Cooking#Tradeskill", -- Black Pepper
	[102538] = "0495. Pandaria Cooking#Tradeskill", -- Fresh Shao-Tien Rice
	[102537] = "0495. Pandaria Cooking#Tradeskill", -- Fresh Silkfeather Hawk Eggs
	[74659] = "0495. Pandaria Cooking#Tradeskill", -- Farm Chicken
	[102540] = "0495. Pandaria Cooking#Tradeskill", -- Fresh Mangos
	[102536] = "0495. Pandaria Cooking#Tradeskill", -- Fresh Lushroom
	[102539] = "0495. Pandaria Cooking#Tradeskill", -- Fresh Strawberries
	[74860] = "0495. Pandaria Cooking#Tradeskill", -- Redbelly Mandarin
	[74857] = "0495. Pandaria Cooking#Tradeskill", -- Giant Mantis Shrimp
	[74856] = "0495. Pandaria Cooking#Tradeskill", -- Jade Lungfish
	[74863] = "0495. Pandaria Cooking#Tradeskill", -- Jewel Danio
	[74866] = "0495. Pandaria Cooking#Tradeskill", -- Golden Carp
	[74861] = "0495. Pandaria Cooking#Tradeskill", -- Tiger Gourami
	[74865] = "0495. Pandaria Cooking#Tradeskill", -- Krasarang Paddlefish
	[74864] = "0495. Pandaria Cooking#Tradeskill", -- Reef Octopus
	[74859] = "0495. Pandaria Cooking#Tradeskill", -- Emperor Salmon
	[85506] = "0495. Pandaria Cooking#Tradeskill", -- Viseclaw Meat
	[87687] = "0495. Pandaria Cooking#Tradeskill", -- Empty Crocolisk Belly Container
	[87680] = "0495. Pandaria Cooking#Tradeskill", -- Empty Emperor Salmon Container
	[87679] = "0495. Pandaria Cooking#Tradeskill", -- Empty Giant Mantis Shrimp Container
	[87686] = "0495. Pandaria Cooking#Tradeskill", -- Empty Golden Carp Container
	[87663] = "0495. Pandaria Cooking#Tradeskill", -- Empty Green Cabbage Container
	[87678] = "0495. Pandaria Cooking#Tradeskill", -- Empty Jade Lungfish Container
	[87670] = "0495. Pandaria Cooking#Tradeskill", -- Empty Jade Squash Container
	[87683] = "0495. Pandaria Cooking#Tradeskill", -- Empty Jewel Danio Container
	[87664] = "0495. Pandaria Cooking#Tradeskill", -- Empty Juicycrunch Carrot Container
	[87685] = "0495. Pandaria Cooking#Tradeskill", -- Empty Krasarang Paddlefish Container
	[87665] = "0495. Pandaria Cooking#Tradeskill", -- Empty Mogu Pumpkin Container
	[87659] = "0495. Pandaria Cooking#Tradeskill", -- Empty Mushan Ribs Container
	[87672] = "0495. Pandaria Cooking#Tradeskill", -- Empty Pink Turnip Container
	[87661] = "0495. Pandaria Cooking#Tradeskill", -- Empty Raw Crab Meat Container
	[87658] = "0495. Pandaria Cooking#Tradeskill", -- Empty Raw Tiger Steak Container
	[87660] = "0495. Pandaria Cooking#Tradeskill", -- Empty Raw Turtle Meat Container
	[87667] = "0495. Pandaria Cooking#Tradeskill", -- Empty Red Blossom Leek Container
	[87681] = "0495. Pandaria Cooking#Tradeskill", -- Empty Redbelly Mandarin Container
	[87684] = "0495. Pandaria Cooking#Tradeskill", -- Empty Reef Octopus Container
	[87666] = "0495. Pandaria Cooking#Tradeskill", -- Empty Scallions Container
	[87671] = "0495. Pandaria Cooking#Tradeskill", -- Empty Striped Melon Container
	[87682] = "0495. Pandaria Cooking#Tradeskill", -- Empty Tiger Gourami Container
	[87673] = "0495. Pandaria Cooking#Tradeskill", -- Empty White Turnip Container
	[87662] = "0495. Pandaria Cooking#Tradeskill", -- Empty Wildfowl Breast Container
	[87669] = "0495. Pandaria Cooking#Tradeskill", -- Empty Witchberries Container
	-- -- Cataclysm (96)
	[62778] = "0496. Cataclysm Cooking#Tradeskill", -- Toughened Flesh
	[62791] = "0496. Cataclysm Cooking#Tradeskill", -- Blood Shrimp
	[62785] = "0496. Cataclysm Cooking#Tradeskill", -- Delicate Wing
	[62784] = "0496. Cataclysm Cooking#Tradeskill", -- Crocolisk Tail
	[62779] = "0496. Cataclysm Cooking#Tradeskill", -- Monstrous Claw
	[62780] = "0496. Cataclysm Cooking#Tradeskill", -- Snake Eye
	[62781] = "0496. Cataclysm Cooking#Tradeskill", -- Giant Turtle Tongue
	[62782] = "0496. Cataclysm Cooking#Tradeskill", -- Dragon Flank
	[62783] = "0496. Cataclysm Cooking#Tradeskill", -- Basilisk "Liver"
	[53068] = "0496. Cataclysm Cooking#Tradeskill", -- Lavascale Catfish
	[53072] = "0496. Cataclysm Cooking#Tradeskill", -- Deepsea Sagefish
	[53070] = "0496. Cataclysm Cooking#Tradeskill", -- Fathom Eel
	[53064] = "0496. Cataclysm Cooking#Tradeskill", -- Highland Guppy
	[53067] = "0496. Cataclysm Cooking#Tradeskill", -- Striped Lurker
	[53071] = "0496. Cataclysm Cooking#Tradeskill", -- Algaefin Rockfish
	[53063] = "0496. Cataclysm Cooking#Tradeskill", -- Mountain Trout
	[53062] = "0496. Cataclysm Cooking#Tradeskill", -- Sharptooth
	[53066] = "0496. Cataclysm Cooking#Tradeskill", -- Blackbelly Mudfish
	[53069] = "0496. Cataclysm Cooking#Tradeskill", -- Murglesnout
	[62786] = "0496. Cataclysm Cooking#Tradeskill", -- Cocoa Beans
	-- -- Northrend (97)
	[36782] = "0497. Northrend Cooking#Tradeskill", -- Succulent Clam Meat
	[43013] = "0497. Northrend Cooking#Tradeskill", -- Chilled Meat
	[43012] = "0497. Northrend Cooking#Tradeskill", -- Rhino Meat
	[41805] = "0497. Northrend Cooking#Tradeskill", -- Borean Man O' War
	[41809] = "0497. Northrend Cooking#Tradeskill", -- Glacial Salmon
	[41813] = "0497. Northrend Cooking#Tradeskill", -- Nettlefish
	[41800] = "0497. Northrend Cooking#Tradeskill", -- Deep Sea Monsterbelly
	[41807] = "0497. Northrend Cooking#Tradeskill", -- Dragonfin Angelfish
	[43010] = "0497. Northrend Cooking#Tradeskill", -- Worm Meat
	[43009] = "0497. Northrend Cooking#Tradeskill", -- Shoveltusk Flank
	[41801] = "0497. Northrend Cooking#Tradeskill", -- Moonglow Cuttlefish
	[41806] = "0497. Northrend Cooking#Tradeskill", -- Musselback Sculpin
	[34736] = "0497. Northrend Cooking#Tradeskill", -- Chunk o' Mammoth
	[41803] = "0497. Northrend Cooking#Tradeskill", -- Rockfin Grouper
	[41810] = "0497. Northrend Cooking#Tradeskill", -- Fangtooth Herring
	[41808] = "0497. Northrend Cooking#Tradeskill", -- Bonescale Snapper
	[43011] = "0497. Northrend Cooking#Tradeskill", -- Worg Haunch
	[41802] = "0497. Northrend Cooking#Tradeskill", -- Imperial Manta Ray
	[41812] = "0497. Northrend Cooking#Tradeskill", -- Barrelhead Goby
	[43501] = "0497. Northrend Cooking#Tradeskill", -- Northern Egg
	[43007] = "0497. Northrend Cooking#Tradeskill", -- Northern Spices
	-- -- Outland (98)
	[24477] = "0498. Outland Cooking#Tradeskill", -- Jaggal Clam Meat
	[27674] = "0498. Outland Cooking#Tradeskill", -- Ravager Flesh
	[27439] = "0498. Outland Cooking#Tradeskill", -- Furious Crawdad
	[31671] = "0498. Outland Cooking#Tradeskill", -- Serpent Flesh
	[27681] = "0498. Outland Cooking#Tradeskill", -- Warped Flesh
	[27422] = "0498. Outland Cooking#Tradeskill", -- Barbed Gill Trout
	[27438] = "0498. Outland Cooking#Tradeskill", -- Golden Darter
	[31670] = "0498. Outland Cooking#Tradeskill", -- Raptor Ribs
	[27682] = "0498. Outland Cooking#Tradeskill", -- Talbuk Venison
	[27425] = "0498. Outland Cooking#Tradeskill", -- Spotted Feltail
	[27671] = "0498. Outland Cooking#Tradeskill", -- Buzzard Meat
	[27678] = "0498. Outland Cooking#Tradeskill", -- Clefthoof Meat
	[27437] = "0498. Outland Cooking#Tradeskill", -- Icefin Bluefish
	[27435] = "0498. Outland Cooking#Tradeskill", -- Figluster's Mudfish
	[27429] = "0498. Outland Cooking#Tradeskill", -- Zangarian Sporefish
	[27677] = "0498. Outland Cooking#Tradeskill", -- Chunk o' Basilisk
	[33823] = "0498. Outland Cooking#Tradeskill", -- Bloodfin Catfish
	[33824] = "0498. Outland Cooking#Tradeskill", -- Crescent-Tail Skullfish
	-- -- Cooking (990)
	[124669] = "04990. Cooking#Tradeskill", -- Darkmoon Daggermaw
	[13757] = "04990. Cooking#Tradeskill", -- Lightning Eel
	[35562] = "04990. Cooking#Tradeskill", -- Bear Flank
	[22644] = "04990. Cooking#Tradeskill", -- Crunchy Spider Leg
	[27668] = "04990. Cooking#Tradeskill", -- Lynx Meat
	[27669] = "04990. Cooking#Tradeskill", -- Bat Flesh
	[23676] = "04990. Cooking#Tradeskill", -- Moongraze Stag Tenderloin
	[21024] = "04990. Cooking#Tradeskill", -- Chimaerok Tenderloin
	[20424] = "04990. Cooking#Tradeskill", -- Sandworm Meat
	[12207] = "04990. Cooking#Tradeskill", -- Giant Egg
	[7974] = "04990. Cooking#Tradeskill", -- Zesty Clam Meat
	[12205] = "04990. Cooking#Tradeskill", -- White Spider Meat
	[12208] = "04990. Cooking#Tradeskill", -- Tender Wolf Meat
	[12206] = "04990. Cooking#Tradeskill", -- Tender Crab Meat
	[3404] = "04990. Cooking#Tradeskill", -- Buzzard Wing
	[4655] = "04990. Cooking#Tradeskill", -- Giant Clam Meat
	[12204] = "04990. Cooking#Tradeskill", -- Heavy Kodo Meat
	[12203] = "04990. Cooking#Tradeskill", -- Red Wolf Meat
	[12184] = "04990. Cooking#Tradeskill", -- Raptor Flesh
	[3712] = "04990. Cooking#Tradeskill", -- Turtle Meat
	[12037] = "04990. Cooking#Tradeskill", -- Mystery Meat
	[12202] = "04990. Cooking#Tradeskill", -- Tiger Meat
	[5504] = "04990. Cooking#Tradeskill", -- Tangy Clam Meat
	[3731] = "04990. Cooking#Tradeskill", -- Lion Meat
	[5471] = "04990. Cooking#Tradeskill", -- Stag Meat
	[2251] = "04990. Cooking#Tradeskill", -- Gooey Spider Leg
	[3667] = "04990. Cooking#Tradeskill", -- Tender Crocolisk Meat
	[3685] = "04990. Cooking#Tradeskill", -- Raptor Egg
	[5470] = "04990. Cooking#Tradeskill", -- Thunder Lizard Tail
	[3730] = "04990. Cooking#Tradeskill", -- Big Bear Meat
	[67229] = "04990. Cooking#Tradeskill", -- Stag Flank
	[1015] = "04990. Cooking#Tradeskill", -- Lean Wolf Flank
	[1468] = "04990. Cooking#Tradeskill", -- Murloc Fin
	[2677] = "04990. Cooking#Tradeskill", -- Boar Ribs
	[5503] = "04990. Cooking#Tradeskill", -- Clam Meat
	[5468] = "04990. Cooking#Tradeskill", -- Soft Frenzy Flesh
	[2924] = "04990. Cooking#Tradeskill", -- Crocolisk Meat
	[1080] = "04990. Cooking#Tradeskill", -- Tough Condor Meat
	[2674] = "04990. Cooking#Tradeskill", -- Crawler Meat
	[2675] = "04990. Cooking#Tradeskill", -- Crawler Claw
	[723] = "04990. Cooking#Tradeskill", -- Goretusk Liver
	[2673] = "04990. Cooking#Tradeskill", -- Coyote Meat
	[3173] = "04990. Cooking#Tradeskill", -- Bear Meat
	[5469] = "04990. Cooking#Tradeskill", -- Strider Meat
	[5467] = "04990. Cooking#Tradeskill", -- Kodo Meat
	[5466] = "04990. Cooking#Tradeskill", -- Scorpid Stinger
	[6889] = "04990. Cooking#Tradeskill", -- Small Egg
	[2672] = "04990. Cooking#Tradeskill", -- Stringy Wolf Meat
	[769] = "04990. Cooking#Tradeskill", -- Chunk of Boar Meat
	[5465] = "04990. Cooking#Tradeskill", -- Small Spider Leg
	[2886] = "04990. Cooking#Tradeskill", -- Crag Boar Rib
	[12223] = "04990. Cooking#Tradeskill", -- Meaty Bat Wing
	[13889] = "04990. Cooking#Tradeskill", -- Raw Whitescale Salmon
	[13888] = "04990. Cooking#Tradeskill", -- Darkclaw Lobster
	[21153] = "04990. Cooking#Tradeskill", -- Raw Greater Sagefish
	[4603] = "04990. Cooking#Tradeskill", -- Raw Spotted Yellowtail
	[21071] = "04990. Cooking#Tradeskill", -- Raw Sagefish
	[13760] = "04990. Cooking#Tradeskill", -- Raw Sunscale Salmon
	[13756] = "04990. Cooking#Tradeskill", -- Raw Summer Bass
	[6308] = "04990. Cooking#Tradeskill", -- Raw Bristle Whisker Catfish
	[13759] = "04990. Cooking#Tradeskill", -- Raw Nightfin Snapper
	[13754] = "04990. Cooking#Tradeskill", -- Raw Glossy Mightfish
	[8365] = "04990. Cooking#Tradeskill", -- Raw Mithril Head Trout
	[13758] = "04990. Cooking#Tradeskill", -- Raw Redgill
	[6361] = "04990. Cooking#Tradeskill", -- Raw Rainbow Fin Albacore
	[6317] = "04990. Cooking#Tradeskill", -- Raw Loch Frenzy
	[6303] = "04990. Cooking#Tradeskill", -- Raw Slitherskin Mackerel
	[6289] = "04990. Cooking#Tradeskill", -- Raw Longjaw Mud Snapper
	[6362] = "04990. Cooking#Tradeskill", -- Raw Rockscale Cod
	[2665] = "04990. Cooking#Tradeskill", -- Stormwind Seasoning Herbs
	[6291] = "04990. Cooking#Tradeskill", -- Raw Brilliant Smallfish
	[8959] = "04990. Cooking#Tradeskill", -- Raw Spinefin Halibut
	[2678] = "04990. Cooking#Tradeskill", -- Mild Spices
	[30817] = "04990. Cooking#Tradeskill", -- Simple Flour
	[159] = "04990. Cooking#Tradeskill", -- Refreshing Spring Water
	[5051] = "04990. Cooking#Tradeskill", -- Dig Rat
	-- -- Holiday Cooking (999)
	[46888] = "04999. Holiday Cooking [Pilgrim's Bounty]#Tradeskill", -- Bountiful Basket
	[44834] = "04999. Holiday Cooking [Pilgrim's Bounty]#Tradeskill", -- Wild Turkey
	[44853] = "04999. Holiday Cooking [Pilgrim's Bounty]#Tradeskill", -- Honey
	[46796] = "04999. Holiday Cooking [Pilgrim's Bounty]#Tradeskill", -- Ripe Tirisfal Pumpkin
	[46784] = "04999. Holiday Cooking [Pilgrim's Bounty]#Tradeskill", -- Ripe Elwynn Pumpkin
	[46793] = "04999. Holiday Cooking [Pilgrim's Bounty]#Tradeskill", -- Tangy Southfury Cranberries
	[44854] = "04999. Holiday Cooking [Pilgrim's Bounty]#Tradeskill", -- Tangy Wetland Cranberries
	[46797] = "04999. Holiday Cooking [Pilgrim's Bounty]#Tradeskill", -- Mulgore Sweet Potato
	[44855] = "04999. Holiday Cooking [Pilgrim's Bounty]#Tradeskill", -- Teldrassil Sweet Potato
	[44853] = "04999. Holiday Cooking [Pilgrim's Bounty]#Tradeskill", -- Honey
	[44835] = "04999. Holiday Cooking [Pilgrim's Bounty]#Tradeskill", -- Autumnal Herbs
	[17194] = "04999. Holiday Cooking [Feast of Winter Veil]#Tradeskill", -- Holiday Spices
	[17196] = "04999. Holiday Cooking [Feast of Winter Veil]#Tradeskill", -- Holiday Spirits
	[34412] = "04999. Holiday Cooking [Feast of Winter Veil]#Tradeskill", -- Sparkling Apple Cider

	--! Herb (05)
	-- -- Shadowlands (91)
	[187699] = "0591. Shadowlands Herb#Tradeskill", -- First Flower
	[171315] = "0591. Shadowlands Herb#Tradeskill", -- Nightshade
	[168583] = "0591. Shadowlands Herb#Tradeskill", -- Widowbloom
	[170554] = "0591. Shadowlands Herb#Tradeskill", -- Vigil's Torch
	[168589] = "0591. Shadowlands Herb#Tradeskill", -- Marrowroot
	[168586] = "0591. Shadowlands Herb#Tradeskill", -- Rising Glory
	[169701] = "0591. Shadowlands Herb#Tradeskill", -- Death Blossom
	-- -- Kul Tiras/Zandalar (92)
	[152510] = "0592. Kul Tiras/Zandalar Herb#Tradeskill", -- Anchor Weed
	[168487] = "0592. Kul Tiras/Zandalar Herb#Tradeskill", -- Zin'anthid
	[152508] = "0592. Kul Tiras/Zandalar Herb#Tradeskill", -- Winter's Kiss
	[152507] = "0592. Kul Tiras/Zandalar Herb#Tradeskill", -- Akunda's Bite
	[152509] = "0592. Kul Tiras/Zandalar Herb#Tradeskill", -- Siren's Pollen
	[152511] = "0592. Kul Tiras/Zandalar Herb#Tradeskill", -- Sea Stalk
	[152505] = "0592. Kul Tiras/Zandalar Herb#Tradeskill", -- Riverbud
	[152506] = "0592. Kul Tiras/Zandalar Herb#Tradeskill", -- Star Moss
	-- -- Broken Isles (93)
	[124106] = "0593. Broken Isles Herb#Tradeskill", -- Felwort
	[124101] = "0593. Broken Isles Herb#Tradeskill", -- Aethril
	[124105] = "0593. Broken Isles Herb#Tradeskill", -- Starlight Rose
	[124103] = "0593. Broken Isles Herb#Tradeskill", -- Foxflower
	[124102] = "0593. Broken Isles Herb#Tradeskill", -- Dreamleaf
	[151565] = "0593. Broken Isles Herb#Tradeskill", -- Astral Glory
	[124104] = "0593. Broken Isles Herb#Tradeskill", -- Fjarnskaggl
	[128304] = "0593. Broken Isles Herb#Tradeskill", -- Yseralline Seed
	[129289] = "0593. Broken Isles Herb#Tradeskill", -- Felwort Seed
	[129284] = "0593. Broken Isles Herb#Tradeskill", -- Aethril Seed
	[129288] = "0593. Broken Isles Herb#Tradeskill", -- Starlight Rose Seed
	[129285] = "0593. Broken Isles Herb#Tradeskill", -- Dreamleaf Seed
	[129287] = "0593. Broken Isles Herb#Tradeskill", -- Fjarnskaggl Seed
	[129286] = "0593. Broken Isles Herb#Tradeskill", -- Foxflower Seed
	-- -- Draenor (94)
	[109128] = "0594. Draenor Herb#Tradeskill", -- Nagrand Arrowbloom
	[109129] = "0594. Draenor Herb#Tradeskill", -- Talador Orchid
	[109126] = "0594. Draenor Herb#Tradeskill", -- Gorgrond Flytrap
	[109125] = "0594. Draenor Herb#Tradeskill", -- Fireweed
	[109127] = "0594. Draenor Herb#Tradeskill", -- Starflower
	[109124] = "0594. Draenor Herb#Tradeskill", -- Frostweed
	[116053] = "0594. Draenor Herb#Tradeskill", -- Draenic Seeds
	-- -- Pandaria (95)
	[72238] = "0595. Pandaria Herb#Tradeskill", -- Golden Lotus
	[89639] = "0595. Pandaria Herb#Tradeskill", -- Desecrated Herb
	[79011] = "0595. Pandaria Herb#Tradeskill", -- Fool's Cap
	[79010] = "0595. Pandaria Herb#Tradeskill", -- Snow Lily
	[72235] = "0595. Pandaria Herb#Tradeskill", -- Silkweed
	[72237] = "0595. Pandaria Herb#Tradeskill", -- Rain Poppy
	[72234] = "0595. Pandaria Herb#Tradeskill", -- Green Tea Leaf
	-- -- Cataclysm (96)
	[52987] = "0596. Cataclysm Herb#Tradeskill", -- Twilight Jasmine
	[52988] = "0596. Cataclysm Herb#Tradeskill", -- Whiptail
	[52986] = "0596. Cataclysm Herb#Tradeskill", -- Heartblossom
	[52984] = "0596. Cataclysm Herb#Tradeskill", -- Stormvine
	[52985] = "0596. Cataclysm Herb#Tradeskill", -- Azshara's Veil
	[52983] = "0596. Cataclysm Herb#Tradeskill", -- Cinderbloom
	-- -- Northrend (97)
	[36908] = "0597. Northrend Herb#Tradeskill", -- Frost Lotus
	[36905] = "0597. Northrend Herb#Tradeskill", -- Lichbloom
	[36906] = "0597. Northrend Herb#Tradeskill", -- Icethorn
	[36903] = "0597. Northrend Herb#Tradeskill", -- Adder's Tongue
	[36904] = "0597. Northrend Herb#Tradeskill", -- Tiger Lily
	[36907] = "0597. Northrend Herb#Tradeskill", -- Talandra's Rose
	[36901] = "0597. Northrend Herb#Tradeskill", -- Goldclover
	[37921] = "0597. Northrend Herb#Tradeskill", -- Deadnettle
	[39970] = "0597. Northrend Herb#Tradeskill", -- Fire Leaf
	-- -- Outland (98)
	[22794] = "0598. Outland Herb#Tradeskill", -- Fel Lotus
	[22792] = "0598. Outland Herb#Tradeskill", -- Nightmare Vine
	[22791] = "0598. Outland Herb#Tradeskill", -- Netherbloom
	[22793] = "0598. Outland Herb#Tradeskill", -- Mana Thistle
	[22785] = "0598. Outland Herb#Tradeskill", -- Felweed
	[22789] = "0598. Outland Herb#Tradeskill", -- Terocone
	[22786] = "0598. Outland Herb#Tradeskill", -- Dreaming Glory
	[22790] = "0598. Outland Herb#Tradeskill", -- Ancient Lichen
	[22787] = "0598. Outland Herb#Tradeskill", -- Ragveil
	-- -- Herb (99)
	[13468] = "0599. Herb#Tradeskill", -- Black Lotus
	[8153] = "0599. Herb#Tradeskill", -- Wildvine
	[3819] = "0599. Herb#Tradeskill", -- Dragon's Teeth
	[3820] = "0599. Herb#Tradeskill", -- Stranglekelp
	[8831] = "0599. Herb#Tradeskill", -- Purple Lotus
	[4625] = "0599. Herb#Tradeskill", -- Firebloom
	[2447] = "0599. Herb#Tradeskill", -- Peacebloom
	[785] = "0599. Herb#Tradeskill", -- Mageroyal
	[2450] = "0599. Herb#Tradeskill", -- Briarthorn
	[8838] = "0599. Herb#Tradeskill", -- Sungrass
	[3821] = "0599. Herb#Tradeskill", -- Goldthorn
	[2452] = "0599. Herb#Tradeskill", -- Swiftthistle
	[8839] = "0599. Herb#Tradeskill", -- Blindweed
	[8845] = "0599. Herb#Tradeskill", -- Ghost Mushroom
	[8836] = "0599. Herb#Tradeskill", -- Arthas' Tears
	[765] = "0599. Herb#Tradeskill", -- Silverleaf
	[2449] = "0599. Herb#Tradeskill", -- Earthroot
	[3356] = "0599. Herb#Tradeskill", -- Kingsblood
	[8846] = "0599. Herb#Tradeskill", -- Gromsblood
	[3358] = "0599. Herb#Tradeskill", -- Khadgar's Whisker
	[13465] = "0599. Herb#Tradeskill", -- Mountain Silversage
	[2453] = "0599. Herb#Tradeskill", -- Bruiseweed
	[13466] = "0599. Herb#Tradeskill", -- Sorrowmoss
	[13464] = "0599. Herb#Tradeskill", -- Golden Sansam
	[3818] = "0599. Herb#Tradeskill", -- Fadeleaf
	[13467] = "0599. Herb#Tradeskill", -- Icecap
	[3357] = "0599. Herb#Tradeskill", -- Liferoot
	[3355] = "0599. Herb#Tradeskill", -- Wild Steelbloom
	[13463] = "0599. Herb#Tradeskill", -- Dreamfoil
	[3369] = "0599. Herb#Tradeskill", -- Grave Moss

	--! Enchanting (06)
	-- -- Shadowlands (91)
	[172232] = "0691. Shadowlands Enchanting#Tradeskill", -- Eternal Crystal
	[172231] = "0691. Shadowlands Enchanting#Tradeskill", -- Sacred Shard
	[172230] = "0691. Shadowlands Enchanting#Tradeskill", -- Soul Dust
	[183951] = "0691. Shadowlands Enchanting#Tradeskill", -- Immortal Shard
	-- -- Kul Tiras/Zandalar (92)
	[152877] = "0692. Kul Tiras/Zandalar Enchanting#Tradeskill", -- Veiled Crystal
	[152876] = "0692. Kul Tiras/Zandalar Enchanting#Tradeskill", -- Umbra Shard
	[152875] = "0692. Kul Tiras/Zandalar Enchanting#Tradeskill", -- Gloom Dust
	-- -- Broken Isles (93)
	[124442] = "0693. Broken Isles Enchanting#Tradeskill", -- Chaos Crystal
	[124441] = "0693. Broken Isles Enchanting#Tradeskill", -- Leylight Shard
	[124440] = "0693. Broken Isles Enchanting#Tradeskill", -- Arkhana
	[137195] = "0693. Broken Isles Enchanting#Tradeskill", -- Highmountain Armor
	[137221] = "0693. Broken Isles Enchanting#Tradeskill", -- Enchanted Raven Sigil
	-- -- Draenor (94)
	[113588] = "0694. Draenor Enchanting#Tradeskill", -- Temporal Crystal
	[111245] = "0694. Draenor Enchanting#Tradeskill", -- Luminous Shard
	[109693] = "0694. Draenor Enchanting#Tradeskill", -- Draenic Dust
	-- -- Pandaria (95)
	[74248] = "0695. Pandaria Enchanting#Tradeskill", -- Sha Crystal
	[74247] = "0695. Pandaria Enchanting#Tradeskill", -- Ethereal Shard
	[74250] = "0695. Pandaria Enchanting#Tradeskill", -- Mysterious Essence
	[74249] = "0695. Pandaria Enchanting#Tradeskill", -- Spirit Dust
	-- -- Cataclysm (96)
	[52721] = "0696. Cataclysm Enchanting#Tradeskill", -- Heavenly Shard
	[52722] = "0696. Cataclysm Enchanting#Tradeskill", -- Maelstrom Crystal
	[52719] = "0696. Cataclysm Enchanting#Tradeskill", -- Greater Celestial Essence
	[52555] = "0696. Cataclysm Enchanting#Tradeskill", -- Hypnotic Dust
	[52718] = "0696. Cataclysm Enchanting#Tradeskill", -- Lesser Celestial Essence
	-- -- Northrend (97)
	[34052] = "0697. Northrend Enchanting#Tradeskill", -- Dream Shard
	[34057] = "0697. Northrend Enchanting#Tradeskill", -- Abyss Crystal
	[34055] = "0697. Northrend Enchanting#Tradeskill", -- Greater Cosmic Essence
	[34054] = "0697. Northrend Enchanting#Tradeskill", -- Infinite Dust
	[34056] = "0697. Northrend Enchanting#Tradeskill", -- Lesser Cosmic Essence
	-- -- Outland (98)
	[22449] = "0698. Outland Enchanting#Tradeskill", -- Large Prismatic Shard
	[22450] = "0698. Outland Enchanting#Tradeskill", -- Void Crystal
	[22446] = "0698. Outland Enchanting#Tradeskill", -- Greater Planar Essence
	[22448] = "0698. Outland Enchanting#Tradeskill", -- Small Prismatic Shard
	[22445] = "0698. Outland Enchanting#Tradeskill", -- Arcane Dust
	[22447] = "0698. Outland Enchanting#Tradeskill", -- Lesser Planar Essence
	-- -- Enchanting (99)
	[38682] = "0699. Enchanting#Tradeskill", -- Enchanting Vellum
	[156930] = "0699. Enchanting#Tradeskill", -- Rich Illusion Dust
	[10940] = "0699. Enchanting#Tradeskill", -- Strange Dust
	[6217] = "0699. Enchanting#Tradeskill", -- Copper Rod
	[10938] = "0699. Enchanting#Tradeskill", -- Lesser Magic Essence
	[16203] = "0699. Enchanting#Tradeskill", -- Greater Eternal Essence
	[14344] = "0699. Enchanting#Tradeskill", -- Large Brilliant Shard
	[16204] = "0699. Enchanting#Tradeskill", -- Light Illusion Dust
	[16202] = "0699. Enchanting#Tradeskill", -- Lesser Eternal Essence
	[10939] = "0699. Enchanting#Tradeskill", -- Greater Magic Essence
	[14343] = "0699. Enchanting#Tradeskill", -- Small Brilliant Shard
	[4470] = "0699. Enchanting#Tradeskill", -- Simple Wood
	[11291] = "0699. Enchanting#Tradeskill", -- Star Wood

	--! Alchemy (07)
	-- -- Shadowlands (91)
	[171292] = "0791. Shadowlands Alchemy#Tradeskill", -- Ground Nightshade
	[171289] = "0791. Shadowlands Alchemy#Tradeskill", -- Ground Widowbloom
	[171288] = "0791. Shadowlands Alchemy#Tradeskill", -- Ground Vigil's Torch
	[171290] = "0791. Shadowlands Alchemy#Tradeskill", -- Ground Marrowroot
	[171291] = "0791. Shadowlands Alchemy#Tradeskill", -- Ground Rising Glory
	[171287] = "0791. Shadowlands Alchemy#Tradeskill", -- Ground Death Blossom
	[183950] = "0791. Shadowlands Alchemy#Tradeskill", -- Distilled Death Extract
	[180732] = "0891. Shadowlands Inscription#Tradeskill|Inscription|0791. Shadowlands Alchemy#Tradeskill", -- Rune Etched Vial
	[180457] = "0791. Shadowlands Alchemy#Tradeskill", -- Shadestone
	-- -- Kul Tiras/Zandalar (92)
	[160325] = "0792. Kul Tiras/Zandalar Alchemy#Tradeskill", -- Quivering Sac
	[168143] = "0792. Kul Tiras/Zandalar Alchemy#Tradeskill", -- Purposefully Potent Potion
	[168146] = "0792. Kul Tiras/Zandalar Alchemy#Tradeskill", -- Sphere of Sangaurum
	[168144] = "0792. Kul Tiras/Zandalar Alchemy#Tradeskill", -- Extremely Precise Vial
	[168145] = "0792. Kul Tiras/Zandalar Alchemy#Tradeskill", -- Sly Rogue's Decanter
	-- -- Broken Isles (93)
	[137596] = "0793. Broken Isles Alchemy#Tradeskill", -- Black Transmutagen
	[137597] = "0793. Broken Isles Alchemy#Tradeskill", -- Oily Transmutagen
	[137595] = "0793. Broken Isles Alchemy#Tradeskill", -- Viscous Transmutagen
	-- -- Draenor (94)
	[108996] = "0794. Draenor Alchemy#Tradeskill", -- Alchemical Catalyst
	[109123] = "0794. Draenor Alchemy#Tradeskill", -- Crescent Oil
	-- -- Pandaria (95)
	[87872] = "0795. Pandaria Alchemy#Tradeskill", -- Desecrated Oil
	[83064] = "0795. Pandaria Alchemy#Tradeskill", -- Spinefish
	-- -- Cataclysm (96)
	[65892] = "0796. Cataclysm Alchemy#Tradeskill", -- Pyrium-Laced Crystalline Vial
	[65893] = "0796. Cataclysm Alchemy#Tradeskill", -- Sands of Time
	[56850] = "0796. Cataclysm Alchemy#Tradeskill", -- Deepstone Oil
	[53065] = "0796. Cataclysm Alchemy#Tradeskill", -- Albino Cavefish
	-- -- Northrend (97)
	[44958] = "0797. Northrend Alchemy#Tradeskill", -- Ethereal Oil
	[41814] = "0797. Northrend Alchemy#Tradeskill", -- Glassfin Minnow
	[40195] = "0797. Northrend Alchemy#Tradeskill", -- Pygmy Oil
	[40199] = "0797. Northrend Alchemy#Tradeskill", -- Pygmy Suckerfish
	-- -- Alchemy (99)
	[3824] = "0799. Alchemy#Tradeskill", -- Shadow Oil
	[3371] = "0799. Alchemy#Tradeskill", -- Crystal Vial
	[9262] = "0799. Alchemy#Tradeskill", -- Black Vitriol
	[13423] = "0799. Alchemy#Tradeskill", -- Stonescale Oil
	[13422] = "0799. Alchemy#Tradeskill", -- Stonescale Eel
	[6371] = "0799. Alchemy#Tradeskill", -- Fire Oil
	[6359] = "0799. Alchemy#Tradeskill", -- Firefin Snapper
	[6370] = "0799. Alchemy#Tradeskill", -- Blackmouth Oil
	[6358] = "0799. Alchemy#Tradeskill", -- Oily Blackmouth
	[19441] = "0799. Alchemy#Tradeskill", -- Huge Venom Sac
	[1288] = "0799. Alchemy#Tradeskill", -- Large Venom Sac
	[1475] = "0799. Alchemy#Tradeskill", -- Small Venom Sac
	[4402] = "0799. Alchemy#Tradeskill", -- Small Flame Sac
	[3164] = "0799. Alchemy#Tradeskill", -- Discolored Worg Heart

	--! Inscription (08)
	-- -- Shadowlands (91)
	[175970] = "0891. Shadowlands Inscription#Tradeskill", -- Tranquil Ink
	[175788] = "0891. Shadowlands Inscription#Tradeskill", -- Tranquil Pigment
	[173059] = "0891. Shadowlands Inscription#Tradeskill", -- Luminous Ink
	[173057] = "0891. Shadowlands Inscription#Tradeskill", -- Luminous Pigment
	[173058] = "0891. Shadowlands Inscription#Tradeskill", -- Umbral Ink
	[173056] = "0891. Shadowlands Inscription#Tradeskill", -- Umbral Pigment
	[173060] = "0891. Shadowlands Inscription#Tradeskill", -- Aerated Water
	[183953] = "0891. Shadowlands Inscription#Tradeskill", -- Sealing Wax
	[175886] = "0891. Shadowlands Inscription#Tradeskill", -- Dark Parchment
	[177843] = "0891. Shadowlands Inscription#Tradeskill", -- Blank Card of Putrescence
	[177842] = "0891. Shadowlands Inscription#Tradeskill", -- Blank Card of Repose
	[177840] = "0891. Shadowlands Inscription#Tradeskill", -- Blank Card of Indomitable
	[177841] = "0891. Shadowlands Inscription#Tradeskill", -- Blank Card of Voracity
	-- -- Kul Tiras/Zandalar (92)
	[158188] = "0892. Kul Tiras/Zandalar Inscription#Tradeskill", -- Crimson Ink
	[153636] = "0892. Kul Tiras/Zandalar Inscription#Tradeskill", -- Crimson Pigment
	[158187] = "0892. Kul Tiras/Zandalar Inscription#Tradeskill", -- Ultramarine Ink
	[153635] = "0892. Kul Tiras/Zandalar Inscription#Tradeskill", -- Ultramarine Pigment
	[168663] = "0892. Kul Tiras/Zandalar Inscription#Tradeskill", -- Maroon Ink
	[168662] = "0892. Kul Tiras/Zandalar Inscription#Tradeskill", -- Maroon Pigment
	[158189] = "0892. Kul Tiras/Zandalar Inscription#Tradeskill", -- Viridescent Ink
	[153669] = "0892. Kul Tiras/Zandalar Inscription#Tradeskill", -- Viridescent Pigment
	[158186] = "0892. Kul Tiras/Zandalar Inscription#Tradeskill", -- Distilled Water
	[158205] = "0892. Kul Tiras/Zandalar Inscription#Tradeskill", -- Acacia Powder
	[168168] = "0892. Kul Tiras/Zandalar Inscription#Tradeskill", -- Gilded Plume
	[168140] = "0892. Kul Tiras/Zandalar Inscription#Tradeskill", -- Ancient Blood Pigment
	[168142] = "0892. Kul Tiras/Zandalar Inscription#Tradeskill", -- Coagulated Miasma
	-- -- Broken Isles (93)
	[129034] = "0893. Broken Isles Inscription#Tradeskill", -- Sallow Pigment
	[129032] = "0893. Broken Isles Inscription#Tradeskill", -- Roseate Pigment
	-- -- Draenor (94)
	[112377] = "0894. Draenor Inscription#Tradeskill", -- War Paints
	[113111] = "0894. Draenor Inscription#Tradeskill", -- Warbinder's Ink
	[114931] = "0894. Draenor Inscription#Tradeskill", -- Cerulean Pigment
	-- -- Pandaria (95)
	[79731] = "0895. Pandaria Inscription#Tradeskill", -- Scroll of Wisdom
	[79255] = "0895. Pandaria Inscription#Tradeskill", -- Starlight Ink
	[79253] = "0895. Pandaria Inscription#Tradeskill", -- Misty Pigment
	[79254] = "0895. Pandaria Inscription#Tradeskill", -- Ink of Dreams
	[79251] = "0895. Pandaria Inscription#Tradeskill", -- Shadow Pigment
	-- -- Cataclysm (96)
	[62323] = "0896. Cataclysm Inscription#Tradeskill", -- Deathwing Scale Fragment
	[61981] = "0896. Cataclysm Inscription#Tradeskill", -- Inferno Ink
	[61980] = "0896. Cataclysm Inscription#Tradeskill", -- Burning Embers
	[61978] = "0896. Cataclysm Inscription#Tradeskill", -- Blackfallow Ink
	[61979] = "0896. Cataclysm Inscription#Tradeskill", -- Ashen Pigment
	-- -- Northrend (97)
	[43127] = "0897. Northrend Inscription#Tradeskill", -- Snowfall Ink
	[43109] = "0897. Northrend Inscription#Tradeskill", -- Icy Pigment
	[43126] = "0897. Northrend Inscription#Tradeskill", -- Ink of the Sea
	[39343] = "0897. Northrend Inscription#Tradeskill", -- Azure Pigment
	-- -- Outland (98)
	[43125] = "0897. Northrend Inscription#Tradeskill", -- Darkflame Ink
	[43108] = "0897. Northrend Inscription#Tradeskill", -- Ebon Pigment
	[43124] = "0897. Northrend Inscription#Tradeskill", -- Ethereal Ink
	[39342] = "0897. Northrend Inscription#Tradeskill", -- Nether Pigment
	-- -- Inscription (99)
	[43123] = "0899. Inscription#Tradeskill", -- Ink of the Sky
	[43107] = "0899. Inscription#Tradeskill", -- Sapphire Pigment
	[43122] = "0899. Inscription#Tradeskill", -- Shimmering Ink
	[39341] = "0899. Inscription#Tradeskill", -- Silvery Pigment
	[43121] = "0899. Inscription#Tradeskill", -- Fiery Ink
	[43106] = "0899. Inscription#Tradeskill", -- Ruby Pigment
	[43119] = "0899. Inscription#Tradeskill", -- Royal Ink
	[43105] = "0899. Inscription#Tradeskill", -- Indigo Pigment
	[43118] = "0899. Inscription#Tradeskill", -- Jadefire Ink
	[39339] = "0899. Inscription#Tradeskill", -- Emerald Pigment
	[43117] = "0899. Inscription#Tradeskill", -- Dawnstar Ink
	[43104] = "0899. Inscription#Tradeskill", -- Burnt Pigment
	[43116] = "0899. Inscription#Tradeskill", -- Lion's Ink
	[39338] = "0899. Inscription#Tradeskill", -- Golden Pigment
	[43115] = "0899. Inscription#Tradeskill", -- Hunter's Ink
	[43103] = "0899. Inscription#Tradeskill", -- Verdant Pigment
	[39774] = "0899. Inscription#Tradeskill", -- Midnight Ink
	[39334] = "0899. Inscription#Tradeskill", -- Dusky Pigment
	[39469] = "0899. Inscription#Tradeskill", -- Moonglow Ink
	[39151] = "0899. Inscription#Tradeskill", -- Alabaster Pigment
	[79740] = "0899. Inscription#Tradeskill", -- Plain Wooden Staff
	[39354] = "0899. Inscription#Tradeskill", -- Light Parchment

	--! Jewelcrafting (09)
	-- -- Shadowlands (91)
	[173108] = "0991. Shadowlands Jewelcrafting#Tradeskill", -- Oriblase
	[173110] = "0991. Shadowlands Jewelcrafting#Tradeskill", -- Umbryl
	[173109] = "0991. Shadowlands Jewelcrafting#Tradeskill", -- Angerseye
	[173171] = "0991. Shadowlands Jewelcrafting#Tradeskill", -- Essence of Torment
	[173170] = "0991. Shadowlands Jewelcrafting#Tradeskill", -- Essence of Rebirth
	[173172] = "0991. Shadowlands Jewelcrafting#Tradeskill", -- Essence of Servitude
	[173173] = "0991. Shadowlands Jewelcrafting#Tradeskill", -- Essence of Valor
	[173168] = "0991. Shadowlands Jewelcrafting#Tradeskill", -- Laestrite Setting
	[183954] = "0991. Shadowlands Jewelcrafting#Tradeskill", -- Malleable Wire
	-- -- Kul Tiras/Zandalar (92)
	[153706] = "0992. Kul Tiras/Zandalar Jewelcrafting#Tradeskill", -- Kraken's Eye
	[168635] = "0992. Kul Tiras/Zandalar Jewelcrafting#Tradeskill", -- Leviathan's Eye
	[168188] = "0992. Kul Tiras/Zandalar Jewelcrafting#Tradeskill", -- Sage Agate
	[154123] = "0992. Kul Tiras/Zandalar Jewelcrafting#Tradeskill", -- Amberblaze
	[154124] = "0992. Kul Tiras/Zandalar Jewelcrafting#Tradeskill", -- Laribole
	[154125] = "0992. Kul Tiras/Zandalar Jewelcrafting#Tradeskill", -- Royal Quartz
	[153701] = "0992. Kul Tiras/Zandalar Jewelcrafting#Tradeskill", -- Rubellite
	[168193] = "0992. Kul Tiras/Zandalar Jewelcrafting#Tradeskill", -- Azsharine
	[153705] = "0992. Kul Tiras/Zandalar Jewelcrafting#Tradeskill", -- Kyanite
	[153703] = "0992. Kul Tiras/Zandalar Jewelcrafting#Tradeskill", -- Solstone
	[153704] = "0992. Kul Tiras/Zandalar Jewelcrafting#Tradeskill", -- Viridium
	[168189] = "0992. Kul Tiras/Zandalar Jewelcrafting#Tradeskill", -- Dark Opal
	[153702] = "0992. Kul Tiras/Zandalar Jewelcrafting#Tradeskill", -- Kubiline
	[153700] = "0992. Kul Tiras/Zandalar Jewelcrafting#Tradeskill", -- Golden Beryl
	[168191] = "0992. Kul Tiras/Zandalar Jewelcrafting#Tradeskill", -- Sea Currant
	[154121] = "0992. Kul Tiras/Zandalar Jewelcrafting#Tradeskill", -- Scarlet Diamond
	[154122] = "0992. Kul Tiras/Zandalar Jewelcrafting#Tradeskill", -- Tidal Amethyst
	[168190] = "0992. Kul Tiras/Zandalar Jewelcrafting#Tradeskill", -- Lava Lazuli
	[168192] = "0992. Kul Tiras/Zandalar Jewelcrafting#Tradeskill", -- Sand Spinel
	[154120] = "0992. Kul Tiras/Zandalar Jewelcrafting#Tradeskill", -- Owlseye
	-- -- Broken Isles Jewelcrafting (93)
	[151579] = "0993. Broken Isles Jewelcrafting#Tradeskill", -- Labradorite
	[151722] = "0993. Broken Isles Jewelcrafting#Tradeskill", -- Florid Malachite
	[151718] = "0993. Broken Isles Jewelcrafting#Tradeskill", -- Argulite
	[151721] = "0993. Broken Isles Jewelcrafting#Tradeskill", -- Hesselian
	[151720] = "0993. Broken Isles Jewelcrafting#Tradeskill", -- Chemirine
	[151719] = "0993. Broken Isles Jewelcrafting#Tradeskill", -- Lightsphene
	[130245] = "0993. Broken Isles Jewelcrafting#Tradeskill", -- Saber's Eye
	[130179] = "0993. Broken Isles Jewelcrafting#Tradeskill", -- Eye of Prophecy
	[130178] = "0993. Broken Isles Jewelcrafting#Tradeskill", -- Furystone
	[130180] = "0993. Broken Isles Jewelcrafting#Tradeskill", -- Dawnlight
	[130181] = "0993. Broken Isles Jewelcrafting#Tradeskill", -- Pandemonite
	[130182] = "0993. Broken Isles Jewelcrafting#Tradeskill", -- Maelstrom Sapphire
	[130183] = "0993. Broken Isles Jewelcrafting#Tradeskill", -- Shadowruby
	[130175] = "0993. Broken Isles Jewelcrafting#Tradeskill", -- Chaotic Spinel
	[130172] = "0993. Broken Isles Jewelcrafting#Tradeskill", -- Sangrite
	[130173] = "0993. Broken Isles Jewelcrafting#Tradeskill", -- Deep Amber
	[130176] = "0993. Broken Isles Jewelcrafting#Tradeskill", -- Skystone
	[130174] = "0993. Broken Isles Jewelcrafting#Tradeskill", -- Azsunite
	[130177] = "0993. Broken Isles Jewelcrafting#Tradeskill", -- Queen's Opal
	[129100] = "0993. Broken Isles Jewelcrafting#Tradeskill", -- Gem Chip
	-- -- Draenor (94)
	[115524] = "0994. Draenor Jewelcrafting#Tradeskill", -- Taladite Crystal
	-- -- Pandaria (95)
	[76734] = "0995. Pandaria Jewelcrafting#Tradeskill", -- Serpent's Eye
	[76132] = "0995. Pandaria Jewelcrafting#Tradeskill", -- Primal Diamond
	[76139] = "0995. Pandaria Jewelcrafting#Tradeskill", -- Wild Jade
	[76131] = "0995. Pandaria Jewelcrafting#Tradeskill", -- Primordial Ruby
	[76138] = "0995. Pandaria Jewelcrafting#Tradeskill", -- River's Heart
	[76142] = "0995. Pandaria Jewelcrafting#Tradeskill", -- Sun's Radiance
	[76140] = "0995. Pandaria Jewelcrafting#Tradeskill", -- Vermilion Onyx
	[76141] = "0995. Pandaria Jewelcrafting#Tradeskill", -- Imperial Amethyst
	[76130] = "0995. Pandaria Jewelcrafting#Tradeskill", -- Tiger Opal
	[76133] = "0995. Pandaria Jewelcrafting#Tradeskill", -- Lapis Lazuli
	[76136] = "0995. Pandaria Jewelcrafting#Tradeskill", -- Pandarian Garnet
	[76134] = "0995. Pandaria Jewelcrafting#Tradeskill", -- Sunstone
	[76137] = "0995. Pandaria Jewelcrafting#Tradeskill", -- Alexandrite
	[76135] = "0995. Pandaria Jewelcrafting#Tradeskill", -- Roguestone
	-- -- Cataclysm (96)
	[52303] = "0996. Cataclysm Jewelcrafting#Tradeskill", -- Shadowspirit Diamond
	[71805] = "0996. Cataclysm Jewelcrafting#Tradeskill", -- Queen's Garnet
	[71808] = "0996. Cataclysm Jewelcrafting#Tradeskill", -- Lava Coral
	[71810] = "0996. Cataclysm Jewelcrafting#Tradeskill", -- Elven Peridot
	[71807] = "0996. Cataclysm Jewelcrafting#Tradeskill", -- Deepholm Iolite
	[71809] = "0996. Cataclysm Jewelcrafting#Tradeskill", -- Shadow Spinel
	[71806] = "0996. Cataclysm Jewelcrafting#Tradeskill", -- Lightstone
	[52190] = "0996. Cataclysm Jewelcrafting#Tradeskill", -- Inferno Ruby
	[52192] = "0996. Cataclysm Jewelcrafting#Tradeskill", -- Dream Emerald
	[52196] = "0996. Cataclysm Jewelcrafting#Tradeskill", -- Chimera's Eye
	[52191] = "0996. Cataclysm Jewelcrafting#Tradeskill", -- Ocean Sapphire
	[52195] = "0996. Cataclysm Jewelcrafting#Tradeskill", -- Amberjewel
	[52193] = "0996. Cataclysm Jewelcrafting#Tradeskill", -- Ember Topaz
	[52194] = "0996. Cataclysm Jewelcrafting#Tradeskill", -- Demonseye
	[52181] = "0996. Cataclysm Jewelcrafting#Tradeskill", -- Hessonite
	[52177] = "0996. Cataclysm Jewelcrafting#Tradeskill", -- Carnelian
	[52180] = "0996. Cataclysm Jewelcrafting#Tradeskill", -- Nightstone
	[52182] = "0996. Cataclysm Jewelcrafting#Tradeskill", -- Jasper
	[52179] = "0996. Cataclysm Jewelcrafting#Tradeskill", -- Alicite
	[52178] = "0996. Cataclysm Jewelcrafting#Tradeskill", -- Zephyrite
	-- -- Northrend (97)
	[46849] = "0997. Northrend Jewelcrafting#Tradeskill", -- Titanium Powder
	[36922] = "0997. Northrend Jewelcrafting#Tradeskill", -- King's Amber
	[36930] = "0997. Northrend Jewelcrafting#Tradeskill", -- Monarch Topaz
	[42225] = "0997. Northrend Jewelcrafting#Tradeskill", -- Dragon's Eye
	[36919] = "0997. Northrend Jewelcrafting#Tradeskill", -- Cardinal Ruby
	[41266] = "0997. Northrend Jewelcrafting#Tradeskill", -- Skyflare Diamond
	[41334] = "0997. Northrend Jewelcrafting#Tradeskill", -- Earthsiege Diamond
	[36918] = "0997. Northrend Jewelcrafting#Tradeskill", -- Scarlet Ruby
	[36933] = "0997. Northrend Jewelcrafting#Tradeskill", -- Forest Emerald
	[36921] = "0997. Northrend Jewelcrafting#Tradeskill", -- Autumn's Glow
	[36927] = "0997. Northrend Jewelcrafting#Tradeskill", -- Twilight Opal
	[36931] = "0997. Northrend Jewelcrafting#Tradeskill", -- Ametrine
	[36928] = "0997. Northrend Jewelcrafting#Tradeskill", -- Dreadstone
	[36924] = "0997. Northrend Jewelcrafting#Tradeskill", -- Sky Sapphire
	[36925] = "0997. Northrend Jewelcrafting#Tradeskill", -- Majestic Zircon
	[36934] = "0997. Northrend Jewelcrafting#Tradeskill", -- Eye of Zul
	[36923] = "0997. Northrend Jewelcrafting#Tradeskill", -- Chalcedony
	[36783] = "0997. Northrend Jewelcrafting#Tradeskill", -- Northsea Pearl
	[36917] = "0997. Northrend Jewelcrafting#Tradeskill", -- Bloodstone
	[36784] = "0997. Northrend Jewelcrafting#Tradeskill", -- Siren's Tear
	[36932] = "0997. Northrend Jewelcrafting#Tradeskill", -- Dark Jade
	[36920] = "0997. Northrend Jewelcrafting#Tradeskill", -- Sun Crystal
	[36929] = "0997. Northrend Jewelcrafting#Tradeskill", -- Huge Citrine
	[36926] = "0997. Northrend Jewelcrafting#Tradeskill", -- Shadow Crystal
	-- -- Outland (98)
	[32227] = "0998. Outland Jewelcrafting#Tradeskill", -- Crimson Spinel
	[24243] = "0998. Outland Jewelcrafting#Tradeskill", -- Adamantite Powder
	[23436] = "0998. Outland Jewelcrafting#Tradeskill", -- Living Ruby
	[23438] = "0998. Outland Jewelcrafting#Tradeskill", -- Star of Elune
	[32230] = "0998. Outland Jewelcrafting#Tradeskill", -- Shadowsong Amethyst
	[25867] = "0998. Outland Jewelcrafting#Tradeskill", -- Earthstorm Diamond
	[23441] = "0998. Outland Jewelcrafting#Tradeskill", -- Nightseye
	[32231] = "0998. Outland Jewelcrafting#Tradeskill", -- Pyrestone
	[23440] = "0998. Outland Jewelcrafting#Tradeskill", -- Dawnstone
	[32228] = "0998. Outland Jewelcrafting#Tradeskill", -- Empyrean Sapphire
	[25868] = "0998. Outland Jewelcrafting#Tradeskill", -- Skyfire Diamond
	[32229] = "0998. Outland Jewelcrafting#Tradeskill", -- Lionseye
	[32249] = "0998. Outland Jewelcrafting#Tradeskill", -- Seaspray Emerald
	[23437] = "0998. Outland Jewelcrafting#Tradeskill", -- Talasite
	[23439] = "0998. Outland Jewelcrafting#Tradeskill", -- Noble Topaz
	[23077] = "0998. Outland Jewelcrafting#Tradeskill", -- Blood Garnet
	[23112] = "0998. Outland Jewelcrafting#Tradeskill", -- Golden Draenite
	[23079] = "0998. Outland Jewelcrafting#Tradeskill", -- Deep Peridot
	[23117] = "0998. Outland Jewelcrafting#Tradeskill", -- Azure Moonstone
	[23107] = "0998. Outland Jewelcrafting#Tradeskill", -- Shadow Draenite
	[21929] = "0998. Outland Jewelcrafting#Tradeskill", -- Flame Spessarite
	[31079] = "0998. Outland Jewelcrafting#Tradeskill", -- Mercurial Adamantite
	[24478] = "0998. Outland Jewelcrafting#Tradeskill", -- Jaggal Pearl
	[24479] = "0998. Outland Jewelcrafting#Tradeskill", -- Shadow Pearl
	-- -- Jewelcrafting (99)
	[21752] = "0999. Jewelcrafting#Tradeskill", -- Thorium Setting
	[20963] = "0999. Jewelcrafting#Tradeskill", -- Mithril Filigree
	[20816] = "0999. Jewelcrafting#Tradeskill", -- Delicate Copper Wire
	[20817] = "0999. Jewelcrafting#Tradeskill", -- Bronze Setting
	[52188] = "0999. Jewelcrafting#Tradeskill", -- Jeweler's Setting
	[12363] = "0999. Jewelcrafting#Tradeskill", -- Arcane Crystal
	[12800] = "0999. Jewelcrafting#Tradeskill", -- Azerothian Diamond
	[12364] = "0999. Jewelcrafting#Tradeskill", -- Huge Emerald
	[12799] = "0999. Jewelcrafting#Tradeskill", -- Large Opal
	[12361] = "0999. Jewelcrafting#Tradeskill", -- Blue Sapphire
	[7910] = "0999. Jewelcrafting#Tradeskill", -- Star Ruby
	[11382] = "0999. Jewelcrafting#Tradeskill", -- Blood of the Mountain
	[7909] = "0999. Jewelcrafting#Tradeskill", -- Aquamarine
	[3864] = "0999. Jewelcrafting#Tradeskill", -- Citrine
	[7971] = "0999. Jewelcrafting#Tradeskill", -- Black Pearl
	[13926] = "0999. Jewelcrafting#Tradeskill", -- Golden Pearl
	[1529] = "0999. Jewelcrafting#Tradeskill", -- Jade
	[1705] = "0999. Jewelcrafting#Tradeskill", -- Lesser Moonstone
	[1206] = "0999. Jewelcrafting#Tradeskill", -- Moss Agate
	[5500] = "0999. Jewelcrafting#Tradeskill", -- Iridescent Pearl
	[1210] = "0999. Jewelcrafting#Tradeskill", -- Shadowgem
	[818] = "0999. Jewelcrafting#Tradeskill", -- Tigerseye
	[5498] = "0999. Jewelcrafting#Tradeskill", -- Small Lustrous Pearl
	[774] = "0999. Jewelcrafting#Tradeskill", -- Malachite
	[11754] = "0999. Jewelcrafting#Tradeskill", -- Black Diamond

	--! Parts (10)
	-- -- Shadowlands (91)
	[172935] = "1091. Shadowlands Parts#Tradeskill", -- Porous Polishing Abrasive
	[172934] = "1091. Shadowlands Parts#Tradeskill", -- Handful of Laestrite Bolts
	[172937] = "1091. Shadowlands Parts#Tradeskill", -- Wormfed Gear Assembly
	[172936] = "1091. Shadowlands Parts#Tradeskill", -- Mortal Coiled Spring
	[183952] = "1091. Shadowlands Parts#Tradeskill", -- Machinist's Oil
	-- -- Kul Tiras/Zandalar (92)
	[163203] = "1092. Kul Tiras/Zandalar Parts#Tradeskill", -- Hypersensitive Azeritometer Sensor
	[161137] = "1092. Kul Tiras/Zandalar Parts#Tradeskill", -- Blast-Fired Electric Servomotor
	[161136] = "1092. Kul Tiras/Zandalar Parts#Tradeskill", -- Azerite Forged Protection Plating
	[161131] = "1092. Kul Tiras/Zandalar Parts#Tradeskill", -- Barely Stable Azerite Reactor
	[161132] = "1092. Kul Tiras/Zandalar Parts#Tradeskill", -- Crush Resistant Stabilizer
	[163569] = "1092. Kul Tiras/Zandalar Parts#Tradeskill", -- Insulated Wiring
	[158887] = "1092. Kul Tiras/Zandalar Parts#Tradeskill", -- Monelite Reinforced Chassis
	[158886] = "1092. Kul Tiras/Zandalar Parts#Tradeskill", -- Super-Charged Engine
	[160502] = "1092. Kul Tiras/Zandalar Parts#Tradeskill", -- Chemical Blasting Cap
	-- -- Broken Isles (93)
	[146714] = "1093. Broken Isles Parts#Tradeskill", -- Hammer of Forgotten Heroes
	[140782] = "1093. Broken Isles Parts#Tradeskill", -- Neural Net Detangler
	[140783] = "1093. Broken Isles Parts#Tradeskill", -- Predictive Combat Operations Databank
	[136633] = "1093. Broken Isles Parts#Tradeskill", -- Loose Trigger
	[136637] = "1093. Broken Isles Parts#Tradeskill", -- Oversized Blasting Cap
	[136636] = "1093. Broken Isles Parts#Tradeskill", -- Sniping Scope
	[140784] = "1093. Broken Isles Parts#Tradeskill", -- Fel Piston Stabilizer
	[140781] = "1093. Broken Isles Parts#Tradeskill", -- X-87 Battle Circuit
	[144329] = "1093. Broken Isles Parts#Tradeskill", -- Hardened Felglass
	[136638] = "1093. Broken Isles Parts#Tradeskill", -- True Iron Barrel
	[140785] = "1093. Broken Isles Parts#Tradeskill", -- Hardened Circuitboard Plating
	-- -- Draenor (94)
	[111366] = "1094. Draenor Parts#Tradeskill", -- Gearspring Parts
	-- -- Pandaria (95)
	[94113] = "1095. Pandaria Parts#Tradeskill", -- Jard's Peculiar Energy Source
	[77468] = "1095. Pandaria Parts#Tradeskill", -- High-Explosive Gunpowder
	[77467] = "1095. Pandaria Parts#Tradeskill", -- Ghost Iron Bolts
	-- -- Cataclysm (96)
	[67749] = "1096. Cataclysm Parts#Tradeskill", -- Electrified Ether
	[60224] = "1096. Cataclysm Parts#Tradeskill", -- Handful of Obsidium Bolts
	-- -- Northrend (97)
	[44500] = "1097. Northrend Parts#Tradeskill", -- Elementium-Plated Exhaust Pipe
	[44499] = "1097. Northrend Parts#Tradeskill", -- Salvaged Iron Golem Parts
	[44501] = "1097. Northrend Parts#Tradeskill", -- Goblin-Machined Piston
	[40533] = "1097. Northrend Parts#Tradeskill", -- Walnut Stock
	[39690] = "1097. Northrend Parts#Tradeskill", -- Volatile Blasting Trigger
	[39682] = "1097. Northrend Parts#Tradeskill", -- Overcharged Capacitor
	[39681] = "1097. Northrend Parts#Tradeskill", -- Handful of Cobalt Bolts
	[39683] = "1097. Northrend Parts#Tradeskill", -- Froststeel Tube
	[39684] = "1097. Northrend Parts#Tradeskill", -- Hair Trigger
	-- -- Parts (99)
	[90146] = "1099. Parts#Tradeskill", -- Tinker's Kit
	[9210] = "1099. Parts#Tradeskill", -- Ghost Dye
	[10290] = "1099. Parts#Tradeskill", -- Pink Dye
	[4342] = "1099. Parts#Tradeskill", -- Purple Dye
	[2325] = "1099. Parts#Tradeskill", -- Black Dye
	[6261] = "1099. Parts#Tradeskill", -- Orange Dye
	[4340] = "1099. Parts#Tradeskill", -- Gray Dye
	[4341] = "1099. Parts#Tradeskill", -- Yellow Dye
	[2605] = "1099. Parts#Tradeskill", -- Green Dye
	[6260] = "1099. Parts#Tradeskill", -- Blue Dye
	[2604] = "1099. Parts#Tradeskill", -- Red Dye
	[2324] = "1099. Parts#Tradeskill", -- Bleach

	--! Elemental (11)
	-- -- Shadowlands (91)
	[187707] = "1191. Shadowlands Elemental#Tradeskill", -- Progenitor Essentia
	[186017] = "1191. Shadowlands Elemental#Tradeskill", -- Korthite Crystal
	[178787] = "1191. Shadowlands Elemental#Tradeskill", -- Orboreal Shard
	-- -- Kul Tiras/Zandalar (92)
	[165703] = "1192. Kul Tiras/Zandalar Elemental#Tradeskill", -- Breath of Bwonsamdi
	[162461] = "1192. Kul Tiras/Zandalar Elemental#Tradeskill", -- Sanguicell
	[165948] = "1192. Kul Tiras/Zandalar Elemental#Tradeskill", -- Tidalcore
	[162460] = "1192. Kul Tiras/Zandalar Elemental#Tradeskill", -- Hydrocore
	[152668] = "1192. Kul Tiras/Zandalar Elemental#Tradeskill", -- Expulsom
	-- -- Broken Isles (93)
	[151568] = "1193. Broken Isles Elemental#Tradeskill", -- Primal Sargerite
	[124124] = "1193. Broken Isles Elemental#Tradeskill", -- Blood of Sargeras
	-- -- Draenor (94)
	[127759] = "1194. Draenor Elemental#Tradeskill", -- Felblight
	[118472] = "1194. Draenor Elemental#Tradeskill", -- Savage Blood
	[120945] = "1194. Draenor Elemental#Tradeskill", -- Primal Spirit
	[113261] = "1194. Draenor Elemental#Tradeskill", -- Sorcerous Fire
	[113262] = "1194. Draenor Elemental#Tradeskill", -- Sorcerous Water
	[113263] = "1194. Draenor Elemental#Tradeskill", -- Sorcerous Earth
	[113264] = "1194. Draenor Elemental#Tradeskill", -- Sorcerous Air
	-- -- Pandaria (95)
	[102218] = "1195. Pandaria Elemental#Tradeskill", -- Spirit of War
	[94289] = "1195. Pandaria Elemental#Tradeskill", -- Haunting Spirit
	[80433] = "1195. Pandaria Elemental#Tradeskill", -- Blood Spirit
	[83092] = "1195. Pandaria Elemental#Tradeskill", -- Orb of Mystery
	[76061] = "1195. Pandaria Elemental#Tradeskill", -- Spirit of Harmony
	[89112] = "1195. Pandaria Elemental#Tradeskill", -- Mote of Harmony
	-- -- Cataclysm (96)
	[71998] = "1196. Cataclysm Elemental#Tradeskill", -- Essence of Destruction
	[69237] = "1196. Cataclysm Elemental#Tradeskill", -- Living Ember
	[52078] = "1196. Cataclysm Elemental#Tradeskill", -- Chaos Orb
	[52325] = "1196. Cataclysm Elemental#Tradeskill", -- Volatile Fire
	[52326] = "1196. Cataclysm Elemental#Tradeskill", -- Volatile Water
	[52328] = "1196. Cataclysm Elemental#Tradeskill", -- Volatile Air
	[52327] = "1196. Cataclysm Elemental#Tradeskill", -- Volatile Earth
	[52329] = "1196. Cataclysm Elemental#Tradeskill", -- Volatile Life
	-- -- Northrend (97)
	[49908] = "1197. Northrend Elemental#Tradeskill", -- Primordial Saronite
	[47556] = "1197. Northrend Elemental#Tradeskill", -- Crusader Orb
	[45087] = "1197. Northrend Elemental#Tradeskill", -- Runed Orb
	[43102] = "1197. Northrend Elemental#Tradeskill", -- Frozen Orb
	[36860] = "1197. Northrend Elemental#Tradeskill", -- Eternal Fire
	[35627] = "1197. Northrend Elemental#Tradeskill", -- Eternal Shadow
	[35623] = "1197. Northrend Elemental#Tradeskill", -- Eternal Air
	[35625] = "1197. Northrend Elemental#Tradeskill", -- Eternal Life
	[35624] = "1197. Northrend Elemental#Tradeskill", -- Eternal Earth
	[35622] = "1197. Northrend Elemental#Tradeskill", -- Eternal Water
	[37702] = "1197. Northrend Elemental#Tradeskill", -- Crystallized Fire
	[37703] = "1197. Northrend Elemental#Tradeskill", -- Crystallized Shadow
	[37705] = "1197. Northrend Elemental#Tradeskill", -- Crystallized Water
	[37700] = "1197. Northrend Elemental#Tradeskill", -- Crystallized Air
	[37704] = "1197. Northrend Elemental#Tradeskill", -- Crystallized Life
	[37701] = "1197. Northrend Elemental#Tradeskill", -- Crystallized Earth
	-- -- Outland (98)
	[34664] = "1198. Outland Elemental#Tradeskill", -- Sunmote
	[32428] = "1198. Outland Elemental#Tradeskill", -- Heart of Darkness
	[23571] = "1198. Outland Elemental#Tradeskill", -- Primal Might
	[23572] = "1198. Outland Elemental#Tradeskill", -- Primal Nether
	[30183] = "1198. Outland Elemental#Tradeskill", -- Nether Vortex
	[22457] = "1198. Outland Elemental#Tradeskill", -- Primal Mana
	[22576] = "1198. Outland Elemental#Tradeskill", -- Mote of Mana
	[21884] = "1198. Outland Elemental#Tradeskill", -- Primal Fire
	[22574] = "1198. Outland Elemental#Tradeskill", -- Mote of Fire
	[21885] = "1198. Outland Elemental#Tradeskill", -- Primal Water
	[22578] = "1198. Outland Elemental#Tradeskill", -- Mote of Water
	[22452] = "1198. Outland Elemental#Tradeskill", -- Primal Earth
	[22573] = "1198. Outland Elemental#Tradeskill", -- Mote of Earth
	[22451] = "1198. Outland Elemental#Tradeskill", -- Primal Air
	[22572] = "1198. Outland Elemental#Tradeskill", -- Mote of Air
	[21886] = "1198. Outland Elemental#Tradeskill", -- Primal Life
	[22575] = "1198. Outland Elemental#Tradeskill", -- Mote of Life
	[22456] = "1198. Outland Elemental#Tradeskill", -- Primal Shadow
	[22577] = "1198. Outland Elemental#Tradeskill", -- Mote of Shadow
	-- -- Elemental (99)
	[17010] = "1199. Elemental#Tradeskill", -- Fiery Core
	[17011] = "1199. Elemental#Tradeskill", -- Lava Core
	[12811] = "1199. Elemental#Tradeskill", -- Righteous Orb
	[22682] = "1199. Elemental#Tradeskill", -- Frozen Rune
	[12662] = "1199. Elemental#Tradeskill", -- Demonic Rune
	[20520] = "1199. Elemental#Tradeskill", -- Dark Rune
	[12804] = "1199. Elemental#Tradeskill", -- Powerful Mojo
	[19943] = "1199. Elemental#Tradeskill", -- Massive Mojo
	[7078] = "1199. Elemental#Tradeskill", -- Essence of Fire
	[7080] = "1199. Elemental#Tradeskill", -- Essence of Water
	[7076] = "1199. Elemental#Tradeskill", -- Essence of Earth
	[7082] = "1199. Elemental#Tradeskill", -- Essence of Air
	[12808] = "1199. Elemental#Tradeskill", -- Essence of Undeath
	[12803] = "1199. Elemental#Tradeskill", -- Living Essence
	[7068] = "1199. Elemental#Tradeskill", -- Elemental Fire
	[7070] = "1199. Elemental#Tradeskill", -- Elemental Water
	[7067] = "1199. Elemental#Tradeskill", -- Elemental Earth
	[7069] = "1199. Elemental#Tradeskill", -- Elemental Air
	[7077] = "1199. Elemental#Tradeskill", -- Heart of Fire
	[7079] = "1199. Elemental#Tradeskill", -- Globe of Water
	[7075] = "1199. Elemental#Tradeskill", -- Core of Earth
	[7081] = "1199. Elemental#Tradeskill", -- Breath of Wind
	[7972] = "1199. Elemental#Tradeskill", -- Ichor of Undeath
	[10286] = "1199. Elemental#Tradeskill", -- Heart of the Wild

	--! Optional Reagents (12)
	-- -- Shadowlands (91)
	[187829] = "1291. Shadowlands Optional Reagents#Tradeskill", -- Aealic Harmonizing Stone
	[187825] = "1291. Shadowlands Optional Reagents#Tradeskill", -- Cosmic Protoweave
	[187849] = "1291. Shadowlands Optional Reagents#Tradeskill", -- Devourer Essence Stone
	[187836] = "1291. Shadowlands Optional Reagents#Tradeskill", -- Erratic Genesis Matrix
	[187827] = "1291. Shadowlands Optional Reagents#Tradeskill", -- Infusion: Corpse Purification
	[187823] = "1291. Shadowlands Optional Reagents#Tradeskill", -- Magically Regulated Automa Core
	[187831] = "1291. Shadowlands Optional Reagents#Tradeskill", -- Pure-Air Sail Extensions
	[187850] = "1291. Shadowlands Optional Reagents#Tradeskill", -- Sustaining Armor Polish
	[187784] = "1291. Shadowlands Optional Reagents#Tradeskill", -- Vestige of the Eternal
	[185960] = "1291. Shadowlands Optional Reagents#Tradeskill", -- Vestige of Origins
	[187742] = "1291. Shadowlands Optional Reagents#Tradeskill", -- Crafter's Mark of the First Ones
	[173384] = "1291. Shadowlands Optional Reagents#Tradeskill", -- Crafter's Mark of the Chained Isle
	[187741] = "1291. Shadowlands Optional Reagents#Tradeskill", -- Crafter's Mark IV
	[173383] = "1291. Shadowlands Optional Reagents#Tradeskill", -- Crafter's Mark III
	[173382] = "1291. Shadowlands Optional Reagents#Tradeskill", -- Crafter's Mark II
	[173381] = "1291. Shadowlands Optional Reagents#Tradeskill", -- Crafter's Mark I
	[183942] = "1291. Shadowlands Optional Reagents#Tradeskill", -- Novice Crafter's Mark
	[173161] = "1291. Shadowlands Optional Reagents#Tradeskill", -- Missive of Critical Strike
	[173160] = "1291. Shadowlands Optional Reagents#Tradeskill", -- Missive of Haste
	[173162] = "1291. Shadowlands Optional Reagents#Tradeskill", -- Missive of Mastery
	[173163] = "1291. Shadowlands Optional Reagents#Tradeskill", -- Missive of Versatility
	-- -- Optional Reagents (99)
	[180060] = "1299. Optional Reagents#Tradeskill", -- Relic of the Past V
	[180059] = "1299. Optional Reagents#Tradeskill", -- Relic of the Past IV
	[180058] = "1299. Optional Reagents#Tradeskill", -- Relic of the Past III
	[180057] = "1299. Optional Reagents#Tradeskill", -- Relic of the Past II
	[180055] = "1299. Optional Reagents#Tradeskill", -- Relic of the Past I

	--! Fishing (13)
	-- -- Broken Isles (93)
	[146964] = "1393. Broken Isles Fishing#Tradeskill", -- Hatecoil Spearhead
	[146965] = "1393. Broken Isles Fishing#Tradeskill", -- Disgusting Ooze
	[146967] = "1393. Broken Isles Fishing#Tradeskill", -- White Sparkly Bauble
	[146968] = "1393. Broken Isles Fishing#Tradeskill", -- Glowing Fish Scale
	[141975] = "1393. Broken Isles Fishing#Tradeskill", -- Mark of Aquaos
	[139653] = "1393. Broken Isles Fishing#Tradeskill", -- Nar'thalas Hermit
	[139658] = "1393. Broken Isles Fishing#Tradeskill", -- Mountain Puffer
	[139661] = "1393. Broken Isles Fishing#Tradeskill", -- Oodelfjisk
	[133727] = "1393. Broken Isles Fishing#Tradeskill", -- Ghostly Queenfish
	[133742] = "1393. Broken Isles Fishing#Tradeskill", -- Ancient Black Barracuda
	[133740] = "1393. Broken Isles Fishing#Tradeskill", -- Axefish
	[133725] = "1393. Broken Isles Fishing#Tradeskill", -- Leyshimmer Blenny
	[133737] = "1393. Broken Isles Fishing#Tradeskill", -- Magic-Eater Frog
	[133726] = "1393. Broken Isles Fishing#Tradeskill", -- Nar'thalas Hermit
	[133735] = "1393. Broken Isles Fishing#Tradeskill", -- Graybelly Lobster
	[133739] = "1393. Broken Isles Fishing#Tradeskill", -- Tainted Runescale Koi
	[133736] = "1393. Broken Isles Fishing#Tradeskill", -- Thundering Stormray
	[133728] = "1393. Broken Isles Fishing#Tradeskill", -- Terrorfin
	[133734] = "1393. Broken Isles Fishing#Tradeskill", -- Oodelfjisk
	[133732] = "1393. Broken Isles Fishing#Tradeskill", -- Coldriver Carp
	[133733] = "1393. Broken Isles Fishing#Tradeskill", -- Ancient Highmountain Salmon
	[133730] = "1393. Broken Isles Fishing#Tradeskill", -- Ancient Mossgill
	[133741] = "1393. Broken Isles Fishing#Tradeskill", -- Seabottom Squid
	[133731] = "1393. Broken Isles Fishing#Tradeskill", -- Mountain Puffer
	[133729] = "1393. Broken Isles Fishing#Tradeskill", -- Thorned Flounder
	[139652] = "1393. Broken Isles Fishing#Tradeskill", -- Leyshimmer Blenny
	[139654] = "1393. Broken Isles Fishing#Tradeskill", -- Ghostly Queenfish
	[139655] = "1393. Broken Isles Fishing#Tradeskill", -- Terrorfin
	[139662] = "1393. Broken Isles Fishing#Tradeskill", -- Graybelly Lobster
	[139668] = "1393. Broken Isles Fishing#Tradeskill", -- Seabottom Squid
	[139659] = "1393. Broken Isles Fishing#Tradeskill", -- Coldriver Carp
	[139660] = "1393. Broken Isles Fishing#Tradeskill", -- Ancient Highmountain Salmon
	[139657] = "1393. Broken Isles Fishing#Tradeskill", -- Ancient Mossgill
	[139669] = "1393. Broken Isles Fishing#Tradeskill", -- Ancient Black Barracuda
	[139666] = "1393. Broken Isles Fishing#Tradeskill", -- Tainted Runescale Koi
	[139667] = "1393. Broken Isles Fishing#Tradeskill", -- Axefish
	[139656] = "1393. Broken Isles Fishing#Tradeskill", -- Thorned Flounder
	[139663] = "1393. Broken Isles Fishing#Tradeskill", -- Thundering Stormray
	[139664] = "1393. Broken Isles Fishing#Tradeskill", -- Magic-Eater Frog
	-- -- Draenor (94)
	[116820] = "1394. Draenor Fishing#Tradeskill", -- Blind Lake Lunker
	[116818] = "1394. Draenor Fishing#Tradeskill", -- Abyssal Gulper Lunker
	[127994] = "1394. Draenor Fishing#Tradeskill", -- Felmouth Frenzy Lunker
	[116819] = "1394. Draenor Fishing#Tradeskill", -- Fire Ammonite Lunker
	[116821] = "1394. Draenor Fishing#Tradeskill", -- Fat Sleeper Lunker
	[122696] = "1394. Draenor Fishing#Tradeskill", -- Sea Scorpion Lunker
	[116822] = "1394. Draenor Fishing#Tradeskill", -- Jawless Skulker Lunker
	[116817] = "1394. Draenor Fishing#Tradeskill", -- Blackwater Whiptail Lunker
	-- Fishing Poles
	[133755] = "1399. Fishing#Tradeskill", -- Underlight Angler
	[44050] = "1399. Fishing#Tradeskill", -- Mastercraft Kalu'ak Fishing Pole
	[180136] = "1399. Fishing#Tradeskill", -- "The Brokers Angle'r"
	[6367] = "1399. Fishing#Tradeskill", -- Big Iron Fishing Pole
	[19022] = "1399. Fishing#Tradeskill", -- Nat Pagle's Extreme Angler FC-5000
	[45858] = "1399. Fishing#Tradeskill", -- Nat's Lucky Fishing Pole
	[45992] = "1399. Fishing#Tradeskill", -- Jeweled Fishing Pole
	[45991] = "1399. Fishing#Tradeskill", -- Bone Fishing Pole
	[19970] = "1399. Fishing#Tradeskill", -- Arcanite Fishing Pole
	[118381] = "1399. Fishing#Tradeskill", -- Ephemeral Fishing Pole
	[6256] = "1399. Fishing#Tradeskill", -- Fishing Pole
	[116826] = "1399. Fishing#Tradeskill", -- Draenic Fishing Pole
	[6365] = "1399. Fishing#Tradeskill", -- Strong Fishing Pole
	[116825] = "1399. Fishing#Tradeskill", -- Savage Fishing Pole
	[6366] = "1399. Fishing#Tradeskill", -- Darkwood Fishing Pole
	[84661] = "1399. Fishing#Tradeskill", -- Dragon Fishing Pole
	[84660] = "1399. Fishing#Tradeskill", -- Pandaren Fishing Pole
	[120163] = "1399. Fishing#Tradeskill", -- Thruk's Fishing Rod
	[168804] = "1399. Fishing#Tradeskill", -- Powered Piscine Procurement Pole
	[25978] = "1399. Fishing#Tradeskill", -- Seth's Graphite Fishing Pole
	[12225] = "1399. Fishing#Tradeskill", -- Blump Family Fishing Pole
	[46337] = "1399. Fishing#Tradeskill", -- Staats' Fishing Pole
	[173044] = "1399. Fishing#Tradeskill", -- Wreathed Fishing Pole
	[177030] = "1399. Fishing#Tradeskill", -- Aquatic Extractor
	-- Fishing Lines
	[116117] = "1399. Fishing#Tradeskill", -- Rook's Lucky Fishin' Line
	[153203] = "1399. Fishing#Tradeskill", -- Ancient Fishing Line
	[19971] = "1399. Fishing#Tradeskill", -- High Test Eternium Fishing Line
	[34836] = "1399. Fishing#Tradeskill", -- Spun Truesilver Fishing Line
	[68796] = "1399. Fishing#Tradeskill", -- Reinforced Fishing Line
	-- Fishing Equipment
	[33820] = "1399. Fishing#Tradeskill", -- Weather-Beaten Fishing Hat
	[88710] = "1399. Fishing#Tradeskill", -- Nat's Hat
	[117405] = "1399. Fishing#Tradeskill", -- Nat's Drinking Hat
	[88535] = "1399. Fishing#Tradeskill", -- Sharpened Tuskarr Spear
	[19969] = "1399. Fishing#Tradeskill", -- Nat Pagle's Extreme Anglin' Boots
	-- Lure
	[93732] = "1399. Fishing#Tradeskill", -- Darkmoon Fishing Cap
	[139175] = "1399. Fishing#Tradeskill", -- Arcane Lure
	[68049] = "1399. Fishing#Tradeskill", -- Heat-Treated Spinning Lure


	--! Archaeology (14)
	[87399] = "14. Archaeology#Tradeskill", -- Restored Artifact
	[108439] = "14. Archaeology#Tradeskill", -- Draenor Clan Orator Cane
	[109585] = "14. Archaeology#Tradeskill", -- Arakkoa Cipher
	[109584] = "14. Archaeology#Tradeskill", -- Ogre Missive
	[95373] = "14. Archaeology#Tradeskill", -- Mantid Amber Sliver
	[79869] = "14. Archaeology#Tradeskill", -- Mogu Statue Piece
	[79868] = "14. Archaeology#Tradeskill", -- Pandaren Pottery Shard
	[64397] = "14. Archaeology#Tradeskill", -- Tol'vir Hieroglyphic
	[64396] = "14. Archaeology#Tradeskill", -- Nerubian Obelisk
	[64395] = "14. Archaeology#Tradeskill", -- Vrykul Rune Stick
	[64394] = "14. Archaeology#Tradeskill", -- Draenei Tome
	[64392] = "14. Archaeology#Tradeskill", -- Orc Blood Text
	[63128] = "14. Archaeology#Tradeskill", -- Troll Tablet
	[63127] = "14. Archaeology#Tradeskill", -- Highborne Scroll
	[130905] = "14. Archaeology#Tradeskill", -- Mark of the Deceiver
	[130903] = "14. Archaeology#Tradeskill", -- Ancient Suramar Scroll
	[130904] = "14. Archaeology#Tradeskill", -- Highmountain Ritual-Stone
	[154989] = "14. Archaeology#Tradeskill", -- Zandalari Idol
	[52843] = "14. Archaeology#Tradeskill", -- Dwarf Rune Stone
	[154990] = "14. Archaeology#Tradeskill", -- Etched Drust Bone


	--[[ ! Equipment ! ]]--

	--! BoA Token (98)
	-- -- Shadowlands (91)
	-- -- -- Zereth Mortis (87)
	[191036] = "989187. [00ccff]Broker's Armament]#Equipment", -- Broker's Accessory
	[190763] = "989187. [00ccff]Broker's Armament]#Equipment", -- Broker's Belt
	[190762] = "989187. [00ccff]Broker's Armament]#Equipment", -- Broker's Boots
	[190761] = "989187. [00ccff]Broker's Armament]#Equipment", -- Broker's Bracers
	[191037] = "989187. [00ccff]Broker's Armament]#Equipment", -- Broker's Braid
	[190760] = "989187. [00ccff]Broker's Armament]#Equipment", -- Broker's Chestpiece
	[190759] = "989187. [00ccff]Broker's Armament]#Equipment", -- Broker's Cloak
	[190758] = "989187. [00ccff]Broker's Armament]#Equipment", -- Broker's Gloves
	[190757] = "989187. [00ccff]Broker's Armament]#Equipment", -- Broker's Helm
	[190756] = "989187. [00ccff]Broker's Armament]#Equipment", -- Broker's Legguards
	[190764] = "989187. [00ccff]Broker's Armament]#Equipment", -- Broker's Ring
	[190755] = "989187. [00ccff]Broker's Armament]#Equipment", -- Broker's Shoulders
	[190741] = "989187. [00ccff]Broker's Armament]#Equipment", -- Broker's Weaponry
	-- -- -- Korthia (88)
	[188156] = "989188. [00ccff]Korthian Armament]#Equipment", -- Korthian Accessory
	[187187] = "989188. [00ccff]Korthian Armament]#Equipment", -- Korthian Armaments
	[187187] = "989188. [00ccff]Korthian Armament]#Equipment", -- Korthian Armaments
	[188161] = "989188. [00ccff]Korthian Armament]#Equipment", -- Korthian Belt
	[188155] = "989188. [00ccff]Korthian Armament]#Equipment", -- Korthian Boots
	[188163] = "989188. [00ccff]Korthian Armament]#Equipment", -- Korthian Bracers
	[188154] = "989188. [00ccff]Korthian Armament]#Equipment", -- Korthian Chestpiece
	[188153] = "989188. [00ccff]Korthian Armament]#Equipment", -- Korthian Cloak
	[188157] = "989188. [00ccff]Korthian Armament]#Equipment", -- Korthian Gloves
	[188158] = "989188. [00ccff]Korthian Armament]#Equipment", -- Korthian Helm
	[188159] = "989188. [00ccff]Korthian Armament]#Equipment", -- Korthian Legguards
	[188160] = "989188. [00ccff]Korthian Armament]#Equipment", -- Korthian Shoulders
	[188162] = "989188. [00ccff]Korthian Armament]#Equipment", -- Korthian Weaponry

	--! Legacy Equipment (99)
	-- -- Artifact (01)
	[158075] = "9901. [e6cc80]Artifact]#Equipment", -- Heart of Azeroth
	[128832] = "9901. [e6cc80]Artifact]#Equipment", -- Aldrachi Warblades
	[127857] = "9901. [e6cc80]Artifact]#Equipment", -- Aluneth
	[128403] = "9901. [e6cc80]Artifact]#Equipment", -- Apocalypse
	[120978] = "9901. [e6cc80]Artifact]#Equipment", -- Ashbringer
	[128292] = "9901. [e6cc80]Artifact]#Equipment", -- Blades of the Fallen Prince
	[128821] = "9901. [e6cc80]Artifact]#Equipment", -- Claws of Ursoc
	[136858] = "9901. [e6cc80]Artifact]#Equipment", -- Darkened T'uure
	[128819] = "9901. [e6cc80]Artifact]#Equipment", -- Doomhammer
	[128862] = "9901. [e6cc80]Artifact]#Equipment", -- Ebonchill
	[128860] = "9901. [e6cc80]Artifact]#Equipment", -- Fangs of Ashamane
	[128476] = "9901. [e6cc80]Artifact]#Equipment", -- Fangs of the Devourer
	[128820] = "9901. [e6cc80]Artifact]#Equipment", -- Felo'melorn
	[128940] = "9901. [e6cc80]Artifact]#Equipment", -- Fists of the Heavens
	[128938] = "9901. [e6cc80]Artifact]#Equipment", -- Fu Zan, the Wanderer's Companion
	[128306] = "9901. [e6cc80]Artifact]#Equipment", -- G'Hanir, the Mother Tree
	[128868] = "9901. [e6cc80]Artifact]#Equipment", -- Light's Wrath
	[128402] = "9901. [e6cc80]Artifact]#Equipment", -- Maw of the Damned
	[128289] = "9901. [e6cc80]Artifact]#Equipment", -- Scale of the Earth-Warder
	[128941] = "9901. [e6cc80]Artifact]#Equipment", -- Scepter of Sargeras
	[128858] = "9901. [e6cc80]Artifact]#Equipment", -- Scythe of Elune
	[128911] = "9901. [e6cc80]Artifact]#Equipment", -- Sharas'dal, Scepter of Tides
	[128937] = "9901. [e6cc80]Artifact]#Equipment", -- Sheilun, Staff of the Mists
	[128943] = "9901. [e6cc80]Artifact]#Equipment", -- Skull of the Man'ari
	[128910] = "9901. [e6cc80]Artifact]#Equipment", -- Strom'kar, the Warbreaker
	[128825] = "9901. [e6cc80]Artifact]#Equipment", -- T'uure, Beacon of the Naaru
	[128808] = "9901. [e6cc80]Artifact]#Equipment", -- Talonclaw
	[128826] = "9901. [e6cc80]Artifact]#Equipment", -- Thas'dorah, Legacy of the Windrunners
	[128872] = "9901. [e6cc80]Artifact]#Equipment", -- The Dreadblades
	[128935] = "9901. [e6cc80]Artifact]#Equipment", -- The Fist of Ra-den
	[128870] = "9901. [e6cc80]Artifact]#Equipment", -- The Kingslayers
	[128823] = "9901. [e6cc80]Artifact]#Equipment", -- The Silver Hand
	[128861] = "9901. [e6cc80]Artifact]#Equipment", -- Titanstrike
	[128866] = "9901. [e6cc80]Artifact]#Equipment", -- Truthguard
	[127829] = "9901. [e6cc80]Artifact]#Equipment", -- Twinblades of the Deceiver
	[128942] = "9901. [e6cc80]Artifact]#Equipment", -- Ulthalesh, the Deadwind Harvester
	[128908] = "9901. [e6cc80]Artifact]#Equipment", -- Warswords of the Valarjar
	[128827] = "9901. [e6cc80]Artifact]#Equipment", -- Xal'atath, Blade of the Black Empire
	-- -- Legendary (02)
	[173241] = "990201. [ff8000]Legendary]#Equipment", -- Grim-Veiled Robe
	[173242] = "990201. [ff8000]Legendary]#Equipment", -- Grim-Veiled Cape
	[173243] = "990201. [ff8000]Legendary]#Equipment", -- Grim-Veiled Sandals
	[173244] = "990201. [ff8000]Legendary]#Equipment", -- Grim-Veiled Mittens
	[173245] = "990201. [ff8000]Legendary]#Equipment", -- Grim-Veiled Hood
	[173246] = "990201. [ff8000]Legendary]#Equipment", -- Grim-Veiled Pants
	[173247] = "990201. [ff8000]Legendary]#Equipment", -- Grim-Veiled Spaulders
	[173248] = "990201. [ff8000]Legendary]#Equipment", -- Grim-Veiled Belt
	[173249] = "990201. [ff8000]Legendary]#Equipment", -- Grim-Veiled Bracers
	[172314] = "990201. [ff8000]Legendary]#Equipment", -- Umbrahide Vest
	[172315] = "990201. [ff8000]Legendary]#Equipment", -- Umbrahide Treads
	[172316] = "990201. [ff8000]Legendary]#Equipment", -- Umbrahide Gauntlets
	[172317] = "990201. [ff8000]Legendary]#Equipment", -- Umbrahide Helm
	[172318] = "990201. [ff8000]Legendary]#Equipment", -- Umbrahide Leggings
	[172319] = "990201. [ff8000]Legendary]#Equipment", -- Umbrahide Pauldrons
	[172320] = "990201. [ff8000]Legendary]#Equipment", -- Umbrahide Waistguard
	[172321] = "990201. [ff8000]Legendary]#Equipment", -- Umbrahide Armguards
	[172322] = "990201. [ff8000]Legendary]#Equipment", -- Boneshatter Vest
	[172323] = "990201. [ff8000]Legendary]#Equipment", -- Boneshatter Treads
	[172324] = "990201. [ff8000]Legendary]#Equipment", -- Boneshatter Gauntlets
	[172325] = "990201. [ff8000]Legendary]#Equipment", -- Boneshatter Helm
	[172326] = "990201. [ff8000]Legendary]#Equipment", -- Boneshatter Greaves
	[172327] = "990201. [ff8000]Legendary]#Equipment", -- Boneshatter Pauldrons
	[172328] = "990201. [ff8000]Legendary]#Equipment", -- Boneshatter Waistguard
	[172329] = "990201. [ff8000]Legendary]#Equipment", -- Boneshatter Armguards
	[171412] = "990201. [ff8000]Legendary]#Equipment", -- Shadowghast Breastplate
	[171413] = "990201. [ff8000]Legendary]#Equipment", -- Shadowghast Sabatons
	[171414] = "990201. [ff8000]Legendary]#Equipment", -- Shadowghast Gauntlets
	[171415] = "990201. [ff8000]Legendary]#Equipment", -- Shadowghast Helm
	[171416] = "990201. [ff8000]Legendary]#Equipment", -- Shadowghast Greaves
	[171417] = "990201. [ff8000]Legendary]#Equipment", -- Shadowghast Pauldrons
	[171418] = "990201. [ff8000]Legendary]#Equipment", -- Shadowghast Waistguard
	[171419] = "990201. [ff8000]Legendary]#Equipment", -- Shadowghast Armguards
	[178926] = "990201. [ff8000]Legendary]#Equipment", -- Shadowghast Ring
	[178927] = "990201. [ff8000]Legendary]#Equipment", -- Shadowghast Necklace
	[169223] = "990201. [ff8000]Legendary]#Equipment", -- Ashjra'kamas, Shroud of Resolve
	[124634] = "990201. [ff8000]Legendary]#Equipment|PALADIN,WARRIOR,DEATHKNIGHT", -- Thorasus, the Stone Heart of Draenor
	[124635] = "990201. [ff8000]Legendary]#Equipment|MAGE,PALADIN,DRUID,PRIEST,SHAMAN,WARLOCK,MONK", -- Nithramus, the All-Seer
	[124636] = "990201. [ff8000]Legendary]#Equipment|DRUID,HUNTER,ROGUE,SHAMAN,MONK,DEMONHUNTER", -- Maalus, the Blood Drinker
	[124637] = "990201. [ff8000]Legendary]#Equipment|PALADIN,WARRIOR,DRUID,DEATHKNIGHT,HUNTER,ROGUE,SHAMAN,MONK,DEMONHUNTER", -- Sanctus, Sigil of the Unbroken
	[124638] = "990201. [ff8000]Legendary]#Equipment|PALADIN,DRUID,PRIEST,SHAMAN,MONK", -- Etheralus, the Eternal Reward
	[102246] = "990201. [ff8000]Legendary]#Equipment|MAGE,DRUID,PRIEST,SHAMAN,WARLOCK", -- Xing-Ho, Breath of Yu'lon
	[102247] = "990201. [ff8000]Legendary]#Equipment|PALADIN,DRUID,PRIEST,SHAMAN,MONK", -- Jina-Kang, Kindness of Chi-Ji
	[102248] = "990201. [ff8000]Legendary]#Equipment|DRUID,HUNTER,ROGUE,SHAMAN,MONK", -- Fen-Yu, Fury of Xuen
	[102249] = "990201. [ff8000]Legendary]#Equipment|PALADIN,WARRIOR,DEATHKNIGHT", -- Gong-Lu, Strength of Xuen
	[102245] = "990201. [ff8000]Legendary]#Equipment|DRUID,MONK", -- Qian-Le, Courage of Niuzao
	[102250] = "990201. [ff8000]Legendary]#Equipment|PALADIN,WARRIOR,DEATHKNIGHT", -- Qian-Ying, Fortitude of Niuzao
	[77949]  = "990201. [ff8000]Legendary]#Equipment", -- Golad, Twilight of Aspects
	[77950]  = "990201. [ff8000]Legendary]#Equipment", -- Tiriosh, Nightmare of Ages
	[71086]  = "990201. [ff8000]Legendary]#Equipment", -- Dragonwrath, Tarecgosa's Rest
	[49623]  = "990201. [ff8000]Legendary]#Equipment", -- Shadowmourne
	[46017]  = "990201. [ff8000]Legendary]#Equipment", -- Val'anyr, Hammer of Ancient Kings
	[34334]  = "990201. [ff8000]Legendary]#Equipment", -- Thori'dal, the Stars' Fury
	[32837]  = "990201. [ff8000]Legendary]#Equipment", -- Warglaive of Azzinoth (Main Hand)
	[32838]  = "990201. [ff8000]Legendary]#Equipment", -- Warglaive of Azzinoth (Off Hand)
	[22632]  = "990201. [ff8000]Legendary]#Equipment", -- Atiesh, Greatstaff of the Guardian (Druid)
	[22589]  = "990201. [ff8000]Legendary]#Equipment", -- Atiesh, Greatstaff of the Guardian (Mage)
	[22631]  = "990201. [ff8000]Legendary]#Equipment", -- Atiesh, Greatstaff of the Guardian (Priest)
	[22630]  = "990201. [ff8000]Legendary]#Equipment", -- Atiesh, Greatstaff of the Guardian (Warlock)
	[19019]  = "990201. [ff8000]Legendary]#Equipment", -- Thunderfury, Blessed Blade of the Windseeker
	[17182]  = "990201. [ff8000]Legendary]#Equipment", -- Sulfuras, Hand of Ragnaros
	-- -- -- Fangs of the Father (9698)
	[77951] = "99029699. [ff8000]Fangs of the Father]#Equipment|ROGUE", -- Shadowy Gem
	[77945] = "99029699. [ff8000]Fangs of the Father]#Equipment|ROGUE", -- Fear
	[77946] = "99029699. [ff8000]Fangs of the Father]#Equipment|ROGUE", -- Vengeance
	[77954] = "99029699. [ff8000]Fangs of the Father]#Equipment|ROGUE", -- Vial of Black Dragonsblood
	[78339] = "99029699. [ff8000]Fangs of the Father]#Equipment|ROGUE", -- Vial of Preserved Dragonsblood
	[74749] = "99029699. [ff8000]Fangs of the Father]#Equipment|ROGUE", -- Charging Decoder Ring
	-- -- -- Dragonwrath, Tarecgosa's Rest (9699)
	[71141] = "99029699. [ff8000]Dragonwrath, Tarecgosa's Rest]#Equipment|PRIEST,SHAMAN,MAGE,WARLOCK,DRUID", -- Eternal Ember
	[69815] = "99029699. [ff8000]Dragonwrath, Tarecgosa's Rest]#Equipment|PRIEST,SHAMAN,MAGE,WARLOCK,DRUID", -- Seething Cinder
	[69646] = "99029699. [ff8000]Dragonwrath, Tarecgosa's Rest]#Equipment|PRIEST,SHAMAN,MAGE,WARLOCK,DRUID", -- Branch of Nordrassil
	[71085] = "99029699. [ff8000]Dragonwrath, Tarecgosa's Rest]#Equipment|PRIEST,SHAMAN,MAGE,WARLOCK,DRUID", -- Runestaff of Nordrassil
	-- -- -- Shadowmourne (9798)
	[50274] = "99029798. [ff8000]Shadowmourne]#Equipment|WARRIOR,PALADIN,DEATHKNIGHT", -- Shadowfrost Shard
	[49869] = "99029798. [ff8000]Shadowmourne]#Equipment|WARRIOR,PALADIN,DEATHKNIGHT", -- Light's Vengeance
	[50226] = "99029798. [ff8000]Shadowmourne]#Equipment|WARRIOR,PALADIN,DEATHKNIGHT", -- Festergut's Acidic Blood
	[50231] = "99029798. [ff8000]Shadowmourne]#Equipment|WARRIOR,PALADIN,DEATHKNIGHT", -- Rotface's Acidic Blood
	[49888] = "99029798. [ff8000]Shadowmourne]#Equipment|WARRIOR,PALADIN,DEATHKNIGHT", -- Shadow's Edge
	-- -- -- Val'anyr, Hammer of Ancient Kings (9799)
	[45038] = "99029799. [ff8000]Val'anyr, Hammer of Ancient Kings]#Equipment|DRUID,MONK,PALADIN,PRIEST,SHAMAN", -- Fragment of Val'anyr
	[45896] = "99029799. [ff8000]Val'anyr, Hammer of Ancient Kings]#Equipment|DRUID,MONK,PALADIN,PRIEST,SHAMAN", -- Unbound Fragments of Val'anyr
	[45039] = "99029799. [ff8000]Val'anyr, Hammer of Ancient Kings]#Equipment|DRUID,MONK,PALADIN,PRIEST,SHAMAN", -- Shattered Fragments of Val'anyr
	-- -- -- Thunderfury (9998)
	[18563] = "99029998. [ff8000]Thunderfury, Blessed Blade of the Windseeker]#Equipment", -- Bindings of the Windseeker (Left)
	[18564] = "99029998. [ff8000]Thunderfury, Blessed Blade of the Windseeker]#Equipment", -- Bindings of the Windseeker (Right)
	[17771] = "99029998. [ff8000]Thunderfury, Blessed Blade of the Windseeker]#Equipment", -- Enchanted Elementium Bar
	[19017] = "99029998. [ff8000]Thunderfury, Blessed Blade of the Windseeker]#Equipment", -- Essence of the Firelord
	-- -- -- Sulfuras, Hand of Ragnaros (9999)
	[17204] = "99029999. [ff8000]Sulfuras, Hand of Ragnaros]#Equipment", -- Eye of Sulfuras
	[17193] = "99029999. [ff8000]Sulfuras, Hand of Ragnaros]#Equipment", -- Sulfuron Hammer
	-- -- Legacy Equipment (99)
	[139905] = "9999. Legacy Equipment#Equipment", -- Gloves of the Arcane Purge
	[139934] = "9999. Legacy Equipment#Equipment", -- Handguards of Demonsbane
	[139965] = "9999. Legacy Equipment#Equipment", -- Grips of the Fel Destroyer
	[139997] = "9999. Legacy Equipment#Equipment", -- Gauntlets of Legion Devastation


	--[[ ! Gem ! ]]--

	-- Cypher (9198)
	[189728] = "9198. Cypher#Gem", -- Crystallized Enhancement: Obscurity
	[189730] = "9198. Cypher#Gem", -- Crystallized Enhancement: Critical Strike
	[189727] = "9198. Cypher#Gem", -- Crystallized Enhancement: Maintainability
	[189734] = "9198. Cypher#Gem", -- Crystallized Enhancement: Rigidity
	[189762] = "9198. Cypher#Gem", -- Crystallized Enhancement: Fault-Tolerance
	[189733] = "9198. Cypher#Gem", -- Crystallized Enhancement: Reliability
	[189760] = "9198. Cypher#Gem", -- Crystallized Enhancement: Robustness
	[189724] = "9198. Cypher#Gem", -- Crystallized Enhancement: Extraction
	[189725] = "9198. Cypher#Gem", -- Crystallized Enhancement: Flexibility
	[189729] = "9198. Cypher#Gem", -- Crystallized Enhancement: Osmosis
	[189732] = "9198. Cypher#Gem", -- Crystallized Enhancement: Redundancy
	[189761] = "9198. Cypher#Gem", -- Crystallized Enhancement: Toxicity
	[189560] = "9198. Cypher#Gem", -- Crystallized Enhancement: Deflection
	[189731] = "9198. Cypher#Gem", -- Crystallized Enhancement: Power
	[189763] = "9198. Cypher#Gem", -- Crystallized Enhancement: Efficiency
	[189722] = "9198. Cypher#Gem", -- Crystallized Enhancement: Alacrity
	[189726] = "9198. Cypher#Gem", -- Crystallized Enhancement: Focus
	[189764] = "9198. Cypher#Gem", -- Crystallized Enhancement: Reflection
	[189723] = "9198. Cypher#Gem", -- Crystallized Enhancement: Absorption
	[189735] = "9198. Cypher#Gem", -- Crystallized Enhancement: Velocity

	-- Shard of Domination (9199) -- 9199. Shard of Domination#Gem
	[187532] = "Junk#Junk", -- Soulfire Chisel
	[187293] = "Junk#Junk", -- Desolate Shard of Bek
	[187296] = "Junk#Junk", -- Desolate Shard of Cor
	[187299] = "Junk#Junk", -- Desolate Shard of Dyz
	[187294] = "Junk#Junk", -- Desolate Shard of Jas
	[187297] = "Junk#Junk", -- Desolate Shard of Kyr
	[187300] = "Junk#Junk", -- Desolate Shard of Oth
	[187295] = "Junk#Junk", -- Desolate Shard of Rev
	[187298] = "Junk#Junk", -- Desolate Shard of Tel
	[187301] = "Junk#Junk", -- Desolate Shard of Zed
	[187302] = "Junk#Junk", -- Foreboding Shard of Bek
	[187305] = "Junk#Junk", -- Foreboding Shard of Cor
	[187308] = "Junk#Junk", -- Foreboding Shard of Dyz
	[187303] = "Junk#Junk", -- Foreboding Shard of Jas
	[187306] = "Junk#Junk", -- Foreboding Shard of Kyr
	[187309] = "Junk#Junk", -- Foreboding Shard of Oth
	[187304] = "Junk#Junk", -- Foreboding Shard of Rev
	[187307] = "Junk#Junk", -- Foreboding Shard of Tel
	[187310] = "Junk#Junk", -- Foreboding Shard of Zed
	[187284] = "Junk#Junk", -- Ominous Shard of Bek
	[187287] = "Junk#Junk", -- Ominous Shard of Cor
	[187290] = "Junk#Junk", -- Ominous Shard of Dyz
	[187285] = "Junk#Junk", -- Ominous Shard of Jas
	[187288] = "Junk#Junk", -- Ominous Shard of Kyr
	[187291] = "Junk#Junk", -- Ominous Shard of Oth
	[187286] = "Junk#Junk", -- Ominous Shard of Rev
	[187289] = "Junk#Junk", -- Ominous Shard of Tel
	[187292] = "Junk#Junk", -- Ominous Shard of Zed
	[187312] = "Junk#Junk", -- Portentous Shard of Bek
	[187315] = "Junk#Junk", -- Portentous Shard of Cor
	[187318] = "Junk#Junk", -- Portentous Shard of Dyz
	[187313] = "Junk#Junk", -- Portentous Shard of Jas
	[187316] = "Junk#Junk", -- Portentous Shard of Kyr
	[187319] = "Junk#Junk", -- Portentous Shard of Oth
	[187314] = "Junk#Junk", -- Portentous Shard of Rev
	[187317] = "Junk#Junk", -- Portentous Shard of Tel
	[187320] = "Junk#Junk", -- Portentous Shard of Zed
	[187057] = "Junk#Junk", -- Shard of Bek
	[187063] = "Junk#Junk", -- Shard of Cor
	[187073] = "Junk#Junk", -- Shard of Dyz
	[187059] = "Junk#Junk", -- Shard of Jas
	[187065] = "Junk#Junk", -- Shard of Kyr
	[187076] = "Junk#Junk", -- Shard of Oth
	[187061] = "Junk#Junk", -- Shard of Rev
	[187071] = "Junk#Junk", -- Shard of Tel
	[187079] = "Junk#Junk", -- Shard of Zed

	-- Punchcard (92)
	[167672] = "92. Punchcard#Gem", -- Cyclotronic Blast
	[168912] = "92. Punchcard#Gem", -- Subroutine: Optimization
	[168800] = "92. Punchcard#Gem", -- Subroutine: Recalibration
	[168798] = "92. Punchcard#Gem", -- Trajectory Analysis
	[167677] = "92. Punchcard#Gem", -- Harmonic Dematerializer
	[168756] = "92. Punchcard#Gem", -- Hijack Synaptic Circuits
	[168909] = "92. Punchcard#Gem", -- Subroutine: Emergency Repairs
	[168785] = "92. Punchcard#Gem", -- Subroutine: Defragmentation
	[168913] = "92. Punchcard#Gem", -- Regenerative Capacitors
	[168751] = "92. Punchcard#Gem", -- Omnipurpose Effective Logic Board
	[168749] = "92. Punchcard#Gem", -- Performant Effective Logic Board
	[168750] = "92. Punchcard#Gem", -- Omnipurpose Refined Logic Board
	[168745] = "92. Punchcard#Gem", -- Optimized Effective Logic Board
	[168748] = "92. Punchcard#Gem", -- Performant Refined Logic Board
	[168744] = "92. Punchcard#Gem", -- Optimized Efficient Logic Board
	[170510] = "92. Punchcard#Gem", -- Forceful Logic Board
	[170508] = "92. Punchcard#Gem", -- Optimized Logic Board
	[168742] = "92. Punchcard#Gem", -- Forceful Adaptable Logic Board
	[168743] = "92. Punchcard#Gem", -- Forceful Efficient Logic Board
	[168746] = "92. Punchcard#Gem", -- Optimized Adaptable Logic Board
	[168747] = "92. Punchcard#Gem", -- Performant Adaptable Logic Board
	[168741] = "92. Punchcard#Gem", -- Forceful Refined Logic Board
	[170509] = "92. Punchcard#Gem", -- Performant Logic Board
	[170507] = "92. Punchcard#Gem", -- Omnipurpose Logic Board
	[168648] = "92. Punchcard#Gem", -- Emergency Anti-Gravity Device
	[168435] = "92. Punchcard#Gem", -- Remote Circuit Bypasser
	[168631] = "92. Punchcard#Gem", -- Metal Detector
	[168671] = "92. Punchcard#Gem", -- Electromagnetic Resistors
	[167693] = "92. Punchcard#Gem", -- Neural Autonomy
	[168633] = "92. Punchcard#Gem", -- Supplemental Oxygenation Device
	[168657] = "92. Punchcard#Gem", -- Friend-or-Foe Identifier
	[168632] = "92. Punchcard#Gem", -- Slipstream Generator

	-- Arcane Relic (9301)
	[133030] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- 'Procured' Kirin Tor Wand Tip
	[132984] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Abandoned Highborne Mana Crystal
	[140813] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Arcana Crux
	[142056] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Arcanum of the Order
	[142175] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Arcanum of Weightlessness
	[142176] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Arcing Static Charge
	[151006] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Augari Manuscript
	[147076] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Charred Hymnal of the Moon
	[133093] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Crawliac Charming Draught
	[150997] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Crystallized Aether
	[139269] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Crystallized Drop of Eternity
	[152690] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Darkfall Arcanum
	[143692] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Earthshaper's Mantra
	[132305] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Elothir's Sympathy
	[133070] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Empowered Lifespring Crystal
	[132282] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Enchanted Pool Garnet
	[138227] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Entrancing Stone
	[133104] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Errant Mana
	[132810] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Erratic Stormforce
	[133007] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Everlasting Construct Core
	[151495] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Exhaustive Research
	[140423] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Exhaustive Research
	[143806] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Exhaustive Research
	[152024] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Fallen Magi's Seerstone
	[132995] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Faronaar Arcane Power-Core
	[140810] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Farsight Spiritjewel
	[131731] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Glinting Shard of Sciallax
	[140077] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Goldleaf Arcwine Phial
	[152027] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Gravitational Condensate
	[133768] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Harbaron's Tether
	[147077] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Inexorable Truth Serum
	[133052] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Instructor's Crystal Head
	[133019] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Jewel of Nar'thalas
	[141515] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Leystone Nugget
	[132281] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Lunarwing Crystal
	[132316] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Mana-Fused Seedling
	[141272] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Mana-Saber Eye
	[133081] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Manathirster Focus
	[140827] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Manatoxin Gland
	[141266] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Manawracked Charm
	[152344] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Meto's Orb of Entropy
	[155846] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Miniaturized Cosmic Beacon
	[147078] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Mote of Astral Suffusion
	[132845] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Odyn's Veil
	[151293] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Orb of the Abandoned Magi
	[137473] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Phase Spider Mandible
	[152026] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Prototype Titan-Disc
	[137547] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Pulsing Prism
	[146930] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Pure Arcane Powder
	[133041] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Radiating Ley Crystal
	[142514] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Ravens' Sight
	[143797] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Reactive Intuition
	[140412] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Reactive Intuition
	[153446] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Reactive Intuition
	[151494] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Reactive Intuition
	[141259] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Seawitch's Foci
	[137490] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Self-Forging Credentials
	[144463] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Shard of Kaldorei Stained Glass
	[132346] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Small Highborne Figurine
	[140812] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Soggy Manascrubber Brush
	[137420] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Split Second
	[133115] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Stonedark Focus
	[142305] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Suffused Manapearl
	[151496] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Taboo Knowledge
	[143807] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Taboo Knowledge
	[143523] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Talisman of the Violet Eye
	[137379] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Tempestbinder's Crystal
	[143699] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Temporal Blossoming
	[132799] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Thrymjaris' Grace
	[152025] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Thu'rayan Lash
	[140047] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Tincture of Arcwine
	[147079] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Torn Fabric of Reality
	[137303] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Touch of Nightfall
	[132335] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Tower Magi's Eye
	[132825] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Val'kyra Boon
	[132787] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Vault Guardian Core
	[133137] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Wisps of Illusion
	[132776] = "9301. Arcane Relic#Gem|50&DEMONHUNTER,50&DRUID,50&HUNTER,50&MAGE,50&PALDIN", -- Yotnar's Pride

	-- Blood Relic (9302)
	[133008] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Azurewing Blood
	[141264] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Bitestone Fury
	[133020] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Blood of the Snake
	[147080] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Blood of the Unworthy
	[151296] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Blood of the Vanquished
	[132985] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Blood of the Vanquished Highborne
	[139260] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Bloodied Bear Fang
	[137363] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Bloodied Spearhead
	[133116] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Bloodsinger Essence
	[143691] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Bloody Kvaldir Pennant
	[143524] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Bones of the Restless
	[150998] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Cragscaler Heart
	[155847] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Cruor of the Avenger
	[132811] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Crystallized Tideskorn Cruelty
	[132996] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Cursed Felstalker Flesh
	[132826] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Cursed Kvaldir Blood
	[141280] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Demonic Shackles
	[152691] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Doomcaller Heart
	[132800] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Drekirjar Lifeblood
	[137471] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Drop of True Blood
	[141523] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Fel-Scented Bait
	[140044] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Felbat Heart
	[141283] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Felbat Razorfang
	[132846] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Felbound Plasma
	[133687] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Fenryr's Bloodstained Fang
	[137465] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Festerface's Rotted Gut
	[137412] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Fistful of Eyes
	[140818] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Foreign Contaminant
	[133082] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Gelmogg's Petrified Heart
	[139257] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Gore-Drenched Fetish
	[144466] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Gore-Flecked Feaster Fang
	[147754] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Gory Dreadlord Horn
	[142180] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Grisly Schism
	[143798] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Grisly Souvenir
	[151497] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Grisly Souvenir
	[153449] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Grisly Souvenir
	[140413] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Grisly Souvenir
	[133094] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Heart of the Witchqueen
	[142057] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Heartbeat of the Order
	[146933] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Highborne Martyr's Blood
	[133042] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Ley-Infused Blood
	[147082] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Man'ari Blood Pact
	[136718] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Mark of Varo'then
	[142179] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Memory of Betrayal
	[137302] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Misshapen Abomination Heart
	[137350] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Monstrous Gluttony
	[152092] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Nathrezim Incisor
	[132777] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Offering of Spilled Blood
	[140820] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Phial of Fel Blood
	[142510] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Phylactery of Unwilling Servitude
	[132284] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Preserved Blood-Stained Claw
	[137544] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Prisoner's Wail
	[147081] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Pungent Chum
	[133031] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Rare White Tiger Heart
	[133053] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Resilient Skrog Blood
	[133071] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Rivermanes' Sacrifice
	[132317] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Sap of the Worldtree
	[152030] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Scourge of Perverse Desire
	[152029] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Shivarran Cachabon
	[139254] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Shrieking Bloodstone
	[140074] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Sin'dorei Blood Gems
	[133105] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Skyhorn Survivalist's Blood
	[143684] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Slavemaster's Malevolence
	[152028] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Spurting Reaver Heart
	[152295] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Svirax's Grim Trophy
	[151189] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Tears of the Maiden
	[132347] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- The Interrogator's Vial
	[132336] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- The Jailer's Cat Tail
	[140425] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Thirsty Bloodstone
	[143808] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Thirsty Bloodstone
	[153450] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Thirsty Bloodstone
	[151498] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Thirsty Bloodstone
	[144509] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Thrill of Battle
	[143809] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Thrill of Battle
	[140426] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Thrill of Battle
	[151499] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Thrill of Battle
	[133138] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Time-Lost Dragon Heart
	[132283] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Uncorrupted Val Blood
	[140819] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Vampiric Fetish
	[132306] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Varethos' Fortitude
	[143682] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Viscous Terror
	[132788] = "9302. Blood Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&HUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Yotnar's Turmoil

	-- Fel Relic (9303)
	[140428] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Alliance of Convenience
	[151502] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Alliance of Convenience
	[153454] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Alliance of Convenience
	[132337] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Araxxas's Badge
	[139267] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Azsharan Councillor's Clasp
	[151289] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Badge of the Fallen Vindicator
	[147086] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Befouled Effigy of Elune
	[141277] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Bloodtotem Brand
	[137476] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Brand of Tyranny
	[147755] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Brutallus's Wretched Heart
	[155848] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Condensed Blight Orb
	[133009] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Corrupted Ley-Crystal
	[133095] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Crawliac Death Scream
	[152692] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Devastator Anchor Crystal
	[152031] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Doomfire Dynamo
	[146926] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Fel Command Beacon
	[142058] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Fel Ward of the Order
	[139253] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Fel-Bloated Venom Sac
	[133032] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Fel-Fire Demon Claw
	[151500] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Fel-Loaded Dice
	[140414] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Fel-Loaded Dice
	[153452] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Fel-Loaded Dice
	[133043] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Fel-Touched Mana Gems
	[140076] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Felborne Energist's Gem
	[140825] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Felfire Pitch
	[132286] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Felshroom
	[143687] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Felskorn Mania
	[140826] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Felstained Jawbone Fragments
	[137491] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Felsworn Covenant
	[133139] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Feltotem Sigil
	[133106] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Fleshrender Roc Essence
	[132827] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Gaze of Helya
	[132348] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Gul'dan's Commission
	[141520] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Imp-Eye Diamond
	[147084] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Imploding Infernal Star
	[140086] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Intact Infernal Palm
	[144459] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Knot of Fel
	[141281] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Legion Portalstone
	[137542] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Metamorphosis Spark
	[136721] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Mo'arg Eyepatch
	[141255] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Mockery of Life
	[147085] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Mutated Nautilus
	[143525] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Necrotic Dominion
	[137351] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Noxious Entrails
	[152034] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Obliterator Propellant
	[143810] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Performance Enhancing Curio
	[151501] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Performance Enhancing Curio
	[153453] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Performance Enhancing Curio
	[143696] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Perilous Bargain
	[133764] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Ragnarok Ember
	[147087] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Ruinous Ashes
	[137407] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Sealed Fel Fissure
	[142181] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Seeping Corruption
	[132778] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Skovald's Betrayal
	[152033] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Sliver of Corruption
	[132285] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Small Nightmare Totem
	[142513] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Token of the Lightning Keeper
	[133117] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Torok's Heart
	[152032] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Twisted Engineer's Fel-Infuser
	[132789] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Twisted Tideskorn Rune
	[132847] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Valgrinn's Heart
	[151008] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Vilefiend Fang
	[152345] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Vilemus' Bile
	[142182] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Viz'aduum's Mindstone
	[150999] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Wakener's Demonic Focus
	[140824] = "9303. Fel Relic#Gem|50&DEMONHUNTER,50&ROGUE,50&WARLOCK", -- Writ of Subjugation

	-- Fire Relic (9304)
	[143701] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Ancient Flamewaking
	[151009] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Annihilan Heart
	[133055] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Azshara's Ire
	[133010] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Azure Flame
	[143800] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Blaze of Glory
	[140415] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Blaze of Glory
	[151503] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Blaze of Glory
	[153455] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Blaze of Glory
	[152035] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Blazing Dreadsteed Horseshoe
	[137375] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Blazing Hydra Flame Sac
	[141522] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Calamir's Jaw
	[142184] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Candle of Flickering Lumens
	[132319] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Charred Imp Claw
	[133107] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Cinderwitch Flame-Song
	[147091] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Cleansing Ignition Catalyst
	[151000] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Construct Forge Cinder
	[147756] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Crashing Ember
	[151290] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Darktide Fervor
	[133118] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Demonkindre Fangs
	[133084] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Drogbar Kindling
	[133022] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Eternal Mage Flame
	[132987] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Everburning Ruin Ember
	[132338] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Everflame Arrowhead
	[140837] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Exothermic Core
	[152294] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Fel Mistress' Brand
	[147089] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Ferocity of the Devout
	[141261] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Fires of Heaven
	[132287] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Firewater Essence
	[143812] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Flame of the Fallen
	[151504] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Flame of the Fallen
	[140429] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Flame of the Fallen
	[153456] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Flame of the Fallen
	[142059] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Flame of the Order
	[132848] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Flame of Valhallas
	[137492] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Flamewreath Spark
	[155849] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Flickering Ember of Rage
	[139266] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Fragment of Eternal Spite
	[144460] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Fury of the Scorned
	[141265] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Gift of Flame
	[134077] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Glowing Shard of Sciallax
	[137358] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Hate-Sculpted Magma
	[132828] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Helhound Core
	[152036] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Hellfire Ignition Switch
	[132802] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Hrydshal Forgeflame
	[146927] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Inferno Oil
	[132349] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Inquisitor's Fire-Brand Tip
	[133073] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Jale's Fury
	[140073] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Khadgar's Pocket Warmer
	[142183] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Lava-Quenched Hoofplate
	[142307] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Miniature Bonfire
	[137546] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Molten Giant's Eye
	[132779] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Pillaged Honor
	[141279] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Prison Guard's Torchflame
	[152038] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Pyretic Bronze Clasp
	[136769] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Ravencrest's Wrath
	[137470] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Rocket Chicken Rocket Fuel
	[132790] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Rumblehoof's Flameheart
	[133096] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Scorched Skyhorn Shawl
	[143526] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Searing Cinder
	[132308] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Shaladrassil's Anger
	[142516] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Sizzling Fang
	[139256] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Sloshing Core of Hatred
	[133129] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Smoldering Crux
	[147088] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Smoldering Thumbscrews
	[133033] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Sorcerer's Ember
	[140043] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Soul Forge Ember
	[140834] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Soul of Flame
	[147090] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Stabilized Extinction Protocol
	[133044] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Stellagosa's Rage
	[133686] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Stormforged Inferno
	[140836] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Sunflare Coal
	[132998] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- The Sufferer's Fury
	[132813] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Thrymjaris' Fury
	[151505] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Torch of Competition
	[143813] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Torch of Competition
	[153457] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Torch of Competition
	[137316] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Torch of Shaladrassil
	[152037] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Tormentor's Brand
	[132288] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Trickster's Everburning Flames
	[140835] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Unkindled Ember
	[152693] = "9304. Fire Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&PALADIN,50&SHAMAN,50&WARLOCK,50&WARRIOR", -- Volatile Devastator Round

	-- Frost Relic (9305)
	[142308] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Ageless Winter
	[132791] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Archived Record of Will
	[133056] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Azshara's Tempest
	[133119] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Bloodtotems' Fear
	[142515] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Chilled Incisor
	[137308] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Clotted Sap of the Grove
	[151508] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Cold Sweat
	[153460] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Cold Sweat
	[140040] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Comet Dust
	[151506] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Conscience of the Victorious
	[143801] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Conscience of the Victorious
	[153458] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Conscience of the Victorious
	[137272] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Cruelty of Dantalionax
	[137340] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Crystalline Energies
	[134076] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Crystallized Shard of Sciallax
	[139259] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Cube of Malice
	[132339] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Death's Chill Mirror Shard
	[132350] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Defiant Frozen Fist
	[133023] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Depths Shard Ice Crystal
	[132849] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Dravak's Jailing Shard
	[132814] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Drekirjar Jarl's Disdain
	[141517] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Drugon's Snowglobe
	[140080] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Everchill Pearl
	[142185] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Fear of Predation
	[152694] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Felbound Drudge's Sorrow
	[137545] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Flashfrozen Ember
	[133141] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Flawless Kun-Lai Blossom
	[152346] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Frigid Earring
	[152040] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Frigid Gloomstone
	[133108] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Frosted Great Eagle Egg
	[137466] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Frostwyrm Heart
	[141274] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Frozen Ley Scar
	[132290] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Frozen Moss of the Den
	[151291] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Frozen Void Shard
	[147093] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Globe of Frothing Eddies
	[147757] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Globule of Submersion
	[132780] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Grasp of the God-King
	[133097] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Haglands Ice Shard
	[140832] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Heart of Frost
	[137370] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Heart of the Sea
	[146928] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Heat Absorbing Prism
	[152042] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Hoarfrost-Beast Talon
	[147092] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Ice-Threaded Conch
	[142060] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Icy Core of the Order
	[133011] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Leyhollow Frost
	[142186] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Mrrmgmrl Grmmlmglrg
	[151010] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Narouan Fin
	[151001] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Phial of Kaarinos Frost
	[132999] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Preserved Highborne Warrior's Fist
	[137403] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Quarantine Catalyst
	[137380] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Rage of the Tides
	[155850] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Rime of the Spirit Realm
	[132309] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Rimed Worldtree Blossom
	[141257] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Roar of the Ocean
	[143527] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Scale of Arcanagos
	[133683] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Seacursed Mist
	[133045] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Senegos' Breath
	[132829] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Sliver of Helfrost
	[133074] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Snow of the Earthmother
	[143703] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Snowmane Totem
	[147095] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Sphere of Entropy
	[143700] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Stoic Hibernation
	[152041] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Sublimating Portal Frost
	[140833] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Sundered Comet
	[143814] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Superiority's Contempt
	[153459] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Superiority's Contempt
	[140431] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Superiority's Contempt
	[151507] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Superiority's Contempt
	[140831] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Suspended Nightwell Droplet
	[132988] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- The Dreadlord's Chill Eye
	[132803] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Thorim's Peak Snowcap
	[144461] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Thrashbite's Spite
	[139250] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Unwaking Slumber
	[132289] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Vale Shadow Frost
	[132320] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Varethos' Frozen Heart
	[147094] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Virus of Lethargy
	[152039] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Viscous Reaver-Coolant
	[133034] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Were-Yeti Paw
	[133085] = "9305. Frost Relic#Gem|50&DEATHKNIGHT,50&DRUID,50&MAGE,50&MONK,50&SHAMAN", -- Whitewater Lake Ice

	-- Holy Relic (9306)
	[136717] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Absolved Ravencrest Brooch
	[143695] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Ambition of the Forlorn
	[140042] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Ancient Sacred Candle
	[150996] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Archaic Meditation Crystal
	[140844] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Archaic Nathrezim Keepsake
	[132786] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Archived Record of Valor
	[147758] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Beguiling Revelation
	[132334] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Blessed Cup of the Moon
	[133006] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Blessed Llothien Stone
	[132775] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Blessing of the Watchers
	[147097] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Blessing of the White Lady
	[147099] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Boon of the Prophet
	[143816] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Brilliant Sunstone
	[140433] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Brilliant Sunstone
	[151510] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Brilliant Sunstone
	[153462] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Brilliant Sunstone
	[151297] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Carved Argunite Idol
	[143796] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Clarity of Conviction
	[151509] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Clarity of Conviction
	[153461] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Clarity of Conviction
	[132279] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Cleansed Shrine Relic
	[137402] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Cleansing Isotope
	[152046] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Coven Prayer Bead
	[152695] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Crest of the Grand Army
	[137495] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Crux of Blind Faith
	[133029] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Dathrohan's Signet
	[151005] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Dram of Light
	[132345] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Elune Graced Signet
	[137548] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Elune's Light
	[132844] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Embrace of the Valkyra
	[136771] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Eyir's Blessing
	[142519] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Favor of the Prime Designate
	[140843] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Flickering Timespark
	[147098] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Fragment of Grace
	[137366] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Gift of the Ocean Empress
	[143528] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Glimpse of the Afterlife
	[140845] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Glistening Meteorite Shard
	[133136] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Glory of Highmountain
	[143686] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Hatecoil Badge of Glory
	[140072] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Headpiece of the Elunian Cycle
	[132824] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Helheim Waylight
	[133092] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Honor of the Skyhorn
	[141271] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Hope of the Forest
	[147096] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Inquisition's Master Key
	[133103] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Lasan's Hope
	[142055] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Light of the Order
	[152043] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Lightshield Amplifier
	[132280] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Lost Priestess' Loop
	[137474] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Loyalty to the Matriarch
	[137346] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Murmuring Idol
	[152347] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Occularus' Unblemished Lens
	[133685] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Odyn's Boon
	[141519] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Pillaged Titan Disc
	[139252] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Preserved Worldseed
	[140434] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Radiance of Dawn
	[153463] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Radiance of Dawn
	[143817] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Radiance of Dawn
	[151511] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Radiance of Dawn
	[139265] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Radiant Dragon Egg
	[139258] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Radiating Metallic Shard
	[155851] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Reorigination Spark
	[141260] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Shieldmaiden's Prayer
	[152044] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Spark of Everburning Light
	[142188] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Spellbound Rose Petal
	[133040] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Teardrop of Elune
	[146934] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Untouched Holy Candle
	[133114] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Valor of the Stonedark
	[152045] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Venerated Puresoul Idol
	[144467] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Vial of Eternal Moon
	[142187] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Virtuous Directive
	[141276] = "9306. Holy Relic#Gem|50&PALADIN,50&PRIEST", -- Vision of An'she

	-- Iron Relic (9307)
	[134081] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Adamant Shard of Sciallax
	[132781] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Archived Record of Might
	[151002] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Argussian Wrought Blade
	[151512] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Battle-Tempered Hilt
	[140417] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Battle-Tempered Hilt
	[153464] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Battle-Tempered Hilt
	[137472] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Betrug's Vigor
	[147100] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Calcified Barnacle
	[147759] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Charged Felfire Casing
	[147101] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Chiseled Starlight
	[143705] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Conquered Summit
	[133075] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Crageater Heart
	[132830] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Cursebinder Chains
	[152048] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Decimator Crankshaft
	[133057] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Etched Talisman of Nar'thalas
	[152293] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Fasces of the Endless Legions
	[140045] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Fel-Cleansed Leystone Key
	[152049] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Fel-Engraved Handbell
	[144462] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Fel-Tempered Link
	[140816] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Fingernail of the Fel Brute
	[133046] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Fortified Ancient Dragonscale
	[133120] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Frag's Core
	[137326] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Fragmented Meteorite Whetstone
	[133086] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Gelmogg's Fractured Skull
	[140815] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Infused Chitin Fragment
	[142061] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Iron Will of the Order
	[152047] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Ironvine Thorn
	[142177] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Jagged Emerald
	[133763] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Key to the Halls
	[133109] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Lasan's Determination
	[132989] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Legion Iron Nugget
	[140817] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Lionshead Lapel Clasp
	[152696] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Manacle of Dominance
	[146929] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Moonstone Figurine
	[155855] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Mote of the Forgemaster
	[133035] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Myzrael Shard
	[133024] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Oracle's Sharpening Stone
	[137359] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Pebble of Ages
	[140075] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Petrified Ancient Bark
	[132295] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Petrified Ancient Bark
	[132321] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Petrified Ancient Branch
	[147102] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Reactive Pylon Casing
	[142306] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Rift Stabilization Shard
	[133098] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Rockcrawler Jaw
	[132340] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Rook Fired Ore
	[142178] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Ruffian's Poisoned Blade
	[141262] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Rune-Etched Quill
	[151292] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Sanctified Eredar Lock
	[139255] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Scything Quill
	[141521] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Sea Giant Toothpick Fragment
	[133012] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Senegos' Resolve
	[132804] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Sigil of Hrydshal
	[136778] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Skovald's Resolve
	[137543] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Soulsap Shackles
	[152292] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Spike of Immortal Command
	[133000] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Stalwart Faronaar Keystone
	[143529] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Star of Hollow Spite
	[140436] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Steadfast Conviction
	[143819] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Steadfast Conviction
	[151514] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Steadfast Conviction
	[153466] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Steadfast Conviction
	[132294] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Stone of the Dream Den
	[133142] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Stonedark Brul Brand
	[141263] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Stonedark Idol
	[132815] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Storm-Charged Lodestone
	[132850] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Stormforged Horn
	[143685] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Strength of the Nazjatar
	[151011] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Stygian Munition Casing
	[141268] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Swordsinger's Counterweight
	[132351] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- The Forgemaster's Hammer Head
	[137469] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Thorium-Plated Egg
	[132792] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Tideskorn War Brand
	[139261] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Tuft of Ironfur
	[137371] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Tumultuous Aftershock
	[132310] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Uncorrupted Soil
	[143818] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Unflinching Grit
	[151513] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Unflinching Grit
	[140435] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Unflinching Grit
	[153465] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Unflinching Grit
	[142511] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Unforged Titansteel
	[137408] = "9307. Iron Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&HUNTER,50&MONK,50&PALADIN,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Xakal's Determination

	-- Life Relic (9308)
	[151515] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- "Borrowed" Soul Essence
	[143803] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- "Borrowed" Soul Essence
	[140418] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- "Borrowed" Soul Essence
	[141516] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- "Liberated" Un'goro Relic
	[144458] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Agronox's Unsullied Heartwood
	[147760] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Apocron's Energy Core
	[134079] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Ardent Shard of Sciallax
	[138228] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Bioluminescent Mushroom
	[139263] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Blessing of Cenarius
	[132311] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Blossom of Promise
	[136973] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Burden of Vigilance
	[140838] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Construct Personality Sphere
	[137307] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Corrupted Knot
	[140078] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Crystalized Leypetal
	[133047] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Crystallized Whelp Egg
	[133099] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Darkfeather Seedling
	[143698] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Effervescent Leyblossom
	[152051] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Eidolon of Life
	[133025] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Enchanted El'dranil Frond
	[152053] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Essence of the Burgeoning Brood
	[143702] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Eternity of Wisdom
	[132297] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Everblooming Flower
	[140088] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Everblooming Sunflower
	[142309] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Fauna Analysis Widget
	[132990] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Fel-Resistant Clipping
	[141275] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Fertile Soil
	[152291] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Fraternal Fervor
	[147106] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Glowing Prayer Candle
	[133110] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Hex-Cleansed Charm
	[132816] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Hrydshal Weald
	[147104] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Icon of Perverse Animation
	[133121] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Instincts of the Elderhorn
	[133058] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Life-Giving Pearl
	[132322] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Lifelink to Elothir
	[133076] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Lifespring Mushroom
	[142190] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Love's Intermission
	[152697] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Mark of Defiant Survival
	[151012] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Marsuul Egg
	[146925] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Mature Morrowsprout
	[147105] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Moontalon's Feather
	[152050] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Mysterious Petrified Egg
	[137411] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Nal'tira's Venom Gland
	[132341] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Nourishmoss
	[137381] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Pact of Vengeful Service
	[140839] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Parasitic Spore
	[142189] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Perfectly Preserved Apple
	[151517] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Petrified Ancient's Thumb
	[140438] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Petrified Ancient's Thumb
	[143821] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Petrified Ancient's Thumb
	[153469] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Petrified Ancient's Thumb
	[151003] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Petrified Seedling
	[141256] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Promise of Rebirth
	[142062] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Prosperity of the Order
	[137339] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Quivering Blightshard Husk
	[133036] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Ravenous Seed
	[137478] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Reflection of Sorrow
	[133013] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Reinvigorating Crystal
	[137327] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Relinquishing Grip of Helheim
	[132352] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Revitalizing Incense
	[143530] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Ritual of Animation
	[155854] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Root of the Lifebinder
	[139249] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Shaladrassil's Blossom
	[136720] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Snapped Emerald Pendant
	[133001] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Soul Fragment of a Faronaar Innocent
	[133143] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Spark of Khaz'goroth
	[132793] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Spark of Will
	[152052] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Sporemound Seedling
	[132851] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Sprig of Valhallas
	[132805] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Stormborn Courage
	[142517] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Swell of the Tides
	[143820] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Tombweed Bloom
	[140437] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Tombweed Bloom
	[151516] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Tombweed Bloom
	[153468] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Tombweed Bloom
	[141269] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Tranquil Clipping
	[132296] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Val'sharah Seed Pods
	[147107] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Valorous Spark of Hope
	[151288] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Void-Resistant Seedpod
	[143689] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Weight of Tradition
	[133087] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Whitewater Carp Eggs
	[132831] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Worthy Soul
	[132782] = "9308. Life Relic#Gem|50&DRUID,50&HUNTER,50&MONK,50&PALADIN,50&PRIEST,50&SHAMAN", -- Yotnar's Gratitude

	-- Shadow Relic (9309)
	[142512] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Accursed Cuspid
	[142310] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Anthology of Horrors
	[143694] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Aristocratic Menace
	[132806] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Azariah's Last Moments
	[133122] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Betrayal of the Bloodtotem
	[140419] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Blindside Approach
	[153470] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Blindside Approach
	[143804] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Blindside Approach
	[151518] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Blindside Approach
	[132832] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Bones of Geir
	[147108] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Brand of Relentless Agony
	[140822] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Breath of Dusk
	[152290] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Censer of Dark Intent
	[133002] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Coalesced Shadows
	[151294] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Coalesced Void
	[133059] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Corrupted Farondis House Insignia
	[152056] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Corrupting Dewclaw
	[133100] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Crawliac Hexrune
	[133088] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Creel's Sorrow
	[152057] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Crepuscular Skitterer Egg
	[136719] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Curdled Soul Essence
	[133026] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Cursed Dissection Blade
	[134078] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Dark Shard of Sciallax
	[143693] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Darkened Brulstone
	[153472] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Dead Man's Tale
	[151520] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Dead Man's Tale
	[140441] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Dead Man's Tale
	[143823] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Dead Man's Tale
	[141518] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Decaying Dragonfang
	[139251] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Despoiled Dragonscale
	[142191] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Dirge of the Hunted
	[142063] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Dusk of the Order
	[132783] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Echo of Aggramar
	[151013] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Ethereal Anchor
	[137463] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Fealty of Nerub
	[140071] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- First Page of the Book of Shadows
	[137347] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Fragment of Loathing
	[142192] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Ghastly Curse
	[147110] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Grimacing Highborne Skull
	[153421] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Grinning Vilefiend Skull
	[147109] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Harjatan's Leering Eye
	[132852] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Horn of Helheim
	[137399] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Ivanyr's Hunger
	[152055] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Kin'garoth's Oil-Sump
	[133144] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Memory of Neltharion
	[144464] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Mephistroth's Nail
	[146931] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Mephistroth's Rib
	[132991] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Mortiferous' Corruption
	[141254] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Mote of Fear
	[141282] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Netherwhisper Arcanum
	[132298] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Nightmare Cave Moss
	[138226] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Nightmare Engulfed Jewel
	[143531] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Nightmares of the Dead
	[139268] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Nightmarish Elm Branch
	[132353] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Patch of Risen Saber Pelt
	[143822] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Polished Shadowstone
	[151519] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Polished Shadowstone
	[140440] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Polished Shadowstone
	[153471] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Polished Shadowstone
	[140821] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Precipice of Eternity
	[132794] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Runetwister Talisman
	[132299] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Satyr's Nightmare Fetish
	[147111] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Scornful Reflection
	[133684] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Screams of the Unworthy
	[133014] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Senegos' Despair
	[137377] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Serpentrix's Guile
	[137549] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Shade of the Vault
	[132817] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Shade of Thorim's Peak
	[140041] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Shadow Dew
	[143690] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Specter of Helheim
	[137464] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Tendril of Darkness
	[132312] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Twisted Nightmare Totem
	[152054] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Unwavering Soul Essence
	[132323] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Varethos' Last Breath
	[133111] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Vengeful Skyhorn Spirit
	[133077] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Vestiges of Gelmogg
	[132342] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Vial of Dormant Shadowswarm
	[151004] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Voidbent Isolon Effigy
	[155852] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Volatile Soul Fragment
	[140823] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Warchief's Shattered Tusk
	[133048] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Wretched Draining Essence
	[137317] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Xavius' Mad Whispers
	[133037] = "9309. Shadow Relic#Gem|50&DEATHKNIGHT,50&DEMONHUNTER,50&PRIEST,50&ROGUE,50&WARLOCK,50&WARRIOR", -- Zandalari Voodoo Totem

	-- Storm Relic (9310)
	[137421] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Accelerating Torrent
	[133016] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Azurewing Guile
	[141514] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Barnacled Mistcaller Orb
	[151521] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Battering Tempest
	[153473] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Battering Tempest
	[143805] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Battering Tempest
	[142193] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Begrudging Confessions
	[137468] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Bonecrushing Hail
	[133039] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Breath of Al'Akir
	[132796] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Breath of the Vault
	[132808] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Breath of Vethir
	[140840] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Chittering Mandible
	[140842] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Collapsing Epoch
	[155853] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Conch of the Thunderer
	[137365] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Condensed Saltsea Globule
	[146932] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Condensed Storm's Fury
	[151295] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Darkstorm Arrowhead
	[132314] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Desiccated Breeze
	[152061] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Droplets of the Cleansing Storm
	[143532] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Echoing Madness
	[137493] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Edge of the First Blade
	[136974] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Empowerment of Thunder
	[132303] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Enchanted Stoneblood Feather
	[144465] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Essence of the Legion Tempest
	[132854] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Fel-Tainted Haze
	[147112] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Felsoul Vortex
	[147113] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Flawless Hurricane Pearl
	[151014] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Fulminating Arcstone
	[142518] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Fury of the Sea
	[133028] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Gale of Azshara
	[133050] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Gale of the Blues
	[142064] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Gale Wind of the Order
	[141278] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Glaivemaster's Whetstone
	[142194] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Gloomy Vortex
	[132344] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Guile of the Hold's Sky Terrors
	[143704] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Harpybane Fetish
	[133061] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Heron's Grace
	[137270] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Howling Echoes
	[133124] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Ironbull's Last Words
	[133079] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Jale's Relief
	[133102] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Julan's Suppressing Wind
	[137550] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Moonglaive Dervish
	[132993] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Nethrandamus' Zephyr
	[152060] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Neuroshock Electrode
	[132325] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Nightmare Zephyr
	[133682] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Northern Gale
	[147114] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Preserved Starlight Incense
	[141270] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Restless Dreams
	[139262] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Reverberating Femur
	[140443] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Roar of the Crowd
	[143825] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Roar of the Crowd
	[151523] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Roar of the Crowd
	[153475] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Roar of the Crowd
	[137313] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Roiling Fog
	[132302] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Rustling of the Forest
	[147761] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Sandblasted Conch
	[152715] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Scarwing Talon
	[151015] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Skyfin Tail Barb
	[133113] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Skyhorn Eagle Feather
	[152348] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Sotanathor's Thundering Hoof
	[152058] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Stormcaller's Fury
	[140079] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Stormforged Fist
	[137008] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Stormfury Diamond
	[143688] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Stormwing's Roar
	[133004] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Swirling Demonic Whispers
	[140841] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Tempest of the Heavens
	[133146] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- The Four Winds
	[132819] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Thorignir Slipstream
	[151522] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Thundering Impact
	[153474] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Thundering Impact
	[140069] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Trueflight Arrow
	[147115] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Unfurling Origination
	[139264] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Uplifting Emerald
	[132834] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Wailing Winds
	[143697] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Warpblade Flux
	[141258] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Whirlpool Seed
	[132785] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Whispers of the Thorignir
	[152059] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Whistling Ulna
	[133090] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Whitewater Breeze
	[132355] = "9310. Storm Relic#Gem|50&HUNTER,50&MONK,50&ROGUE,50&SHAMAN,50&WARRIOR", -- Wind-Whipped Hold Banner Strip

	-- Sha-Touched Gem (95)
	[89873] = "95. Sha-Touched Gem#Gem", -- Crystallized Dread
	[89882] = "95. Sha-Touched Gem#Gem", -- Crystallized Horror
	[89881] = "95. Sha-Touched Gem#Gem", -- Crystallized Terror

	-- Cogwheel (97)
	[77542] = "97. Cogwheel#Gem", -- Quick Tinker's Gear
	[77546] = "97. Cogwheel#Gem", -- Sparkling Tinker's Gear
	[77543] = "97. Cogwheel#Gem", -- Precise Tinker's Gear
	[77541] = "97. Cogwheel#Gem", -- Smooth Tinker's Gear
	[77544] = "97. Cogwheel#Gem", -- Flashing Tinker's Gear
	[77547] = "97. Cogwheel#Gem", -- Fractured Tinker's Gear
	[77545] = "97. Cogwheel#Gem", -- Rigid Tinker's Gear
	[77540] = "97. Cogwheel#Gem", -- Subtle Tinker's Gear
	[59479] = "97. Cogwheel#Gem", -- Quick Cogwheel
	[59489] = "97. Cogwheel#Gem", -- Precise Cogwheel
	[59496] = "97. Cogwheel#Gem", -- Sparkling Cogwheel
	[59480] = "97. Cogwheel#Gem", -- Fractured Cogwheel
	[59478] = "97. Cogwheel#Gem", -- Smooth Cogwheel
	[59493] = "97. Cogwheel#Gem", -- Rigid Cogwheel
	[59477] = "97. Cogwheel#Gem", -- Subtle Cogwheel
	[59491] = "97. Cogwheel#Gem", -- Flashing Cogwheel
	[68660] = "97. Cogwheel#Gem", -- Mystic Cogwheel

	-- Meta Gem (98)
	[95346] = "98. Meta Gem#Gem", -- Capacitive Primal Diamond
	[95347] = "98. Meta Gem#Gem", -- Sinister Primal Diamond
	[95345] = "98. Meta Gem#Gem", -- Courageous Primal Diamond
	[95344] = "98. Meta Gem#Gem", -- Indomitable Primal Diamond
	[76884] = "98. Meta Gem#Gem", -- Agile Primal Diamond
	[76885] = "98. Meta Gem#Gem", -- Burning Primal Diamond
	[76886] = "98. Meta Gem#Gem", -- Reverberating Primal Diamond
	[76887] = "98. Meta Gem#Gem", -- Fleet Primal Diamond
	[76879] = "98. Meta Gem#Gem", -- Ember Primal Diamond
	[76895] = "98. Meta Gem#Gem", -- Austere Primal Diamond
	[95348] = "98. Meta Gem#Gem", -- Tyrannical Primal Diamond
	[76897] = "98. Meta Gem#Gem", -- Effulgent Primal Diamond
	[76891] = "98. Meta Gem#Gem", -- Powerful Primal Diamond
	[76894] = "98. Meta Gem#Gem", -- Forlorn Primal Diamond
	[76890] = "98. Meta Gem#Gem", -- Destructive Primal Diamond
	[76893] = "98. Meta Gem#Gem", -- Impassive Primal Diamond
	[76888] = "98. Meta Gem#Gem", -- Revitalizing Primal Diamond
	[76896] = "98. Meta Gem#Gem", -- Eternal Primal Diamond
	[76892] = "98. Meta Gem#Gem", -- Enigmatic Primal Diamond
	[68778] = "98. Meta Gem#Gem", -- Agile Shadowspirit Diamond
	[68780] = "98. Meta Gem#Gem", -- Burning Shadowspirit Diamond
	[68779] = "98. Meta Gem#Gem", -- Reverberating Shadowspirit Diamond
	[52296] = "98. Meta Gem#Gem", -- Ember Shadowspirit Diamond
	[52291] = "98. Meta Gem#Gem", -- Chaotic Shadowspirit Diamond
	[52294] = "98. Meta Gem#Gem", -- Austere Shadowspirit Diamond
	[52297] = "98. Meta Gem#Gem", -- Revitalizing Shadowspirit Diamond
	[52295] = "98. Meta Gem#Gem", -- Effulgent Shadowspirit Diamond
	[52299] = "98. Meta Gem#Gem", -- Powerful Shadowspirit Diamond
	[52301] = "98. Meta Gem#Gem", -- Impassive Shadowspirit Diamond
	[52292] = "98. Meta Gem#Gem", -- Bracing Shadowspirit Diamond
	[52293] = "98. Meta Gem#Gem", -- Eternal Shadowspirit Diamond
	[52289] = "98. Meta Gem#Gem", -- Fleet Shadowspirit Diamond
	[52298] = "98. Meta Gem#Gem", -- Destructive Shadowspirit Diamond
	[52300] = "98. Meta Gem#Gem", -- Enigmatic Shadowspirit Diamond
	[52302] = "98. Meta Gem#Gem", -- Forlorn Shadowspirit Diamond
	[41400] = "98. Meta Gem#Gem", -- Thundering Skyflare Diamond
	[41285] = "98. Meta Gem#Gem", -- Chaotic Skyflare Diamond
	[41401] = "98. Meta Gem#Gem", -- Insightful Earthsiege Diamond
	[41398] = "98. Meta Gem#Gem", -- Relentless Earthsiege Diamond
	[41380] = "98. Meta Gem#Gem", -- Austere Earthsiege Diamond
	[41385] = "98. Meta Gem#Gem", -- Invigorating Earthsiege Diamond
	[44088] = "98. Meta Gem#Gem", -- Powerful Earthshatter Diamond
	[41375] = "98. Meta Gem#Gem", -- Tireless Skyflare Diamond
	[41376] = "98. Meta Gem#Gem", -- Revitalizing Skyflare Diamond
	[41377] = "98. Meta Gem#Gem", -- Shielded Skyflare Diamond
	[44082] = "98. Meta Gem#Gem", -- Impassive Starflare Diamond
	[41339] = "98. Meta Gem#Gem", -- Swift Skyflare Diamond
	[41395] = "98. Meta Gem#Gem", -- Bracing Earthsiege Diamond
	[41389] = "98. Meta Gem#Gem", -- Beaming Earthsiege Diamond
	[44087] = "98. Meta Gem#Gem", -- Persistent Earthshatter Diamond
	[41382] = "98. Meta Gem#Gem", -- Trenchant Earthsiege Diamond
	[41396] = "98. Meta Gem#Gem", -- Eternal Earthsiege Diamond
	[44078] = "98. Meta Gem#Gem", -- Tireless Starflare Diamond
	[44081] = "98. Meta Gem#Gem", -- Enigmatic Starflare Diamond
	[44084] = "98. Meta Gem#Gem", -- Forlorn Starflare Diamond
	[41381] = "98. Meta Gem#Gem", -- Persistent Earthsiege Diamond
	[44089] = "98. Meta Gem#Gem", -- Trenchant Earthshatter Diamond
	[41335] = "98. Meta Gem#Gem", -- Enigmatic Skyflare Diamond
	[41379] = "98. Meta Gem#Gem", -- Impassive Skyflare Diamond
	[41397] = "98. Meta Gem#Gem", -- Powerful Earthsiege Diamond
	[41333] = "98. Meta Gem#Gem", -- Ember Skyflare Diamond
	[44076] = "98. Meta Gem#Gem", -- Swift Starflare Diamond
	[41378] = "98. Meta Gem#Gem", -- Forlorn Skyflare Diamond
	[41307] = "98. Meta Gem#Gem", -- Destructive Skyflare Diamond
	[32640] = "98. Meta Gem#Gem", -- Tense Unstable Diamond
	[25893] = "98. Meta Gem#Gem", -- Mystical Skyfire Diamond
	[28557] = "98. Meta Gem#Gem", -- Quickened Starfire Diamond
	[34220] = "98. Meta Gem#Gem", -- Chaotic Skyfire Diamond
	[25898] = "98. Meta Gem#Gem", -- Tenacious Earthstorm Diamond
	[25899] = "98. Meta Gem#Gem", -- Brutal Earthstorm Diamond
	[32409] = "98. Meta Gem#Gem", -- Relentless Earthstorm Diamond
	[25901] = "98. Meta Gem#Gem", -- Insightful Earthstorm Diamond
	[25896] = "98. Meta Gem#Gem", -- Powerful Earthstorm Diamond
	[25894] = "98. Meta Gem#Gem", -- Swift Skyfire Diamond
	[25897] = "98. Meta Gem#Gem", -- Bracing Earthstorm Diamond
	[32410] = "98. Meta Gem#Gem", -- Thundering Skyfire Diamond
	[32641] = "98. Meta Gem#Gem", -- Imbued Unstable Diamond
	[35501] = "98. Meta Gem#Gem", -- Eternal Earthstorm Diamond
	[28556] = "98. Meta Gem#Gem", -- Swift Windfire Diamond
	[35503] = "98. Meta Gem#Gem", -- Ember Skyfire Diamond
	[25895] = "98. Meta Gem#Gem", -- Enigmatic Skyfire Diamond
	[25890] = "98. Meta Gem#Gem", -- Destructive Skyfire Diamond

	-- Gem (99) socket-prismatic-closed
	[173128] = "99. Gem#Gem", -- Quick Jewel Cluster
	[173127] = "99. Gem#Gem", -- Deadly Jewel Cluster
	[173129] = "99. Gem#Gem", -- Versatile Jewel Cluster
	[173130] = "99. Gem#Gem", -- Masterful Jewel Cluster
	[173126] = "99. Gem#Gem", -- Straddling Jewel Doublet
	[173122] = "99. Gem#Gem", -- Quick Jewel Doublet
	[173125] = "99. Gem#Gem", -- Revitalizing Jewel Doublet
	[173124] = "99. Gem#Gem", -- Masterful Jewel Doublet
	[173121] = "99. Gem#Gem", -- Deadly Jewel Doublet
	[173123] = "99. Gem#Gem", -- Versatile Jewel Doublet
	[169220] = "99. Gem#Gem", -- Straddling Sage Agate
	[168638] = "99. Gem#Gem", -- Leviathan's Eye of Intellect
	[168636] = "99. Gem#Gem", -- Leviathan's Eye of Strength
	[168637] = "99. Gem#Gem", -- Leviathan's Eye of Agility
	[153709] = "99. Gem#Gem", -- Kraken's Eye of Intellect
	[168639] = "99. Gem#Gem", -- Deadly Lava Lazuli
	[153708] = "99. Gem#Gem", -- Kraken's Eye of Agility
	[168641] = "99. Gem#Gem", -- Quick Sand Spinel
	[168642] = "99. Gem#Gem", -- Versatile Dark Opal
	[154127] = "99. Gem#Gem", -- Quick Owlseye
	[154126] = "99. Gem#Gem", -- Deadly Amberblaze
	[153707] = "99. Gem#Gem", -- Kraken's Eye of Strength
	[154128] = "99. Gem#Gem", -- Versatile Royal Quartz
	[168640] = "99. Gem#Gem", -- Masterful Sea Currant
	[154129] = "99. Gem#Gem", -- Masterful Tidal Amethyst
	[153715] = "99. Gem#Gem", -- Straddling Viridium
	[153710] = "99. Gem#Gem", -- Deadly Solstone
	[153712] = "99. Gem#Gem", -- Versatile Kyanite
	[153714] = "99. Gem#Gem", -- Natant Rubellite
	[153711] = "99. Gem#Gem", -- Quick Golden Beryl
	[153713] = "99. Gem#Gem", -- Masterful Kubiline
	[130248] = "99. Gem#Gem", -- Saber's Eye of Intellect
	[130246] = "99. Gem#Gem", -- Saber's Eye of Strength
	[130247] = "99. Gem#Gem", -- Saber's Eye of Agility
	[151583] = "99. Gem#Gem", -- Quick Lightsphene
	[151584] = "99. Gem#Gem", -- Masterful Argulite
	[130219] = "99. Gem#Gem", -- Deadly Eye of Prophecy
	[130222] = "99. Gem#Gem", -- Masterful Shadowruby
	[130221] = "99. Gem#Gem", -- Versatile Maelstrom Sapphire
	[130220] = "99. Gem#Gem", -- Quick Dawnlight
	[151585] = "99. Gem#Gem", -- Versatile Labradorite
	[151580] = "99. Gem#Gem", -- Deadly Deep Chemirine
	[127761] = "99. Gem#Gem", -- Immaculate Haste Taladite
	[127763] = "99. Gem#Gem", -- Immaculate Haste Taladene
	[127760] = "99. Gem#Gem", -- Immaculate Critical Strike Taladite
	[130216] = "99. Gem#Gem", -- Quick Azsunite
	[115803] = "99. Gem#Gem", -- Critical Strike Taladite
	[115811] = "99. Gem#Gem", -- Greater Haste Taladite
	[115808] = "99. Gem#Gem", -- Stamina Taladite
	[115809] = "99. Gem#Gem", -- Greater Critical Strike Taladite
	[115804] = "99. Gem#Gem", -- Haste Taladite
	[115806] = "99. Gem#Gem", -- Haste Taladene
	[115813] = "99. Gem#Gem", -- Greater Haste Taladene
	[115815] = "99. Gem#Gem", -- Greater Stamina Taladite
	[127414] = "99. Gem#Gem", -- Eye of Rukhmar
	[115814] = "99. Gem#Gem", -- Greater Versatility Taladite
	[127762] = "99. Gem#Gem", -- Immaculate Mastery Taladite
	[130217] = "99. Gem#Gem", -- Versatile Skystone
	[115807] = "99. Gem#Gem", -- Versatility Taladite
	[115812] = "99. Gem#Gem", -- Greater Mastery Taladite
	[127765] = "99. Gem#Gem", -- Immaculate Stamina Taladite
	[130215] = "99. Gem#Gem", -- Deadly Deep Amber
	[115805] = "99. Gem#Gem", -- Mastery Taladite
	[127415] = "99. Gem#Gem", -- Eye of Anzu
	[127416] = "99. Gem#Gem", -- Eye of Sethe
	[127764] = "99. Gem#Gem", -- Immaculate Versatility Taladite
	[130218] = "99. Gem#Gem", -- Masterful Queen's Opal
	[49110] = "99. Gem#Gem", -- Nightmare Tear
	[42702] = "99. Gem#Gem", -- Enchanted Tear
	[34142] = "99. Gem#Gem", -- Infinite Sphere
	[22459] = "99. Gem#Gem", -- Void Sphere
	[22460] = "99. Gem#Gem", -- Prismatic Sphere
	[42701] = "99. Gem#Gem", -- Enchanted Pearl
	-- Red
	[76694] = "99. Gem#Gem", -- Brilliant Primordial Ruby
	[76692] = "99. Gem#Gem", -- Delicate Primordial Ruby
	[83151] = "99. Gem#Gem", -- Delicate Serpent's Eye
	[76696] = "99. Gem#Gem", -- Bold Primordial Ruby
	[83147] = "99. Gem#Gem", -- Precise Serpent's Eye
	[76695] = "99. Gem#Gem", -- Flashing Primordial Ruby
	[76693] = "99. Gem#Gem", -- Precise Primordial Ruby
	[83150] = "99. Gem#Gem", -- Brilliant Serpent's Eye
	[83141] = "99. Gem#Gem", -- Bold Serpent's Eye
	[83152] = "99. Gem#Gem", -- Flashing Serpent's Eye
	[76630] = "99. Gem#Gem", -- Perfect Bold Pandarian Garnet
	[76626] = "99. Gem#Gem", -- Perfect Delicate Pandarian Garnet
	[76629] = "99. Gem#Gem", -- Perfect Flashing Pandarian Garnet
	[76628] = "99. Gem#Gem", -- Perfect Brilliant Pandarian Garnet
	[76627] = "99. Gem#Gem", -- Perfect Precise Pandarian Garnet
	[76564] = "99. Gem#Gem", -- Bold Pandarian Garnet
	[76562] = "99. Gem#Gem", -- Brilliant Pandarian Garnet
	[76561] = "99. Gem#Gem", -- Precise Pandarian Garnet
	[76563] = "99. Gem#Gem", -- Flashing Pandarian Garnet
	[76560] = "99. Gem#Gem", -- Delicate Pandarian Garnet
	[71881] = "99. Gem#Gem", -- Brilliant Queen's Garnet
	[71883] = "99. Gem#Gem", -- Bold Queen's Garnet
	[71879] = "99. Gem#Gem", -- Delicate Queen's Garnet
	[52207] = "99. Gem#Gem", -- Brilliant Inferno Ruby
	[52212] = "99. Gem#Gem", -- Delicate Inferno Ruby
	[52206] = "99. Gem#Gem", -- Bold Inferno Ruby
	[52255] = "99. Gem#Gem", -- Bold Chimera's Eye
	[52257] = "99. Gem#Gem", -- Brilliant Chimera's Eye
	[71880] = "99. Gem#Gem", -- Precise Queen's Garnet
	[71882] = "99. Gem#Gem", -- Flashing Queen's Garnet
	[52230] = "99. Gem#Gem", -- Precise Inferno Ruby
	[52259] = "99. Gem#Gem", -- Flashing Chimera's Eye
	[52258] = "99. Gem#Gem", -- Delicate Chimera's Eye
	[52216] = "99. Gem#Gem", -- Flashing Inferno Ruby
	[52260] = "99. Gem#Gem", -- Precise Chimera's Eye
	[52174] = "99. Gem#Gem", -- Perfect Flashing Carnelian
	[52175] = "99. Gem#Gem", -- Perfect Delicate Carnelian
	[52173] = "99. Gem#Gem", -- Perfect Brilliant Carnelian
	[52172] = "99. Gem#Gem", -- Perfect Precise Carnelian
	[52176] = "99. Gem#Gem", -- Perfect Bold Carnelian
	[40111] = "99. Gem#Gem", -- Bold Cardinal Ruby
	[40112] = "99. Gem#Gem", -- Delicate Cardinal Ruby
	[40113] = "99. Gem#Gem", -- Brilliant Cardinal Ruby
	[42142] = "99. Gem#Gem", -- Bold Dragon's Eye
	[45883] = "99. Gem#Gem", -- Brilliant Stormjewel
	[42144] = "99. Gem#Gem", -- Brilliant Dragon's Eye
	[52082] = "99. Gem#Gem", -- Delicate Carnelian
	[40118] = "99. Gem#Gem", -- Precise Cardinal Ruby
	[39998] = "99. Gem#Gem", -- Brilliant Scarlet Ruby
	[42152] = "99. Gem#Gem", -- Flashing Dragon's Eye
	[45862] = "99. Gem#Gem", -- Bold Stormjewel
	[45882] = "99. Gem#Gem", -- Brilliant Stormjewel
	[39996] = "99. Gem#Gem", -- Bold Scarlet Ruby
	[39997] = "99. Gem#Gem", -- Delicate Scarlet Ruby
	[45879] = "99. Gem#Gem", -- Delicate Stormjewel
	[52084] = "99. Gem#Gem", -- Brilliant Carnelian
	[42143] = "99. Gem#Gem", -- Delicate Dragon's Eye
	[40003] = "99. Gem#Gem", -- Precise Scarlet Ruby
	[40001] = "99. Gem#Gem", -- Flashing Scarlet Ruby
	[40116] = "99. Gem#Gem", -- Flashing Cardinal Ruby
	[42154] = "99. Gem#Gem", -- Precise Dragon's Eye
	[52081] = "99. Gem#Gem", -- Bold Carnelian
	[52085] = "99. Gem#Gem", -- Precise Carnelian
	[52083] = "99. Gem#Gem", -- Flashing Carnelian
	[32193] = "99. Gem#Gem", -- Bold Crimson Spinel
	[32196] = "99. Gem#Gem", -- Brilliant Crimson Spinel
	[32194] = "99. Gem#Gem", -- Delicate Crimson Spinel
	[24030] = "99. Gem#Gem", -- Brilliant Living Ruby
	[33133] = "99. Gem#Gem", -- Don Julio's Heart
	[39905] = "99. Gem#Gem", -- Delicate Bloodstone
	[33134] = "99. Gem#Gem", -- Kailee's Rose
	[35487] = "99. Gem#Gem", -- Delicate Crimson Spinel
	[35488] = "99. Gem#Gem", -- Brilliant Crimson Spinel
	[24036] = "99. Gem#Gem", -- Flashing Living Ruby
	[32199] = "99. Gem#Gem", -- Flashing Crimson Spinel
	[33131] = "99. Gem#Gem", -- Crimson Sun
	[39900] = "99. Gem#Gem", -- Bold Bloodstone
	[24027] = "99. Gem#Gem", -- Bold Living Ruby
	[24028] = "99. Gem#Gem", -- Delicate Living Ruby
	[39912] = "99. Gem#Gem", -- Brilliant Bloodstone
	[41435] = "99. Gem#Gem", -- Perfect Flashing Bloodstone
	[41444] = "99. Gem#Gem", -- Perfect Brilliant Bloodstone
	[39910] = "99. Gem#Gem", -- Precise Bloodstone
	[41434] = "99. Gem#Gem", -- Perfect Delicate Bloodstone
	[39908] = "99. Gem#Gem", -- Flashing Bloodstone
	[41432] = "99. Gem#Gem", -- Perfect Bold Bloodstone
	[41437] = "99. Gem#Gem", -- Perfect Precise Bloodstone
	[28362] = "99. Gem#Gem", -- Delicate Ornate Ruby
	[28118] = "99. Gem#Gem", -- Brilliant Ornate Ruby
	[23095] = "99. Gem#Gem", -- Bold Blood Garnet
	[23094] = "99. Gem#Gem", -- Brilliant Blood Garnet
	[28595] = "99. Gem#Gem", -- Delicate Blood Garnet
	[30598] = "99. Gem#Gem", -- Don Amancio's Heart
	[23096] = "99. Gem#Gem", -- Brilliant Blood Garnet
	[23097] = "99. Gem#Gem", -- Delicate Blood Garnet
	[28361] = "99. Gem#Gem", -- Delicate Blood Garnet
	[38545] = "99. Gem#Gem", -- Delicate Ornate Ruby
	[23113] = "99. Gem#Gem", -- Brilliant Blood Garnet
	[27812] = "99. Gem#Gem", -- Brilliant Blood Garnet
	[28360] = "99. Gem#Gem", -- Delicate Blood Garnet
	[27777] = "99. Gem#Gem", -- Brilliant Blood Garnet
	[30571] = "99. Gem#Gem", -- Don Rodrigo's Heart
	[28459] = "99. Gem#Gem", -- Delicate Tourmaline
	[28461] = "99. Gem#Gem", -- Brilliant Tourmaline
	[28458] = "99. Gem#Gem", -- Bold Tourmaline
	-- Blue
	[76639] = "99. Gem#Gem", -- Solid River's Heart
	[76636] = "99. Gem#Gem", -- Rigid River's Heart
	[76638] = "99. Gem#Gem", -- Sparkling River's Heart
	[83148] = "99. Gem#Gem", -- Solid Serpent's Eye
	[83149] = "99. Gem#Gem", -- Sparkling Serpent's Eye
	[83144] = "99. Gem#Gem", -- Rigid Serpent's Eye
	[76637] = "99. Gem#Gem", -- Stormy River's Heart
	[76570] = "99. Gem#Gem", -- Perfect Rigid Lapis Lazuli
	[76572] = "99. Gem#Gem", -- Perfect Sparkling Lapis Lazuli
	[76573] = "99. Gem#Gem", -- Perfect Solid Lapis Lazuli
	[76571] = "99. Gem#Gem", -- Perfect Stormy Lapis Lazuli
	[76505] = "99. Gem#Gem", -- Sparkling Lapis Lazuli
	[76506] = "99. Gem#Gem", -- Solid Lapis Lazuli
	[76504] = "99. Gem#Gem", -- Stormy Lapis Lazuli
	[76502] = "99. Gem#Gem", -- Rigid Lapis Lazuli
	[52244] = "99. Gem#Gem", -- Sparkling Ocean Sapphire
	[52246] = "99. Gem#Gem", -- Stormy Ocean Sapphire
	[71820] = "99. Gem#Gem", -- Solid Deepholm Iolite
	[52235] = "99. Gem#Gem", -- Rigid Ocean Sapphire
	[52242] = "99. Gem#Gem", -- Solid Ocean Sapphire
	[52261] = "99. Gem#Gem", -- Solid Chimera's Eye
	[77140] = "99. Gem#Gem", -- Stormy Deepholm Iolite
	[52262] = "99. Gem#Gem", -- Sparkling Chimera's Eye
	[52263] = "99. Gem#Gem", -- Stormy Chimera's Eye
	[52264] = "99. Gem#Gem", -- Rigid Chimera's Eye
	[71817] = "99. Gem#Gem", -- Rigid Deepholm Iolite
	[71818] = "99. Gem#Gem", -- Stormy Deepholm Iolite
	[71819] = "99. Gem#Gem", -- Sparkling Deepholm Iolite
	[52168] = "99. Gem#Gem", -- Perfect Rigid Zephyrite
	[52169] = "99. Gem#Gem", -- Perfect Stormy Zephyrite
	[52170] = "99. Gem#Gem", -- Perfect Sparkling Zephyrite
	[52171] = "99. Gem#Gem", -- Perfect Solid Zephyrite
	[40119] = "99. Gem#Gem", -- Solid Majestic Zircon
	[40122] = "99. Gem#Gem", -- Stormy Majestic Zircon
	[36767] = "99. Gem#Gem", -- Solid Dragon's Eye
	[52086] = "99. Gem#Gem", -- Solid Zephyrite
	[40014] = "99. Gem#Gem", -- Rigid Sky Sapphire
	[40125] = "99. Gem#Gem", -- Rigid Majestic Zircon
	[40008] = "99. Gem#Gem", -- Solid Sky Sapphire
	[42155] = "99. Gem#Gem", -- Stormy Dragon's Eye
	[52089] = "99. Gem#Gem", -- Rigid Zephyrite
	[40011] = "99. Gem#Gem", -- Stormy Sky Sapphire
	[42156] = "99. Gem#Gem", -- Rigid Dragon's Eye
	[40120] = "99. Gem#Gem", -- Sparkling Majestic Zircon
	[45880] = "99. Gem#Gem", -- Solid Stormjewel
	[45881] = "99. Gem#Gem", -- Sparkling Stormjewel
	[45987] = "99. Gem#Gem", -- Rigid Stormjewel
	[52087] = "99. Gem#Gem", -- Sparkling Zephyrite
	[42145] = "99. Gem#Gem", -- Sparkling Dragon's Eye
	[40010] = "99. Gem#Gem", -- Sparkling Sky Sapphire
	[52088] = "99. Gem#Gem", -- Stormy Zephyrite
	[32200] = "99. Gem#Gem", -- Solid Empyrean Sapphire
	[39919] = "99. Gem#Gem", -- Solid Chalcedony
	[41441] = "99. Gem#Gem", -- Perfect Solid Chalcedony
	[34256] = "99. Gem#Gem", -- Charmed Amani Jewel
	[34831] = "99. Gem#Gem", -- Eye of the Sea
	[32201] = "99. Gem#Gem", -- Sparkling Empyrean Sapphire
	[32203] = "99. Gem#Gem", -- Stormy Empyrean Sapphire
	[24039] = "99. Gem#Gem", -- Stormy Star of Elune
	[24035] = "99. Gem#Gem", -- Sparkling Star of Elune
	[39927] = "99. Gem#Gem", -- Sparkling Chalcedony
	[24033] = "99. Gem#Gem", -- Solid Star of Elune
	[24051] = "99. Gem#Gem", -- Rigid Star of Elune
	[32206] = "99. Gem#Gem", -- Rigid Empyrean Sapphire
	[33135] = "99. Gem#Gem", -- Falling Star
	[39915] = "99. Gem#Gem", -- Rigid Chalcedony
	[39932] = "99. Gem#Gem", -- Stormy Chalcedony
	[41440] = "99. Gem#Gem", -- Perfect Sparkling Chalcedony
	[41443] = "99. Gem#Gem", -- Perfect Stormy Chalcedony
	[41447] = "99. Gem#Gem", -- Perfect Rigid Chalcedony
	[23116] = "99. Gem#Gem", -- Rigid Azure Moonstone
	[23118] = "99. Gem#Gem", -- Solid Azure Moonstone
	[23119] = "99. Gem#Gem", -- Sparkling Azure Moonstone
	[23120] = "99. Gem#Gem", -- Stormy Azure Moonstone
	[23121] = "99. Gem#Gem", -- Sparkling Azure Moonstone
	[28468] = "99. Gem#Gem", -- Rigid Zircon
	[28463] = "99. Gem#Gem", -- Solid Zircon
	[28464] = "99. Gem#Gem", -- Sparkling Zircon
	-- Yellow
	[76700] = "99. Gem#Gem", -- Fractured Sun's Radiance
	[76701] = "99. Gem#Gem", -- Mystic Sun's Radiance
	[76699] = "99. Gem#Gem", -- Quick Sun's Radiance
	[76697] = "99. Gem#Gem", -- Smooth Sun's Radiance
	[83143] = "99. Gem#Gem", -- Fractured Serpent's Eye
	[83146] = "99. Gem#Gem", -- Smooth Serpent's Eye
	[76698] = "99. Gem#Gem", -- Subtle Sun's Radiance
	[83142] = "99. Gem#Gem", -- Quick Serpent's Eye
	[83145] = "99. Gem#Gem", -- Subtle Serpent's Eye
	[76632] = "99. Gem#Gem", -- Perfect Subtle Sunstone
	[76633] = "99. Gem#Gem", -- Perfect Quick Sunstone
	[76631] = "99. Gem#Gem", -- Perfect Smooth Sunstone
	[76634] = "99. Gem#Gem", -- Perfect Fractured Sunstone
	[76635] = "99. Gem#Gem", -- Perfect Mystic Sunstone
	[76569] = "99. Gem#Gem", -- Mystic Sunstone
	[76566] = "99. Gem#Gem", -- Subtle Sunstone
	[76567] = "99. Gem#Gem", -- Quick Sunstone
	[76568] = "99. Gem#Gem", -- Fractured Sunstone
	[76565] = "99. Gem#Gem", -- Smooth Sunstone
	[71877] = "99. Gem#Gem", -- Fractured Lightstone
	[52219] = "99. Gem#Gem", -- Fractured Amberjewel
	[52241] = "99. Gem#Gem", -- Smooth Amberjewel
	[71878] = "99. Gem#Gem", -- Mystic Lightstone
	[71874] = "99. Gem#Gem", -- Smooth Lightstone
	[52226] = "99. Gem#Gem", -- Mystic Amberjewel
	[71875] = "99. Gem#Gem", -- Subtle Lightstone
	[52232] = "99. Gem#Gem", -- Quick Amberjewel
	[52269] = "99. Gem#Gem", -- Fractured Chimera's Eye
	[52266] = "99. Gem#Gem", -- Smooth Chimera's Eye
	[52267] = "99. Gem#Gem", -- Mystic Chimera's Eye
	[71876] = "99. Gem#Gem", -- Quick Lightstone
	[52268] = "99. Gem#Gem", -- Quick Chimera's Eye
	[77134] = "99. Gem#Gem", -- Mystic Lightstone
	[52247] = "99. Gem#Gem", -- Subtle Amberjewel
	[52265] = "99. Gem#Gem", -- Subtle Chimera's Eye
	[52164] = "99. Gem#Gem", -- Perfect Quick Alicite
	[52166] = "99. Gem#Gem", -- Perfect Smooth Alicite
	[52165] = "99. Gem#Gem", -- Perfect Mystic Alicite
	[52167] = "99. Gem#Gem", -- Perfect Subtle Alicite
	[52163] = "99. Gem#Gem", -- Perfect Fractured Alicite
	[42158] = "99. Gem#Gem", -- Mystic Dragon's Eye
	[40128] = "99. Gem#Gem", -- Quick King's Amber
	[40124] = "99. Gem#Gem", -- Smooth King's Amber
	[44066] = "99. Gem#Gem", -- Kharmaa's Grace
	[42150] = "99. Gem#Gem", -- Quick Dragon's Eye
	[40127] = "99. Gem#Gem", -- Mystic King's Amber
	[42149] = "99. Gem#Gem", -- Smooth Dragon's Eye
	[40017] = "99. Gem#Gem", -- Quick Autumn's Glow
	[52093] = "99. Gem#Gem", -- Quick Alicite
	[40016] = "99. Gem#Gem", -- Mystic Autumn's Glow
	[40115] = "99. Gem#Gem", -- Subtle King's Amber
	[42151] = "99. Gem#Gem", -- Subtle Dragon's Eye
	[40000] = "99. Gem#Gem", -- Subtle Autumn's Glow
	[40013] = "99. Gem#Gem", -- Smooth Autumn's Glow
	[52091] = "99. Gem#Gem", -- Smooth Alicite
	[52090] = "99. Gem#Gem", -- Subtle Alicite
	[52092] = "99. Gem#Gem", -- Mystic Alicite
	[52094] = "99. Gem#Gem", -- Fractured Alicite
	[35761] = "99. Gem#Gem", -- Quick Lionseye
	[33140] = "99. Gem#Gem", -- Blood of Amber
	[32205] = "99. Gem#Gem", -- Smooth Lionseye
	[35315] = "99. Gem#Gem", -- Quick Dawnstone
	[32198] = "99. Gem#Gem", -- Subtle Lionseye
	[39917] = "99. Gem#Gem", -- Mystic Sun Crystal
	[24032] = "99. Gem#Gem", -- Subtle Dawnstone
	[33143] = "99. Gem#Gem", -- Stone of Blades
	[41436] = "99. Gem#Gem", -- Perfect Smooth Sun Crystal
	[24048] = "99. Gem#Gem", -- Smooth Dawnstone
	[32209] = "99. Gem#Gem", -- Mystic Lionseye
	[39909] = "99. Gem#Gem", -- Smooth Sun Crystal
	[24053] = "99. Gem#Gem", -- Mystic Dawnstone
	[33144] = "99. Gem#Gem", -- Facet of Eternity
	[39907] = "99. Gem#Gem", -- Subtle Sun Crystal
	[39916] = "99. Gem#Gem", -- Subtle Sun Crystal
	[39918] = "99. Gem#Gem", -- Quick Sun Crystal
	[41439] = "99. Gem#Gem", -- Perfect Subtle Sun Crystal
	[41445] = "99. Gem#Gem", -- Perfect Mystic Sun Crystal
	[41446] = "99. Gem#Gem", -- Perfect Quick Sun Crystal
	[23114] = "99. Gem#Gem", -- Smooth Golden Draenite
	[28119] = "99. Gem#Gem", -- Smooth Ornate Dawnstone
	[27679] = "99. Gem#Gem", -- Mystic Dawnstone
	[38546] = "99. Gem#Gem", -- Smooth Ornate Dawnstone
	[28120] = "99. Gem#Gem", -- Smooth Ornate Dawnstone
	[23115] = "99. Gem#Gem", -- Subtle Golden Draenite
	[28290] = "99. Gem#Gem", -- Smooth Golden Draenite
	[28470] = "99. Gem#Gem", -- Subtle Amber
	[28467] = "99. Gem#Gem", -- Smooth Amber
	-- Purple
	[76686] = "99. Gem#Gem", -- Purified Imperial Amethyst
	[76680] = "99. Gem#Gem", -- Glinting Imperial Amethyst
	[76684] = "99. Gem#Gem", -- Etched Imperial Amethyst
	[76685] = "99. Gem#Gem", -- Mysterious Imperial Amethyst
	[76681] = "99. Gem#Gem", -- Accurate Imperial Amethyst
	[89674] = "99. Gem#Gem", -- Tense Imperial Amethyst
	[76682] = "99. Gem#Gem", -- Veiled Imperial Amethyst
	[89680] = "99. Gem#Gem", -- Assassin's Imperial Amethyst
	[93410] = "99. Gem#Gem", -- Mysterious Serpent's Eye
	[76687] = "99. Gem#Gem", -- Shifting Imperial Amethyst
	[76688] = "99. Gem#Gem", -- Guardian's Imperial Amethyst
	[76683] = "99. Gem#Gem", -- Retaliating Imperial Amethyst
	[76689] = "99. Gem#Gem", -- Timeless Imperial Amethyst
	[76690] = "99. Gem#Gem", -- Defender's Imperial Amethyst
	[76691] = "99. Gem#Gem", -- Sovereign Imperial Amethyst
	[93408] = "99. Gem#Gem", -- Tense Serpent's Eye
	[93409] = "99. Gem#Gem", -- Assassin's Serpent's Eye
	[89676] = "99. Gem#Gem", -- Perfect Tense Roguestone
	[76619] = "99. Gem#Gem", -- Perfect Mysterious Roguestone
	[76620] = "99. Gem#Gem", -- Perfect Purified Roguestone
	[76616] = "99. Gem#Gem", -- Perfect Veiled Roguestone
	[76618] = "99. Gem#Gem", -- Perfect Etched Roguestone
	[76621] = "99. Gem#Gem", -- Perfect Shifting Roguestone
	[76623] = "99. Gem#Gem", -- Perfect Timeless Roguestone
	[76615] = "99. Gem#Gem", -- Perfect Accurate Roguestone
	[76617] = "99. Gem#Gem", -- Perfect Retaliating Roguestone
	[76624] = "99. Gem#Gem", -- Perfect Defender's Roguestone
	[76625] = "99. Gem#Gem", -- Perfect Sovereign Roguestone
	[76614] = "99. Gem#Gem", -- Perfect Glinting Roguestone
	[76622] = "99. Gem#Gem", -- Perfect Guardian's Roguestone
	[76551] = "99. Gem#Gem", -- Retaliating Roguestone
	[76553] = "99. Gem#Gem", -- Mysterious Roguestone
	[76554] = "99. Gem#Gem", -- Purified Roguestone
	[76557] = "99. Gem#Gem", -- Timeless Roguestone
	[76549] = "99. Gem#Gem", -- Accurate Roguestone
	[76559] = "99. Gem#Gem", -- Sovereign Roguestone
	[89679] = "99. Gem#Gem", -- Perfect Assassin's Roguestone
	[76548] = "99. Gem#Gem", -- Glinting Roguestone
	[89675] = "99. Gem#Gem", -- Tense Roguestone
	[76550] = "99. Gem#Gem", -- Veiled Roguestone
	[76555] = "99. Gem#Gem", -- Shifting Roguestone
	[76556] = "99. Gem#Gem", -- Guardian's Roguestone
	[76552] = "99. Gem#Gem", -- Etched Roguestone
	[76558] = "99. Gem#Gem", -- Defender's Roguestone
	[89678] = "99. Gem#Gem", -- Assassin's Roguestone
	[52217] = "99. Gem#Gem", -- Veiled Demonseye
	[71864] = "99. Gem#Gem", -- Veiled Shadow Spinel
	[71873] = "99. Gem#Gem", -- Sovereign Shadow Spinel
	[71868] = "99. Gem#Gem", -- Purified Shadow Spinel
	[71872] = "99. Gem#Gem", -- Defender's Shadow Spinel
	[52236] = "99. Gem#Gem", -- Purified Demonseye
	[52243] = "99. Gem#Gem", -- Sovereign Demonseye
	[52221] = "99. Gem#Gem", -- Guardian's Demonseye
	[71862] = "99. Gem#Gem", -- Glinting Shadow Spinel
	[71866] = "99. Gem#Gem", -- Etched Shadow Spinel
	[71867] = "99. Gem#Gem", -- Mysterious Shadow Spinel
	[52213] = "99. Gem#Gem", -- Etched Demonseye
	[52248] = "99. Gem#Gem", -- Timeless Demonseye
	[71865] = "99. Gem#Gem", -- Retaliating Shadow Spinel
	[52203] = "99. Gem#Gem", -- Accurate Demonseye
	[52220] = "99. Gem#Gem", -- Glinting Demonseye
	[52234] = "99. Gem#Gem", -- Retaliating Demonseye
	[52238] = "99. Gem#Gem", -- Shifting Demonseye
	[71863] = "99. Gem#Gem", -- Accurate Shadow Spinel
	[52210] = "99. Gem#Gem", -- Defender's Demonseye
	[71871] = "99. Gem#Gem", -- Timeless Shadow Spinel
	[77133] = "99. Gem#Gem", -- Mysterious Shadow Spinel
	[71869] = "99. Gem#Gem", -- Shifting Shadow Spinel
	[71870] = "99. Gem#Gem", -- Guardian's Shadow Spinel
	[52152] = "99. Gem#Gem", -- Perfect Accurate Nightstone
	[52162] = "99. Gem#Gem", -- Perfect Sovereign Nightstone
	[52153] = "99. Gem#Gem", -- Perfect Veiled Nightstone
	[52160] = "99. Gem#Gem", -- Perfect Defender's Nightstone
	[52155] = "99. Gem#Gem", -- Perfect Glinting Nightstone
	[52157] = "99. Gem#Gem", -- Perfect Purified Nightstone
	[52154] = "99. Gem#Gem", -- Perfect Retaliating Nightstone
	[52156] = "99. Gem#Gem", -- Perfect Etched Nightstone
	[52158] = "99. Gem#Gem", -- Perfect Guardian's Nightstone
	[52159] = "99. Gem#Gem", -- Perfect Timeless Nightstone
	[52161] = "99. Gem#Gem", -- Perfect Shifting Nightstone
	[40133] = "99. Gem#Gem", -- Purified Dreadstone
	[40130] = "99. Gem#Gem", -- Shifting Dreadstone
	[40129] = "99. Gem#Gem", -- Sovereign Dreadstone
	[40135] = "99. Gem#Gem", -- Mysterious Dreadstone
	[40153] = "99. Gem#Gem", -- Veiled Dreadstone
	[40164] = "99. Gem#Gem", -- Timeless Dreadstone
	[52098] = "99. Gem#Gem", -- Timeless Nightstone
	[40023] = "99. Gem#Gem", -- Shifting Twilight Opal
	[40141] = "99. Gem#Gem", -- Guardian's Dreadstone
	[52097] = "99. Gem#Gem", -- Defender's Nightstone
	[40143] = "99. Gem#Gem", -- Etched Dreadstone
	[40162] = "99. Gem#Gem", -- Accurate Dreadstone
	[40026] = "99. Gem#Gem", -- Purified Twilight Opal
	[40028] = "99. Gem#Gem", -- Mysterious Twilight Opal
	[40032] = "99. Gem#Gem", -- Defender's Twilight Opal
	[52102] = "99. Gem#Gem", -- Glinting Nightstone
	[40022] = "99. Gem#Gem", -- Sovereign Twilight Opal
	[40058] = "99. Gem#Gem", -- Accurate Twilight Opal
	[40157] = "99. Gem#Gem", -- Glinting Dreadstone
	[40025] = "99. Gem#Gem", -- Timeless Twilight Opal
	[40038] = "99. Gem#Gem", -- Etched Twilight Opal
	[40139] = "99. Gem#Gem", -- Defender's Dreadstone
	[40034] = "99. Gem#Gem", -- Guardian's Twilight Opal
	[52099] = "99. Gem#Gem", -- Guardian's Nightstone
	[52104] = "99. Gem#Gem", -- Veiled Nightstone
	[52105] = "99. Gem#Gem", -- Accurate Nightstone
	[40049] = "99. Gem#Gem", -- Veiled Twilight Opal
	[52095] = "99. Gem#Gem", -- Sovereign Nightstone
	[52096] = "99. Gem#Gem", -- Shifting Nightstone
	[52101] = "99. Gem#Gem", -- Etched Nightstone
	[40044] = "99. Gem#Gem", -- Glinting Twilight Opal
	[52100] = "99. Gem#Gem", -- Purified Nightstone
	[52103] = "99. Gem#Gem", -- Retaliating Nightstone
	[30546] = "99. Gem#Gem", -- Sovereign Tanzanite
	[30555] = "99. Gem#Gem", -- Timeless Tanzanite
	[32225] = "99. Gem#Gem", -- Purified Shadowsong Amethyst
	[30549] = "99. Gem#Gem", -- Shifting Tanzanite
	[32211] = "99. Gem#Gem", -- Sovereign Shadowsong Amethyst
	[24055] = "99. Gem#Gem", -- Shifting Nightseye
	[31118] = "99. Gem#Gem", -- Sovereign Amethyst
	[31117] = "99. Gem#Gem", -- Tireless Soothing Amethyst
	[32212] = "99. Gem#Gem", -- Shifting Shadowsong Amethyst
	[24061] = "99. Gem#Gem", -- Glinting Nightseye
	[24056] = "99. Gem#Gem", -- Timeless Nightseye
	[39945] = "99. Gem#Gem", -- Mysterious Shadow Crystal
	[30553] = "99. Gem#Gem", -- Glinting Tanzanite
	[30556] = "99. Gem#Gem", -- Glinting Tanzanite
	[30572] = "99. Gem#Gem", -- Purified Tanzanite
	[31116] = "99. Gem#Gem", -- Timeless Amethyst
	[32215] = "99. Gem#Gem", -- Timeless Shadowsong Amethyst
	[39942] = "99. Gem#Gem", -- Glinting Shadow Crystal
	[30559] = "99. Gem#Gem", -- Etched Tanzanite
	[30600] = "99. Gem#Gem", -- Purified Tanzanite
	[24054] = "99. Gem#Gem", -- Sovereign Nightseye
	[30586] = "99. Gem#Gem", -- Purified Tanzanite
	[30603] = "99. Gem#Gem", -- Purified Tanzanite
	[31867] = "99. Gem#Gem", -- Veiled Nightseye
	[32220] = "99. Gem#Gem", -- Glinting Shadowsong Amethyst
	[39934] = "99. Gem#Gem", -- Sovereign Shadow Crystal
	[39968] = "99. Gem#Gem", -- Timeless Shadow Crystal
	[30564] = "99. Gem#Gem", -- Veiled Tanzanite
	[30583] = "99. Gem#Gem", -- Timeless Tanzanite
	[30589] = "99. Gem#Gem", -- Purified Tanzanite
	[39935] = "99. Gem#Gem", -- Shifting Shadow Crystal
	[39966] = "99. Gem#Gem", -- Accurate Shadow Crystal
	[41473] = "99. Gem#Gem", -- Perfect Purified Shadow Crystal
	[41502] = "99. Gem#Gem", -- Perfect Veiled Shadow Crystal
	[30566] = "99. Gem#Gem", -- Defender's Tanzanite
	[30573] = "99. Gem#Gem", -- Mysterious Tanzanite
	[32221] = "99. Gem#Gem", -- Veiled Shadowsong Amethyst
	[32634] = "99. Gem#Gem", -- Shifting Amethyst
	[39979] = "99. Gem#Gem", -- Purified Shadow Crystal
	[41452] = "99. Gem#Gem", -- Perfect Timeless Shadow Crystal
	[30574] = "99. Gem#Gem", -- Shifting Tanzanite
	[32635] = "99. Gem#Gem", -- Timeless Amethyst
	[32636] = "99. Gem#Gem", -- Purified Amethyst
	[39948] = "99. Gem#Gem", -- Etched Shadow Crystal
	[41461] = "99. Gem#Gem", -- Perfect Sovereign Shadow Crystal
	[41482] = "99. Gem#Gem", -- Perfect Accurate Shadow Crystal
	[41488] = "99. Gem#Gem", -- Perfect Etched Shadow Crystal
	[24065] = "99. Gem#Gem", -- Purified Nightseye
	[30552] = "99. Gem#Gem", -- Timeless Tanzanite
	[39939] = "99. Gem#Gem", -- Defender's Shadow Crystal
	[39940] = "99. Gem#Gem", -- Guardian's Shadow Crystal
	[39957] = "99. Gem#Gem", -- Veiled Shadow Crystal
	[41450] = "99. Gem#Gem", -- Perfect Shifting Shadow Crystal
	[41451] = "99. Gem#Gem", -- Perfect Defender's Shadow Crystal
	[41453] = "99. Gem#Gem", -- Perfect Guardian's Shadow Crystal
	[41455] = "99. Gem#Gem", -- Perfect Mysterious Shadow Crystal
	[41462] = "99. Gem#Gem", -- Perfect Glinting Shadow Crystal
	[23108] = "99. Gem#Gem", -- Timeless Shadow Draenite
	[23100] = "99. Gem#Gem", -- Glinting Shadow Draenite
	[32836] = "99. Gem#Gem", -- Purified Shadow Pearl
	[23111] = "99. Gem#Gem", -- Sovereign Shadow Draenite
	[23109] = "99. Gem#Gem", -- Purified Shadow Draenite
	[23110] = "99. Gem#Gem", -- Shifting Shadow Draenite
	[31866] = "99. Gem#Gem", -- Veiled Shadow Draenite
	[32833] = "99. Gem#Gem", -- Purified Jaggal Pearl
	-- Green
	[76642] = "99. Gem#Gem", -- Lightning Wild Jade
	[76641] = "99. Gem#Gem", -- Piercing Wild Jade
	[76640] = "99. Gem#Gem", -- Misty Wild Jade
	[76643] = "99. Gem#Gem", -- Sensei's Wild Jade
	[76656] = "99. Gem#Gem", -- Puissant Wild Jade
	[76646] = "99. Gem#Gem", -- Balanced Wild Jade
	[76654] = "99. Gem#Gem", -- Forceful Wild Jade
	[76644] = "99. Gem#Gem", -- Effulgent Wild Jade
	[76648] = "99. Gem#Gem", -- Turbid Wild Jade
	[76649] = "99. Gem#Gem", -- Radiant Wild Jade
	[93705] = "99. Gem#Gem", -- Nimble Wild Jade
	[76647] = "99. Gem#Gem", -- Vivid Wild Jade
	[76650] = "99. Gem#Gem", -- Shattered Wild Jade
	[76653] = "99. Gem#Gem", -- Regal Wild Jade
	[76645] = "99. Gem#Gem", -- Zen Wild Jade
	[76651] = "99. Gem#Gem", -- Energized Wild Jade
	[76652] = "99. Gem#Gem", -- Jagged Wild Jade
	[76655] = "99. Gem#Gem", -- Confounded Wild Jade
	[76657] = "99. Gem#Gem", -- Steady Wild Jade
	[76581] = "99. Gem#Gem", -- Perfect Vivid Alexandrite
	[76579] = "99. Gem#Gem", -- Perfect Zen Alexandrite
	[76575] = "99. Gem#Gem", -- Perfect Piercing Alexandrite
	[76576] = "99. Gem#Gem", -- Perfect Lightning Alexandrite
	[76580] = "99. Gem#Gem", -- Perfect Balanced Alexandrite
	[76585] = "99. Gem#Gem", -- Perfect Energized Alexandrite
	[93707] = "99. Gem#Gem", -- Perfect Nimble Alexandrite
	[76577] = "99. Gem#Gem", -- Perfect Sensei's Alexandrite
	[76578] = "99. Gem#Gem", -- Perfect Effulgent Alexandrite
	[76583] = "99. Gem#Gem", -- Perfect Radiant Alexandrite
	[76587] = "99. Gem#Gem", -- Perfect Regal Alexandrite
	[76574] = "99. Gem#Gem", -- Perfect Misty Alexandrite
	[76582] = "99. Gem#Gem", -- Perfect Turbid Alexandrite
	[76584] = "99. Gem#Gem", -- Perfect Shattered Alexandrite
	[76591] = "99. Gem#Gem", -- Perfect Steady Alexandrite
	[76586] = "99. Gem#Gem", -- Perfect Jagged Alexandrite
	[76588] = "99. Gem#Gem", -- Perfect Forceful Alexandrite
	[76589] = "99. Gem#Gem", -- Perfect Confounded Alexandrite
	[76590] = "99. Gem#Gem", -- Perfect Puissant Alexandrite
	[76521] = "99. Gem#Gem", -- Regal Alexandrite
	[76512] = "99. Gem#Gem", -- Zen Alexandrite
	[76507] = "99. Gem#Gem", -- Misty Alexandrite
	[76519] = "99. Gem#Gem", -- Energized Alexandrite
	[76515] = "99. Gem#Gem", -- Turbid Alexandrite
	[93706] = "99. Gem#Gem", -- Nimble Alexandrite
	[76511] = "99. Gem#Gem", -- Effulgent Alexandrite
	[76514] = "99. Gem#Gem", -- Vivid Alexandrite
	[76524] = "99. Gem#Gem", -- Puissant Alexandrite
	[76508] = "99. Gem#Gem", -- Piercing Alexandrite
	[76509] = "99. Gem#Gem", -- Lightning Alexandrite
	[76513] = "99. Gem#Gem", -- Balanced Alexandrite
	[76517] = "99. Gem#Gem", -- Radiant Alexandrite
	[76518] = "99. Gem#Gem", -- Shattered Alexandrite
	[76520] = "99. Gem#Gem", -- Jagged Alexandrite
	[76522] = "99. Gem#Gem", -- Forceful Alexandrite
	[76523] = "99. Gem#Gem", -- Confounded Alexandrite
	[76525] = "99. Gem#Gem", -- Steady Alexandrite
	[76510] = "99. Gem#Gem", -- Sensei's Alexandrite
	[52231] = "99. Gem#Gem", -- Puissant Dream Emerald
	[52233] = "99. Gem#Gem", -- Regal Dream Emerald
	[71826] = "99. Gem#Gem", -- Infused Elven Peridot
	[71831] = "99. Gem#Gem", -- Radiant Elven Peridot
	[71838] = "99. Gem#Gem", -- Puissant Elven Peridot
	[77131] = "99. Gem#Gem", -- Infused Elven Peridot
	[52250] = "99. Gem#Gem", -- Zen Dream Emerald
	[71822] = "99. Gem#Gem", -- Misty Elven Peridot
	[71833] = "99. Gem#Gem", -- Energized Elven Peridot
	[52225] = "99. Gem#Gem", -- Lightning Dream Emerald
	[52245] = "99. Gem#Gem", -- Steady Dream Emerald
	[71829] = "99. Gem#Gem", -- Vivid Elven Peridot
	[77137] = "99. Gem#Gem", -- Shattered Elven Peridot
	[77139] = "99. Gem#Gem", -- Steady Elven Peridot
	[77142] = "99. Gem#Gem", -- Turbid Elven Peridot
	[77143] = "99. Gem#Gem", -- Vivid Elven Peridot
	[77154] = "99. Gem#Gem", -- Radiant Elven Peridot
	[52223] = "99. Gem#Gem", -- Jagged Dream Emerald
	[52228] = "99. Gem#Gem", -- Piercing Dream Emerald
	[68741] = "99. Gem#Gem", -- Vivid Dream Emerald
	[71825] = "99. Gem#Gem", -- Sensei's Elven Peridot
	[71827] = "99. Gem#Gem", -- Zen Elven Peridot
	[71830] = "99. Gem#Gem", -- Turbid Elven Peridot
	[71834] = "99. Gem#Gem", -- Jagged Elven Peridot
	[77130] = "99. Gem#Gem", -- Balanced Elven Peridot
	[52218] = "99. Gem#Gem", -- Forceful Dream Emerald
	[52227] = "99. Gem#Gem", -- Nimble Dream Emerald
	[71823] = "99. Gem#Gem", -- Piercing Elven Peridot
	[71824] = "99. Gem#Gem", -- Lightning Elven Peridot
	[71828] = "99. Gem#Gem", -- Balanced Elven Peridot
	[71836] = "99. Gem#Gem", -- Forceful Elven Peridot
	[71837] = "99. Gem#Gem", -- Nimble Elven Peridot
	[71839] = "99. Gem#Gem", -- Steady Elven Peridot
	[52237] = "99. Gem#Gem", -- Sensei's Dream Emerald
	[71832] = "99. Gem#Gem", -- Shattered Elven Peridot
	[71835] = "99. Gem#Gem", -- Regal Elven Peridot
	[52131] = "99. Gem#Gem", -- Perfect Puissant Jasper
	[52129] = "99. Gem#Gem", -- Perfect Sensei's Jasper
	[52137] = "99. Gem#Gem", -- Perfect Nimble Jasper
	[52133] = "99. Gem#Gem", -- Perfect Forceful Jasper
	[52134] = "99. Gem#Gem", -- Perfect Steady Jasper
	[52136] = "99. Gem#Gem", -- Perfect Jagged Jasper
	[52138] = "99. Gem#Gem", -- Perfect Regal Jasper
	[52132] = "99. Gem#Gem", -- Perfect Lightning Jasper
	[52135] = "99. Gem#Gem", -- Perfect Piercing Jasper
	[52130] = "99. Gem#Gem", -- Perfect Zen Jasper
	[40167] = "99. Gem#Gem", -- Regal Eye of Zul
	[52128] = "99. Gem#Gem", -- Sensei's Jasper
	[40179] = "99. Gem#Gem", -- Energized Eye of Zul
	[52119] = "99. Gem#Gem", -- Regal Jasper
	[40102] = "99. Gem#Gem", -- Turbid Forest Emerald
	[52124] = "99. Gem#Gem", -- Forceful Jasper
	[40106] = "99. Gem#Gem", -- Shattered Forest Emerald
	[40177] = "99. Gem#Gem", -- Lightning Eye of Zul
	[52122] = "99. Gem#Gem", -- Piercing Jasper
	[40095] = "99. Gem#Gem", -- Misty Forest Emerald
	[52123] = "99. Gem#Gem", -- Steady Jasper
	[52126] = "99. Gem#Gem", -- Puissant Jasper
	[52127] = "99. Gem#Gem", -- Zen Jasper
	[40086] = "99. Gem#Gem", -- Jagged Forest Emerald
	[40089] = "99. Gem#Gem", -- Regal Forest Emerald
	[40091] = "99. Gem#Gem", -- Forceful Forest Emerald
	[40173] = "99. Gem#Gem", -- Turbid Eye of Zul
	[52121] = "99. Gem#Gem", -- Jagged Jasper
	[40088] = "99. Gem#Gem", -- Nimble Forest Emerald
	[40105] = "99. Gem#Gem", -- Energized Forest Emerald
	[40165] = "99. Gem#Gem", -- Jagged Eye of Zul
	[40166] = "99. Gem#Gem", -- Nimble Eye of Zul
	[40168] = "99. Gem#Gem", -- Steady Eye of Zul
	[40169] = "99. Gem#Gem", -- Forceful Eye of Zul
	[40171] = "99. Gem#Gem", -- Misty Eye of Zul
	[40182] = "99. Gem#Gem", -- Shattered Eye of Zul
	[40090] = "99. Gem#Gem", -- Steady Forest Emerald
	[40098] = "99. Gem#Gem", -- Radiant Forest Emerald
	[40100] = "99. Gem#Gem", -- Lightning Forest Emerald
	[40180] = "99. Gem#Gem", -- Radiant Eye of Zul
	[52120] = "99. Gem#Gem", -- Nimble Jasper
	[52125] = "99. Gem#Gem", -- Lightning Jasper
	[35758] = "99. Gem#Gem", -- Steady Seaspray Emerald
	[30602] = "99. Gem#Gem", -- Jagged Chrysoprase
	[30605] = "99. Gem#Gem", -- Nimble Chrysoprase
	[30550] = "99. Gem#Gem", -- Misty Chrysoprase
	[24067] = "99. Gem#Gem", -- Jagged Talasite
	[33782] = "99. Gem#Gem", -- Steady Talasite
	[24066] = "99. Gem#Gem", -- Radiant Talasite
	[30608] = "99. Gem#Gem", -- Radiant Chrysoprase
	[41466] = "99. Gem#Gem", -- Perfect Forceful Dark Jade
	[41474] = "99. Gem#Gem", -- Perfect Shattered Dark Jade
	[30548] = "99. Gem#Gem", -- Jagged Chrysoprase
	[30565] = "99. Gem#Gem", -- Jagged Chrysoprase
	[35759] = "99. Gem#Gem", -- Forceful Seaspray Emerald
	[30590] = "99. Gem#Gem", -- Regal Chrysoprase
	[30594] = "99. Gem#Gem", -- Regal Chrysoprase
	[41475] = "99. Gem#Gem", -- Perfect Lightning Dark Jade
	[41478] = "99. Gem#Gem", -- Perfect Radiant Dark Jade
	[32226] = "99. Gem#Gem", -- Jagged Seaspray Emerald
	[41470] = "99. Gem#Gem", -- Perfect Misty Dark Jade
	[41480] = "99. Gem#Gem", -- Perfect Turbid Dark Jade
	[30560] = "99. Gem#Gem", -- Misty Chrysoprase
	[30563] = "99. Gem#Gem", -- Regal Chrysoprase
	[32223] = "99. Gem#Gem", -- Regal Seaspray Emerald
	[32224] = "99. Gem#Gem", -- Radiant Seaspray Emerald
	[32639] = "99. Gem#Gem", -- Jagged Mossjewel
	[35318] = "99. Gem#Gem", -- Forceful Talasite
	[39976] = "99. Gem#Gem", -- Regal Dark Jade
	[39978] = "99. Gem#Gem", -- Forceful Dark Jade
	[41464] = "99. Gem#Gem", -- Perfect Regal Dark Jade
	[41467] = "99. Gem#Gem", -- Perfect Energized Dark Jade
	[41468] = "99. Gem#Gem", -- Perfect Jagged Dark Jade
	[41481] = "99. Gem#Gem", -- Perfect Nimble Dark Jade
	[30575] = "99. Gem#Gem", -- Nimble Chrysoprase
	[30592] = "99. Gem#Gem", -- Steady Chrysoprase
	[30601] = "99. Gem#Gem", -- Steady Chrysoprase
	[30606] = "99. Gem#Gem", -- Lightning Chrysoprase
	[35707] = "99. Gem#Gem", -- Regal Talasite
	[39933] = "99. Gem#Gem", -- Jagged Dark Jade
	[39975] = "99. Gem#Gem", -- Nimble Dark Jade
	[39977] = "99. Gem#Gem", -- Steady Dark Jade
	[39980] = "99. Gem#Gem", -- Misty Dark Jade
	[39981] = "99. Gem#Gem", -- Lightning Dark Jade
	[39982] = "99. Gem#Gem", -- Turbid Dark Jade
	[39983] = "99. Gem#Gem", -- Energized Dark Jade
	[39991] = "99. Gem#Gem", -- Radiant Dark Jade
	[39992] = "99. Gem#Gem", -- Shattered Dark Jade
	[41476] = "99. Gem#Gem", -- Perfect Steady Dark Jade
	[23105] = "99. Gem#Gem", -- Regal Deep Peridot
	[27786] = "99. Gem#Gem", -- Jagged Deep Peridot
	[27809] = "99. Gem#Gem", -- Jagged Deep Peridot
	[23103] = "99. Gem#Gem", -- Radiant Deep Peridot
	[23104] = "99. Gem#Gem", -- Jagged Deep Peridot
	-- Orange
	[76672] = "99. Gem#Gem", -- Artful Vermilion Onyx
	[76668] = "99. Gem#Gem", -- Reckless Vermilion Onyx
	[76660] = "99. Gem#Gem", -- Potent Vermilion Onyx
	[76659] = "99. Gem#Gem", -- Crafty Vermilion Onyx
	[76661] = "99. Gem#Gem", -- Inscribed Vermilion Onyx
	[76670] = "99. Gem#Gem", -- Adept Vermilion Onyx
	[76658] = "99. Gem#Gem", -- Deadly Vermilion Onyx
	[76674] = "99. Gem#Gem", -- Skillful Vermilion Onyx
	[76669] = "99. Gem#Gem", -- Fierce Vermilion Onyx
	[76679] = "99. Gem#Gem", -- Resplendent Vermilion Onyx
	[76663] = "99. Gem#Gem", -- Resolute Vermilion Onyx
	[76676] = "99. Gem#Gem", -- Tenuous Vermilion Onyx
	[76664] = "99. Gem#Gem", -- Stalwart Vermilion Onyx
	[76666] = "99. Gem#Gem", -- Deft Vermilion Onyx
	[76678] = "99. Gem#Gem", -- Splendid Vermilion Onyx
	[93404] = "99. Gem#Gem", -- Resplendent Serpent's Eye
	[76677] = "99. Gem#Gem", -- Willful Vermilion Onyx
	[76667] = "99. Gem#Gem", -- Wicked Vermilion Onyx
	[76671] = "99. Gem#Gem", -- Keen Vermilion Onyx
	[76675] = "99. Gem#Gem", -- Lucent Vermilion Onyx
	[93405] = "99. Gem#Gem", -- Lucent Serpent's Eye
	[93406] = "99. Gem#Gem", -- Willful Serpent's Eye
	[76673] = "99. Gem#Gem", -- Fine Vermilion Onyx
	[76665] = "99. Gem#Gem", -- Champion's Vermilion Onyx
	[76662] = "99. Gem#Gem", -- Polished Vermilion Onyx
	[76607] = "99. Gem#Gem", -- Perfect Fine Tiger Opal
	[76594] = "99. Gem#Gem", -- Perfect Potent Tiger Opal
	[76604] = "99. Gem#Gem", -- Perfect Adept Tiger Opal
	[76606] = "99. Gem#Gem", -- Perfect Artful Tiger Opal
	[76602] = "99. Gem#Gem", -- Perfect Reckless Tiger Opal
	[76592] = "99. Gem#Gem", -- Perfect Deadly Tiger Opal
	[76593] = "99. Gem#Gem", -- Perfect Crafty Tiger Opal
	[76596] = "99. Gem#Gem", -- Perfect Polished Tiger Opal
	[76611] = "99. Gem#Gem", -- Perfect Willful Tiger Opal
	[76612] = "99. Gem#Gem", -- Perfect Splendid Tiger Opal
	[76613] = "99. Gem#Gem", -- Perfect Resplendent Tiger Opal
	[76595] = "99. Gem#Gem", -- Perfect Inscribed Tiger Opal
	[76597] = "99. Gem#Gem", -- Perfect Resolute Tiger Opal
	[76598] = "99. Gem#Gem", -- Perfect Stalwart Tiger Opal
	[76603] = "99. Gem#Gem", -- Perfect Fierce Tiger Opal
	[76605] = "99. Gem#Gem", -- Perfect Keen Tiger Opal
	[76609] = "99. Gem#Gem", -- Perfect Lucent Tiger Opal
	[76599] = "99. Gem#Gem", -- Perfect Champion's Tiger Opal
	[76600] = "99. Gem#Gem", -- Perfect Deft Tiger Opal
	[76601] = "99. Gem#Gem", -- Perfect Wicked Tiger Opal
	[76608] = "99. Gem#Gem", -- Perfect Skillful Tiger Opal
	[76610] = "99. Gem#Gem", -- Perfect Tenuous Tiger Opal
	[76536] = "99. Gem#Gem", -- Reckless Tiger Opal
	[76538] = "99. Gem#Gem", -- Adept Tiger Opal
	[76532] = "99. Gem#Gem", -- Stalwart Tiger Opal
	[76545] = "99. Gem#Gem", -- Willful Tiger Opal
	[76528] = "99. Gem#Gem", -- Potent Tiger Opal
	[76540] = "99. Gem#Gem", -- Artful Tiger Opal
	[76541] = "99. Gem#Gem", -- Fine Tiger Opal
	[76542] = "99. Gem#Gem", -- Skillful Tiger Opal
	[76544] = "99. Gem#Gem", -- Tenuous Tiger Opal
	[76546] = "99. Gem#Gem", -- Splendid Tiger Opal
	[76547] = "99. Gem#Gem", -- Resplendent Tiger Opal
	[76529] = "99. Gem#Gem", -- Inscribed Tiger Opal
	[76530] = "99. Gem#Gem", -- Polished Tiger Opal
	[76539] = "99. Gem#Gem", -- Keen Tiger Opal
	[76543] = "99. Gem#Gem", -- Lucent Tiger Opal
	[76526] = "99. Gem#Gem", -- Deadly Tiger Opal
	[76527] = "99. Gem#Gem", -- Crafty Tiger Opal
	[76531] = "99. Gem#Gem", -- Resolute Tiger Opal
	[76533] = "99. Gem#Gem", -- Champion's Tiger Opal
	[76534] = "99. Gem#Gem", -- Deft Tiger Opal
	[76535] = "99. Gem#Gem", -- Wicked Tiger Opal
	[76537] = "99. Gem#Gem", -- Fierce Tiger Opal
	[68356] = "99. Gem#Gem", -- Willful Ember Topaz
	[71843] = "99. Gem#Gem", -- Inscribed Lava Coral
	[71850] = "99. Gem#Gem", -- Reckless Lava Coral
	[71852] = "99. Gem#Gem", -- Adept Lava Coral
	[71861] = "99. Gem#Gem", -- Resplendent Lava Coral
	[52239] = "99. Gem#Gem", -- Potent Ember Topaz
	[71854] = "99. Gem#Gem", -- Artful Lava Coral
	[71840] = "99. Gem#Gem", -- Deadly Lava Coral
	[68358] = "99. Gem#Gem", -- Resplendent Ember Topaz
	[52208] = "99. Gem#Gem", -- Reckless Ember Topaz
	[52214] = "99. Gem#Gem", -- Fierce Ember Topaz
	[71842] = "99. Gem#Gem", -- Potent Lava Coral
	[71855] = "99. Gem#Gem", -- Fine Lava Coral
	[52222] = "99. Gem#Gem", -- Inscribed Ember Topaz
	[52240] = "99. Gem#Gem", -- Skillful Ember Topaz
	[52204] = "99. Gem#Gem", -- Adept Ember Topaz
	[68357] = "99. Gem#Gem", -- Lucent Ember Topaz
	[71848] = "99. Gem#Gem", -- Deft Lava Coral
	[77141] = "99. Gem#Gem", -- Tenuous Lava Coral
	[52211] = "99. Gem#Gem", -- Deft Ember Topaz
	[52229] = "99. Gem#Gem", -- Polished Ember Topaz
	[71851] = "99. Gem#Gem", -- Fierce Lava Coral
	[71859] = "99. Gem#Gem", -- Willful Lava Coral
	[77132] = "99. Gem#Gem", -- Lucent Lava Coral
	[52205] = "99. Gem#Gem", -- Artful Ember Topaz
	[52209] = "99. Gem#Gem", -- Deadly Ember Topaz
	[71849] = "99. Gem#Gem", -- Wicked Lava Coral
	[71856] = "99. Gem#Gem", -- Skillful Lava Coral
	[71860] = "99. Gem#Gem", -- Splendid Lava Coral
	[77136] = "99. Gem#Gem", -- Resplendent Lava Coral
	[77138] = "99. Gem#Gem", -- Splendid Lava Coral
	[52224] = "99. Gem#Gem", -- Keen Ember Topaz
	[52249] = "99. Gem#Gem", -- Resolute Ember Topaz
	[71845] = "99. Gem#Gem", -- Resolute Lava Coral
	[71846] = "99. Gem#Gem", -- Stalwart Lava Coral
	[71847] = "99. Gem#Gem", -- Champion's Lava Coral
	[52215] = "99. Gem#Gem", -- Fine Ember Topaz
	[71841] = "99. Gem#Gem", -- Crafty Lava Coral
	[71844] = "99. Gem#Gem", -- Polished Lava Coral
	[71853] = "99. Gem#Gem", -- Keen Lava Coral
	[71857] = "99. Gem#Gem", -- Lucent Lava Coral
	[71858] = "99. Gem#Gem", -- Tenuous Lava Coral
	[77144] = "99. Gem#Gem", -- Willful Lava Coral
	[52147] = "99. Gem#Gem", -- Perfect Potent Hessonite
	[52140] = "99. Gem#Gem", -- Perfect Artful Hessonite
	[52139] = "99. Gem#Gem", -- Perfect Keen Hessonite
	[52145] = "99. Gem#Gem", -- Perfect Deft Hessonite
	[52149] = "99. Gem#Gem", -- Perfect Inscribed Hessonite
	[52141] = "99. Gem#Gem", -- Perfect Fine Hessonite
	[52146] = "99. Gem#Gem", -- Perfect Fierce Hessonite
	[52148] = "99. Gem#Gem", -- Perfect Deadly Hessonite
	[52142] = "99. Gem#Gem", -- Perfect Adept Hessonite
	[52143] = "99. Gem#Gem", -- Perfect Skillful Hessonite
	[52144] = "99. Gem#Gem", -- Perfect Reckless Hessonite
	[52150] = "99. Gem#Gem", -- Perfect Resolute Hessonite
	[52151] = "99. Gem#Gem", -- Perfect Polished Hessonite
	[40155] = "99. Gem#Gem", -- Reckless Ametrine
	[40146] = "99. Gem#Gem", -- Fierce Ametrine
	[40150] = "99. Gem#Gem", -- Deft Ametrine
	[40152] = "99. Gem#Gem", -- Potent Ametrine
	[40147] = "99. Gem#Gem", -- Deadly Ametrine
	[40037] = "99. Gem#Gem", -- Inscribed Monarch Topaz
	[40142] = "99. Gem#Gem", -- Inscribed Ametrine
	[52113] = "99. Gem#Gem", -- Reckless Hessonite
	[40051] = "99. Gem#Gem", -- Reckless Monarch Topaz
	[52115] = "99. Gem#Gem", -- Adept Hessonite
	[40048] = "99. Gem#Gem", -- Potent Monarch Topaz
	[40154] = "99. Gem#Gem", -- Willful Ametrine
	[40057] = "99. Gem#Gem", -- Stalwart Monarch Topaz
	[52116] = "99. Gem#Gem", -- Fine Hessonite
	[52117] = "99. Gem#Gem", -- Artful Hessonite
	[40041] = "99. Gem#Gem", -- Fierce Monarch Topaz
	[40052] = "99. Gem#Gem", -- Deadly Monarch Topaz
	[40145] = "99. Gem#Gem", -- Resplendent Ametrine
	[40159] = "99. Gem#Gem", -- Deft Ametrine
	[40163] = "99. Gem#Gem", -- Resolute Ametrine
	[52110] = "99. Gem#Gem", -- Potent Hessonite
	[52112] = "99. Gem#Gem", -- Deft Hessonite
	[40039] = "99. Gem#Gem", -- Champion's Monarch Topaz
	[40160] = "99. Gem#Gem", -- Stalwart Ametrine
	[52107] = "99. Gem#Gem", -- Resolute Hessonite
	[40050] = "99. Gem#Gem", -- Willful Monarch Topaz
	[40144] = "99. Gem#Gem", -- Champion's Ametrine
	[52108] = "99. Gem#Gem", -- Inscribed Hessonite
	[52111] = "99. Gem#Gem", -- Fierce Hessonite
	[52114] = "99. Gem#Gem", -- Skillful Hessonite
	[52118] = "99. Gem#Gem", -- Keen Hessonite
	[40040] = "99. Gem#Gem", -- Resplendent Monarch Topaz
	[40059] = "99. Gem#Gem", -- Resolute Monarch Topaz
	[40149] = "99. Gem#Gem", -- Lucent Ametrine
	[52106] = "99. Gem#Gem", -- Polished Hessonite
	[52109] = "99. Gem#Gem", -- Deadly Hessonite
	[40045] = "99. Gem#Gem", -- Lucent Monarch Topaz
	[40055] = "99. Gem#Gem", -- Deft Monarch Topaz
	[32218] = "99. Gem#Gem", -- Potent Pyrestone
	[35760] = "99. Gem#Gem", -- Reckless Pyrestone
	[32222] = "99. Gem#Gem", -- Deadly Pyrestone
	[30551] = "99. Gem#Gem", -- Reckless Fire Opal
	[32217] = "99. Gem#Gem", -- Inscribed Pyrestone
	[30582] = "99. Gem#Gem", -- Deadly Fire Opal
	[30587] = "99. Gem#Gem", -- Champion's Fire Opal
	[41489] = "99. Gem#Gem", -- Perfect Fierce Huge Citrine
	[30547] = "99. Gem#Gem", -- Reckless Fire Opal
	[41490] = "99. Gem#Gem", -- Perfect Stalwart Huge Citrine
	[41499] = "99. Gem#Gem", -- Perfect Resplendent Huge Citrine
	[30585] = "99. Gem#Gem", -- Polished Fire Opal
	[30604] = "99. Gem#Gem", -- Resplendent Fire Opal
	[39956] = "99. Gem#Gem", -- Potent Huge Citrine
	[30591] = "99. Gem#Gem", -- Lucent Fire Opal
	[30593] = "99. Gem#Gem", -- Potent Fire Opal
	[39959] = "99. Gem#Gem", -- Reckless Huge Citrine
	[24058] = "99. Gem#Gem", -- Inscribed Noble Topaz
	[24060] = "99. Gem#Gem", -- Reckless Noble Topaz
	[30584] = "99. Gem#Gem", -- Inscribed Fire Opal
	[39965] = "99. Gem#Gem", -- Stalwart Huge Citrine
	[39967] = "99. Gem#Gem", -- Resolute Huge Citrine
	[24059] = "99. Gem#Gem", -- Potent Noble Topaz
	[30554] = "99. Gem#Gem", -- Stalwart Fire Opal
	[30588] = "99. Gem#Gem", -- Potent Fire Opal
	[30607] = "99. Gem#Gem", -- Splendid Fire Opal
	[32638] = "99. Gem#Gem", -- Reckless Citrine
	[39950] = "99. Gem#Gem", -- Resplendent Huge Citrine
	[41483] = "99. Gem#Gem", -- Perfect Champion's Huge Citrine
	[41495] = "99. Gem#Gem", -- Perfect Potent Huge Citrine
	[30558] = "99. Gem#Gem", -- Stalwart Fire Opal
	[31868] = "99. Gem#Gem", -- Deadly Noble Topaz
	[39947] = "99. Gem#Gem", -- Inscribed Huge Citrine
	[39952] = "99. Gem#Gem", -- Deadly Huge Citrine
	[39958] = "99. Gem#Gem", -- Willful Huge Citrine
	[41484] = "99. Gem#Gem", -- Perfect Deadly Huge Citrine
	[41486] = "99. Gem#Gem", -- Perfect Willful Huge Citrine
	[41492] = "99. Gem#Gem", -- Perfect Inscribed Huge Citrine
	[41493] = "99. Gem#Gem", -- Perfect Lucent Huge Citrine
	[41497] = "99. Gem#Gem", -- Perfect Reckless Huge Citrine
	[41498] = "99. Gem#Gem", -- Perfect Resolute Huge Citrine
	[30581] = "99. Gem#Gem", -- Willful Fire Opal
	[32637] = "99. Gem#Gem", -- Deadly Citrine
	[39949] = "99. Gem#Gem", -- Champion's Huge Citrine
	[39951] = "99. Gem#Gem", -- Fierce Huge Citrine
	[39954] = "99. Gem#Gem", -- Lucent Huge Citrine
	[39955] = "99. Gem#Gem", -- Deft Huge Citrine
	[41485] = "99. Gem#Gem", -- Perfect Deft Huge Citrine
	[28123] = "99. Gem#Gem", -- Potent Ornate Topaz
	[28363] = "99. Gem#Gem", -- Deadly Ornate Topaz
	[23101] = "99. Gem#Gem", -- Potent Flame Spessarite
	[23098] = "99. Gem#Gem", -- Inscribed Flame Spessarite
	[31869] = "99. Gem#Gem", -- Deadly Flame Spessarite
	[23099] = "99. Gem#Gem", -- Reckless Flame Spessarite
	[38547] = "99. Gem#Gem", -- Deadly Ornate Topaz
	[38548] = "99. Gem#Gem", -- Potent Ornate Topaz


	--[[ ! Sanctum ! ]]--
	-- Sort by Expansion descending, Covenant descending, Level descending

	-- Shadowlands (91)
	-- -- Venthyr (01)
	-- -- -- Ember Court (98)
	[181248] = "910198. Ember Court#Sanctum", -- Ancient Sinstone
	[176850] = "910198. Ember Court#Sanctum", -- Blank Invitation
	-- -- -- Sinfall (99)
	-- -- Night Fae (02)
	-- -- -- Queen's Conservatory (98)
	[177953] = "910298. Queen's Conservatory#Sanctum", -- Untamed Spirit (Quest)
	[178881] = "910298. Queen's Conservatory#Sanctum", -- Dutiful Spirit
	[178880] = "910298. Queen's Conservatory#Sanctum", -- Greater Dutiful Spirit
	[178879] = "910298. Queen's Conservatory#Sanctum", -- Divine Dutiful Spirit
	[178874] = "910298. Queen's Conservatory#Sanctum", -- Martial Spirit
	[178877] = "910298. Queen's Conservatory#Sanctum", -- Greater Martial Spirit
	[178878] = "910298. Queen's Conservatory#Sanctum", -- Divine Martial Spirit
	[177698] = "910298. Queen's Conservatory#Sanctum", -- Untamed Spirit
	[177699] = "910298. Queen's Conservatory#Sanctum", -- Greater Untamed Spirit
	[177700] = "910298. Queen's Conservatory#Sanctum", -- Divine Untamed Spirit
	[178882] = "910298. Queen's Conservatory#Sanctum", -- Prideful Spirit
	[178883] = "910298. Queen's Conservatory#Sanctum", -- Greater Prideful Spirit
	[178884] = "910298. Queen's Conservatory#Sanctum", -- Divine Prideful Spirit
	[176921] = "910298. Queen's Conservatory#Sanctum", -- Temporal Leaves
	[176922] = "910298. Queen's Conservatory#Sanctum", -- Wild Nightbloom
	[176832] = "910298. Queen's Conservatory#Sanctum", -- Wildseed Root Grain
	[183521] = "910298. Queen's Conservatory#Sanctum", -- Temporal Leaf Seeds
	[183520] = "910298. Queen's Conservatory#Sanctum", -- Wild Nightbloom Seeds
	[183522] = "910298. Queen's Conservatory#Sanctum", -- Wildseed Root Grain Seeds
	-- -- -- Heart of the Forest (99)
	-- -- Necrolord (03)
	-- -- -- Abominable Stitching (98)
	[183744] = "910398. Abominable Stitching#Sanctum", -- Superior Parts
	[178061] = "910398. Abominable Stitching#Sanctum", -- Malleable Flesh
	[183830] = "910398. Abominable Stitching#Sanctum", -- Do It Yourself Flag Kit
	[184304] = "910398. Abominable Stitching#Sanctum", -- Anima-Touched Weapon Fragments
	[183754] = "910398. Abominable Stitching#Sanctum", -- Stitchflesh's Design Notes
	-- -- -- Seat of the Primus (99)
	-- -- Kyrian (04)
	-- -- -- Path of Ascension (98)
	[178995] = "910498. Path of Ascension#Sanctum", -- Soul Mirror Shard
	[179009] = "910498. Path of Ascension#Sanctum", -- Tampered Anima Charger
	[179008] = "910498. Path of Ascension#Sanctum", -- Depleted Goliath Core
	[180477] = "910498. Path of Ascension#Sanctum", -- Elysian Feathers
	[180594] = "910498. Path of Ascension#Sanctum", -- Calloused Bone
	[180478] = "910498. Path of Ascension#Sanctum", -- Champion's Pelt
	[180595] = "910498. Path of Ascension#Sanctum", -- Nightforged Steel
	-- -- -- Elysian Hold (99)
	-- -- Covenant (01-04)
	[186472] = "91. Covenant#Sanctum", -- Wisps of Memory
	[187415] = "91. Covenant#Sanctum", -- Mind-Expanding Prism
	[188657] = "91. Covenant#Sanctum", -- Mind-Expanding Prism
	[187414] = "91. Covenant#Sanctum", -- Fractal Thoughtbinder
	[188656] = "91. Covenant#Sanctum", -- Fractal Thoughtbinder
	[188655] = "91. Covenant#Sanctum", -- Crystalline Memory Repository
	[187413] = "91. Covenant#Sanctum", -- Crystalline Memory Repository
	-- -- Anima (99)

	-- Battle for Azeroth (92)
	-- -- The Wind's Redemption/The Banshee's Wail (99)
	[162114] = "9299. War Ship#Sanctum",
	[162113] = "9299. War Ship#Sanctum",
	[165721] = "9299. War Ship#Sanctum",
	[162115] = "9299. War Ship#Sanctum",
	[162120] = "9299. War Ship#Sanctum",
	[162109] = "9299. War Ship#Sanctum",
	[162107] = "9299. War Ship#Sanctum",
	[162111] = "9299. War Ship#Sanctum",
	[162122] = "9299. War Ship#Sanctum",
	[162116] = "9299. War Ship#Sanctum",
	[162112] = "9299. War Ship#Sanctum",
	[162108] = "9299. War Ship#Sanctum",
	[162110] = "9299. War Ship#Sanctum",
	[165719] = "9299. War Ship#Sanctum",

	-- Legion (93)
	-- -- Order Hall
	[147348] = "93. Order Hall#Sanctum", -- Bulky Armor Set
	[147349] = "93. Order Hall#Sanctum", -- Spiked Armor Set
	[147350] = "93. Order Hall#Sanctum", -- Invincible Armor Set
	[136412] = "93. Order Hall#Sanctum", -- Heavy Armor Set
	[137207] = "93. Order Hall#Sanctum", -- Fortified Armor Set
	[137208] = "93. Order Hall#Sanctum", -- Indestructible Armor Set
	[138410] = "93. Order Hall#Sanctum", -- Summoning Portal
	[139428] = "93. Order Hall#Sanctum", -- A Master Plan
	[139781] = "93. Order Hall#Sanctum", -- Marin Noggenfogger's Lucky Coin
	[140760] = "93. Order Hall#Sanctum", -- Libram of Truth
	[140922] = "93. Order Hall#Sanctum", -- Imp Pact
	[140923] = "93. Order Hall#Sanctum", -- Ghoul Tombstone
	[140924] = "93. Order Hall#Sanctum", -- Ashtongue Beacon
	[140925] = "93. Order Hall#Sanctum", -- Enchanted Bark
	[140926] = "93. Order Hall#Sanctum", -- Bowmen's Orders
	[140927] = "93. Order Hall#Sanctum", -- Water Globe
	[140928] = "93. Order Hall#Sanctum", -- Ox Initiate's Pledge
	[140929] = "93. Order Hall#Sanctum", -- Squire's Oath
	[140931] = "93. Order Hall#Sanctum", -- Bandit Wanted Poster
	[140932] = "93. Order Hall#Sanctum", -- Earthen Mark
	[140933] = "93. Order Hall#Sanctum", -- Runed Aspirant's Band
	[141332] = "93. Order Hall#Sanctum", -- The Annals of Light and Shadow
	[142209] = "93. Order Hall#Sanctum", -- Dinner Invitation
	[143605] = "93. Order Hall#Sanctum", -- Strange Ball of Energy
	[143850] = "93. Order Hall#Sanctum", -- Summon Grimtotem Warrior
	[143852] = "93. Order Hall#Sanctum", -- Lucky Rabbit's Foot
	[140930] = "93. Order Hall#Sanctum", -- Acolyte's Vows
	[141028] = "93. Order Hall#Sanctum", -- Grimoire of Knowledge
	[188654] = "93. Order Hall#Sanctum", -- Grimoire of Knowledge
	[184688] = "93. Order Hall#Sanctum", -- Grimoire of Knowledge
	[188652] = "93. Order Hall#Sanctum", -- Grimoire of Knowledge
	[184687] = "93. Order Hall#Sanctum", -- Grimoire of Knowledge
	[184686] = "93. Order Hall#Sanctum", -- Grimoire of Knowledge
	[188651] = "93. Order Hall#Sanctum", -- Grimoire of Knowledge
	[188653] = "93. Order Hall#Sanctum", -- Grimoire of Knowledge
	[184684] = "93. Order Hall#Sanctum", -- Grimoire of Knowledge
	[184685] = "93. Order Hall#Sanctum", -- Grimoire of Knowledge
	[188650] = "93. Order Hall#Sanctum", -- Grimoire of Knowledge
	[153006] = "93. Order Hall#Sanctum", -- Grimoire of Lost Knowledge
	[165749] = "93. Order Hall#Sanctum",
	[147569] = "93. Order Hall#Sanctum",
	[139844] = "93. Order Hall#Sanctum",
	[152928] = "93. Order Hall#Sanctum",
	[152450] = "93. Order Hall#Sanctum",
	[139802] = "93. Order Hall#Sanctum",
	[139853] = "93. Order Hall#Sanctum",
	[152449] = "93. Order Hall#Sanctum",
	[152936] = "93. Order Hall#Sanctum",
	[139845] = "93. Order Hall#Sanctum",
	[139862] = "93. Order Hall#Sanctum",
	[139858] = "93. Order Hall#Sanctum",
	[147565] = "93. Order Hall#Sanctum",
	[138413] = "93. Order Hall#Sanctum",
	[139873] = "93. Order Hall#Sanctum",
	[140582] = "93. Order Hall#Sanctum",
	[139847] = "93. Order Hall#Sanctum",
	[139827] = "93. Order Hall#Sanctum",
	[139814] = "93. Order Hall#Sanctum",
	[139859] = "93. Order Hall#Sanctum",
	[147556] = "93. Order Hall#Sanctum",
	[139850] = "93. Order Hall#Sanctum",
	[139843] = "93. Order Hall#Sanctum",
	[165745] = "93. Order Hall#Sanctum",
	[139808] = "93. Order Hall#Sanctum",
	[152454] = "93. Order Hall#Sanctum",
	[139877] = "93. Order Hall#Sanctum",
	[139830] = "93. Order Hall#Sanctum",
	[139837] = "93. Order Hall#Sanctum",
	[139856] = "93. Order Hall#Sanctum",
	[147571] = "93. Order Hall#Sanctum",
	[147564] = "93. Order Hall#Sanctum",
	[165741] = "93. Order Hall#Sanctum",
	[139795] = "93. Order Hall#Sanctum",
	[147570] = "93. Order Hall#Sanctum",
	[139822] = "93. Order Hall#Sanctum",
	[139840] = "93. Order Hall#Sanctum",
	[140573] = "93. Order Hall#Sanctum",
	[139809] = "93. Order Hall#Sanctum",
	[139826] = "93. Order Hall#Sanctum",
	[139863] = "93. Order Hall#Sanctum",
	[139819] = "93. Order Hall#Sanctum",
	[147552] = "93. Order Hall#Sanctum",
	[139838] = "93. Order Hall#Sanctum",
	[147568] = "93. Order Hall#Sanctum",
	[152444] = "93. Order Hall#Sanctum",
	[147557] = "93. Order Hall#Sanctum",
	[152453] = "93. Order Hall#Sanctum",
	[139866] = "93. Order Hall#Sanctum",
	[139792] = "93. Order Hall#Sanctum",
	[139842] = "93. Order Hall#Sanctum",
	[139804] = "93. Order Hall#Sanctum",
	[139865] = "93. Order Hall#Sanctum",
	[147554] = "93. Order Hall#Sanctum",
	[140572] = "93. Order Hall#Sanctum",
	[139857] = "93. Order Hall#Sanctum",
	[139846] = "93. Order Hall#Sanctum",
	[139871] = "93. Order Hall#Sanctum",
	[147560] = "93. Order Hall#Sanctum",
	[147566] = "93. Order Hall#Sanctum",
	[152442] = "93. Order Hall#Sanctum",
	[139867] = "93. Order Hall#Sanctum",
	[165743] = "93. Order Hall#Sanctum",
	[152438] = "93. Order Hall#Sanctum",
	[139833] = "93. Order Hall#Sanctum",
	[139869] = "93. Order Hall#Sanctum",
	[139872] = "93. Order Hall#Sanctum",
	[139824] = "93. Order Hall#Sanctum",
	[139868] = "93. Order Hall#Sanctum",
	[152447] = "93. Order Hall#Sanctum",
	[139801] = "93. Order Hall#Sanctum",
	[165746] = "93. Order Hall#Sanctum",
	[165738] = "93. Order Hall#Sanctum",
	[139835] = "93. Order Hall#Sanctum",
	[152445] = "93. Order Hall#Sanctum",
	[139861] = "93. Order Hall#Sanctum",
	[165742] = "93. Order Hall#Sanctum",
	[165720] = "93. Order Hall#Sanctum",
	[139811] = "93. Order Hall#Sanctum",
	[139823] = "93. Order Hall#Sanctum",
	[139821] = "93. Order Hall#Sanctum",
	[139799] = "93. Order Hall#Sanctum",
	[152439] = "93. Order Hall#Sanctum",
	[165748] = "93. Order Hall#Sanctum",
	[140571] = "93. Order Hall#Sanctum",
	[165744] = "93. Order Hall#Sanctum",
	[139829] = "93. Order Hall#Sanctum",
	[139812] = "93. Order Hall#Sanctum",
	[147558] = "93. Order Hall#Sanctum",
	[152448] = "93. Order Hall#Sanctum",
	[152929] = "93. Order Hall#Sanctum",
	[152452] = "93. Order Hall#Sanctum",
	[139828] = "93. Order Hall#Sanctum",
	[147561] = "93. Order Hall#Sanctum",
	[139878] = "93. Order Hall#Sanctum",
	[165739] = "93. Order Hall#Sanctum",
	[139876] = "93. Order Hall#Sanctum",
	[152932] = "93. Order Hall#Sanctum",
	[152443] = "93. Order Hall#Sanctum",
	[139874] = "93. Order Hall#Sanctum",
	[152441] = "93. Order Hall#Sanctum",
	[139864] = "93. Order Hall#Sanctum",
	[139848] = "93. Order Hall#Sanctum",
	[152927] = "93. Order Hall#Sanctum",
	[139836] = "93. Order Hall#Sanctum",
	[152934] = "93. Order Hall#Sanctum",
	[152933] = "93. Order Hall#Sanctum",
	[147553] = "93. Order Hall#Sanctum",
	[147572] = "93. Order Hall#Sanctum",
	[139870] = "93. Order Hall#Sanctum",
	[139854] = "93. Order Hall#Sanctum",
	[139855] = "93. Order Hall#Sanctum",
	[139832] = "93. Order Hall#Sanctum",
	[139831] = "93. Order Hall#Sanctum",
	[147567] = "93. Order Hall#Sanctum",
	[147563] = "93. Order Hall#Sanctum",
	[165740] = "93. Order Hall#Sanctum",
	[140581] = "93. Order Hall#Sanctum",
	[139813] = "93. Order Hall#Sanctum",
	[139860] = "93. Order Hall#Sanctum",
	[165747] = "93. Order Hall#Sanctum",
	[139825] = "93. Order Hall#Sanctum",
	[139841] = "93. Order Hall#Sanctum",
	[139875] = "93. Order Hall#Sanctum",
	[139851] = "93. Order Hall#Sanctum",
	[139834] = "93. Order Hall#Sanctum",
	[147555] = "93. Order Hall#Sanctum",
	[140583] = "93. Order Hall#Sanctum",
	[152930] = "93. Order Hall#Sanctum",
	[152437] = "93. Order Hall#Sanctum",
	[152440] = "93. Order Hall#Sanctum",
	[152451] = "93. Order Hall#Sanctum",
	[139839] = "93. Order Hall#Sanctum",
	[152935] = "93. Order Hall#Sanctum",
	[139852] = "93. Order Hall#Sanctum",
	[147559] = "93. Order Hall#Sanctum",
	[139816] = "93. Order Hall#Sanctum",
	[139849] = "93. Order Hall#Sanctum",
	[152446] = "93. Order Hall#Sanctum",
	[138416] = "93. Order Hall#Sanctum",
	[152931] = "93. Order Hall#Sanctum",
	[151842] = "93. Order Hall#Sanctum", -- Krokul Armor Set
	[151843] = "93. Order Hall#Sanctum", -- Eredath Armor Set
	[151844] = "93. Order Hall#Sanctum", -- Xenedar Armor Set
	[152095] = "93. Order Hall#Sanctum", -- Krokul Ridgestalker
	[152096] = "93. Order Hall#Sanctum", -- Void-Purged Krokul
	[152097] = "93. Order Hall#Sanctum", -- Lightforged Bulwark

	-- Warlords of Draenor (94)
	-- -- Lunarfall/Frostwall
	[116913] = "94. Garrison#Sanctum", -- Peon's Mining Pick
	[116916] = "94. Garrison#Sanctum", -- Gorepetal's Gentle Grasp
	[118474] = "94. Garrison#Sanctum", -- Supreme Manual of Dance
	[120311] = "94. Garrison#Sanctum", -- The Blademaster's Necklace
	[118354] = "94. Garrison#Sanctum", -- Follower Retraining Certificate
	[122272] = "94. Garrison#Sanctum", -- Follower Ability Retraining Manual
	[114081] = "94. Garrison#Sanctum", -- Blackrock Weaponry
	[114131] = "94. Garrison#Sanctum", -- Power Overrun Weapon Enhancement
	[114129] = "94. Garrison#Sanctum", -- Striking Weapon Enhancement
	[114128] = "94. Garrison#Sanctum", -- Balanced Weapon Enhancement
	[114822] = "94. Garrison#Sanctum", -- Heavily Reinforced Armor Enhancement
	[114808] = "94. Garrison#Sanctum", -- Fortified Armor Enhancement
	[114745] = "94. Garrison#Sanctum", -- Braced Armor Enhancement
	[128307] = "94. Garrison#Sanctum", -- Draenic Weaponry
	[128308] = "94. Garrison#Sanctum", -- Draenic Armor Set
	[114622] = "94. Garrison#Sanctum", -- Goredrenched Weaponry
	[114746] = "94. Garrison#Sanctum", -- Goredrenched Armor Set
	[120313] = "94. Garrison#Sanctum", -- Sanketsu
	[128314] = "94. Garrison#Sanctum", -- Frozen Arms of a Hero
	[116394] = "94. Garrison#Sanctum", -- Outpost Building Assembly Notes
	[116395] = "94. Garrison#Sanctum", -- Comprehensive Outpost Construction Guide
	[118215] = "94. Garrison#Sanctum", -- Book of Garrison Blueprints
	[111812] = "94. Garrison#Sanctum", -- Alchemy Lab, Level 1
	[111929] = "94. Garrison#Sanctum", -- Alchemy Lab, Level 2
	[111930] = "94. Garrison#Sanctum", -- Alchemy Lab, Level 3
	[111968] = "94. Garrison#Sanctum", -- Barn, Level 2
	[111969] = "94. Garrison#Sanctum", -- Barn, Level 3
	[111956] = "94. Garrison#Sanctum", -- Barracks, Level 1
	[111970] = "94. Garrison#Sanctum", -- Barracks, Level 2
	[111971] = "94. Garrison#Sanctum", -- Barracks, Level 3
	[111966] = "94. Garrison#Sanctum", -- Dwarven Bunker, Level 2
	[111967] = "94. Garrison#Sanctum", -- Dwarven Bunker, Level 3
	[111817] = "94. Garrison#Sanctum", -- Enchanter's Study, Level 1
	[111972] = "94. Garrison#Sanctum", -- Enchanter's Study, Level 2
	[111973] = "94. Garrison#Sanctum", -- Enchanter's Study, Level 3
	[109258] = "94. Garrison#Sanctum", -- Engineering Works, Level 1
	[109256] = "94. Garrison#Sanctum", -- Engineering Works, Level 2
	[109257] = "94. Garrison#Sanctum", -- Engineering Works, Level 3
	[111927] = "94. Garrison#Sanctum", -- Fishing Shack, Level 2
	[111928] = "94. Garrison#Sanctum", -- Fishing Shack, Level 3
	[116248] = "94. Garrison#Sanctum", -- Frostwall Mines, Level 2
	[116249] = "94. Garrison#Sanctum", -- Frostwall Mines, Level 3
	[116431] = "94. Garrison#Sanctum", -- Frostwall Tavern, Level 2
	[116432] = "94. Garrison#Sanctum", -- Frostwall Tavern, Level 3
	[111814] = "94. Garrison#Sanctum", -- Gem Boutique, Level 1
	[111974] = "94. Garrison#Sanctum", -- Gem Boutique, Level 2
	[111975] = "94. Garrison#Sanctum", -- Gem Boutique, Level 3
	[111980] = "94. Garrison#Sanctum", -- Gladiator's Sanctum, Level 2
	[111981] = "94. Garrison#Sanctum", -- Gladiator's Sanctum, Level 3
	[111984] = "94. Garrison#Sanctum", -- Gnomish Gearworks, Level 2
	[111985] = "94. Garrison#Sanctum", -- Gnomish Gearworks, Level 3
	[116200] = "94. Garrison#Sanctum", -- Goblin Workshop, Level 2
	[116201] = "94. Garrison#Sanctum", -- Goblin Workshop, Level 3
	[109577] = "94. Garrison#Sanctum", -- Herb Garden, Level 2
	[111997] = "94. Garrison#Sanctum", -- Herb Garden, Level 3
	[109254] = "94. Garrison#Sanctum", -- Lumber Mill, Level 2
	[109255] = "94. Garrison#Sanctum", -- Lumber Mill, Level 3
	[109576] = "94. Garrison#Sanctum", -- Lunarfall Excavation, Level 2
	[111996] = "94. Garrison#Sanctum", -- Lunarfall Excavation, Level 3
	[107694] = "94. Garrison#Sanctum", -- Lunarfall Inn, Level 2
	[109065] = "94. Garrison#Sanctum", -- Lunarfall Inn, Level 3
	[109062] = "94. Garrison#Sanctum", -- Mage Tower, Level 2
	[109063] = "94. Garrison#Sanctum", -- Mage Tower, Level 3
	[111998] = "94. Garrison#Sanctum", -- Menagerie, Level 2
	[111999] = "94. Garrison#Sanctum", -- Menagerie, Level 3
	[111957] = "94. Garrison#Sanctum", -- Salvage Yard, Level 1
	[111976] = "94. Garrison#Sanctum", -- Salvage Yard, Level 2
	[111977] = "94. Garrison#Sanctum", -- Salvage Yard, Level 3
	[111815] = "94. Garrison#Sanctum", -- Scribe's Quarters, Level 1
	[111978] = "94. Garrison#Sanctum", -- Scribe's Quarters, Level 2
	[111979] = "94. Garrison#Sanctum", -- Scribe's Quarters, Level 3
	[116196] = "94. Garrison#Sanctum", -- Spirit Lodge, Level 2
	[116197] = "94. Garrison#Sanctum", -- Spirit Lodge, Level 3
	[112002] = "94. Garrison#Sanctum", -- Stables, Level 2
	[112003] = "94. Garrison#Sanctum", -- Stables, Level 3
	[111982] = "94. Garrison#Sanctum", -- Storehouse, Level 2
	[111983] = "94. Garrison#Sanctum", -- Storehouse, Level 3
	[111816] = "94. Garrison#Sanctum", -- Tailoring Emporium, Level 1
	[111992] = "94. Garrison#Sanctum", -- Tailoring Emporium, Level 2
	[111993] = "94. Garrison#Sanctum", -- Tailoring Emporium, Level 3
	[111813] = "94. Garrison#Sanctum", -- The Forge, Level 1
	[111990] = "94. Garrison#Sanctum", -- The Forge, Level 2
	[111991] = "94. Garrison#Sanctum", -- The Forge, Level 3
	[111818] = "94. Garrison#Sanctum", -- The Tannery, Level 1
	[111988] = "94. Garrison#Sanctum", -- The Tannery, Level 2
	[111989] = "94. Garrison#Sanctum", -- The Tannery, Level 3
	[111986] = "94. Garrison#Sanctum", -- Trading Post, Level 2
	[111987] = "94. Garrison#Sanctum", -- Trading Post, Level 3
	[116185] = "94. Garrison#Sanctum", -- War Mill, Level 2
	[116186] = "94. Garrison#Sanctum", -- War Mill, Level 3
	[128313] = "94. Garrison#Sanctum", -- Huge Ogre Cache
	[114781] = "94. Garrison#Sanctum", -- Timber


	--[[ ! Consumable ! ]]--

	--! Item Enhancement
	[172920] = "Item Enhancement", -- Optical Target Embiggener
	[172921] = "Item Enhancement", -- Infra-green Reflex Sight

	--! Glyph (01)
	-- -- Death Knight (01)
	[137274] = "0101. Glyph [c41e3a]Death Knight]#Consumable", -- Glyph of Cracked Ice
	[43551]  = "0101. Glyph [c41e3a]Death Knight]#Consumable", -- Glyph of Foul Menagerie
	[139271] = "0101. Glyph [c41e3a]Death Knight]#Consumable", -- Glyph of the Chilled Shell
	[139270] = "0101. Glyph [c41e3a]Death Knight]#Consumable", -- Glyph of the Crimson Shell
	[43535]  = "0101. Glyph [c41e3a]Death Knight]#Consumable", -- Glyph of the Geist
	[104099] = "0101. Glyph [c41e3a]Death Knight]#Consumable", -- Glyph of the Skeleton
	-- -- Demon Hunter (02)
	[129029] = "0102. Glyph [a330c9]Demon Hunter]#Consumable", -- Glyph of Crackling Flames
	[139417] = "0102. Glyph [a330c9]Demon Hunter]#Consumable", -- Glyph of Fallow Wings
	[129028] = "0102. Glyph [a330c9]Demon Hunter]#Consumable", -- Glyph of Fel Touched Souls
	[139435] = "0102. Glyph [a330c9]Demon Hunter]#Consumable", -- Glyph of Fel Wings
	[139437] = "0102. Glyph [a330c9]Demon Hunter]#Consumable", -- Glyph of Fel-Enemies
	[139362] = "0102. Glyph [a330c9]Demon Hunter]#Consumable", -- Glyph of Mana Touched Souls
	[139438] = "0102. Glyph [a330c9]Demon Hunter]#Consumable", -- Glyph of Shadow-Enemies
	[139436] = "0102. Glyph [a330c9]Demon Hunter]#Consumable", -- Glyph of Tattered Wings
	-- -- Druid (03)
	[136826] = "0103. Glyph [ff7c0a]Druid]#Consumable", -- Glyph of Autumnal Bloom
	[44922]  = "0103. Glyph [ff7c0a]Druid]#Consumable", -- Glyph of Stars
	[184100] = "0103. Glyph [ff7c0a]Druid]#Consumable", -- Glyph of the Aerial Chameleon
	[184097] = "0103. Glyph [ff7c0a]Druid]#Consumable", -- Glyph of the Aquatic Chameleon
	[136825] = "0103. Glyph [ff7c0a]Druid]#Consumable", -- Glyph of the Feral Chameleon
	[139278] = "0103. Glyph [ff7c0a]Druid]#Consumable", -- Glyph of the Forest Path
	[118061] = "0103. Glyph [ff7c0a]Druid]#Consumable", -- Glyph of the Sun
	[184096] = "0103. Glyph [ff7c0a]Druid]#Consumable", -- Glyph of the Swift Chameleon
	[43334]  = "0103. Glyph [ff7c0a]Druid]#Consumable", -- Glyph of the Ursol Chameleon
	[188164] = "0103. Glyph [ff7c0a]Druid]#Consumable", -- Glyph of the Wild Mushroom
	[143750] = "0103. Glyph [ff7c0a]Druid]#Consumable", -- Glyph of Twilight Bloom
	-- -- Hunter (04)
	[137249] = "0104. Glyph [aad372]Hunter]#Consumable", -- Glyph of Arachnophobia
	[170173] = "0104. Glyph [aad372]Hunter]#Consumable", -- Glyph of Dire Bees
	[43350]  = "0104. Glyph [aad372]Hunter]#Consumable", -- Glyph of Lesser Proportion
	[137250] = "0104. Glyph [aad372]Hunter]#Consumable", -- Glyph of Nesingwary's Nemeses
	[137269] = "0104. Glyph [aad372]Hunter]#Consumable", -- Glyph of Stellar Flare
	[139288] = "0104. Glyph [aad372]Hunter]#Consumable", -- Glyph of the Dire Stable
	[137267] = "0104. Glyph [aad372]Hunter]#Consumable", -- Glyph of the Goblin Anti-Grav Flare
	[137239] = "0104. Glyph [aad372]Hunter]#Consumable", -- Glyph of the Hook
	[137238] = "0104. Glyph [aad372]Hunter]#Consumable", -- Glyph of the Trident
	-- -- Mage (05)
	[42751]  = "0105. Glyph [3fc7eb]Mage]#Consumable", -- Glyph of Crittermorph
	[167539] = "0105. Glyph [3fc7eb]Mage]#Consumable", -- Glyph of Dalaran Brilliance
	[104105] = "0105. Glyph [3fc7eb]Mage]#Consumable", -- Glyph of Evaporation
	[172449] = "0105. Glyph [3fc7eb]Mage]#Consumable", -- Glyph of Lavish Servings
	[139352] = "0105. Glyph [3fc7eb]Mage]#Consumable", -- Glyph of Polymorphic Proportions
	[139348] = "0105. Glyph [3fc7eb]Mage]#Consumable", -- Glyph of Smolder
	[129019] = "0105. Glyph [3fc7eb]Mage]#Consumable", -- Glyph of Sparkles
	[170165] = "0105. Glyph [3fc7eb]Mage]#Consumable", -- Glyph of Steaming Fury
	[166664] = "0105. Glyph [3fc7eb]Mage]#Consumable", -- Glyph of Storm's Wake
	[170168] = "0105. Glyph [3fc7eb]Mage]#Consumable", -- Glyph of the Cold Waves
	[170164] = "0105. Glyph [3fc7eb]Mage]#Consumable", -- Glyph of the Dark Depths
	[166583] = "0105. Glyph [3fc7eb]Mage]#Consumable", -- Glyph of the Tides
	[104104] = "0105. Glyph [3fc7eb]Mage]#Consumable", -- Glyph of the Unbound Elemental
	-- -- Monk (06)
	[139338] = "0106. Glyph [00ff98]Monk]#Consumable", -- Glyph of Crackling Crane Lightning
	[129022] = "0106. Glyph [00ff98]Monk]#Consumable", -- Glyph of Crackling Ox Lightning
	[87881]  = "0106. Glyph [00ff98]Monk]#Consumable", -- Glyph of Crackling Tiger Lightning
	[87888]  = "0106. Glyph [00ff98]Monk]#Consumable", -- Glyph of Fighting Pose
	[87883]  = "0106. Glyph [00ff98]Monk]#Consumable", -- Glyph of Honor
	[87885]  = "0106. Glyph [00ff98]Monk]#Consumable", -- Glyph of Rising Tiger Kick
	[139339] = "0106. Glyph [00ff98]Monk]#Consumable", -- Glyph of Yu'lon's Grace
	-- -- Paladin (07)
	[43369]  = "0107. Glyph [f48cba]Paladin]#Consumable", -- Glyph of Fire From the Heavens
	[104108] = "0107. Glyph [f48cba]Paladin]#Consumable", -- Glyph of Pillar of Light
	[41100]  = "0107. Glyph [f48cba]Paladin]#Consumable", -- Glyph of the Luminous Charger
	[137293] = "0107. Glyph [f48cba]Paladin]#Consumable", -- Glyph of the Queen
	[143588] = "0107. Glyph [f48cba]Paladin]#Consumable", -- Glyph of the Trusted Steed
	[43366]  = "0107. Glyph [f48cba]Paladin]#Consumable", -- Glyph of Winged Vengeance
	[153177] = "0107. Glyph [f48cba]Paladin]#Consumable", -- Golden Charger's Bridle
	[153174] = "0107. Glyph [f48cba]Paladin]#Consumable", -- Valorous Charger's Bridle
	[153175] = "0107. Glyph [f48cba]Paladin]#Consumable", -- Vengeful Charger's Bridle
	[153176] = "0107. Glyph [f48cba]Paladin]#Consumable", -- Vigilant Charger's Bridle
	-- -- Priest (08)
	[149755] = "0108. Glyph [ffffff]Priest]#Consumable", -- Glyph of Angels
	[153036] = "0108. Glyph [ffffff]Priest]#Consumable", -- Glyph of Dark Absolution
	[129017] = "0108. Glyph [ffffff]Priest]#Consumable", -- Glyph of Ghostly Fade
	[104122] = "0108. Glyph [ffffff]Priest]#Consumable", -- Glyph of Inspired Hymns
	[43373]  = "0108. Glyph [ffffff]Priest]#Consumable", -- Glyph of Shackle Undead
	[77101]  = "0108. Glyph [ffffff]Priest]#Consumable", -- Glyph of Shadow
	[87392]  = "0108. Glyph [ffffff]Priest]#Consumable", -- Glyph of Shadowy Friends
	[79538]  = "0108. Glyph [ffffff]Priest]#Consumable", -- Glyph of the Heavens
	[153031] = "0108. Glyph [ffffff]Priest]#Consumable", -- Glyph of the Lightspawn
	[104120] = "0108. Glyph [ffffff]Priest]#Consumable", -- Glyph of the Sha
	[87277]  = "0108. Glyph [ffffff]Priest]#Consumable", -- Glyph of the Val'kyr
	[153033] = "0108. Glyph [ffffff]Priest]#Consumable", -- Glyph of the Voidling
	-- -- Rogue (09)
	[139358] = "0109. Glyph [fff468]Rogue]#Consumable", -- Glyph of Blackout
	[139442] = "0109. Glyph [fff468]Rogue]#Consumable", -- Glyph of Burnout
	[45768]  = "0109. Glyph [fff468]Rogue]#Consumable", -- Glyph of Disguise
	[129020] = "0109. Glyph [fff468]Rogue]#Consumable", -- Glyph of Flash Bang
	-- -- Shaman (10)
	[139289] = "0110. Glyph [0070dd]Shaman]#Consumable", -- Glyph of Critterhex
	[137289] = "0110. Glyph [0070dd]Shaman]#Consumable", -- Glyph of Flickering
	[104127] = "0110. Glyph [0070dd]Shaman]#Consumable", -- Glyph of Lingering Ancestors
	[137288] = "0110. Glyph [0070dd]Shaman]#Consumable", -- Glyph of Pebbles
	[104126] = "0110. Glyph [0070dd]Shaman]#Consumable", -- Glyph of Spirit Raptors
	[190378] = "0110. Glyph [0070dd]Shaman]#Consumable", -- Glyph of the Spectral Lupine
	[137287] = "0110. Glyph [0070dd]Shaman]#Consumable", -- Glyph of the Spectral Raptor
	[190380] = "0110. Glyph [0070dd]Shaman]#Consumable", -- Glyph of the Spectral Vulpine
	[43386]  = "0110. Glyph [0070dd]Shaman]#Consumable", -- Glyph of the Spectral Wolf
	-- -- Warlock (11)
	[45789]  = "0111. Glyph [8788ee]Warlock]#Consumable", -- Glyph of Crimson Banish
	[151538] = "0111. Glyph [8788ee]Warlock]#Consumable", -- Glyph of Ember Shards
	[129018] = "0111. Glyph [8788ee]Warlock]#Consumable", -- Glyph of Fel Imp
	[151542] = "0111. Glyph [8788ee]Warlock]#Consumable", -- Glyph of Fel-Touched Shards
	[42459]  = "0111. Glyph [8788ee]Warlock]#Consumable", -- Glyph of Felguard
	[151540] = "0111. Glyph [8788ee]Warlock]#Consumable", -- Glyph of Floating Shards
	[43394]  = "0111. Glyph [8788ee]Warlock]#Consumable", -- Glyph of Soulwell
	[137191] = "0111. Glyph [8788ee]Warlock]#Consumable", -- Glyph of the Inquisitor's Eye
	[139312] = "0111. Glyph [8788ee]Warlock]#Consumable", -- Glyph of the Observer
	[147119] = "0111. Glyph [8788ee]Warlock]#Consumable", -- Glyph of the Shadow Succubus
	[139310] = "0111. Glyph [8788ee]Warlock]#Consumable", -- Glyph of the Shivarra
	[139311] = "0111. Glyph [8788ee]Warlock]#Consumable", -- Glyph of the Voidlord
	[139315] = "0111. Glyph [8788ee]Warlock]#Consumable", -- Glyph of Wrathguard
	[147117] = "0111. Glyph [8788ee]Warlock]#Consumable", -- Orb of the Fel Temptress
	-- -- Warrior (12)
	[80588]  = "0112. Glyph [c69b6d]Warrior]#Consumable", -- Glyph of Burning Anger
	[141898] = "0112. Glyph [c69b6d]Warrior]#Consumable", -- Glyph of Falling Thunder
	[43398]  = "0112. Glyph [c69b6d]Warrior]#Consumable", -- Glyph of Gushing Wound
	[80587]  = "0112. Glyph [c69b6d]Warrior]#Consumable", -- Glyph of Hawk Feast
	[43400]  = "0112. Glyph [c69b6d]Warrior]#Consumable", -- Glyph of Mighty Victory
	[137188] = "0112. Glyph [c69b6d]Warrior]#Consumable", -- Glyph of the Blazing Savior
	[85221]  = "0112. Glyph [c69b6d]Warrior]#Consumable", -- Glyph of the Blazing Trail
	[104138] = "0112. Glyph [c69b6d]Warrior]#Consumable", -- Glyph of the Weaponmaster
	[49084]  = "0112. Glyph [c69b6d]Warrior]#Consumable", -- Glyph of Thunder Strike

	-- Contracts
	[187796] = "Consumable#Consumable", -- Contract: The Enlightened
	[165016] = "Consumable#Consumable", -- Contract: 7th Legion
	[153668] = "Consumable#Consumable", -- Contract: Champions of Azeroth
	[153662] = "Consumable#Consumable", -- Contract: Order of Embers
	[153661] = "Consumable#Consumable", -- Contract: Proudmoore Admiralty
	[172008] = "Consumable#Consumable", -- Contract: Rajani
	[168960] = "Consumable#Consumable", -- Contract: Rustbolt Resistance
	[153663] = "Consumable#Consumable", -- Contract: Storm's Wake
	[153665] = "Consumable#Consumable", -- Contract: Talanji's Expedition
	[165017] = "Consumable#Consumable", -- Contract: The Honorbound
	[168959] = "Consumable#Consumable", -- Contract: Unshackled
	[153667] = "Consumable#Consumable", -- Contract: Tortollan Seekers
	[172010] = "Consumable#Consumable", -- Contract: Uldum Accord
	[153666] = "Consumable#Consumable", -- Contract: Voldunai
	[153664] = "Consumable#Consumable", -- Contract: Zandalari Empire
	[168956] = "Consumable#Consumable", -- Contract: Ankoan
	[173062] = "Consumable#Consumable", -- Contract: Court of Harvesters
	[186522] = "Consumable#Consumable", -- Contract: Death's Advance
	[173051] = "Consumable#Consumable", -- Contract: The Ascended
	[175924] = "Consumable#Consumable", -- Contract: The Undying Army
	[173053] = "Consumable#Consumable", -- Contract: The Wild Hunt

	-- Misc
	[60680] = "Consumable#Consumable", -- S.A.F.E. "Parachute"
	[122128] = "Consumable#Consumable", -- Checkered Flag

	-- Ashran (99)

	-- Torghast (99)
	[168207] = "99. [00ff00]Torghast, Tower of the Damned]#Consumable", -- Plundered Anima Cell
	[184662] = "99. [00ff00]Torghast, Tower of the Damned]#Consumable", -- Requisitioned Anima Cell
	[170540] = "99. [00ff00]Torghast, Tower of the Damned]#Consumable", -- Ravenous Anima Cell
	[176409] = "99. [00ff00]Torghast, Tower of the Damned]#Consumable", -- Rejuvenating Siphoned Essence
	[176443] = "99. [00ff00]Torghast, Tower of the Damned]#Consumable", -- Fleeting Frenzy Potion
	[1119938] = "99. [00ff00]Torghast, Tower of the Damned]#Consumable", -- Mawrat Harness
	[186615] = "99. [00ff00]Torghast, Tower of the Damned]#Consumable", -- Mirror of the Conjured Twin
	[186614] = "99. [00ff00]Torghast, Tower of the Damned]#Consumable", -- Soul Jar
	[186636] = "99. [00ff00]Torghast, Tower of the Damned]#Consumable", -- Cage of Mawrats
	[186678] = "99. [00ff00]Torghast, Tower of the Damned]#Consumable", -- Mawforged Weapons Cache
	[186679] = "99. [00ff00]Torghast, Tower of the Damned]#Consumable", -- Scroll of Domination


	--[[ ! Miscellaneous ! ]]--
	-- Sort by priority

	--! Account Bound
	[142156] = "Account Bound", -- Order Resources Cache
	[150737] = "Account Bound", -- Abundant Order Resources Cache
	[187077] = "Account Bound", -- Packaged Soul Ash
	[191031] = "Account Bound", -- Packaged Soul Cinders
	[188198] = "Account Bound", -- Traveler's Anima Cache

	--! Currency (01)
	[128659] = "Currency#Miscellaneous", -- Merry Supplies
	[128658] = "Currency#Miscellaneous", -- Spooky Supplies
	[49927] = "Currency#Miscellaneous", -- Love Token
	[187219] = "Currency#Miscellaneous", -- Attendant's Token of Merit

	--! Reputation (02)
	[71088] = "02. Reputation#Miscellaneous", -- Bilgewater Writ of Commendation
	[45720] = "02. Reputation#Miscellaneous", -- Sen'jin Commendation Badge
	[70150] = "02. Reputation#Miscellaneous", -- Sen'jin Writ of Commendation
	[45714] = "02. Reputation#Miscellaneous", -- Darnassus Commendation Badge
	[70145] = "02. Reputation#Miscellaneous", -- Darnassus Writ of Commendation
	[45715] = "02. Reputation#Miscellaneous", -- Exodar Commendation Badge
	[70146] = "02. Reputation#Miscellaneous", -- Exodar Writ of Commendation
	[71087] = "02. Reputation#Miscellaneous", -- Gilneas Writ of Commendation
	[45716] = "02. Reputation#Miscellaneous", -- Gnomeregan Commendation Badge
	[70147] = "02. Reputation#Miscellaneous", -- Gnomeregan Writ of Commendation
	[45717] = "02. Reputation#Miscellaneous", -- Ironforge Commendation Badge
	[70148] = "02. Reputation#Miscellaneous", -- Ironforge Writ of Commendation
	[45719] = "02. Reputation#Miscellaneous", -- Orgrimmar Commendation Badge
	[70149] = "02. Reputation#Miscellaneous", -- Orgrimmar Writ of Commendation
	[45721] = "02. Reputation#Miscellaneous", -- Silvermoon Commendation Badge
	[70151] = "02. Reputation#Miscellaneous", -- Silvermoon Writ of Commendation
	[45585] = "02. Reputation#Miscellaneous", -- Silvermoon City Tabard
	[45718] = "02. Reputation#Miscellaneous", -- Stormwind Commendation Badge
	[70152] = "02. Reputation#Miscellaneous", -- Stormwind Writ of Commendation
	[45722] = "02. Reputation#Miscellaneous", -- Thunder Bluff Commendation Badge
	[70153] = "02. Reputation#Miscellaneous", -- Thunder Bluff Writ of Commendation
	[45723] = "02. Reputation#Miscellaneous", -- Undercity Commendation Badge
	[70154] = "02. Reputation#Miscellaneous", -- Undercity Writ of Commendation
	[21377] = "02. Reputation#Miscellaneous", -- Deadwood Headdress Feather
	[21383] = "02. Reputation#Miscellaneous", -- Winterfall Spirit Beads
	[24290] = "02. Reputation#Miscellaneous", -- Mature Spore Sack
	[32506] = "02. Reputation#Miscellaneous", -- Netherwing Egg
	[32427] = "02. Reputation#Miscellaneous", -- Netherwing Crystal
	[25433] = "02. Reputation#Miscellaneous", -- Obsidian Warbeads
	[29209] = "02. Reputation#Miscellaneous", -- Zaxxis Insignia
	[25416] = "02. Reputation#Miscellaneous", -- Oshu'gun Crystal Fragment
	[25463] = "02. Reputation#Miscellaneous", -- Pair of Ivory Tusks
	[44711] = "02. Reputation#Miscellaneous", -- Argent Crusade Commendation Badge
	[44713] = "02. Reputation#Miscellaneous", -- Ebon Blade Commendation Badge
	[43950] = "02. Reputation#Miscellaneous", -- Kirin Tor Commendation Badge
	[49702] = "02. Reputation#Miscellaneous", -- Sons of Hodir Commendation Badge
	[44710] = "02. Reputation#Miscellaneous", -- Wyrmrest Commendation Badge
	[86592] = "02. Reputation#Miscellaneous", -- Hozen Peace Pipe
	[79265] = "02. Reputation#Miscellaneous", -- Blue Feather
	[79266] = "02. Reputation#Miscellaneous", -- Jade Cat
	[79267] = "02. Reputation#Miscellaneous", -- Lovely Apple
	[79268] = "02. Reputation#Miscellaneous", -- Marsh Lily
	[79264] = "02. Reputation#Miscellaneous", -- Ruby Shard
	[89155] = "02. Reputation#Miscellaneous", -- Onyx Egg
	[118099] = "02. Reputation#Miscellaneous", -- Gorian Artifact Fragment
	[152961] = "02. Reputation#Miscellaneous", -- Greater Argussian Reach Insignia
	[152959] = "02. Reputation#Miscellaneous", -- Argussian Reach Insignia
	[147727] = "02. Reputation#Miscellaneous", -- Greater Legionfall Insignia
	[146949] = "02. Reputation#Miscellaneous", -- Legionfall Insignia
	[152956] = "02. Reputation#Miscellaneous", -- Greater Army of the Light Insignia
	[152958] = "02. Reputation#Miscellaneous", -- Army of the Light Insignia
	[138777] = "02. Reputation#Miscellaneous", -- Drowned Mana
	[147410] = "02. Reputation#Miscellaneous", -- Greater Court of Farondis Insignia
	[141989] = "02. Reputation#Miscellaneous", -- Greater Court of Farondis Insignia
	[146937] = "02. Reputation#Miscellaneous", -- Court of Farondis Insignia
	[139023] = "02. Reputation#Miscellaneous", -- Court of Farondis Insignia
	[141988] = "02. Reputation#Miscellaneous", -- Greater Dreamweaer Insignia
	[147411] = "02. Reputation#Miscellaneous", -- Greater Dreamweaer Insignia
	[139021] = "02. Reputation#Miscellaneous", -- Dreamweaver Insignia
	[146936] = "02. Reputation#Miscellaneous", -- Dreamweaver Insignia
	[141990] = "02. Reputation#Miscellaneous", -- Greater Highmountain Tribe Insignia
	[147412] = "02. Reputation#Miscellaneous", -- Greater Highmountain Tribe Insignia
	[139024] = "02. Reputation#Miscellaneous", -- Highmountain Tribe Insignia
	[146938] = "02. Reputation#Miscellaneous", -- Highmountain Tribe Insignia
	[147413] = "02. Reputation#Miscellaneous", -- Greater Nightfallen Insignia
	[141992] = "02. Reputation#Miscellaneous", -- Greater Nightfallen Insignia
	[139026] = "02. Reputation#Miscellaneous", -- Nightfallen Insignia
	[146940] = "02. Reputation#Miscellaneous", -- Nightfallen Insignia
	[141870] = "02. Reputation#Miscellaneous", -- Arcane Tablet of Falanar
	[147416] = "02. Reputation#Miscellaneous", -- Arcane Tablet of Falanar
	[140260] = "02. Reputation#Miscellaneous", -- Arcane Remnant of Falanar
	[147418] = "02. Reputation#Miscellaneous", -- Arcane Remnant of Falanar
	[141991] = "02. Reputation#Miscellaneous", -- Greater Wardens Insignia
	[147415] = "02. Reputation#Miscellaneous", -- Greater Wardens Insignia
	[139025] = "02. Reputation#Miscellaneous", -- Wardens Insignia
	[146939] = "02. Reputation#Miscellaneous", -- Wardens Insignia
	[141987] = "02. Reputation#Miscellaneous", -- Greater Valarjar Insignia
	[147414] = "02. Reputation#Miscellaneous", -- Greater Valarjar Insignia
	[139020] = "02. Reputation#Miscellaneous", -- Valarjar Insignia
	[146935] = "02. Reputation#Miscellaneous", -- Valarjar Insignia
	[142363] = "02. Reputation#Miscellaneous", -- Mark of Prey
	[146960] = "02. Reputation#Miscellaneous", -- Ancient Totem Fragment
	[146961] = "02. Reputation#Miscellaneous", -- Shiny Bauble
	[146848] = "02. Reputation#Miscellaneous", -- Framented Enchantment
	[146963] = "02. Reputation#Miscellaneous", -- Desecrated Seaweed
	[146959] = "02. Reputation#Miscellaneous", -- Corrupted Globule
	[146962] = "02. Reputation#Miscellaneous", -- Golden Minnow
	[170184] = "02. Reputation#Miscellaneous", -- Ancient Reefwalker Bark
	[163617] = "02. Reputation#Miscellaneous", -- Rusted Alliance Insignia
	[163217] = "02. Reputation#Miscellaneous", -- Azeroth's Tear
	[163614] = "02. Reputation#Miscellaneous", -- Exotic Spices
	[163616] = "02. Reputation#Miscellaneous", -- Dented Coin
	[173375] = "02. Reputation#Miscellaneous", -- Rajani Insignia
	[173736] = "02. Reputation#Miscellaneous", -- Layered Information Kernel of E-steam
	[163615] = "02. Reputation#Miscellaneous", -- Lost Sea Scroll
	[163619] = "02. Reputation#Miscellaneous", -- Golden Beetle
	[163621] = "02. Reputation#Miscellaneous", -- Rusted Horde Insignia
	[170079] = "02. Reputation#Miscellaneous", -- Abyssal Conch
	[169942] = "02. Reputation#Miscellaneous", -- Vibrant Sea Blossom
	[166501] = "02. Reputation#Miscellaneous", -- Soggy Page
	[173377] = "02. Reputation#Miscellaneous", -- Uldum Accord Insignia
	[163618] = "02. Reputation#Miscellaneous", -- Shimmering Shell
	[170081] = "02. Reputation#Miscellaneous", -- Abyssal Conch
	[169941] = "02. Reputation#Miscellaneous", -- Ceremonial Ankoan Scabbard
	[163620] = "02. Reputation#Miscellaneous", -- Island Flotsam

	-- Unbound Reputation (03)
	[20404] = "02. Reputation#Miscellaneous", -- Encrypted Twilight Text
	[18945] = "02. Reputation#Miscellaneous", -- Dark Iron Residue
	[24401] = "02. Reputation#Miscellaneous", -- Unidentified Plant Parts
	[129949] = "02. Reputation#Miscellaneous", -- Commendation of the Cenarion Expedition
	[129948] = "02. Reputation#Miscellaneous", -- Commendation of Honor Hold
	[129950] = "02. Reputation#Miscellaneous", -- Commendation of the Keepers of Time
	[24449] = "02. Reputation#Miscellaneous", -- Fertile Spores
	[24291] = "02. Reputation#Miscellaneous", -- Bog Lord Tendril
	[24246] = "02. Reputation#Miscellaneous", -- Sanguine Hibiscus
	[129945] = "02. Reputation#Miscellaneous", -- Commendation of The Consortium
	[129947] = "02. Reputation#Miscellaneous", -- Commendation of Thrallmar
	[129951] = "02. Reputation#Miscellaneous", -- Commendation of Lower City
	[29740] = "02. Reputation#Miscellaneous", -- Fel Armament
	[30809] = "02. Reputation#Miscellaneous", -- Mark of Sargeras
	[29425] = "02. Reputation#Miscellaneous", -- Mark of Kil'jaeden
	[29739] = "02. Reputation#Miscellaneous", -- Arcane Tome
	[30810] = "02. Reputation#Miscellaneous", -- Sunfury Signet
	[29426] = "02. Reputation#Miscellaneous", -- Firewing Signet
	[129946] = "02. Reputation#Miscellaneous", -- Commendation of The Sha'tar
	[129942] = "02. Reputation#Miscellaneous", -- Commendation of the Argent Crusade
	[129940] = "02. Reputation#Miscellaneous", -- Commendation of the Kirin Tor
	[129941] = "02. Reputation#Miscellaneous", -- Commendation of the Ebon Blade
	[129943] = "02. Reputation#Miscellaneous", -- Commendation of the Sons of Hodir
	[42780] = "02. Reputation#Miscellaneous", -- Relic of Ulduar
	[129944] = "02. Reputation#Miscellaneous", -- Commendation of the Wyrmrest Accord
	[129954] = "02. Reputation#Miscellaneous", -- Commendation of the Horde Expedition
	[129955] = "02. Reputation#Miscellaneous", -- Commendation of the Alliance Vanguard
	[63517] = "02. Reputation#Miscellaneous", -- Baradin's Wardens Commendation
	[133150] = "02. Reputation#Miscellaneous", -- Commendation of the Dragonmaw Clan
	[133152] = "02. Reputation#Miscellaneous", -- Commendation of the Guardians of Hyjal
	[63518] = "02. Reputation#Miscellaneous", -- Hellscream's Reach Commendation
	[133154] = "02. Reputation#Miscellaneous", -- Commendation of the Ramkahen
	[133159] = "02. Reputation#Miscellaneous", -- Commendation of The Earthen Ring
	[133160] = "02. Reputation#Miscellaneous", -- Commendation of Therazane
	[133151] = "02. Reputation#Miscellaneous", -- Commendation of the Wildhammer Clan
	[143943] = "02. Reputation#Miscellaneous", -- Commendation of the Dominance Offensive
	[143947] = "02. Reputation#Miscellaneous", -- Commendation of Emperor Shaohao
	[94227] = "02. Reputation#Miscellaneous", -- Stolen Golden Lotus Insignia
	[143937] = "02. Reputation#Miscellaneous", -- Commendation of the Golden Lotus
	[90816] = "02. Reputation#Miscellaneous", -- Relic of the Thunder King
	[90815] = "02. Reputation#Miscellaneous", -- Relic of Guo-Lai
	[143940] = "02. Reputation#Miscellaneous", -- Commendation of the Kirin Tor Offensive
	[143944] = "02. Reputation#Miscellaneous", -- Commendation of Operation: Shieldwall
	[143942] = "02. Reputation#Miscellaneous", -- Commendation of the Order of the Cloud Serpent
	[104286] = "02. Reputation#Miscellaneous", -- Quivering Firestorm Egg
	[94223] = "02. Reputation#Miscellaneous", -- Stolen Shado-Pan Insignia
	[143936] = "02. Reputation#Miscellaneous", -- Commendation of the Shado-Pan
	[143945] = "02. Reputation#Miscellaneous", -- Commendation of the Shado-Pan Assault
	[95496] = "02. Reputation#Miscellaneous", -- Shado-Pan Assault Insignia
	[143939] = "02. Reputation#Miscellaneous", -- Commendation of the Sunreaver Onslaught
	[94225] = "02. Reputation#Miscellaneous", -- Stolen Celestial Insignia
	[143938] = "02. Reputation#Miscellaneous", -- Commendation of The August Celestials
	[94226] = "02. Reputation#Miscellaneous", -- Stolen Klaxxi Insignia
	[143935] = "02. Reputation#Miscellaneous", -- Commendation of The Klaxxi
	[143946] = "02. Reputation#Miscellaneous", -- Commendation of The Anglers
	[143941] = "02. Reputation#Miscellaneous", -- Commendation of The Tillers
	[128315] = "02. Reputation#Miscellaneous", -- Medallion of the Legion
	[167924] = "02. Reputation#Miscellaneous", -- Commendation of the Arakkoa Outcasts
	[117492] = "02. Reputation#Miscellaneous", -- Relic of Rukhmar
	[167929] = "02. Reputation#Miscellaneous", -- Commendation of the Council of Exarchs
	[167928] = "02. Reputation#Miscellaneous", -- Commendation of the Frostwolf Orcs
	[168018] = "02. Reputation#Miscellaneous", -- Commendation of the Hand of the Prophet
	[167930] = "02. Reputation#Miscellaneous", -- Commendation of the Laughing Skull Orcs
	[167925] = "02. Reputation#Miscellaneous", -- Commendation of the Order of the Awakened
	[167932] = "02. Reputation#Miscellaneous", -- Commendation of the Sha'tari Defense
	[167926] = "02. Reputation#Miscellaneous", -- Commendation of the Steamwheedle Preservation Society
	[118100] = "02. Reputation#Miscellaneous", -- Highmaul Relic
	[118654] = "02. Reputation#Miscellaneous", -- Aogexon's Fang
	[118655] = "02. Reputation#Miscellaneous", -- Bergruu's Horn
	[118656] = "02. Reputation#Miscellaneous", -- Dekorhan's Tusk
	[118657] = "02. Reputation#Miscellaneous", -- Direhoof's Hide
	[118658] = "02. Reputation#Miscellaneous", -- Gagrog's Skull
	[118659] = "02. Reputation#Miscellaneous", -- Mu'gra's Head
	[118660] = "02. Reputation#Miscellaneous", -- Thek'talon's Talon
	[118661] = "02. Reputation#Miscellaneous", -- Xelganak's Stinger
	[120172] = "02. Reputation#Miscellaneous", -- Vileclaw's Claw
	[167927] = "02. Reputation#Miscellaneous", -- Commendation of the Saberstalkers
	[168017] = "02. Reputation#Miscellaneous", -- Commendation of Vol'jin's Headhunters
	[153113] = "02. Reputation#Miscellaneous", -- Demon's Soulstone
	[152954] = "02. Reputation#Miscellaneous", -- Greater Argussian Reach Insignia
	[152960] = "02. Reputation#Miscellaneous", -- Argussian Reach Insignia
	[152464] = "02. Reputation#Miscellaneous", -- Greater Legionfall Insignia
	[146950] = "02. Reputation#Miscellaneous", -- Legionfall Insignia
	[152955] = "02. Reputation#Miscellaneous", -- Greater Army of the Light Insignia
	[152957] = "02. Reputation#Miscellaneous", -- Army of the Light Insignia
	[150927] = "02. Reputation#Miscellaneous", -- Greater Court of Farondis Insignia
	[146943] = "02. Reputation#Miscellaneous", -- Court of Farondis Insignia
	[141340] = "02. Reputation#Miscellaneous", -- Court of Farondis Insignia
	[150926] = "02. Reputation#Miscellaneous", -- Greater Dreamweaer Insignia
	[141339] = "02. Reputation#Miscellaneous", -- Dreamweaver Insignia
	[146942] = "02. Reputation#Miscellaneous", -- Dreamweaver Insignia
	[150928] = "02. Reputation#Miscellaneous", -- Greater Highmountain Tribe Insignia
	[141341] = "02. Reputation#Miscellaneous", -- Highmountain Tribe Insignia
	[146944] = "02. Reputation#Miscellaneous", -- Highmountain Tribe Insignia
	[150930] = "02. Reputation#Miscellaneous", -- Greater Nightfallen Insignia
	[141343] = "02. Reputation#Miscellaneous", -- Nightfallen Insignia
	[146946] = "02. Reputation#Miscellaneous", -- Nightfallen Insignia
	[150929] = "02. Reputation#Miscellaneous", -- Greater Wardens Insignia
	[141342] = "02. Reputation#Miscellaneous", -- Wardens Insignia
	[146945] = "02. Reputation#Miscellaneous", -- Wardens Insignia
	[150925] = "02. Reputation#Miscellaneous", -- Greater Valarjar Insignia
	[141338] = "02. Reputation#Miscellaneous", -- Valarjar Insignia
	[146941] = "02. Reputation#Miscellaneous", -- Valarjar Insignia
	[174507] = "02. Reputation#Miscellaneous", -- Fallen Soldier's Insignia
	[174502] = "02. Reputation#Miscellaneous", -- Tear of Azeroth
	[168822] = "02. Reputation#Miscellaneous", -- Thin Jelly
	[168825] = "02. Reputation#Miscellaneous", -- Rich Jelly
	[168828] = "02. Reputation#Miscellaneous", -- Royal Jelly
	[174503] = "02. Reputation#Miscellaneous", -- Exotically Spiced Carrot
	[174504] = "02. Reputation#Miscellaneous", -- Proudmoore War Copper
	[173374] = "02. Reputation#Miscellaneous", -- Rajani Insignia
	[168497] = "02. Reputation#Miscellaneous", -- Rustbolt Resistance Insignia
	[174521] = "02. Reputation#Miscellaneous", -- Transferable Kernel of E-steam
	[174505] = "02. Reputation#Miscellaneous", -- Tide-Speaker's Tome
	[174506] = "02. Reputation#Miscellaneous", -- Golden Insect Wings
	[174508] = "02. Reputation#Miscellaneous", -- Fallen Soldier's Insignia
	[174523] = "02. Reputation#Miscellaneous", -- Waveswept Abyssal Conch
	[174519] = "02. Reputation#Miscellaneous", -- Verdant Hills of Chokingvine - Page 17
	[173376] = "02. Reputation#Miscellaneous", -- Uldum Accord Insignia
	[174501] = "02. Reputation#Miscellaneous", -- Ornate Voldunai Jewelry
	[174518] = "02. Reputation#Miscellaneous", -- Jani Figurine
	[174522] = "02. Reputation#Miscellaneous", -- Waveswept Abyssal Conch
	[191022] = "02. Reputation#Miscellaneous", -- Eternal Curio

	--! Toy
	[86591] = "Toy#Miscellaneous", -- Magic Banana
	[128453] = "Toy#Miscellaneous", -- Saberstalkers Battle Standard
	[163604] = "Toy#Miscellaneous", -- Net-o-Matic 5000
	[116114] = "Toy#Miscellaneous", -- Prestige Card: The Turn
	[179295] = "Toy#Miscellaneous", -- Squeaky Bat
	-- Consumable
	[190740] = "Toy#Miscellaneous", -- Automa Integration
	[49884] = "Toy#Miscellaneous", -- Kaja'Cola
	[133545] = "Toy#Miscellaneous", -- "New!" Kaja'Cola
	[187418] = "Toy#Miscellaneous", -- Evolving Mawshroom
	[13508] = "Toy#Miscellaneous", -- Eye of Arachnida
	[118414] = "Toy#Miscellaneous", -- Awesomefish
	[127837] = "Toy#Miscellaneous", -- Draught of Raw Magic
	[187244] = "Toy#Miscellaneous", -- Questionable Mawshrooms
	[190739] = "Toy#Miscellaneous", -- Provis Wax
	[104304] = "Toy#Miscellaneous", -- Blizzard Stone
	[104306] = "Toy#Miscellaneous", -- Sunset Stone
	[104305] = "Toy#Miscellaneous", -- Ashen Stone
	[104303] = "Toy#Miscellaneous", -- Rain Stone
	[124640] = "Toy#Miscellaneous", -- Inky Black Potion
	[170379] = "Toy#Miscellaneous", -- Sunwarmed Sand
	[104316] = "Toy#Miscellaneous", -- Spectral Grog
	[8529] = "Toy#Miscellaneous", -- Noggenfogger Elixir
	[104111] = "Toy#Miscellaneous", -- Elixir of Wandering Spirits
	[43572] = "Toy#Miscellaneous", -- Magic Eater
	[112321] = "Toy#Miscellaneous", -- Enchanted Dust
	[46779] = "Toy#Miscellaneous", -- Path of Cenarius
	[119435] = "Toy#Miscellaneous", -- Path of Flame
	[103631] = "Toy#Miscellaneous", -- Lucky Path of Cenarius
	[45047] = "Toy#Miscellaneous", -- Sandbox Tiger
	[92959] = "Toy#Miscellaneous", -- Darkmoon "Cougar"
	[92966] = "Toy#Miscellaneous", -- Darkmoon "Dragon"
	[92967] = "Toy#Miscellaneous", -- Darkmoon "Gryphon"
	[92968] = "Toy#Miscellaneous", -- Darkmoon "Murloc"
	[92958] = "Toy#Miscellaneous", -- Darkmoon "Nightsaber"
	[92969] = "Toy#Miscellaneous", -- Darkmoon "Rocket"
	[92956] = "Toy#Miscellaneous", -- Darkmoon "Snow Leopard"
	[77158] = "Toy#Miscellaneous", -- Darkmoon "Tiger"
	[92970] = "Toy#Miscellaneous", -- Darkmoon "Wyvern"
	[78883] = "Toy#Miscellaneous", -- Darkmoon Firewater (Size)
	[21745] = "Toy#Miscellaneous", -- Elder's Moonstone
	[128506] = "Toy#Miscellaneous", -- Celebration Wand - Gnoll
	[128505] = "Toy#Miscellaneous", -- Celebration Wand - Murloc
	[147883] = "Toy#Miscellaneous", -- Celebration Wand - Quilboar
	[147882] = "Toy#Miscellaneous", -- Celebration Wand - Trogg
	[70725] = "Toy#Miscellaneous", -- Hallowed Hunter Wand - Squashling
	[116851] = "Toy#Miscellaneous", -- Hallowed Wand - Abomination
	[139004] = "Toy#Miscellaneous", -- Hallowed Wand - Banshee
	[20410] = "Toy#Miscellaneous", -- Hallowed Wand - Bat
	[128645] = "Toy#Miscellaneous", -- Hallowed Wand - Gargoyle
	[116853] = "Toy#Miscellaneous", -- Hallowed Wand - Geist
	[20409] = "Toy#Miscellaneous", -- Hallowed Wand - Ghost
	[116850] = "Toy#Miscellaneous", -- Hallowed Wand - Ghoul
	[20399] = "Toy#Miscellaneous", -- Hallowed Wand - Leper Gnome
	[128646] = "Toy#Miscellaneous", -- Hallowed Wand - Nerubian
	[20398] = "Toy#Miscellaneous", -- Hallowed Wand - Ninja
	[20397] = "Toy#Miscellaneous", -- Hallowed Wand - Pirate
	[20413] = "Toy#Miscellaneous", -- Hallowed Wand - Random
	[20411] = "Toy#Miscellaneous", -- Hallowed Wand - Skeleton
	[116848] = "Toy#Miscellaneous", -- Hallowed Wand - Slime
	[116854] = "Toy#Miscellaneous", -- Hallowed Wand - Spider
	[128644] = "Toy#Miscellaneous", -- Hallowed Wand - Wight
	[20414] = "Toy#Miscellaneous", -- Hallowed Wand - Wisp
	[44792] = "Toy#Miscellaneous", -- Blossoming Branch
	[128507] = "Toy#Miscellaneous", -- Inflatable Thunderfury, Blessed Blade of the Windseeker
	[128643] = "Toy#Miscellaneous", -- Exquisite Costume Set: "Deathwing"
	[128510] = "Toy#Miscellaneous", -- Exquisite Costume Set: "Edwin VanCleef"
	[138990] = "Toy#Miscellaneous", -- Exquisite Costume Set: "Grommash"
	[116828] = "Toy#Miscellaneous", -- Exquisite Costume Set: "The Lich King"
	[151268] = "Toy#Miscellaneous", -- Exquisite Costume Set: "Xavius"
	[186697] = "Toy#Miscellaneous", -- Blossom Burst
	[186701] = "Toy#Miscellaneous", -- Glory Burst
	[186700] = "Toy#Miscellaneous", -- Marrow Burst
	[186698] = "Toy#Miscellaneous", -- Torch Burst
	[186699] = "Toy#Miscellaneous", -- Widow Burst
	[63246] = "Toy#Miscellaneous", -- Origami Beetle
	[62238] = "Toy#Miscellaneous", -- Origami Rock
	[62239] = "Toy#Miscellaneous", -- Origami Slime
	[87647] = "Toy#Miscellaneous", -- Origami Crane
	[87648] = "Toy#Miscellaneous", -- Origami Frog
	[44623] = "Toy#Miscellaneous", -- Bottle of Dalaran Red
	[44621] = "Toy#Miscellaneous", -- Bottle of Dalaran White
	[44625] = "Toy#Miscellaneous", -- Bottle of Aged Dalaran Red
	[44627] = "Toy#Miscellaneous", -- Bottle of Peaked Dalaran Red
	[44626] = "Toy#Miscellaneous", -- Cask of Aged Dalaran Red
	[44622] = "Toy#Miscellaneous", -- Cask of Dalaran White
	[44629] = "Toy#Miscellaneous", -- Cask of Peaked Dalaran Red
	[141318] = "Toy#Miscellaneous", -- Angry Post
	[141319] = "Toy#Miscellaneous", -- Happy Post
	[141320] = "Toy#Miscellaneous", -- Thoughtful Post
	-- Firework
	[74142] = "Toy#Miscellaneous", -- Darkmoon Firework
	-- Equipment
	[12185] = "Toy#Miscellaneous", -- Bloodsail Admiral's Hat
	[21579] = "Toy#Miscellaneous", -- Vanquished Tentacle of C'Thun
	[86570] = "Toy#Miscellaneous", -- Crate of Kidnapped Puppies
	[19979] = "Toy#Miscellaneous", -- Hook of the Master Angler
	[86572] = "Toy#Miscellaneous", -- Terracotta Fragment
	[117566] = "Toy#Miscellaneous", -- Heavy Frostwolf Shroud
	-- Battle Pets
	[71153] = "Toy [Battle Pets]#Miscellaneous", -- Magical Pet Biscuit
	[35223] = "Toy [Battle Pets]#Miscellaneous", -- Papa Hummel's Old-Fashioned Pet Biscuit
	[89906] = "Toy [Battle Pets]#Miscellaneous", -- Magical Mini-Treat
	[163205] = "Toy [Battle Pets]#Miscellaneous", -- Ghostly Pet Biscuit
	[43626] = "Toy [Battle Pets]#Miscellaneous", -- Happy Pet Snack
	[139036] = "Toy [Battle Pets]#Miscellaneous", -- Ominous Pet Treat
	[169944] = "Toy [Battle Pets]#Miscellaneous", -- Minuscule Fez
	[180405] = "Toy [Battle Pets]#Miscellaneous", -- Rusty Gargon Chain

	-- Battle Pets
	[116415] = "Battle Pets#Miscellaneous", -- Shiny Pet Charm
	[163036] = "Battle Pets#Miscellaneous", -- Polished Pet Charm
	[92679] = "Battle Pets#Miscellaneous", -- Flawless Aquatic Battle-Stone
	[92741] = "Battle Pets#Miscellaneous", -- Flawless Battle-Stone
	[92675] = "Battle Pets#Miscellaneous", -- Flawless Beast Battle-Stone
	[92676] = "Battle Pets#Miscellaneous", -- Flawless Critter Battle-Stone
	[92683] = "Battle Pets#Miscellaneous", -- Flawless Dragonkin Battle-Stone
	[92665] = "Battle Pets#Miscellaneous", -- Flawless Elemental Battle-Stone
	[92677] = "Battle Pets#Miscellaneous", -- Flawless Flying Battle-Stone
	[92682] = "Battle Pets#Miscellaneous", -- Flawless Humanoid Battle-Stone
	[92678] = "Battle Pets#Miscellaneous", -- Flawless Magic Battle-Stone
	[92680] = "Battle Pets#Miscellaneous", -- Flawless Mechanical Battle-Stone
	[92681] = "Battle Pets#Miscellaneous", -- Flawless Undead Battle-Stone
	[137391] = "Battle Pets#Miscellaneous", -- Immaculate Aquatic Battle-Stone
	[137627] = "Battle Pets#Miscellaneous", -- Immaculate Battle-Stone
	[137394] = "Battle Pets#Miscellaneous", -- Immaculate Beast Battle-Stone
	[137393] = "Battle Pets#Miscellaneous", -- Immaculate Critter Battle-Stone
	[137387] = "Battle Pets#Miscellaneous", -- Immaculate Dragonkin Battle-Stone
	[137395] = "Battle Pets#Miscellaneous", -- Immaculate Elemental Battle-Stone
	[137396] = "Battle Pets#Miscellaneous", -- Immaculate Flying Battle-Stone
	[137388] = "Battle Pets#Miscellaneous", -- Immaculate Humanoid Battle-Stone
	[137392] = "Battle Pets#Miscellaneous", -- Immaculate Magic Battle-Stone
	[137390] = "Battle Pets#Miscellaneous", -- Immaculate Mechanical Battle-Stone
	[137389] = "Battle Pets#Miscellaneous", -- Immaculate Undead Battle-Stone
	[98715] = "Battle Pets#Miscellaneous", -- Marked Flawless Battle-Stone
	[92742] = "Battle Pets#Miscellaneous", -- Polished Battle-Stone
	[98112] = "Battle Pets#Miscellaneous", -- Lesser Pet Treat
	[98114] = "Battle Pets#Miscellaneous", -- Pet Treat
	[116424] = "Battle Pets#Miscellaneous", -- Aquatic Battle-Training Stone
	[116374] = "Battle Pets#Miscellaneous", -- Beast Battle-Training Stone
	[116418] = "Battle Pets#Miscellaneous", -- Critter Battle-Training Stone
	[116419] = "Battle Pets#Miscellaneous", -- Dragonkin Battle-Training Stone
	[116420] = "Battle Pets#Miscellaneous", -- Elemental Battle-Training Stone
	[127755] = "Battle Pets#Miscellaneous", -- Fel-Touched Battle-Training Stone
	[116429] = "Battle Pets#Miscellaneous", -- Flawless Battle-Training Stone
	[116421] = "Battle Pets#Miscellaneous", -- Flying Battle-Training Stone
	[116416] = "Battle Pets#Miscellaneous", -- Humanoid Battle-Training Stone
	[116422] = "Battle Pets#Miscellaneous", -- Magic Battle-Training Stone
	[116417] = "Battle Pets#Miscellaneous", -- Mechanical Battle-Training Stone
	[122457] = "Battle Pets#Miscellaneous", -- Ultimate Battle-Training Stone
	[116423] = "Battle Pets#Miscellaneous", -- Undead Battle-Training Stone


	--[[ ! Container ! ]]--
	-- Sort by priority

	--! Lockbox
	[16882] = "95. {ParagonReputation_Bag} [00ff00]Lockbox]|ROGUE|80. [ff0000]Lockbox]#Container", -- Battered Junkbox
	[4632] = "95. {ParagonReputation_Bag} [00ff00]Lockbox]|ROGUE|80. [ff0000]Lockbox]#Container", -- Ornate Bronze Lockbox
	[4633] = "95. {ParagonReputation_Bag} [00ff00]Lockbox]|ROGUE|80. [ff0000]Lockbox]#Container", -- Heavy Bronze Lockbox
	[16883] = "95. {ParagonReputation_Bag} [00ff00]Lockbox]|ROGUE|80. [ff0000]Lockbox]#Container", -- Worn Junkbox
	[4634] = "95. {ParagonReputation_Bag} [00ff00]Lockbox]|ROGUE|80. [ff0000]Lockbox]#Container", -- Iron Lockbox
	[4636] = "95. {ParagonReputation_Bag} [00ff00]Lockbox]|ROGUE|80. [ff0000]Lockbox]#Container", -- Strong Iron Lockbox
	[16884] = "95. {ParagonReputation_Bag} [00ff00]Lockbox]|ROGUE|80. [ff0000]Lockbox]#Container", -- Sturdy Junkbox
	[4637] = "95. {ParagonReputation_Bag} [00ff00]Lockbox]|ROGUE|80. [ff0000]Lockbox]#Container", -- Steel Lockbox
	[4638] = "95. {ParagonReputation_Bag} [00ff00]Lockbox]|ROGUE|80. [ff0000]Lockbox]#Container", -- Reinforced Steel Lockbox
	[16885] = "95. {ParagonReputation_Bag} [00ff00]Lockbox]|ROGUE|80. [ff0000]Lockbox]#Container", -- Heavy Junkbox
	[5758] = "95. {ParagonReputation_Bag} [00ff00]Lockbox]|ROGUE|80. [ff0000]Lockbox]#Container", -- Mithril Lockbox
	[5759] = "95. {ParagonReputation_Bag} [00ff00]Lockbox]|ROGUE|80. [ff0000]Lockbox]#Container", -- Thorium Lockbox
	[29569] = "95. {ParagonReputation_Bag} [00ff00]Lockbox]|ROGUE|80. [ff0000]Lockbox]#Container", -- Strong Junkbox
	[5760] = "95. {ParagonReputation_Bag} [00ff00]Lockbox]|ROGUE|80. [ff0000]Lockbox]#Container", -- Eternium Lockbox
	[31952] = "95. {ParagonReputation_Bag} [00ff00]Lockbox]|ROGUE|80. [ff0000]Lockbox]#Container", -- Khorium Lockbox
	[43575] = "95. {ParagonReputation_Bag} [00ff00]Lockbox]|ROGUE|80. [ff0000]Lockbox]#Container", -- Reinforced Junkbox
	[43622] = "95. {ParagonReputation_Bag} [00ff00]Lockbox]|ROGUE|80. [ff0000]Lockbox]#Container", -- Froststeel Lockbox
	[43624] = "95. {ParagonReputation_Bag} [00ff00]Lockbox]|ROGUE|80. [ff0000]Lockbox]#Container", -- Titanium Lockbox
	[45986] = "95. {ParagonReputation_Bag} [00ff00]Lockbox]|ROGUE|80. [ff0000]Lockbox]#Container", -- Tiny Titanium Lockbox
	[63349] = "95. {ParagonReputation_Bag} [00ff00]Lockbox]|ROGUE|80. [ff0000]Lockbox]#Container", -- Flame-Scarred Junkbox
	[68729] = "95. {ParagonReputation_Bag} [00ff00]Lockbox]|ROGUE|80. [ff0000]Lockbox]#Container", -- Elementium Lockbox
	[88165] = "95. {ParagonReputation_Bag} [00ff00]Lockbox]|ROGUE|80. [ff0000]Lockbox]#Container", -- Vine-Cracked Junkbox
	[88567] = "95. {ParagonReputation_Bag} [00ff00]Lockbox]|ROGUE|80. [ff0000]Lockbox]#Container", -- Ghost Iron Lockbox
	[106895] = "95. {ParagonReputation_Bag} [00ff00]Lockbox]|ROGUE|80. [ff0000]Lockbox]#Container", -- Iron-Bound Junkbox
	[116920] = "95. {ParagonReputation_Bag} [00ff00]Lockbox]|ROGUE|80. [ff0000]Lockbox]#Container", -- True Steel Lockbox
	[121331] = "95. {ParagonReputation_Bag} [00ff00]Lockbox]|ROGUE|80. [ff0000]Lockbox]#Container", -- Leystone Lockbox
	[169475] = "95. {ParagonReputation_Bag} [00ff00]Lockbox]|ROGUE|80. [ff0000]Lockbox]#Container", -- Barnacled Lockbox
	[180533] = "95. {ParagonReputation_Bag} [00ff00]Lockbox]|ROGUE|80. [ff0000]Lockbox]#Container", -- Solenium Lockbox
	[180532] = "95. {ParagonReputation_Bag} [00ff00]Lockbox]|ROGUE|80. [ff0000]Lockbox]#Container", -- Oxxein Lockbox
	[180522] = "95. {ParagonReputation_Bag} [00ff00]Lockbox]|ROGUE|80. [ff0000]Lockbox]#Container", -- Phaedrum Lockbox
	[179311] = "95. {ParagonReputation_Bag} [00ff00]Lockbox]|ROGUE|80. [ff0000]Lockbox]#Container", -- Sinvyr Lockbox
	[186161] = "95. {ParagonReputation_Bag} [00ff00]Lockbox]|ROGUE|80. [ff0000]Lockbox]#Container", -- Stygian Lockbox
	[188787] = "95. {ParagonReputation_Bag} [00ff00]Lockbox]|ROGUE|80. [ff0000]Lockbox]#Container", -- Locked Broker Luggage

	--! Pieces (98)
	[171839] = "Pieces", -- Elethium Nugget
	[171835] = "Pieces", -- Solenium Nugget
	[171836] = "Pieces", -- Oxxein Nugget
	[171837] = "Pieces", -- Phaedrum Nugget
	[171838] = "Pieces", -- Sinvyr Nugget
	[171834] = "Pieces", -- Laestrite Nugget
	[109992] = "Pieces", -- Blackrock Fragment
	[109991] = "Pieces", -- True Iron Nugget
	[108309] = "Pieces", -- Pyrite Ore Nugget
	[108308] = "Pieces", -- Elementium Ore Nugget
	[108391] = "Pieces", -- Titanium Ore Nugget
	[108307] = "Pieces", -- Obsidium Ore Nugget
	[108305] = "Pieces", -- Cobalt Ore Nugget
	[108306] = "Pieces", -- Saronite Ore Nugget
	[108304] = "Pieces", -- Khorium Ore Nugget
	[108303] = "Pieces", -- Eternium Ore Nugget
	[108302] = "Pieces", -- Adamantite Ore Nugget
	[108301] = "Pieces", -- Fel Iron Ore Nugget
	[108298] = "Pieces", -- Thorium Ore Nugget
	[108300] = "Pieces", -- Mithril Ore Nugget
	[108299] = "Pieces", -- Truesilver Ore Nugget
	[108297] = "Pieces", -- Iron Ore Nugget
	[108296] = "Pieces", -- Gold Ore Nugget
	[108295] = "Pieces", -- Tin Ore Nugget
	[108294] = "Pieces", -- Silver Ore Nugget
	[97546] = "Pieces", -- Kyparite Fragment
	[97512] = "Pieces", -- Ghost Iron Nugget
	[97621] = "Pieces", -- Silkweed Stem
	[97624] = "Pieces", -- Desecrated Herb Pod
	[97622] = "Pieces", -- Snow Lily Petal
	[97620] = "Pieces", -- Rain Poppy Petal
	[97623] = "Pieces", -- Fool's Cap Spores
	[97619] = "Pieces", -- Torn Green Tea Leaf
	[109625] = "Pieces", -- Broken Fireweed Stem
	[109624] = "Pieces", -- Broken Frostweed Stem
	[109629] = "Pieces", -- Talador Orchid Petal
	[109628] = "Pieces", -- Nagrand Arrowbloom Petal
	[109627] = "Pieces", -- Starflower Petal
	[109626] = "Pieces", -- Gorgrond Flytrap Ichor
	[108365] = "Pieces", -- Whiptail Stem
	[108364] = "Pieces", -- Twilight Jasmine Petal
	[108363] = "Pieces", -- Heartblossom Petal
	[108362] = "Pieces", -- Azshara's Veil Stem
	[108361] = "Pieces", -- Stormvine Stalk
	[108360] = "Pieces", -- Cinderbloom Petal
	[108356] = "Pieces", -- Icethorn Bramble
	[108355] = "Pieces", -- Lichbloom Stalk
	[108353] = "Pieces", -- Adder's Tongue Stem
	[108354] = "Pieces", -- Tiger Lily Petal
	[108358] = "Pieces", -- Deadnettle Bramble
	[108359] = "Pieces", -- Fire Leaf Bramble
	[108357] = "Pieces", -- Talandra's Rose Petal
	[108352] = "Pieces", -- Goldclover Leaf
	[108351] = "Pieces", -- Mana Thistle Leaf
	[108348] = "Pieces", -- Ancient Lichen Petal
	[108350] = "Pieces", -- Nightmare Vine Stem
	[108349] = "Pieces", -- Netherbloom Leaf
	[108346] = "Pieces", -- Ragveil Cap
	[108347] = "Pieces", -- Terocone Leaf
	[108344] = "Pieces", -- Felweed Stalk
	[108345] = "Pieces", -- Dreaming Glory Petal
	[108343] = "Pieces", -- Icecap Petal
	[108342] = "Pieces", -- Sorrowmoss Leaf
	[108339] = "Pieces", -- Dreamfoil Blade
	[108341] = "Pieces", -- Mountain Silversage Stalk
	[108340] = "Pieces", -- Golden Sansam Leaf
	[108338] = "Pieces", -- Gromsblood Leaf
	[108335] = "Pieces", -- Sungrass Stalk
	[108337] = "Pieces", -- Ghost Mushroom Cap
	[108336] = "Pieces", -- Blindweed Stem
	[108334] = "Pieces", -- Arthas' Tears Petal
	[108332] = "Pieces", -- Firebloom Petal
	[108333] = "Pieces", -- Purple Lotus Petal
	[108329] = "Pieces", -- Dragon's Teeth Stem
	[108326] = "Pieces", -- Khadgar's Whisker Stem
	[108331] = "Pieces", -- Goldthorn Bramble
	[108328] = "Pieces", -- Fadeleaf Petal
	[108325] = "Pieces", -- Liferoot Stem
	[108324] = "Pieces", -- Kingsblood Petal
	[108323] = "Pieces", -- Wild Steelbloom Petal
	[108327] = "Pieces", -- Grave Moss Leaf
	[108330] = "Pieces", -- Stranglekelp Blade
	[108322] = "Pieces", -- Bruiseweed Stem
	[108321] = "Pieces", -- Swiftthistle Leaf
	[108320] = "Pieces", -- Briarthorn Bramble
	[108318] = "Pieces", -- Mageroyal Petal
	[108319] = "Pieces", -- Earthroot Stem
	[169697] = "Pieces", -- Nightshade Petal
	[169699] = "Pieces", -- Vigil's Torch Petal
	[169700] = "Pieces", -- Death Blossom Petal
	[168591] = "Pieces", -- Marrowroot Petal
	[169550] = "Pieces", -- Rising Glory Petal
	[169698] = "Pieces", -- Widowbloom Petal
	[111673] = "Pieces", -- Enormous Fire Ammonite
	[111676] = "Pieces", -- Enormous Jawless Skulker
	[111671] = "Pieces", -- Enormous Abyssal Gulper Eel
	[111667] = "Pieces", -- Blind Lake Sturgeon
	[111669] = "Pieces", -- Jawless Skulker
	[111664] = "Pieces", -- Abyssal Gulper Eel
	[111674] = "Pieces", -- Enormous Blind Lake Sturgeon
	[111666] = "Pieces", -- Fire Ammonite
	[111670] = "Pieces", -- Enormous Blackwater Whiptail
	[111672] = "Pieces", -- Enormous Sea Scorpion
	[111595] = "Pieces", -- Crescent Saberfish
	[111675] = "Pieces", -- Enormous Fat Sleeper
	[111663] = "Pieces", -- Blackwater Whiptail
	[111668] = "Pieces", -- Fat Sleeper
	[111665] = "Pieces", -- Sea Scorpion
	[111601] = "Pieces", -- Enormous Crescent Saberfish
	[111659] = "Pieces", -- Small Abyssal Gulper Eel
	[111656] = "Pieces", -- Small Fire Ammonite
	[111651] = "Pieces", -- Small Fat Sleeper
	[111650] = "Pieces", -- Small Jawless Skulker
	[111589] = "Pieces", -- Small Crescent Saberfish
	[111652] = "Pieces", -- Small Blind Lake Sturgeon
	[111658] = "Pieces", -- Small Sea Scorpion
	[111662] = "Pieces", -- Small Blackwater Whiptail
	[110610] = "Pieces", -- Raw Beast Hide Scraps
	[112157] = "Pieces", -- Prismatic Scale Fragment
	[112156] = "Pieces", -- Blackened Dragonscale Fragment
	[112155] = "Pieces", -- Deepsea Scale Fragment
	[112158] = "Pieces", -- Icy Dragonscale Fragment
	[112177] = "Pieces", -- Nerubian Chitin Fragment
	[112182] = "Pieces", -- Patch of Fel Hide
	[112185] = "Pieces", -- Wind Scale Fragment
	[33567] = "Pieces", -- Borean Leather Scraps
	[52977] = "Pieces", -- Savage Leather Scraps
	[105718] = "Pieces", -- Sha Crystal Fragment
	[74252] = "Pieces", -- Small Ethereal Shard
	[52720] = "Pieces", -- Small Heavenly Shard
	[34053] = "Pieces", -- Small Dream Shard
	[115504] = "Pieces", -- Fractured Temporal Crystal
	[115502] = "Pieces", -- Small Luminous Shard
	[90407] = "Pieces", -- Sparkling Shard
	[127390] = "Pieces", -- Polished Crystal
	-- -- Azerite Essence
	[169694] = "Pieces", -- Aqueous Reliquary
	[174288] = "Pieces", -- Breath of Everlasting Spirit
	[174279] = "Pieces", -- Encrypted Ny'alothan Text
	[169491] = "Pieces", -- Focused Life Anima
	[169687] = "Pieces", -- Fragment of Zem'lan's Lost Treasure Map
	[169774] = "Pieces", -- Progression Sprocket
	[174287] = "Pieces", -- Sparks of Unwavering Strength

	--! Openable (99)
	-- -- Equipment Token
	[114052] = "Openable", -- Gleaming Ring
	[114053] = "Openable", -- Shimmering Gauntlets
	[114108] = "Openable", -- Tormented Armament
	[114094] = "Openable", -- Tormented Bracers
	[114097] = "Openable", -- Tormented Gauntlets
	[114101] = "Openable", -- Tormented Girdle
	[114098] = "Openable", -- Tormented Hood
	[114099] = "Openable", -- Tormented Leggings
	[114100] = "Openable", -- Tormented Spaulders
	[114096] = "Openable", -- Tormented Treads
	[114105] = "Openable", -- Tormented Trinket
	[147212] = "Openable", -- Dauntless Bracers
	[147221] = "Openable", -- Dauntless Choker
	[147222] = "Openable", -- Dauntless Cloak
	[147215] = "Openable", -- Dauntless Gauntlets
	[147219] = "Openable", -- Dauntless Girdle
	[147216] = "Openable", -- Dauntless Hood
	[147217] = "Openable", -- Dauntless Leggings
	[147220] = "Openable", -- Dauntless Ring
	[147218] = "Openable", -- Dauntless Spaulders
	[147214] = "Openable", -- Dauntless Treads
	[147223] = "Openable", -- Dauntless Trinket
	[147213] = "Openable", -- Dauntless Tunic
	[133549] = "Openable", -- Muck-Covered Shoes
	-- -- Container
	[171209] = "Openable", -- Blooded Satchel
	[135540] = "Openable", -- Crate of Battlefield Goods
	[135539] = "Openable", -- Crate of Battlefield Goods
	[135541] = "Openable", -- Crusader's Crate of Battlefield Goods
	[135546] = "Openable", -- Fel-Touched Crate of Battlefield Goods
	[135542] = "Openable", -- Icy Crate of Battlefield Goods
	[138098] = "Openable", -- Iron-Bound Crate of Battlefield Goods
	[135543] = "Openable", -- Rival's Crate of Battlefield Goods
	[135545] = "Openable", -- Savage Crate of Battlefield Goods
	[171211] = "Openable", -- Venthyr Coin Purse
	[45072] = "Openable", -- Brightly Colored Egg
	[108738] = "Openable", -- Giant Draenor Clam
	[112623] = "Openable", -- Pack of Fishing Supplies
	[113346] = "Openable", -- Blood Card (5g)
	[113347] = "Openable", -- Blood Card (5g)
	[113348] = "Openable", -- Blood Card (5g)
	[113349] = "Openable", -- Blood Card (20g)
	[114634] = "Openable", -- Icy Satchel of Helpful Goods
	[114641] = "Openable", -- Icy Satchel of Helpful Goods
	[114648] = "Openable", -- Scorched Satchel of Helpful Goods
	[114655] = "Openable", -- Scorched Satchel of Helpful Goods
	[114662] = "Openable", -- Tranquil Satchel of Helpful Goods
	[114669] = "Openable", -- Tranquil Satchel of Helpful Goods
	[116062] = "Openable", -- Greater Darkmoon Pet Supplies
	[117394] = "Openable", -- Satchel of Chilled Goods
	[118931] = "Openable", -- Leonid's Bag of Supplies
	[119139] = "Openable", -- Sacked Caravan Plunder
	[124670] = "Openable", -- Sealed Darkmoon Crate
	[126947] = "Openable", -- Nal'ryssa's Spare Mining Supplies
	[127389] = "Openable", -- Polished Crystal
	[127413] = "Openable", -- Jeweled Arakkoa Effigy
	[134143] = "Openable", -- Darkmoon Game Prize
	[137560] = "Openable", -- Dreamweaver Provisions
	[137561] = "Openable", -- Highmountain Tribute
	[137590] = "Openable", -- Pile of Silk
	[137591] = "Openable", -- Pile of Skins
	[137592] = "Openable", -- Pile of Ore
	[137593] = "Openable", -- Pile of Herbs
	[137594] = "Openable", -- Pile of Gems
	[137600] = "Openable", -- Pile of Pants
	[137608] = "Openable", -- Growling Sac
	[139879] = "Openable", -- Crate of Champion Equipment
	[140601] = "Openable", -- Sixtrigger Resource Crate
	[141344] = "Openable", -- Tribute of the Broken Isles
	[141410] = "Openable", -- Invasion Survival Kit
	[142023] = "Openable", -- Adventurer's Footlocker
	[143607] = "Openable", -- Soldier's Footlocker
	[146747] = "Openable", -- Dreamweaver Provisions
	[146748] = "Openable", -- Highmountain Tribute
	[146899] = "Openable", -- Highmountain Supplies
	[146948] = "Openable", -- Tribute of the Broken Isles
	[147446] = "Openable", -- Brawler's Footlocker
	[147573] = "Openable", -- Trial of Style Reward: First Place
	[147574] = "Openable", -- Trial of Style Reward: Second Place
	[147575] = "Openable", -- Trial of Style Reward: Third Place
	[147576] = "Openable", -- Trial of Style Consolation Prize
	[147726] = "Openable", -- Nethercluster
	[147729] = "Openable", -- Netherchunk
	[149503] = "Openable", -- Stolen Gift
	[150924] = "Openable", -- Greater Tribute of the Broken Isles
	[151464] = "Openable", -- Dreamweaver Provisions
	[151465] = "Openable", -- Highmountain Tribute
	[152104] = "Openable", -- Highmountain Supplies
	[152578] = "Openable", -- Sack of Herbs
	[152580] = "Openable", -- Pile of Cloth
	[152581] = "Openable", -- Bag of Jewels
	[152582] = "Openable", -- Sack of Skins
	[152923] = "Openable", -- Gleaming Footlocker
	[154759] = "Openable", -- Broken Isles Survival Kit
	[154903] = "Openable", -- Dreamweaver Provisions
	[154904] = "Openable", -- Highmountain Tribute
	[154991] = "Openable", -- Brawler's Footlocker
	[154992] = "Openable", -- Brawler's Footlocker
	[156682] = "Openable", -- Otherworldly Satchel of Helpful Goods
	[156683] = "Openable", -- Satchel of Helpful Goods
	[156688] = "Openable", -- Icy Satchel of Helpful Goods
	[156689] = "Openable", -- Scorched Satchel of Helpful Goods
	[156698] = "Openable", -- Tranquil Satchel of Helpful Goods
	[156707] = "Openable", -- Bret's Satchel of Helpful Goods
	[157822] = "Openable", -- Dreamweaver Provisions
	[157823] = "Openable", -- Highmountain Tribute
	[160322] = "Openable", -- Pile of Ore
	[160439] = "Openable", -- Adventurer's Footlocker
	[163611] = "Openable", -- Seafarer's Coin Pouch
	[163612] = "Openable", -- Wayfinder's Satchel
	[163613] = "Openable", -- Sack of Plunder
	[165851] = "Openable", -- Bag of Anchors
	[166245] = "Openable", -- Tortollan Seekers Supplies
	[166282] = "Openable", -- Talanji's Expedition Supplies
	[166290] = "Openable", -- Voldunai Supplies
	[166292] = "Openable", -- Zandalari Empire Supplies
	[166294] = "Openable", -- Storm's Wake Supplies
	[166295] = "Openable", -- Proudmoore Admiralty Supplies
	[166297] = "Openable", -- Order of Embers Supplies
	[166298] = "Openable", -- Champions of Azeroth Supplies
	[166299] = "Openable", -- Honorbound Supplies
	[166300] = "Openable", -- 7th Legion Supplies
	[168162] = "Openable", -- Chronal Cache of Cloth
	[168262] = "Openable", -- Sentry Fish
	[168488] = "Openable", -- Seafarer's Lost Coin Pouch
	[169939] = "Openable", -- Ankoan Supplies
	[169940] = "Openable", -- Unshackled Supplies
	[170061] = "Openable", -- Rustbolt Supplies
	[171210] = "Openable", -- Satchel of Nature's Bounty
	[171305] = "Openable", -- Salvaged Cache of Good
	[171305] = "Openable", -- Salvaged Cache of Goods
	[171987] = "Openable", -- Champions of Azeroth Survival Kit
	[171988] = "Openable", -- Adventurer's Footlocker
	[173949] = "Openable", -- Dread Chain Salvage
	[173950] = "Openable", -- Crestfall Salvage
	[173987] = "Openable", -- Elemental Salvage
	[173988] = "Openable", -- Havenswood Salvage
	[173989] = "Openable", -- Jorundall Salvage
	[173990] = "Openable", -- Molten Cay Salvage
	[173991] = "Openable", -- Rotting Mire Salvage
	[173992] = "Openable", -- Skittering Hollow Salvage
	[173993] = "Openable", -- Snowblossom Salvage
	[173994] = "Openable", -- Un'gol Ruins Salvage
	[173995] = "Openable", -- Venture Co. 'Salvage'
	[173996] = "Openable", -- Verdant Wilds Salvage
	[173997] = "Openable", -- Whispering Reef Salvage
	[174483] = "Openable", -- Rajani Supplies
	[174484] = "Openable", -- Uldum Accord Supplies
	[178040] = "Openable", -- Condensed Stygia
	[178045] = "Openable", -- Soul Prism
	[180355] = "Openable", -- Ornate Pyx
	[180646] = "Openable", -- Supplies of the Undying Army
	[180647] = "Openable", -- Ascended Supplies
	[180648] = "Openable", -- Court of Harvesters Supplies
	[180649] = "Openable", -- Wild Hunt Supplies
	[181372] = "Openable", -- Tribute of the Ascended
	[181476] = "Openable", -- Tribute of the Wild Hunt
	[181556] = "Openable", -- Tribute of the Court
	[181732] = "Openable", -- Tribute of the Ambitious
	[181733] = "Openable", -- Tribute of the Duty-Bound
	[181741] = "Openable", -- Tribute of the Paragon
	[183424] = "Openable", -- Stitched Satchel of Maldraxxi Goods
	[183426] = "Openable", -- Stitched Satchel of Fae Goods
	[183428] = "Openable", -- Stitched Satchel of Aspirant Goods
	[183429] = "Openable", -- Stitched Satchel of Venthyr Goods
	[183701] = "Openable", -- Cleansing Rite Materials
	[183702] = "Openable", -- Nature's Splendor
	[183822] = "Openable", -- Icecrown Survival Kit
	[184395] = "Openable", -- Fallen Adventurer's Cache
	[184444] = "Openable", -- Supplies for the Path
	[184630] = "Openable", -- Adventurer's Tailoring Cache
	[184631] = "Openable", -- Adventurer's Enchanting Cache
	[184632] = "Openable", -- Champion's Fish Cache
	[184633] = "Openable", -- Champion's Meat Cache
	[184634] = "Openable", -- Adventurer's Herbalism Cache
	[184635] = "Openable", -- Adventurer's Mining Cache
	[184636] = "Openable", -- Adventurer's Skinning Cache
	[184637] = "Openable", -- Hero's Meat Cache
	[184638] = "Openable", -- Hero's Fish Cache
	[184639] = "Openable", -- Champion's Tailoring Cache
	[184640] = "Openable", -- Champion's Skinning Cache
	[184641] = "Openable", -- Champion's Mining Cache
	[184642] = "Openable", -- Champion's Herbalism Cache
	[184643] = "Openable", -- Champion's Enchanting Cache
	[184644] = "Openable", -- Hero's Tailoring Cache
	[184645] = "Openable", -- Hero's Skinning Cache
	[184646] = "Openable", -- Hero's Mining Cache
	[184647] = "Openable", -- Hero's Herbalism Cache
	[184648] = "Openable", -- Hero's Enchanting Cache
	[184843] = "Openable", -- Salvaged Supplies
	[185765] = "Openable", -- Shipment of Heavy Callous Hide
	[185832] = "Openable", -- Shipment of Elethium Ore
	[185833] = "Openable", -- Shipment of Lightless Silk
	[185940] = "Openable", -- Pristine Survival Kit
	[186650] = "Openable", -- Death's Advance Supplies
	[186694] = "Openable", -- Shaded Bag of Ore
	[187028] = "Openable", -- Supplies of the Archivists' Codex
	[187221] = "Openable", -- Soul Ash Cache
	[187222] = "Openable", -- Stygic Singularity
	[187254] = "Openable", -- Arrangement of Anima
	[187503] = "Openable", -- Bundle of Archived Research
	[187520] = "Openable", -- Gently Shaken Gift (2021)
	[187561] = "Openable", -- Winter Veil Gift (2021)
	[187569] = "Openable", -- Brokers' Tailoring Mote of Potentiation
	[187570] = "Openable", -- Brokers' Skinning Mote of Potentiation
	[187571] = "Openable", -- Brokers' Mining Mote of Potentiation
	[187572] = "Openable", -- Brokers' Herbalism Mote of Potentiation
	[187573] = "Openable", -- Brokers' Enchanting Mote of Potentiation
	[187574] = "Openable", -- Brokers' Overflowing Bucket
	[187575] = "Openable", -- Korthian Fishing Cache
	[187576] = "Openable", -- Korthian Skinning Cache
	[187577] = "Openable", -- Korthian Meat Cache
	[187659] = "Openable", -- Adventurer's Footlocker
	[187710] = "Openable", -- Anniversary Gift (18th)
	[187780] = "Openable", -- Enlightened Broker Supplies
	[187780] = "Openable", -- Enlightened Broker Supplies
	[187781] = "Openable", -- Automa Supplies
	[187781] = "Openable", -- Olea Cache
	[187787] = "Openable", -- Ephemera Orb
	[187817] = "Openable", -- Korthite Crystal Geode
	[190178] = "Openable", -- Pouch of Protogenic Provisions
	[190178] = "Openable", -- Pouch of Protogenic Provisions
	[190610] = "Openable", -- Tribute of the Enlightened Elders
	[190610] = "Openable", -- Tribute of the Enlightened Elders
	[190655] = "Openable", -- Cache of Sepulcher Treasures
	[190656] = "Openable", -- Cache of Sepulcher Treasures (Heroic)
	[190823] = "Openable", -- Firim's Mysterious Cache
	[191030] = "Openable", -- Cosmic Flux Parcel
	[191040] = "Openable", -- Cache of Sepulcher Treasures
	[191041] = "Openable", -- Cache of Sepulcher Treasures (Heroic)
	[191139] = "Openable", -- Tribute of the Enlightened Elders
	[191139] = "Openable", -- Tribute of the Enlightened Elders
	[191299] = "Openable", -- Tribute to the Enlightened
	[191701] = "Openable", -- Bag of Explored Souls
	[19296] = "Openable", -- Greater Darkmoon Prize
	[19297] = "Openable", -- Lesser Darkmoon Prize
	[19298] = "Openable", -- Minor Darkmoon Prize
	[21156] = "Openable", -- Scarab Bag
	[21509] = "Openable", -- Ahn'Qiraj War Effort Supplies
	[21510] = "Openable", -- Ahn'Qiraj War Effort Supplies
	[21511] = "Openable", -- Ahn'Qiraj War Effort Supplies
	[21512] = "Openable", -- Ahn'Qiraj War Effort Supplies
	[21513] = "Openable", -- Ahn'Qiraj War Effort Supplies
	[24476] = "Openable", -- Jaggal Clam
	[27513] = "Openable", -- Curious Crate
	[36781] = "Openable", -- Darkwater Clam
	[37168] = "Openable", -- Mysterious Tarot
	[37602] = "Openable", -- Ruined Vellum
	[39349] = "Openable", -- Ruined Vellum
	[39350] = "Openable", -- Ruined Vellum
	[43145] = "Openable", -- Ruined Vellum
	[43146] = "Openable", -- Ruined Vellum
	[44161] = "Openable", -- Arcane Tarot
	[44163] = "Openable", -- Shadowy Tarot
	[44475] = "Openable", -- Reinforced Crate
	[44700] = "Openable", -- Brooding Darkwater Clam
	[45909] = "Openable", -- Giant Darkwater Clam
	[46809] = "Openable", -- Bountiful Cookbook
	[51999] = "Openable", -- Satchel of Helpful Goods
	[52000] = "Openable", -- Satchel of Helpful Goods
	[52001] = "Openable", -- Satchel of Helpful Goods
	[52002] = "Openable", -- Satchel of Helpful Goods
	[52003] = "Openable", -- Satchel of Helpful Goods
	[52004] = "Openable", -- Satchel of Helpful Goods
	[52005] = "Openable", -- Satchel of Helpful Goods
	[52274] = "Openable", -- Earthen Ring Supplies
	[52340] = "Openable", -- Abyssal Clam
	[52344] = "Openable", -- Earthen Ring Supplies
	[54536] = "Openable", -- Satchel of Chilled Goods
	[54537] = "Openable", -- Heart-Shaped Box
	[5523] = "Openable", -- Small Barnacled Clam
	[5524] = "Openable", -- Thick-Shelled Clam
	[65513] = "Openable", -- Crate of Tasty Meat
	[67248] = "Openable", -- Satchel of Helpful Goods
	[67250] = "Openable", -- Satchel of Helpful Goods
	[6827] = "Openable", -- Box of Supplies
	[68689] = "Openable", -- Imported Supplies
	[77952] = "Openable|ROGUE", -- Elementium Gem Cluster
	[78897] = "Openable", -- Pouch o' Tokens
	[78898] = "Openable", -- Sack o' Tokens
	[78899] = "Openable", -- Pouch o' Tokens
	[78900] = "Openable", -- Pouch o' Tokens
	[78901] = "Openable", -- Pouch o' Tokens
	[78902] = "Openable", -- Pouch o' Tokens
	[78903] = "Openable", -- Pouch o' Tokens
	[78904] = "Openable", -- Pouch o' Tokens
	[78905] = "Openable", -- Sack o' Tokens
	[78906] = "Openable", -- Sack o' Tokens
	[78907] = "Openable", -- Sack o' Tokens
	[78908] = "Openable", -- Sack o' Tokens
	[78909] = "Openable", -- Sack o' Tokens
	[78910] = "Openable", -- Sack o' Tokens
	[7973] = "Openable", -- Big-Mouth Clam
	[87217] = "Openable", -- Small Bag of Goods
	[91086] = "Openable", -- Darkmoon Pet Supplies
	[9276] = "Openable", -- Pirate's Footlocker
	[92788] = "Openable", -- Ride Ticket Book
	[92789] = "Openable", -- Ride Ticket Book
	[92790] = "Openable", -- Ride Ticket Book
	[92791] = "Openable", -- Ride Ticket Book
	[92792] = "Openable", -- Ride Ticket Book
	[92793] = "Openable", -- Ride Ticket Book
	[92794] = "Openable", -- Ride Ticket Book
	[93724] = "Openable", -- Darkmoon Game Prize
	[94158] = "Openable", -- Big Bag of Zandalari Supplies
	[94159] = "Openable", -- Small Bag of Zandalari Supplies
	[97948] = "Openable", -- Surplus Supplies
	[97949] = "Openable", -- Surplus Supplies
	[97950] = "Openable", -- Surplus Supplies
	[97951] = "Openable", -- Surplus Supplies
	[97952] = "Openable", -- Surplus Supplies
	[97953] = "Openable", -- Surplus Supplies
	[97954] = "Openable", -- Surplus Supplies
	[97955] = "Openable", -- Surplus Supplies
	[97956] = "Openable", -- Surplus Supplies
	[97957] = "Openable", -- Surplus Supplies
	-- -- Archaeology
	[154913] = "Openable", -- Akun'Jar Vase
	[114171] = "Openable", -- Ancestral Talisman
	[154922] = "Openable", -- Ancient Runebound Tome
	[95376] = "Openable", -- Ancient Sap Feeder
	[114204] = "Openable", -- Apexis Crystal
	[114205] = "Openable", -- Apexis Hieroglyph
	[114206] = "Openable", -- Apexis Scroll
	[79903] = "Openable", -- Apothecary Tins
	[95375] = "Openable", -- Banner of the Mantid Empire
	[114163] = "Openable", -- Barbed Fishing Hook
	[114207] = "Openable", -- Beakbreaker of Terokk
	[114157] = "Openable", -- Blackrock Razor
	[160743] = "Openable", -- Blowgun of the Sethra
	[114198] = "Openable", -- Burial Urn
	[154917] = "Openable", -- Bwonsamdi Voodoo Mask
	[114165] = "Openable", -- Calcified Eye In a Jar
	[79901] = "Openable", -- Carved Bronze Mirror
	[154921] = "Openable", -- Ceremonial Bonesaw
	[114167] = "Openable", -- Ceremonial Tattoo Needles
	[114169] = "Openable", -- Cracked Ivory Idol
	[79909] = "Openable", -- Cracked Mogu Runestone
	[114199] = "Openable", -- Decree Scrolls
	[154923] = "Openable", -- Disembowling Sickle
	[114177] = "Openable", -- Doomsday Prophecy
	[114197] = "Openable", -- Dreamcatcher
	[79913] = "Openable", -- Edicts of the Thunder King
	[114155] = "Openable", -- Elemental Bellows
	[79900] = "Openable", -- Empty Keg
	[114191] = "Openable", -- Eye of Har'gunn the Blind
	[114141] = "Openable", -- Fang-Scarred Frostwolf Axe
	[114173] = "Openable", -- Flask of Blazegrease
	[130917] = "Openable", -- Flayed-Skin Chronicle
	[114143] = "Openable", -- Frostwolf Ancestry Scrimshaw
	[114189] = "Openable", -- Gladiator's Shield
	[79902] = "Openable", -- Gold-Inlaid Figurine
	[114175] = "Openable", -- Gronn-Tooth Necklace
	[130913] = "Openable", -- Hand-Smoothed Pyrestone
	[114179] = "Openable", -- Headdress of the First Shaman
	[154916] = "Openable", -- High Apothecary's Hood
	[114161] = "Openable", -- Hooked Dagger
	[130916] = "Openable", -- Imp's Cup
	[114194] = "Openable", -- Imperial Decree Stele
	[130907] = "Openable", -- Inert Leystone Charm
	[95378] = "Openable", -- Inert Sound Beacon
	[79914] = "Openable", -- Iron Amulet
	[154924] = "Openable", -- Jagged Blade of the Drust
	[95382] = "Openable", -- Kypari Sap Container
	[130918] = "Openable", -- Malformed Abyssal
	[79908] = "Openable", -- Manacles of Rebellion
	[95380] = "Openable", -- Mantid Lamp
	[114153] = "Openable", -- Metalworker's Hammer
	[79916] = "Openable", -- Mogu Coin
	[130912] = "Openable", -- Moosebone Fish-Hook
	[114190] = "Openable", -- Mortar and Pestle
	[114185] = "Openable", -- Ogre Figurine
	[114203] = "Openable", -- Outcast Dreamcatcher
	[79897] = "Openable", -- Pandaren Game Board
	[79896] = "Openable", -- Pandaren Tea Set
	[79904] = "Openable", -- Pearl of Yu'lon
	[79911] = "Openable", -- Petrified Bone Whip
	[114187] = "Openable", -- Pictogram Carving
	[95381] = "Openable", -- Pollen Collector
	[154931] = "Openable", -- Pristine Akun'Jar Vase
	[154927] = "Openable", -- Pristine Ancient Runebound Tome
	[160744] = "Openable", -- Pristine Blowgun of the Sethrak
	[154935] = "Openable", -- Pristine Bwonsamdi Voodoo Mask
	[154928] = "Openable", -- Pristine Disembowling Sickle
	[154934] = "Openable", -- Pristine High Apothecary's Hood
	[154929] = "Openable", -- Pristine Jagged Blade of the Drust
	[154933] = "Openable", -- Pristine Rezan Idol
	[154930] = "Openable", -- Pristine Ritual Fetish
	[160742] = "Openable", -- Pristine Soul Coffer
	[154932] = "Openable", -- Pristine Urn of Passage
	[130908] = "Openable", -- Quietwine Vial
	[95379] = "Openable", -- Remains of a Paragon
	[154915] = "Openable", -- Rezan Idol
	[154925] = "Openable", -- Ritual Fetish
	[114193] = "Openable", -- Rylak Riding Harness
	[114149] = "Openable", -- Screaming Bullroarer
	[114200] = "Openable", -- Solar Orb
	[114195] = "Openable", -- Sorcerer-King Toe Ring
	[160741] = "Openable", -- Soul Coffer
	[79905] = "Openable", -- Standard of Niuzao
	[114192] = "Openable", -- Stone Dentures
	[114183] = "Openable", -- Stone Manacles
	[114181] = "Openable", -- Stonemaul Succession Stone
	[114201] = "Openable", -- Sundial
	[114202] = "Openable", -- Talonpriest Mask
	[79910] = "Openable", -- Terracotta Arm
	[95377] = "Openable", -- The Praying Mantid
	[79912] = "Openable", -- Thunder King Insignia
	[130911] = "Openable", -- Trailhead Drum
	[79898] = "Openable", -- Twin Stein Set
	[154914] = "Openable", -- Urn of Passage
	[130906] = "Openable", -- Violetglass Vessel
	[79899] = "Openable", -- Walking Cane
	[79915] = "Openable", -- Warlord's Branding Iron
	[114196] = "Openable", -- Warmaul of the Warmaul Chieftain
	[114147] = "Openable", -- Warsinger's Drums
	[114151] = "Openable", -- Warsong Ceremonial Pike
	[114159] = "Openable", -- Weighted Chopping Axe
	[114145] = "Openable", -- Wolfskin Snowshoes
	[79917] = "Openable", -- Worn Monument Ledger

	--! Learnable (98)
	-- -- Rockin' Rollin' Racer
	[187560] = "Learnable", -- Rockin' Rollin' Racer Pack
	-- -- Currency Increase
	[184219] = "Learnable|Quest:62821|Already Learned", -- Treatise on Sinstone Fragment Acquisition
	[188793] = "Learnable|Quest:65282|Account Bound", -- Improvised Cypher Analysis Tool
	-- -- Renown
	[188167] = "Learnable", -- Broker Mark of Distinction
	-- -- Pepe
	[170151] = "Learnable", -- A Tiny Clockwork Key
	[161451] = "Learnable", -- A Tiny Diving Helmet
	[127867] = "Learnable", -- A Tiny Ninja Shroud
	[139632] = "Learnable", -- A Tiny Pair of Goggles
	[186593] = "Learnable", -- A Tiny Pair of Wings
	[127870] = "Learnable", -- A Tiny Pirate Hat
	[127869] = "Learnable", -- A Tiny Plated Helm
	[128874] = "Learnable", -- A Tiny Scarecrow Costume
	[186580] = "Learnable", -- A Tiny Sinstone
	[186524] = "Learnable", -- A Tiny Vial of Slime
	[127865] = "Learnable", -- A Tiny Viking Helmet
	[161443] = "Learnable", -- A Tiny Voodoo Mask
	[174865] = "Learnable", -- A Tiny Winter Hat
	[186473] = "Learnable", -- A Tiny Winter Staff
	-- -- Azeroth Mini
	[169848] = "Learnable", -- Azeroth Mini Pack: Bondo's Yard
	[169850] = "Learnable", -- Azeroth Mini Pack: Mechagon
	[169895] = "Learnable", -- Azeroth Mini: Beastbot
	[169852] = "Learnable", -- Azeroth Mini: Blastatron
	[169795] = "Learnable", -- Azeroth Mini: Bondo Bigblock
	[169851] = "Learnable", -- Azeroth Mini: Cogstar
	[169843] = "Learnable", -- Azeroth Mini: Cork Stuttguard
	[169841] = "Learnable", -- Azeroth Mini: Erazmin
	[169840] = "Learnable", -- Azeroth Mini: Gazlowe
	[169845] = "Learnable", -- Azeroth Mini: HK-8
	[169794] = "Learnable", -- Azeroth Mini: Izira Gearsworn
	[169846] = "Learnable", -- Azeroth Mini: King Mechagon
	[169849] = "Learnable", -- Azeroth Mini: Naeno Megacrash
	[169844] = "Learnable", -- Azeroth Mini: Overspark
	[169896] = "Learnable", -- Azeroth Mini: Pascal-K1N6
	[169842] = "Learnable", -- Azeroth Mini: Roadtrogg
	[169876] = "Learnable", -- Azeroth Mini: Sapphronetta
	[169838] = "Learnable", -- Azeroth Mini: Starter Pack
	[169797] = "Learnable", -- Azeroth Mini: Wrenchbot
	-- -- Pocopoc
	[187833] = "Learnable", -- Dapper Pocopoc
	[189451] = "Learnable", -- Chef Pocopoc
	[189707] = "Learnable", -- Pocopoc's Bronze and Gold Body
	[189708] = "Learnable", -- Pocopoc's Beryllium and Silver Body
	[189709] = "Learnable", -- Pocopoc's Cobalt and Copper Body
	[189710] = "Learnable", -- Pocopoc's Ruby and Platinum Body
	[189711] = "Learnable", -- Pocopoc's Gold and Ruby Components
	[189712] = "Learnable", -- Pocopoc's Silver and Beryllium Components
	[189713] = "Learnable", -- Pocopoc's Copper and Cobalt Components
	[189714] = "Learnable", -- Pocopoc's Platinum and Emerald Components
	[189715] = "Learnable", -- Pocopoc's Diamond Vambraces
	[189716] = "Learnable", -- Pocopoc's Face Decoration
	[189717] = "Learnable", -- Pocopoc's Shielded Core
	[189718] = "Learnable", -- Pocopoc's Upgraded Core
	[190058] = "Learnable", -- Peaceful Pocopoc
	[190059] = "Learnable", -- Pirate Pocopoc
	[190060] = "Learnable", -- Adventurous Pocopoc
	[190061] = "Learnable", -- Admiral Pocopoc
	[190062] = "Learnable", -- Wicked Pocopoc
	[190096] = "Learnable", -- Pocobold
	[190098] = "Learnable", -- Pepepec
	[190182] = "Learnable", -- Lovely Regal Pocopoc
	-- -- Hunter Taming
	[94232] = "Learnable|HUNTER&Spell:138430", -- Ancient Tome of Dinomancy
	[134125] = "Learnable|HUNTER&Spell:205154|Unbound", -- Mecha-Bond Imprint Matrix
	[147580] = "Learnable|HUNTER&Spell:242155|Account Bound", -- Tome of the Hybrid Beast
	[183123] = "Learnable|Quest:62254|Already Learned", -- How to School Your Serpent
	[166502] = "Learnable|Quest:54753|Already Learned", -- Blood-Soaked Tome of Dark Whispers
	[183124] = "Learnable|Quest:62255|Already Learned", -- Simple Tome of Bone-Binding
	[180705] = "Learnable|Quest:61160|Already Learned", -- Gargon Training Manual
	-- -- Mage Polymorph
	[44709] = "Learnable|MAGE&Spell:61305|Unbound", -- Tome of Polymorph: Black Cat
	[162626] = "Learnable|MAGE&Spell:277792|Already Learned", -- Tome of Polymorph: Bumblebee
	[162625] = "Learnable|MAGE&Spell:277787|Already Learned", -- Tome of Polymorph: Direhorn
	[120138] = "Learnable|MAGE&Spell:161354|Unbound", -- Tome of Polymorph: Monkey
	[120139] = "Learnable|MAGE&Spell:161355|Already Learned", -- Tome of Polymorph: Penguin
	[120137] = "Learnable|MAGE&Spell:161353|Unbound", -- Tome of Polymorph: Polar Bear Cub
	[120140] = "Learnable|MAGE&Spell:126819|Unbound", -- Tome of Polymorph: Porcupine
	[44793] = "Learnable|MAGE&Spell:61721|Already Learned", -- Tome of Polymorph: Rabbit
	[22739] = "Learnable|MAGE&Spell:28271|Unbound", -- Tome of Polymorph: Turtle
	-- -- Shaman Hex
	[136972] = "Learnable|SHAMAN&Spell:211015|Unbound", -- Tome of Hex: Cockroach
	[136938] = "Learnable|SHAMAN&Spell:210873|Already Learned", -- Tome of Hex: Compy
	[172405] = "Learnable|SHAMAN&Spell:309328|Already Learned", -- Tome of Hex: Living Honey
	[159841] = "Learnable|SHAMAN&Spell:269352|Already Learned", -- Tome of Hex: Skeletal Hatchling
	[136971] = "Learnable|SHAMAN&Spell:211010|Already Learned", -- Tome of Hex: Snake
	[136969] = "Learnable|SHAMAN&Spell:211004|Already Learned", -- Tome of Hex: Spider
	[162624] = "Learnable|SHAMAN&Spell:277784|Already Learned", -- Tome of Hex: Wicker Mongrel
	[162623] = "Learnable|SHAMAN&Spell:277778|Already Learned", -- Tome of Hex: Zandalari Tendonripper
	-- -- Warlock Demon
	[189719] = "Learnable", -- Barbed Collar of the Incubus
	[189720] = "Learnable", -- Barbed Collar of the Succubus
	-- -- Crypt Couture
	[183691] = "Learnable", -- Mucosal Pigment
	[183394] = "Learnable", -- Discarded Grimoire
	[183397] = "Learnable", -- Sorcerer's Blade
	[183401] = "Learnable", -- Amethystine Dye
	[183399] = "Learnable", -- Ritualist's Mantle
	[183692] = "Learnable", -- Jagged Bonesaw
	[183690] = "Learnable", -- Ashen Ink
	[183693] = "Learnable", -- Plague Doctor's Mask
	-- -- Experience
	[140179] = "Learnable|XP", -- Faded Star Chart
	[140356] = "Learnable|XP", -- Demonic Scribblings
	[140360] = "Learnable|XP", -- Rockwurm Barb
	[140362] = "Learnable|XP", -- Dust from the Shadowlands
	[140375] = "Learnable|XP", -- Used Felblades
	[140376] = "Learnable|XP", -- Mardum-Calibrated Balancer
	[140458] = "Learnable|XP", -- Lasher Seed
	[140464] = "Learnable|XP", -- Miniature Totem
	[140465] = "Learnable|XP", -- Duskpelt Hide
	[140483] = "Learnable|XP", -- Jade Fragment
	[140499] = "Learnable|XP", -- Off-Colored Fel Stone
	[140501] = "Learnable|XP", -- Outdated Intelligence
	[140502] = "Learnable|XP", -- Tattered Eye Patch
	[140514] = "Learnable|XP", -- Vial of Air
	[140526] = "Learnable|XP", -- Eredar Signet
	[140527] = "Learnable|XP", -- Wrathguard's Medallion
	[120205] = "Learnable|XP", -- Player Experience
	[140584] = "Learnable|XP", -- Player Experience
	[143786] = "Learnable|XP", -- Player Experience
	[147434] = "Learnable|XP", -- Player Experience
	[165606] = "Learnable|XP", -- Player Experience
	[166231] = "Learnable|XP", -- Player Experience
	-- -- Reputation
	[190339] = "Learnable", -- Enlightened Offering
	[190941] = "Learnable", -- Teachings of the Elders
	-- -- Grants Mission
	[171986] = "Learnable", -- Resonance Locator
	[166999] = "Learnable", -- Treasure Map
	[165904] = "Learnable", -- Treasure Map of Havenswood
	[165905] = "Learnable", -- Treasure Map of Jorundall
	[165884] = "Learnable", -- Treasure Map of Molten Cay
	[165906] = "Learnable", -- Treasure Map of Skittering Hollow
	[165903] = "Learnable", -- Treasure Map of The Dread Chain
	[165902] = "Learnable", -- Treasure Map of The Rotting Mire
	[165901] = "Learnable", -- Treasure Map of Un'gol Ruins
	[165900] = "Learnable", -- Treasure Map of Verdant Wilds
	[165899] = "Learnable", -- Treasure Map of Whispering Reef
	[169693] = "Learnable", -- Zem'lan's Lost Treasure Map
	-- -- Azerite Essence
	[168443] = "Learnable", -- Agitated Blood of the Dominated
	[168814] = "Learnable", -- Animated Blood of the Decimated
	[168854] = "Learnable", -- Animated Elemental Heart
	[168920] = "Learnable", -- Azerite-Encrusted Timequartz
	[168922] = "Learnable", -- Azerite-Fueled Timequartz
	[168921] = "Learnable", -- Azerite-Infused Timequartz
	[168623] = "Learnable", -- Biconcavic Lens of the Focusing Iris
	[168575] = "Learnable", -- Branch of Rejuvenating Rings
	[168618] = "Learnable", -- Brilliant Worldvein
	[173884] = "Learnable", -- Burgeoning Void Droplet
	[168924] = "Learnable", -- Bursting Seed of Life
	[173886] = "Learnable", -- Bursting Void Droplet
	[168934] = "Learnable", -- Calibrated Existence Gauge
	[169614] = "Learnable", -- Call to Arms Distinction
	[168614] = "Learnable", -- Charged Scale of the Blue Aspect
	[168444] = "Learnable", -- Churning Blood of the Conquered
	[168929] = "Learnable", -- Codex of the Never-Ending Tides
	[168620] = "Learnable", -- Converging Lens of the Focusing Iris
	[168538] = "Learnable", -- Dazzling Azerite Formation
	[168573] = "Learnable", -- Death-Resistant Leaf
	[168837] = "Learnable", -- Depth Forged Aegis
	[168612] = "Learnable", -- Dreamglow Dragonscale
	[168851] = "Learnable", -- Enduring Battlefield Memento
	[168838] = "Learnable", -- Enduring Bulwark of the Depths
	[168842] = "Learnable", -- Engine of Mecha-Perfection
	[168933] = "Learnable", -- Enhanced Existence Capacitor
	[168860] = "Learnable", -- Enhanced Purification Protocols
	[169901] = "Learnable", -- Etched Bone Trophy of the Vanquished
	[168935] = "Learnable", -- Existence Vibrancy Display
	[168399] = "Learnable", -- Fetish of the Dark Caverns
	[168558] = "Learnable", -- Fetish of the Deep Dungeons
	[168560] = "Learnable", -- Fetish of the Gilded Catacombs
	[168559] = "Learnable", -- Fetish of the Hidden Labyrinths
	[169902] = "Learnable", -- Finger-Bone Trophy of Battle
	[168617] = "Learnable", -- Fluctuating Worldvein
	[168436] = "Learnable", -- Focused Star Point
	[168440] = "Learnable", -- Gleaming Star Shard
	[168853] = "Learnable", -- Glinting Battlefield Memento
	[168943] = "Learnable", -- Grid of Bursting Vitality
	[168328] = "Learnable", -- Hardened Azerite Formation
	[168866] = "Learnable", -- Incandescent Azerite Slivershards
	[168926] = "Learnable", -- Lingering Seed of Renewal
	[173291] = "Learnable", -- Luminous Azerite Geode
	[168621] = "Learnable", -- Magnifying Lens of the Focusing Iris
	[173310] = "Learnable", -- Manual of Unbalanced Tactics
	[173308] = "Learnable", -- Mark of Boistrous Duty
	[168845] = "Learnable", -- Mecha-Perfection Turbo
	[168942] = "Learnable", -- Mesh of Expanding Vitality
	[168400] = "Learnable", -- Null Force Containment Unit
	[168566] = "Learnable", -- Null Force Cooling Unit
	[168568] = "Learnable", -- Null Force Nullifier
	[168569] = "Learnable", -- Null Force Visualizer
	[173288] = "Learnable", -- Overflowing Azerite Geode
	[168846] = "Learnable", -- Pearl of Lucid Dreams
	[168849] = "Learnable", -- Pearl of Luminous Designs
	[168847] = "Learnable", -- Pearl of Manifest Ambitions
	[168848] = "Learnable", -- Pearl of Perspicuous Intentions
	[168844] = "Learnable", -- Perfection-Enhancing Gearbox
	[168843] = "Learnable", -- Perfectly Timed Differential
	[168574] = "Learnable", -- Petrified Living Bark
	[168865] = "Learnable", -- Polarized Azerite Slivershards
	[169899] = "Learnable", -- Polished Skull Trophy
	[173289] = "Learnable", -- Pulsing Azerite Geode
	[168855] = "Learnable", -- Pulsing Elemental Heart
	[168816] = "Learnable", -- Pulsing Star Heart
	[173290] = "Learnable", -- Quickening Azerite Geode
	[168932] = "Learnable", -- Reactive Existence Battery
	[168536] = "Learnable", -- Recrystallizing Azerite Formation
	[168839] = "Learnable", -- Regenerating Barrier of the Depths
	[168925] = "Learnable", -- Replicating Seed of Abundance
	[173883] = "Learnable", -- Replicating Void Droplets
	[168856] = "Learnable", -- Resonating Elemental Heart
	[168840] = "Learnable", -- Resplendent Bastion of the Depths
	[173311] = "Learnable", -- Resplendent Warden's Badge
	[169900] = "Learnable", -- Rib-Bone Choker of Dominance
	[168442] = "Learnable", -- Roiling Blood of the Vanquished
	[168576] = "Learnable", -- Roots of Magnificent Revival
	[168927] = "Learnable", -- Seed of Vibrant Blooms
	[168864] = "Learnable", -- Sharpened Azerite Slivershards
	[168857] = "Learnable", -- Sparkling Elemental Heart
	[168581] = "Learnable", -- Sphere of Incandescent Neutralization
	[168580] = "Learnable", -- Sphere of Leeched Mobility
	[168578] = "Learnable", -- Sphere of Suppressed Force
	[168579] = "Learnable", -- Sphere of Unrestrained Fury
	[168622] = "Learnable", -- Stabilizing Lens of the Focusing Iris
	[168852] = "Learnable", -- Stalwart Battlefield Memento
	[168616] = "Learnable", -- Stalwart Worldvein
	[168439] = "Learnable", -- Swirling Star Dust
	[168928] = "Learnable", -- Tablet of the Balancing Tides
	[168859] = "Learnable", -- Targeted Purification Protocols
	[168537] = "Learnable", -- Tempered Azerite Formation
	[168613] = "Learnable", -- Tempered Scale of the Scarlet Broodmother
	[168850] = "Learnable", -- Time-Lost Battlefield Memento
	[168858] = "Learnable", -- Titan Purification Protocols
	[173283] = "Learnable", -- Token of a Brilliant Death
	[173280] = "Learnable", -- Token of Death's Door
	[173282] = "Learnable", -- Token of Death's Glee
	[173281] = "Learnable", -- Token of Death's Mark
	[168930] = "Learnable", -- Tome of the Quickening Tides
	[168861] = "Learnable", -- Ultimate Purification Protocols
	[168863] = "Learnable", -- Unbound Azerite Slivershards
	[168923] = "Learnable", -- Unburdened Azerite Timequartz
	[168931] = "Learnable", -- Vellum of Illuminating Tides
	[168941] = "Learnable", -- Vitality Redistribution Lattice
	[173885] = "Learnable", -- Volatile Void Droplet
	[168615] = "Learnable", -- Volatile Worldvein
	[168938] = "Learnable", -- Ward of Mutual Aid
	[168937] = "Learnable", -- Ward of Reciprocation
	[168940] = "Learnable", -- Ward of Unimaginable Brilliance
	[168936] = "Learnable", -- Ward of Unwavering Hope
	[173309] = "Learnable", -- Water Dancer's Technique
	[168944] = "Learnable", -- Web of Unbridled Vitality
	-- -- Legendary Power
	[183382] = "Learnable", -- Memory of a Battlelord
	[187109] = "Learnable", -- Memory of a Blazing Slaughter
	[183216] = "Learnable", -- Memory of a Burning Wound
	[187237] = "Learnable", -- Memory of a Call to Arms
	[183231] = "Learnable", -- Memory of a Cat-Eye Curio
	[183288] = "Learnable", -- Memory of a Celestial Infusion
	[183318] = "Learnable", -- Memory of a Clear Mind
	[183339] = "Learnable", -- Memory of a Concealed Blunderbuss
	[183251] = "Learnable", -- Memory of a Craven Strategem
	[183212] = "Learnable", -- Memory of a Darkglare Medallion
	[183224] = "Learnable", -- Memory of a Deep Focus Draught
	[183254] = "Learnable", -- Memory of a Dire Command
	[183322] = "Learnable", -- Memory of a Divine Image
	[183210] = "Learnable", -- Memory of a Fel Bombardment
	[183274] = "Learnable", -- Memory of a Fevered Incantation
	[183218] = "Learnable", -- Memory of a Fortified Fel Flame
	[182638] = "Learnable", -- Memory of a Frenzied Monstrosity
	[182634] = "Learnable", -- Memory of a Frozen Champion's Rage
	[183268] = "Learnable", -- Memory of a Grisly Icicle
	[183341] = "Learnable", -- Memory of a Guile Charm
	[183324] = "Learnable", -- Memory of a Harmonious Apparatus
	[183317] = "Learnable", -- Memory of a Heavenly Vault
	[183307] = "Learnable", -- Memory of a Holy Sigil
	[183234] = "Learnable", -- Memory of a Luffa-Infused Embrace
	[183362] = "Learnable", -- Memory of a Malefic Wrath
	[183329] = "Learnable", -- Memory of a Prism of Shadow and Fire
	[182640] = "Learnable", -- Memory of a Reanimated Shambler
	[183388] = "Learnable", -- Memory of a Reckless Defense
	[183312] = "Learnable", -- Memory of a Relentless Inquisitor
	[183390] = "Learnable", -- Memory of a Reprisal
	[183380] = "Learnable", -- Memory of a Seismic Reverberation
	[183272] = "Learnable", -- Memory of a Siphoning Storm
	[183247] = "Learnable", -- Memory of a Stable Phantasma Lure
	[183232] = "Learnable", -- Memory of a Symmetrical Eye
	[183273] = "Learnable", -- Memory of a Temporal Warp
	[183229] = "Learnable", -- Memory of a Timeworn Dreambinder
	[183252] = "Learnable", -- Memory of a Trapping Apparatus
	[182631] = "Learnable", -- Memory of a Vampiric Aura
	[183249] = "Learnable", -- Memory of a Vital Sacrifice
	[183265] = "Learnable", -- Memory of a Wildfire Cluster
	[182632] = "Learnable", -- Memory of Absolute Zero
	[183342] = "Learnable", -- Memory of Akaari's Soul Fragment
	[186568] = "Learnable", -- Memory of an Abomination's Frenzy
	[183346] = "Learnable", -- Memory of an Ancestral Reminder
	[183270] = "Learnable", -- Memory of an Arcane Bombardment
	[183358] = "Learnable", -- Memory of an Earthen Harmony
	[183351] = "Learnable", -- Memory of an Elemental Equilibrium
	[183383] = "Learnable", -- Memory of an Enduring Blow
	[183215] = "Learnable", -- Memory of an Erratic Fel Core
	[182625] = "Learnable", -- Memory of an Everlasting Grip
	[183267] = "Learnable", -- Memory of an Expanded Potential
	[183373] = "Learnable", -- Memory of an Implosive Potential
	[183393] = "Learnable", -- Memory of an Unbreakable Will
	[183239] = "Learnable", -- Memory of an Unending Growth
	[183290] = "Learnable", -- Memory of Ancient Teachings
	[183228] = "Learnable", -- Memory of Arcane Pulsars
	[183325] = "Learnable", -- Memory of Archbishop Benedictus
	[183363] = "Learnable", -- Memory of Azj'Aqir's Agony
	[183374] = "Learnable", -- Memory of Azj'Aqir's Cinders
	[183376] = "Learnable", -- Memory of Azj'Aqir's Madness
	[187111] = "Learnable", -- Memory of Blind Faith
	[183330] = "Learnable", -- Memory of Bloodfang's Essence
	[182628] = "Learnable", -- Memory of Bryndaor
	[187161] = "Learnable", -- Memory of Bwonsamdi's Pact
	[183314] = "Learnable", -- Memory of Cauterizing Shadows
	[183338] = "Learnable", -- Memory of Celerity
	[186687] = "Learnable", -- Memory of Celestial Spirits
	[183287] = "Learnable", -- Memory of Charred Passions
	[183292] = "Learnable", -- Memory of Clouded Focus
	[182637] = "Learnable", -- Memory of Death's Certainty
	[182617] = "Learnable", -- Memory of Death's Embrace
	[186621] = "Learnable", -- Memory of Death's Fathom
	[183348] = "Learnable", -- Memory of Deeply Rooted Elements
	[183367] = "Learnable", -- Memory of Demonic Synergy
	[183347] = "Learnable", -- Memory of Devastating Chains
	[187106] = "Learnable", -- Memory of Divine Resonance
	[183258] = "Learnable", -- Memory of Eagletalon's True Focus
	[187511] = "Learnable", -- Memory of Elysian Might
	[183242] = "Learnable", -- Memory of Eonar
	[183284] = "Learnable", -- Memory of Escaping from Reality
	[183344] = "Learnable", -- Memory of Finality
	[183323] = "Learnable", -- Memory of Flash Concentration
	[183280] = "Learnable", -- Memory of Fragments of Ice
	[183386] = "Learnable", -- Memory of Fujieda
	[186570] = "Learnable", -- Memory of Glory
	[182630] = "Learnable", -- Memory of Gorefiend's Domination
	[183340] = "Learnable", -- Memory of Greenskin
	[186567] = "Learnable", -- Memory of Insatiable Hunger
	[183331] = "Learnable", -- Memory of Invigorating Shadowdust
	[183248] = "Learnable", -- Memory of Jailer's Eye
	[183359] = "Learnable", -- Memory of Jonat
	[183295] = "Learnable", -- Memory of Keefer
	[186673] = "Learnable", -- Memory of Kindred Affinity
	[182635] = "Learnable", -- Memory of Koltira
	[183225] = "Learnable", -- Memory of Lycara
	[183303] = "Learnable", -- Memory of Maraad's Dying Breath
	[183315] = "Learnable", -- Memory of Measured Contemplation
	[183319] = "Learnable", -- Memory of my Crystalline Reflection
	[183217] = "Learnable", -- Memory of my Darker Nature
	[186576] = "Learnable", -- Memory of Nature's Fury
	[183245] = "Learnable", -- Memory of Norgannon
	[183227] = "Learnable", -- Memory of Oneth
	[187160] = "Learnable", -- Memory of Pallid Command
	[183263] = "Learnable", -- Memory of Poisonous Injectors
	[187127] = "Learnable", -- Memory of Radiant Embers
	[186565] = "Learnable", -- Memory of Rampant Transference
	[183220] = "Learnable", -- Memory of Razelikh's Defilement
	[186775] = "Learnable", -- Memory of Resounding Clarity
	[183364] = "Learnable", -- Memory of Sacrolash's Dark Strike
	[183246] = "Learnable", -- Memory of Sephuz
	[187162] = "Learnable", -- Memory of Shadow Word: Manipulation
	[183286] = "Learnable", -- Memory of Shaohao
	[186635] = "Learnable", -- Memory of Sinful Delight
	[186609] = "Learnable", -- Memory of Sinful Hysteria
	[187277] = "Learnable", -- Memory of Sinister Teachings
	[183281] = "Learnable", -- Memory of Slick Ice
	[183219] = "Learnable", -- Memory of Soul of Fire
	[183289] = "Learnable", -- Memory of Stormstout
	[182627] = "Learnable", -- Memory of Superstrain
	[183261] = "Learnable", -- Memory of Surging Shots
	[183328] = "Learnable", -- Memory of Talbadar
	[187105] = "Learnable", -- Memory of the Agonizing Gaze
	[183213] = "Learnable", -- Memory of the Anguish of the Collective
	[183230] = "Learnable", -- Memory of the Apex Predator
	[183243] = "Learnable", -- Memory of the Arbiter's Judgment
	[183309] = "Learnable", -- Memory of the Ardent Protector
	[187230] = "Learnable", -- Memory of the Bag of Munitions
	[183226] = "Learnable", -- Memory of the Balance of All Things
	[183389] = "Learnable", -- Memory of the Berserker's Will
	[182633] = "Learnable", -- Memory of the Biting Cold
	[187217] = "Learnable", -- Memory of the Bountiful Brew
	[183262] = "Learnable", -- Memory of the Butcher's Bone Fragments
	[183214] = "Learnable", -- Memory of the Chaos Theory
	[183223] = "Learnable", -- Memory of the Circle of Life and Death
	[183366] = "Learnable", -- Memory of the Claw of Endereth
	[183278] = "Learnable", -- Memory of the Cold Front
	[183365] = "Learnable", -- Memory of the Consuming Wrath
	[187228] = "Learnable", -- Memory of the Contained Perpetual Explosion
	[183370] = "Learnable", -- Memory of the Core of the Balespider
	[182629] = "Learnable", -- Memory of the Crimson Runes
	[183221] = "Learnable", -- Memory of the Dark Flame Spirit
	[183368] = "Learnable", -- Memory of the Dark Portal
	[183241] = "Learnable", -- Memory of the Dark Titan
	[183334] = "Learnable", -- Memory of the Dashing Scoundrel
	[182636] = "Learnable", -- Memory of the Deadliest Coil
	[183343] = "Learnable", -- Memory of the Deathly Shadows
	[183387] = "Learnable", -- Memory of the Deathmaker
	[186712] = "Learnable", -- Memory of the Deathspike
	[187227] = "Learnable", -- Memory of the Decaying Soul Satchel
	[183349] = "Learnable", -- Memory of the Deeptremor Stone
	[183352] = "Learnable", -- Memory of the Demise of Skybreaker
	[187118] = "Learnable", -- Memory of the Demonic Oath
	[183375] = "Learnable", -- Memory of the Diabolic Raiment
	[183266] = "Learnable", -- Memory of the Disciplinary Command
	[183354] = "Learnable", -- Memory of the Doom Winds
	[183335] = "Learnable", -- Memory of the Doomblade
	[183336] = "Learnable", -- Memory of the Duskwalker's Patch
	[187107] = "Learnable", -- Memory of the Duty-Bound Gavel
	[183222] = "Learnable", -- Memory of the Elder Druid
	[187224] = "Learnable", -- Memory of the Elemental Conduit
	[183308] = "Learnable", -- Memory of the Endless Kings
	[183256] = "Learnable", -- Memory of the Eredun War Order
	[183384] = "Learnable", -- Memory of the Exploiter
	[187280] = "Learnable", -- Memory of the Fae Heart
	[187258] = "Learnable", -- Memory of the Faeline Harmony
	[183282] = "Learnable", -- Memory of the Fatal Touch
	[186566] = "Learnable", -- Memory of the Final Sentence
	[183311] = "Learnable", -- Memory of the Final Verdict
	[183275] = "Learnable", -- Memory of the Firestorm
	[183255] = "Learnable", -- Memory of the Flamewaker
	[187231] = "Learnable", -- Memory of the Fragments of the Elder Antlers
	[183279] = "Learnable", -- Memory of the Freezing Winds
	[183233] = "Learnable", -- Memory of the Frenzyband
	[183355] = "Learnable", -- Memory of the Frost Witch
	[183350] = "Learnable", -- Memory of the Great Sundering
	[183372] = "Learnable", -- Memory of the Grim Inquisitor
	[186591] = "Learnable", -- Memory of the Harmonic Echo
	[183371] = "Learnable", -- Memory of the Horned Nightmare
	[183211] = "Learnable", -- Memory of the Hour of Darkness
	[183271] = "Learnable", -- Memory of the Infinite Arcane
	[183283] = "Learnable", -- Memory of the Invoker
	[183294] = "Learnable", -- Memory of the Jade Ignition
	[183320] = "Learnable", -- Memory of the Kiss of Death
	[187225] = "Learnable", -- Memory of the Languishing Soul Detritus
	[183296] = "Learnable", -- Memory of the Last Emperor
	[183378] = "Learnable", -- Memory of the Leaper
	[183313] = "Learnable", -- Memory of the Lightbringer's Tempest
	[183298] = "Learnable", -- Memory of the Mad Paragon
	[183300] = "Learnable", -- Memory of the Magistrate's Judgment
	[183332] = "Learnable", -- Memory of the Master Assassin's Mark
	[183379] = "Learnable", -- Memory of the Misshapen Mirror
	[183276] = "Learnable", -- Memory of the Molten Sky
	[183293] = "Learnable", -- Memory of the Morning's Tear
	[183240] = "Learnable", -- Memory of the Mother Tree
	[183235] = "Learnable", -- Memory of the Natural Order
	[186710] = "Learnable", -- Memory of the Obedient
	[187229] = "Learnable", -- Memory of the Pact of the Soulstalkers
	[183327] = "Learnable", -- Memory of the Painbreaker Psalm
	[183321] = "Learnable", -- Memory of the Penitent One
	[182626] = "Learnable", -- Memory of the Phearomones
	[187232] = "Learnable", -- Memory of the Pouch of Razor Fragments
	[183356] = "Learnable", -- Memory of the Primal Lava Actuators
	[183360] = "Learnable", -- Memory of the Primal Tide Core
	[187259] = "Learnable", -- Memory of the Raging Vesper Vortex
	[183244] = "Learnable", -- Memory of the Rattle of the Maw
	[183306] = "Learnable", -- Memory of the Righteous Bulwark
	[183345] = "Learnable", -- Memory of the Rotten
	[183257] = "Learnable", -- Memory of the Rylakstalker's Fangs
	[183264] = "Learnable", -- Memory of the Rylakstalker's Strikes
	[187132] = "Learnable", -- Memory of the Seasons of Plenty
	[187223] = "Learnable", -- Memory of the Seeds of Rampant Growth
	[183260] = "Learnable", -- Memory of the Serpentstalker's Trickery
	[183304] = "Learnable", -- Memory of the Shadowbreaker
	[187226] = "Learnable", -- Memory of the Shards of Annihilation
	[183305] = "Learnable", -- Memory of the Shock Barrier
	[186572] = "Learnable", -- Memory of the Sinful Surge
	[183237] = "Learnable", -- Memory of the Sleeper
	[183253] = "Learnable", -- Memory of the Soulforge Embers
	[187163] = "Learnable", -- Memory of the Spheres' Harmony
	[183361] = "Learnable", -- Memory of the Spiritwalker's Tidal Totem
	[186689] = "Learnable", -- Memory of the Splintered Elements
	[183277] = "Learnable", -- Memory of the Sun King
	[183299] = "Learnable", -- Memory of the Sun's Cycles
	[183302] = "Learnable", -- Memory of the Sunwell's Bloom
	[183285] = "Learnable", -- Memory of the Swiftsure Wraps
	[183392] = "Learnable", -- Memory of the Thunderlord
	[183381] = "Learnable", -- Memory of the Tormented Kings
	[186676] = "Learnable", -- Memory of the Toxic Onslaught
	[183269] = "Learnable", -- Memory of the Triune Ward
	[183316] = "Learnable", -- Memory of the Twins of the Sun Priestess
	[183259] = "Learnable", -- Memory of the Unblinking Vigil
	[186577] = "Learnable", -- Memory of the Unbridled Swarm
	[183385] = "Learnable", -- Memory of the Unhinged
	[183310] = "Learnable", -- Memory of the Vanguard's Momentum
	[183238] = "Learnable", -- Memory of the Verdant Infusion
	[183326] = "Learnable", -- Memory of the Void's Eternal Call
	[183391] = "Learnable", -- Memory of the Wall
	[183250] = "Learnable", -- Memory of the Wild Call
	[183353] = "Learnable", -- Memory of the Windspeaker's Lava Resurgence
	[183357] = "Learnable", -- Memory of the Witch Doctor
	[183377] = "Learnable", -- Memory of the Ymirjar
	[183337] = "Learnable", -- Memory of the Zoldyck Insignia
	[183333] = "Learnable", -- Memory of Tiny Toxic Blade
	[190584] = "Learnable", -- Memory of Unity
	[190596] = "Learnable", -- Memory of Unity
	[190590] = "Learnable", -- Memory of Unity
	[190594] = "Learnable", -- Memory of Unity
	[190589] = "Learnable", -- Memory of Unity
	[190587] = "Learnable", -- Memory of Unity
	[190595] = "Learnable", -- Memory of Unity
	[190588] = "Learnable", -- Memory of Unity
	[190592] = "Learnable", -- Memory of Unity
	[190593] = "Learnable", -- Memory of Unity
	[190598] = "Learnable", -- Memory of Unity
	[190591] = "Learnable", -- Memory of Unity
	[183236] = "Learnable", -- Memory of Ursoc
	[183301] = "Learnable", -- Memory of Uther
	[183369] = "Learnable", -- Memory of Wilfred's Sigil of Superior Summoning
	[183297] = "Learnable", -- Memory of Xuen
	[183291] = "Learnable", -- Memory of Yu'lon
	-- -- Conduit
	[190184] = "Learnable|Quest:65623|Account Bound", -- Incense of Infinity
	[190640] = "Learnable", -- Font of Ephemeral Power
	[190956] = "Learnable", -- Decanter of Untapped Potential
	[187148] = "Learnable", -- Death-Bound Shard
	[190640] = "Learnable", -- Font of Ephemeral Power
	[190644] = "Learnable", -- Vessel of Profound Possibilities
	[181848] = "Learnable", -- Accelerated Cold
	[182460] = "Learnable", -- Accrued Vitality
	[187507] = "Learnable", -- Adaptive Armor Fragment
	[183508] = "Learnable", -- Ambidexterity
	[184587] = "Learnable", -- Ambuscade
	[181509] = "Learnable", -- Arcane Prodigy
	[181738] = "Learnable", -- Artifice of the Archmage
	[180933] = "Learnable", -- Ashen Juggernaut
	[182755] = "Learnable", -- Ashen Remains
	[182105] = "Learnable", -- Astral Protection
	[181963] = "Learnable", -- Blood Bond
	[183402] = "Learnable", -- Bloodletting
	[181770] = "Learnable", -- Bone Marrow Hops
	[183468] = "Learnable", -- Born Anew
	[183470] = "Learnable", -- Born of the Wilds
	[182748] = "Learnable", -- Borne of Blood
	[182706] = "Learnable", -- Brooding Pool
	[182292] = "Learnable", -- Brutal Grasp
	[182649] = "Learnable", -- Brutal Projectiles
	[180844] = "Learnable", -- Brutal Vitality
	[180943] = "Learnable", -- Cacophonous Roar
	[181435] = "Learnable", -- Calculated Strikes
	[182128] = "Learnable", -- Call of Flame
	[183483] = "Learnable", -- Carnivorous Instinct
	[182750] = "Learnable", -- Carnivorous Stalkers
	[182962] = "Learnable", -- Catastrophic Origin
	[181705] = "Learnable", -- Celestial Effervescence
	[181838] = "Learnable", -- Charitable Soul
	[182584] = "Learnable", -- Cheetah's Vigor
	[181834] = "Learnable", -- Chilled Resilience
	[182136] = "Learnable", -- Chilled to the Core
	[181837] = "Learnable", -- Clear Mind
	[183498] = "Learnable", -- Cloaked in Shadows
	[182769] = "Learnable", -- Combusting Engine
	[187506] = "Learnable", -- Condensed Anima Sphere
	[183473] = "Learnable", -- Conflux of Elements
	[183197] = "Learnable", -- Controlled Destruction
	[182206] = "Learnable", -- Convocation of the Dead
	[181462] = "Learnable", -- Coordinated Offensive
	[182478] = "Learnable", -- Corrupting Leer
	[183510] = "Learnable", -- Count the Odds
	[181974] = "Learnable", -- Courageous Ascension
	[180935] = "Learnable", -- Crash the Ramparts
	[182110] = "Learnable", -- Crippling Hex
	[181698] = "Learnable", -- Cryo-Freeze
	[182383] = "Learnable", -- Dancing with Fate
	[182657] = "Learnable", -- Deadly Chain
	[183202] = "Learnable", -- Deadly Tandem
	[182203] = "Learnable", -- Debilitating Malady
	[183471] = "Learnable", -- Deep Allegiance
	[183511] = "Learnable", -- Deeper Daggers
	[182598] = "Learnable", -- Demon Muzzle
	[182470] = "Learnable", -- Demonic Momentum
	[182330] = "Learnable", -- Demonic Parole
	[181712] = "Learnable", -- Depths of Insanity
	[182651] = "Learnable", -- Destructive Reverberations
	[183076] = "Learnable", -- Diabolic Bloodstone
	[181539] = "Learnable", -- Discipline of the Grove
	[182140] = "Learnable", -- Dissonant Echoes
	[182656] = "Learnable", -- Disturb the Peace
	[181707] = "Learnable", -- Diverted Energy
	[182304] = "Learnable", -- Divine Call
	[181512] = "Learnable", -- Dizzying Tumble
	[182754] = "Learnable", -- Duplicitous Havoc
	[182461] = "Learnable", -- Echoing Blessings
	[183132] = "Learnable", -- Echoing Call
	[182345] = "Learnable", -- Elysian Dirge
	[181980] = "Learnable", -- Embrace Death
	[182142] = "Learnable", -- Embrace of Earth
	[182331] = "Learnable", -- Empowered Release
	[183474] = "Learnable", -- Endless Thirst
	[182321] = "Learnable", -- Enfeebled Mark
	[182582] = "Learnable", -- Enkindled Spirit
	[181943] = "Learnable", -- Eradicating Blow
	[182347] = "Learnable", -- Essential Extraction
	[181786] = "Learnable", -- Eternal Hunger
	[181740] = "Learnable", -- Evasive Stride
	[181982] = "Learnable", -- Everfrost
	[183472] = "Learnable", -- Evolved Swarm
	[181845] = "Learnable", -- Exaltation
	[182462] = "Learnable", -- Expurgation
	[183500] = "Learnable", -- Fade to Nothing
	[182129] = "Learnable", -- Fae Fermata
	[182961] = "Learnable", -- Fatal Decimation
	[182340] = "Learnable", -- Fel Celerity
	[182752] = "Learnable", -- Fel Commando
	[182316] = "Learnable", -- Fel Defender
	[182324] = "Learnable", -- Felfire Haste
	[182610] = "Learnable", -- Ferocious Appetite
	[181981] = "Learnable", -- Festering Transfusion
	[181736] = "Learnable", -- Flame Accretion
	[183396] = "Learnable", -- Flame Infusion
	[183489] = "Learnable", -- Flash of Clarity
	[182113] = "Learnable", -- Fleeting Wind
	[183490] = "Learnable", -- Floral Recycling
	[181467] = "Learnable", -- Flow of Time
	[182667] = "Learnable", -- Focused Light
	[182135] = "Learnable", -- Focused Lightning
	[182743] = "Learnable", -- Focused Malignancy
	[181942] = "Learnable", -- Focused Mending
	[181508] = "Learnable", -- Fortifying Ingredients
	[183469] = "Learnable", -- Front of the Pack
	[180932] = "Learnable", -- Fueled by Violence
	[183478] = "Learnable", -- Fury of the Skies
	[181553] = "Learnable", -- Gift of the Lich
	[182336] = "Learnable", -- Golden Path
	[181466] = "Learnable", -- Grounding Breath
	[181498] = "Learnable", -- Grounding Surge
	[182385] = "Learnable", -- Growing Inferno
	[181735] = "Learnable", -- Hack and Slash
	[182777] = "Learnable", -- Hallowed Discernment
	[181975] = "Learnable", -- Hardened Bones
	[181373] = "Learnable", -- Harm Denial
	[182464] = "Learnable", -- Harmony of the Tortollan
	[182463] = "Learnable", -- Harrowing Punishment
	[182131] = "Learnable", -- Haunting Apparitions
	[182145] = "Learnable", -- Heavy Rainfall
	[182126] = "Learnable", -- High Voltage
	[182141] = "Learnable", -- Holy Oration
	[181461] = "Learnable", -- Ice Bite
	[181455] = "Learnable", -- Icy Propulsion
	[181774] = "Learnable", -- Imbued Reflections
	[182288] = "Learnable", -- Impenetrable Gloom
	[181756] = "Learnable", -- Incantation of Swiftness
	[183481] = "Learnable", -- Incessant Hunter
	[182685] = "Learnable", -- Increased Scrutiny
	[181469] = "Learnable", -- Indelible Victory
	[182772] = "Learnable", -- Infernal Brand
	[181504] = "Learnable", -- Infernal Cascade
	[183466] = "Learnable", -- Innate Resolve
	[181376] = "Learnable", -- Inner Fury
	[182133] = "Learnable", -- Insatiable Appetite
	[180847] = "Learnable", -- Inspiring Presence
	[181600] = "Learnable", -- Ire of the Ascended
	[181495] = "Learnable", -- Jade Bond
	[183044] = "Learnable", -- Kilrogg's Cunning
	[183495] = "Learnable", -- Lashing Scars
	[181847] = "Learnable", -- Lasting Spirit
	[182348] = "Learnable", -- Lavish Harvest
	[183487] = "Learnable", -- Layered Mane
	[183506] = "Learnable", -- Lethal Poisons
	[182448] = "Learnable", -- Light's Barding
	[181840] = "Learnable", -- Light's Inspiration
	[181510] = "Learnable", -- Lingering Numbness
	[182208] = "Learnable", -- Lingering Plague
	[182344] = "Learnable", -- Lost in Darkness
	[181734] = "Learnable", -- Magi's Brand
	[182137] = "Learnable", -- Magma Fist
	[183505] = "Learnable", -- Maim, Mangle
	[182441] = "Learnable", -- Marksman's Advantage
	[181506] = "Learnable", -- Master Flame
	[182187] = "Learnable", -- Meat Shield
	[181962] = "Learnable", -- Mental Recovery
	[180944] = "Learnable", -- Merciless Bonegrinder
	[182138] = "Learnable", -- Mind Devourer
	[182468] = "Learnable", -- Mortal Combo
	[181827] = "Learnable", -- Move with Grace
	[182144] = "Learnable", -- Nature's Focus
	[182339] = "Learnable", -- Necrotic Barrage
	[181511] = "Learnable", -- Nether Precision
	[183496] = "Learnable", -- Nimble Fingers
	[181737] = "Learnable", -- Nourishing Chi
	[182621] = "Learnable", -- One With the Beast
	[181844] = "Learnable", -- Pain Transformation
	[183514] = "Learnable", -- Perforated Veins
	[182440] = "Learnable", -- Piercing Verdict
	[183512] = "Learnable", -- Planned Execution
	[183503] = "Learnable", -- Poisoned Katar
	[181842] = "Learnable", -- Power Unto Others
	[182686] = "Learnable", -- Powerful Precision
	[183477] = "Learnable", -- Precise Alignment
	[183502] = "Learnable", -- Prepared for All
	[182295] = "Learnable", -- Proliferation
	[182677] = "Learnable", -- Punish the Guilty
	[182338] = "Learnable", -- Pure Concentration
	[182125] = "Learnable", -- Pyroclastic Shock
	[183499] = "Learnable", -- Quick Decisions
	[182139] = "Learnable", -- Rabid Shadows
	[182325] = "Learnable", -- Ravenous Consumption
	[183491] = "Learnable", -- Ready for Anything
	[183497] = "Learnable", -- Recuperator
	[182106] = "Learnable", -- Refreshing Waters
	[181841] = "Learnable", -- Reinforced Shell
	[182469] = "Learnable", -- Rejuvenating Wind
	[182368] = "Learnable", -- Relentless Onslaught
	[182646] = "Learnable", -- Repeat Decree
	[182476] = "Learnable", -- Resilience of the Hunter
	[182449] = "Learnable", -- Resolute Barrier
	[182684] = "Learnable", -- Resolute Defender
	[181944] = "Learnable", -- Resonant Words
	[182622] = "Learnable", -- Resplendent Light
	[181505] = "Learnable", -- Resplendent Mist
	[183492] = "Learnable", -- Reverberation
	[182480] = "Learnable", -- Reversal of Fortune
	[182770] = "Learnable", -- Righteous Might
	[182778] = "Learnable", -- Ringing Clarity
	[181641] = "Learnable", -- Rising Sun Revival
	[182604] = "Learnable", -- Roaring Fire
	[182736] = "Learnable", -- Rolling Agony
	[182753] = "Learnable", -- Royal Decree
	[183501] = "Learnable", -- Rushed Setup
	[180896] = "Learnable", -- Safeguard
	[183485] = "Learnable", -- Savage Combatant
	[181700] = "Learnable", -- Scalding Brew
	[183494] = "Learnable", -- Septic Shock
	[182384] = "Learnable", -- Serrated Glaive
	[182466] = "Learnable", -- Shade of Terror
	[182127] = "Learnable", -- Shake the Foundations
	[182648] = "Learnable", -- Sharpshooter's Focus
	[182130] = "Learnable", -- Shattered Perceptions
	[182317] = "Learnable", -- Shattered Restoration
	[182307] = "Learnable", -- Shielding Words
	[181843] = "Learnable", -- Shining Radiance
	[181389] = "Learnable", -- Shivering Core
	[182624] = "Learnable", -- Show of Force
	[181639] = "Learnable", -- Siphoned Malice
	[183509] = "Learnable", -- Sleight of Hand
	[182964] = "Learnable", -- Soul Eater
	[182471] = "Learnable", -- Soul Furnace
	[182960] = "Learnable", -- Soul Tithe
	[182335] = "Learnable", -- Spirit Attunement
	[181836] = "Learnable", -- Spirit Drain
	[182111] = "Learnable", -- Spiritual Resonance
	[180842] = "Learnable", -- Stalwart Guardian
	[183476] = "Learnable", -- Stellar Inspiration
	[183513] = "Learnable", -- Stiletto Staccato
	[183184] = "Learnable", -- Stinging Strike
	[183167] = "Learnable", -- Strength of the Pack
	[181759] = "Learnable", -- Strike with Clarity
	[183482] = "Learnable", -- Sudden Ambush
	[183493] = "Learnable", -- Sudden Fractures
	[181867] = "Learnable", -- Swift Penitence
	[181624] = "Learnable", -- Swift Transference
	[182143] = "Learnable", -- Swirling Currents
	[182605] = "Learnable", -- Tactical Retreat
	[183480] = "Learnable", -- Taste for Blood
	[181769] = "Learnable", -- Tempest Barrier
	[182559] = "Learnable", -- Templar's Vindication
	[180843] = "Learnable", -- Template Conduit
	[182767] = "Learnable", -- The Long Summer
	[182108] = "Learnable", -- Thunderous Paws
	[183467] = "Learnable", -- Tireless Pursuit
	[182109] = "Learnable", -- Totemic Surge
	[183464] = "Learnable", -- Tough as Bark
	[181826] = "Learnable", -- Translucent Image
	[183507] = "Learnable", -- Triple Threat
	[182465] = "Learnable", -- Truth's Wake
	[181640] = "Learnable", -- Tumbling Technique
	[182346] = "Learnable", -- Tumbling Waves
	[182751] = "Learnable", -- Tyrant's Soul
	[183479] = "Learnable", -- Umbral Intensity
	[183484] = "Learnable", -- Unchecked Aggression
	[182132] = "Learnable", -- Unending Grip
	[182201] = "Learnable", -- Unleashed Frenzy
	[183463] = "Learnable", -- Unnatural Malice
	[181709] = "Learnable", -- Unnerving Focus
	[181383] = "Learnable", -- Unrelenting Cold
	[182134] = "Learnable", -- Unruly Winds
	[183488] = "Learnable", -- Unstoppable Growth
	[182675] = "Learnable", -- Untempered Dedication
	[183465] = "Learnable", -- Ursine Vigor
	[182681] = "Learnable", -- Vengeful Shock
	[182442] = "Learnable", -- Veteran's Repute
	[181776] = "Learnable", -- Vicious Contempt
	[182608] = "Learnable", -- Virtuous Command
	[182318] = "Learnable", -- Viscous Ink
	[182107] = "Learnable", -- Vital Accretion
	[181742] = "Learnable", -- Walk with the Ox
	[181775] = "Learnable", -- Way of the Fae
	[183486] = "Learnable", -- Well-Honed Instincts
	[183504] = "Learnable", -- Well-Placed Steel
	[181464] = "Learnable", -- Winter's Protection
	[182747] = "Learnable", -- Withering Bolt
	[183199] = "Learnable", -- Withering Ground
	[181866] = "Learnable", -- Withering Plague
	[182456] = "Learnable", -- Wrench Evil
	[181465] = "Learnable", -- Xuen's Bond

	--! Buff
	[187709] = "Buff", -- Celebration Package (18th)
	[189723] = "Buff", -- Absorptialic Crystallic Spheroid
	[189736] = "Buff", -- Absorptialic Fluidic Spheroid
	[189722] = "Buff", -- Alacrialic Crystallic Spheroid
	[189740] = "Buff", -- Alacrialic Fluidic Spheroid
	[189732] = "Buff", -- Constialic Crystallic Spheroid
	[189748] = "Buff", -- Constialic Fluidic Spheroid
	[189560] = "Buff", -- Deflectialic Crystallic Spheroid
	[189577] = "Buff", -- Deflectialic Fluidic Spheroid
	[189763] = "Buff", -- Efficialic Crystallic Spheroid
	[189757] = "Buff", -- Efficialic Fluidic Spheroid
	[189724] = "Buff", -- Extractialic Crystallic Spheroid
	[189739] = "Buff", -- Extractialic Fluidic Spheroid
	[189725] = "Buff", -- Flexialic Crystallic Spheroid
	[189749] = "Buff", -- Flexialic Fluidic Spheroid
	[189726] = "Buff", -- Focialic Crystallic Spheroid
	[189743] = "Buff", -- Focialic Fluidic Spheroid
	[189762] = "Buff", -- Fortialic Crystallic Spheroid
	[189755] = "Buff", -- Fortialic Fluidic Spheroid
	[189727] = "Buff", -- Healialic Crystallic Spheroid
	[189742] = "Buff", -- Healialic Fluidic Spheroid
	[189728] = "Buff", -- Obscurialic Crystallic Spheroid
	[189737] = "Buff", -- Obscurialic Fluidic Spheroid
	[189729] = "Buff", -- Osmosialic Crystallic Spheroid
	[189741] = "Buff", -- Osmosialic Fluidic Spheroid
	[189730] = "Buff", -- Perceptialic Crystallic Spheroid
	[189738] = "Buff", -- Perceptialic Fluidic Spheroid
	[189731] = "Buff", -- Potentialic Crystallic Spheroid
	[189744] = "Buff", -- Potentialic Fluidic Spheroid
	[189764] = "Buff", -- Reflectialic Crystallic Spheroid
	[189758] = "Buff", -- Reflectialic Fluidic Spheroid
	[189733] = "Buff", -- Relialic Crystallic Spheroid
	[189745] = "Buff", -- Relialic Fluidic Spheroid
	[189734] = "Buff", -- Rigialic Crystallic Spheroid
	[189746] = "Buff", -- Rigialic Fluidic Spheroid
	[189760] = "Buff", -- Robustialic Crystallic Spheroid
	[189759] = "Buff", -- Robustialic Fluidic Spheroid
	[189761] = "Buff", -- Toxicialic Crystallic Spheroid
	[189756] = "Buff", -- Toxicialic Fluidic Spheroid
	[189735] = "Buff", -- Velocialic Crystallic Spheroid
	[189747] = "Buff", -- Velocialic Fluidic Spheroid


	--[[ ! Junk ! ]]--

	-- Profession Tools
	[20815] = "Junk", -- Jeweler's Kit
	[177034] = "Junk", -- Gem Chisel Kit
	[6218] = "Junk", -- Runed Copper Rod
	[39505] = "Junk", -- Virtuoso Inking Set

	-- Trash
	[187893] = "Junk", -- Volatile Precursor
	[118225] = "Junk", -- Highmaul Hops
	[127991] = "Junk", -- Felmouth Frenzy
	[136654] = "Junk", -- Field Pack
	[138967] = "Junk", -- Big Fountain Goldfish
	[162516] = "Junk", -- Rasboralus
	[162517] = "Junk", -- U'taka
	[22710] = "Junk", -- Bloodthistle
	[22788] = "Junk", -- Flame Cap
	[22797] = "Junk", -- Nightmare Seed
	[27511] = "Junk", -- Inscribed Scrollcase
	[35285] = "Junk", -- Giant Sunfish
	[43571] = "Junk", -- Sewer Carp
	[43646] = "Junk", -- Fountain Goldfish
	[43647] = "Junk", -- Shimmering Minnow
	[43652] = "Junk", -- Slippery Eel
	[113340] = "Junk", -- Blood Card (1c)
	[113341] = "Junk", -- Blood Card (10s)
	[113342] = "Junk", -- Blood Card (50s)
	[113343] = "Junk", -- Blood Card (50s)
	[113344] = "Junk", -- Blood Card (1g)
	[113345] = "Junk", -- Blood Card (1g)
	[113350] = "Junk", -- Blood Card (50g)
	[113351] = "Junk", -- Blood Card (100g)
	[113352] = "Junk", -- Blood Card (1,000g)
	[113353] = "Junk", -- Blood Card (3,000g)
	[113354] = "Junk", -- Blood Card (6,000g)
	[62561] = "Junk", -- Fortune Card (10s)
	[62247] = "Junk", -- Fortune Card (10s)
	[62552] = "Junk", -- Fortune Card (10s)
	[62553] = "Junk", -- Fortune Card (10s)
	[62554] = "Junk", -- Fortune Card (10s)
	[62555] = "Junk", -- Fortune Card (10s)
	[62556] = "Junk", -- Fortune Card (10s)
	[62557] = "Junk", -- Fortune Card (10s)
	[62558] = "Junk", -- Fortune Card (10s)
	[62559] = "Junk", -- Fortune Card (10s)
	[62560] = "Junk", -- Fortune Card (10s)
	[62562] = "Junk", -- Fortune Card (10s)
	[62563] = "Junk", -- Fortune Card (10s)
	[62564] = "Junk", -- Fortune Card (10s)
	[62565] = "Junk", -- Fortune Card (10s)
	[62566] = "Junk", -- Fortune Card (10s)
	[62567] = "Junk", -- Fortune Card (10s)
	[62568] = "Junk", -- Fortune Card (10s)
	[62569] = "Junk", -- Fortune Card (10s)
	[62570] = "Junk", -- Fortune Card (10s)
	[62571] = "Junk", -- Fortune Card (10s)
	[62572] = "Junk", -- Fortune Card (10s)
	[62573] = "Junk", -- Fortune Card (10s)
	[62574] = "Junk", -- Fortune Card (10s)
	[62575] = "Junk", -- Fortune Card (10s)
	[62576] = "Junk", -- Fortune Card (10s)
	[62246] = "Junk", -- Fortune Card (50s)
	[62577] = "Junk", -- Fortune Card (50s)
	[62578] = "Junk", -- Fortune Card (50s)
	[62579] = "Junk", -- Fortune Card (50s)
	[62580] = "Junk", -- Fortune Card (50s)
	[62581] = "Junk", -- Fortune Card (50s)
	[62582] = "Junk", -- Fortune Card (50s)
	[62583] = "Junk", -- Fortune Card (50s)
	[62584] = "Junk", -- Fortune Card (50s)
	[62585] = "Junk", -- Fortune Card (50s)
	[62586] = "Junk", -- Fortune Card (50s)
	[62587] = "Junk", -- Fortune Card (50s)
	[62588] = "Junk", -- Fortune Card (50s)
	[62589] = "Junk", -- Fortune Card (50s)
	[62590] = "Junk", -- Fortune Card (50s)
	[62591] = "Junk", -- Fortune Card (50s)
	[60839] = "Junk", -- Fortune Card (1g)
	[62598] = "Junk", -- Fortune Card (1g)
	[62599] = "Junk", -- Fortune Card (1g)
	[62600] = "Junk", -- Fortune Card (1g)
	[62601] = "Junk", -- Fortune Card (1g)
	[60841] = "Junk", -- Fortune Card (5g)
	[62602] = "Junk", -- Fortune Card (5g)
	[62603] = "Junk", -- Fortune Card (5g)
	[62604] = "Junk", -- Fortune Card (5g)
	[62605] = "Junk", -- Fortune Card (5g)
	[60842] = "Junk", -- Fortune Card (20g)
	[60843] = "Junk", -- Fortune Card (50g)
	[62606] = "Junk", -- Fortune Card (50g)
	[60845] = "Junk", -- Fortune Card (200g)
	[60840] = "Junk", -- Fortune Card (1,000g)
	[60844] = "Junk", -- Fortune Card (5,000g)
	[10305] = "Junk", -- Scroll of Protection IV
	[10306] = "Junk", -- Scroll of Versatility IV
	[10307] = "Junk", -- Scroll of Stamina IV
	[10308] = "Junk", -- Scroll of Intellect IV
	[10309] = "Junk", -- Scroll of Agility IV
	[10310] = "Junk", -- Scroll of Strength IV
	[1180] = "Junk", -- Scroll of Stamina
	[1181] = "Junk", -- Scroll of Versatility
	[1477] = "Junk", -- Scroll of Agility II
	[1478] = "Junk", -- Scroll of Protection II
	[1711] = "Junk", -- Scroll of Stamina II
	[1712] = "Junk", -- Scroll of Versatility II
	[2289] = "Junk", -- Scroll of Strength II
	[2290] = "Junk", -- Scroll of Intellect II
	[27498] = "Junk", -- Scroll of Agility V
	[27499] = "Junk", -- Scroll of Intellect V
	[27500] = "Junk", -- Scroll of Protection V
	[27501] = "Junk", -- Scroll of Versatility V
	[27502] = "Junk", -- Scroll of Stamina V
	[27503] = "Junk", -- Scroll of Strength V
	[3012] = "Junk", -- Scroll of Agility
	[3013] = "Junk", -- Scroll of Protection
	[33457] = "Junk", -- Scroll of Agility VI
	[33458] = "Junk", -- Scroll of Intellect VI
	[33459] = "Junk", -- Scroll of Protection VI
	[33460] = "Junk", -- Scroll of Versatility VI
	[33461] = "Junk", -- Scroll of Stamina VI
	[33462] = "Junk", -- Scroll of Strength VI
	[37091] = "Junk", -- Scroll of Intellect VII
	[37092] = "Junk", -- Scroll of Intellect VIII
	[37093] = "Junk", -- Scroll of Stamina VII
	[37094] = "Junk", -- Scroll of Stamina VIII
	[37097] = "Junk", -- Scroll of Versatility VII
	[37098] = "Junk", -- Scroll of Versatility VIII
	[37098] = "Junk", -- Scroll of Versatility VIII
	[37098] = "Junk", -- Scroll of Versatility VIII
	[43463] = "Junk", -- Scroll of Agility VII
	[43464] = "Junk", -- Scroll of Agility VIII
	[43465] = "Junk", -- Scroll of Strength VII
	[43466] = "Junk", -- Scroll of Strength VIII
	[43467] = "Junk", -- Scroll of Protection VII
	[4419] = "Junk", -- Scroll of Intellect III
	[4421] = "Junk", -- Scroll of Protection III
	[4422] = "Junk", -- Scroll of Stamina III
	[4424] = "Junk", -- Scroll of Versatility III
	[4425] = "Junk", -- Scroll of Agility III
	[4426] = "Junk", -- Scroll of Strength III
	[63303] = "Junk", -- Scroll of Agility IX
	[63304] = "Junk", -- Scroll of Strength IX
	[63305] = "Junk", -- Scroll of Intellect IX
	[63306] = "Junk", -- Scroll of Stamina IX
	[63307] = "Junk", -- Scroll of Versatility IX
	[63308] = "Junk", -- Scroll of Protection IX
	[954] = "Junk", -- Scroll of Strength
	[955] = "Junk", -- Scroll of Intellect
	[141938] = "Junk", -- Shard of Vorgos
	[141939] = "Junk", -- Shard of Kozak
}

local Zigi = AdiBags:RegisterFilter("Zigi", 94)
Zigi.uiName = "Zigi";
Zigi.uiDesc = "Proper organization"

function Zigi:FormatName(name, profession)
	local class = select(2, UnitClass("player"))
	local faction = UnitFactionGroup("player")
	local covenant = C_Covenants and C_Covenants.GetActiveCovenantID() or 0

	-- Shortcuts
	if name == "Pieces" then name = "96. {vehicle-hammergold} Pieces#Container" end
	if name == "Buff" then name = "97. {ParagonReputation_Checkmark} [00ff00]Buff]#Container" end
	if name == "Learnable" then name = "98. {ParagonReputation_Checkmark} [00ff00]Learnable]#Container" end
	if name == "Learned" then name = "98. [ff0000]Learned]#Container" end
	if name == "Openable" then name = "99. {ParagonReputation_Bag} [00ff00]Openable]#Container" end
	if name == "Unbound" then name = "98. Unbound#Unbound" end
	if name == "Account Bound" then name = "99. [00ccff]Account Bound]#Unbound" end
	if name == "Junk" then name = "Junk#Junk" end
	if name == "Mythic Keystone" then
		name = "[a335ee]Mythic Keystone]#Mythic Keystone"
		local map = C_MythicPlus.GetOwnedKeystoneChallengeMapID()
		local level = C_MythicPlus.GetOwnedKeystoneLevel()

		if map and level then
			name = "[a335ee]Keystone: " .. (ChallengeMap[map] or map) .. " (" .. level .. ")]#Mythic Keystone"
		end
	end

	-- Sanctum
	if name == "94. Garrison#Sanctum" then
		-- Faction specific names for the Garrison
		if faction == "Alliance" then name = "94. Lunarfall#Sanctum" end
		if faction == "Horde" then name = "94. Frostwall#Sanctum" end
	elseif name == "93. Order Hall#Sanctum" then
		-- Class specific names for Order Halls
		if class == "DEATHKNIGHT" then name = "93. Acherus: The Ebon Hold#Sanctum" end
		if class == "DEMONHUNTER" then name = "93. The Fel Hammer#Sanctum" end
		if class == "DRUID" then name = "93. The Dreamgrove#Sanctum" end
		if class == "HUNTER" then name = "93. Trueshot Lodge#Sanctum" end
		if class == "MAGE" then name = "93. Hall of the Guardian#Sanctum" end
		if class == "MONK" then name = "93. Temple of Five Dawns#Sanctum" end
		if class == "PALADIN" then name = "93. Sanctum of Light#Sanctum" end
		if class == "PRIEST" then name = "93. Netherlight Temple#Sanctum" end
		if class == "ROGUE" then name = "93. Hall of Shadows#Sanctum" end
		if class == "SHAMAN" then name = "93. Heart of Azeroth#Sanctum" end
		if class == "WARLOCK" then name = "93. Dreadscar Rift#Sanctum" end
		if class == "WARRIOR" then name = "93. Skyhold#Sanctum" end
	elseif name == "9299. War Ship#Sanctum" then
		-- Faction specific names for the BfA War Ship
		if faction == "Alliance" then name = "9299. The Wind's Redemption#Sanctum" end
		if faction == "Horde" then name = "9299. The Banshee's Wail#Sanctum" end
	elseif name == "91. Covenant#Sanctum" then
		-- Covenant Sanctum names
		if covenant == 1 then name = "910499. Elysian Hold#Sanctum" end
		if covenant == 2 then name = "910199. Sinfall#Sanctum" end
		if covenant == 3 then name = "910299. Heart of the Forest#Sanctum" end
		if covenant == 4 then name = "910399. Seat of the Primus#Sanctum" end
	end

	-- Add spec info to Relics
	if name == "9301. Arcane Relic#Gem" then
		-- Arcane
		if class == "DEMONHUNTER" then name = "9301. Arcane Relic  {GarrMission_ClassIcon-DemonHunter-Vengeance}#Gem" end
		if class == "DRUID" then name = "9301. Arcane Relic  {GarrMission_ClassIcon-Druid-Balance}#Gem" end
		if class == "HUNTER" then name = "9301. Arcane Relic  {GarrMission_ClassIcon-Hunter-BeastMastery}#Gem" end
		if class == "MAGE" then name = "9301. Arcane Relic  {GarrMission_ClassIcon-Mage-Arcane} {GarrMission_ClassIcon-Mage-Fire} {GarrMission_ClassIcon-Mage-Frost}#Gem" end
		if class == "PALADIN" then name = "9301. Arcane Relic  {GarrMission_ClassIcon-Paladin-Protection}#Gem" end
	elseif name == "9302. Blood Relic#Gem" then
		-- Blood
		if class == "DEATHKNIGHT" then name = "9302. Blood Relic  {GarrMission_ClassIcon-DeathKnight-Blood} {GarrMission_ClassIcon-DeathKnight-Unholy}#Gem" end
		if class == "DRUID" then name = "9302. Blood Relic  {GarrMission_ClassIcon-Druid-Feral} {GarrMission_ClassIcon-Druid-Guardian}#Gem" end
		if class == "HUNTER" then name = "9302. Blood Relic  {GarrMission_ClassIcon-Hunter-Marksmanship} {GarrMission_ClassIcon-Hunter-Survival}#Gem" end
		if class == "PRIEST" then name = "9302. Blood Relic  {GarrMission_ClassIcon-Priest-Shadow}#Gem" end
		if class == "ROGUE" then name = "9302. Blood Relic  {GarrMission_ClassIcon-Rogue-Assassination} {GarrMission_ClassIcon-Rogue-Outlaw}#Gem" end
		if class == "WARLOCK" then name = "9302. Blood Relic  {GarrMission_ClassIcon-Warlock-Affliction}#Gem" end
		if class == "WARRIOR" then name = "9302. Blood Relic  {GarrMission_ClassIcon-Warrior-Arms} {GarrMission_ClassIcon-Warrior-Protection}#Gem" end
	elseif name == "9303. Fel Relic#Gem" then
		-- Fel
		if class == "DEMONHUNTER" then name = "9303. Fel Relic  {GarrMission_ClassIcon-DemonHunter-Havoc} {GarrMission_ClassIcon-DemonHunter-Vengeance}#Gem" end
		if class == "ROGUE" then name = "9303. Fel Relic  {GarrMission_ClassIcon-Rogue-Subtlety}#Gem" end
		if class == "WARLOCK" then name = "9303. Fel Relic  {GarrMission_ClassIcon-Warlock-Demonology} {GarrMission_ClassIcon-Warlock-Destruction}#Gem" end
	elseif name == "9304. Fire Relic#Gem" then
		-- Fire
		if class == "DEATHKNIGHT" then name = "9304. Fire Relic  {GarrMission_ClassIcon-DeathKnight-Unholy}#Gem" end
		if class == "DRUID" then name = "9304. Fire Relic  {GarrMission_ClassIcon-Druid-Guardian}#Gem" end
		if class == "MAGE" then name = "9304. Fire Relic  {GarrMission_ClassIcon-Mage-Fire}#Gem" end
		if class == "PALADIN" then name = "9304. Fire Relic  {GarrMission_ClassIcon-Paladin-Retribution}#Gem" end
		if class == "SHAMAN" then name = "9304. Fire Relic  {GarrMission_ClassIcon-Shaman-Ehancement}#Gem" end
		if class == "WARLOCK" then name = "9304. Fire Relic  {GarrMission_ClassIcon-Warlock-Demonology} {GarrMission_ClassIcon-Warlock-Destruction}#Gem" end
		if class == "WARRIOR" then name = "9304. Fire Relic  {GarrMission_ClassIcon-Warrior-Fury} {GarrMission_ClassIcon-Warrior-Protection}#Gem" end
	elseif name == "9305. Frost Relic#Gem" then
		-- Frost
		if class == "DEATHKNIGHT" then name = "9305. Frost Relic  {GarrMission_ClassIcon-DeathKnight-Frost}#Gem" end
		if class == "DRUID" then name = "9305. Frost Relic  {GarrMission_ClassIcon-Druid-Feral} {GarrMission_ClassIcon-Druid-Restoration}#Gem" end
		if class == "MAGE" then name = "9305. Frost Relic  {GarrMission_ClassIcon-Mage-Arcane} {GarrMission_ClassIcon-Mage-Frost}#Gem" end
		if class == "MONK" then name = "9305. Frost Relic  {GarrMission_ClassIcon-Monk-Mistweaver}#Gem" end
		if class == "SHAMAN" then name = "9305. Frost Relic  {GarrMission_ClassIcon-Shaman-Elemental} {GarrMission_ClassIcon-Shaman-Restoration}#Gem" end
	elseif name == "9306. Holy Relic#Gem" then
		-- Holy
		if class == "PALADIN" then name = "9306. Holy Relic  {GarrMission_ClassIcon-Paladin-Holy} {GarrMission_ClassIcon-Paladin-Protection} {GarrMission_ClassIcon-Paladin-Retribution}#Gem" end
		if class == "PRIEST" then name = "9306. Holy Relic  {GarrMission_ClassIcon-Priest-Discipline} {GarrMission_ClassIcon-Priest-Holy}#Gem" end
	elseif name == "9307. Iron Relic#Gem" then
		-- Iron
		if class == "DEATHKNIGHT" then name = "9307. Iron Relic  {GarrMission_ClassIcon-DeathKnight-Blood}#Gem" end
		if class == "DEMONHUNTER" then name = "9307. Iron Relic  {GarrMission_ClassIcon-DemonHunter-Vengeance}#Gem" end
		if class == "HUNTER" then name = "9307. Iron Relic  {GarrMission_ClassIcon-Hunter-BeastMastery} {GarrMission_ClassIcon-Hunter-Survival}#Gem" end
		if class == "MONK" then name = "9307. Iron Relic  {GarrMission_ClassIcon-Monk-Brewmaster} {GarrMission_ClassIcon-Monk-Windwalker}#Gem" end
		if class == "PALADIN" then name = "9307. Iron Relic  {GarrMission_ClassIcon-Paladin-Holy}#Gem" end
		if class == "ROGUE" then name = "9307. Iron Relic  {GarrMission_ClassIcon-Rogue-Assassination} {GarrMission_ClassIcon-Rogue-Outlaw}#Gem" end
		if class == "SHAMAN" then name = "9307. Iron Relic  {GarrMission_ClassIcon-Shaman-Ehancement}#Gem" end
		if class == "WARRIOR" then name = "9307. Iron Relic  {GarrMission_ClassIcon-Warrior-Arms} {GarrMission_ClassIcon-Warrior-Fury} {GarrMission_ClassIcon-Warrior-Protection}#Gem" end
	elseif name == "9308. Life Relic#Gem" then
		-- Life
		if class == "DRUID" then name = "9308. Life Relic  {GarrMission_ClassIcon-Druid-Balance} {GarrMission_ClassIcon-Druid-Feral} {GarrMission_ClassIcon-Druid-Guardian} {GarrMission_ClassIcon-Druid-Restoration}#Gem" end
		if class == "HUNTER" then name = "9308. Life Relic  {GarrMission_ClassIcon-Hunter-Marksmanship}#Gem" end
		if class == "MONK" then name = "9308. Life Relic  {GarrMission_ClassIcon-Monk-Brewmaster} {GarrMission_ClassIcon-Monk-Mistweaver}#Gem" end
		if class == "PALADIN" then name = "9308. Life Relic  {GarrMission_ClassIcon-Paladin-Holy}#Gem" end
		if class == "PRIEST" then name = "9308. Life Relic  {GarrMission_ClassIcon-Priest-Holy}#Gem" end
		if class == "SHAMAN" then name = "9308. Life Relic  {GarrMission_ClassIcon-Shaman-Restoration}#Gem" end
	elseif name == "9309. Shadow Relic#Gem" then
		-- Shadow
		if class == "DEATHKNIGHT" then name = "9309. Shadow Relic  {GarrMission_ClassIcon-DeathKnight-Blood} {GarrMission_ClassIcon-DeathKnight-Frost} {GarrMission_ClassIcon-DeathKnight-Unholy}#Gem" end
		if class == "DEMONHUNTER" then name = "9309. Shadow Relic  {GarrMission_ClassIcon-DemonHunter-Havoc}#Gem" end
		if class == "PRIEST" then name = "9309. Shadow Relic  {GarrMission_ClassIcon-Priest-Discipline} {GarrMission_ClassIcon-Priest-Shadow}#Gem" end
		if class == "ROGUE" then name = "9309. Shadow Relic  {GarrMission_ClassIcon-Rogue-Assassination} {GarrMission_ClassIcon-Rogue-Subtlety}#Gem" end
		if class == "WARLOCK" then name = "9309. Shadow Relic  {GarrMission_ClassIcon-Warlock-Affliction} {GarrMission_ClassIcon-Warlock-Demonology}#Gem" end
		if class == "WARRIOR" then name = "9309. Shadow Relic  {GarrMission_ClassIcon-Warrior-Arms}#Gem" end
	elseif name == "9310. Storm Relic#Gem" then
		-- Storm
		if class == "HUNTER" then name = "9310. Storm Relic  {GarrMission_ClassIcon-Hunter-BeastMastery} {GarrMission_ClassIcon-Hunter-Marksmanship} {GarrMission_ClassIcon-Hunter-Survival}#Gem" end
		if class == "MONK" then name = "9310. Storm Relic  {GarrMission_ClassIcon-Monk-Brewmaster} {GarrMission_ClassIcon-Monk-Mistweaver} {GarrMission_ClassIcon-Monk-Windwalker}#Gem" end
		if class == "ROGUE" then name = "9310. Storm Relic  {GarrMission_ClassIcon-Rogue-Outlaw}#Gem" end
		if class == "SHAMAN" then name = "9310. Storm Relic  {GarrMission_ClassIcon-Shaman-Elemental} {GarrMission_ClassIcon-Shaman-Ehancement}#Gem" end
		if class == "WARRIOR" then name = "9310. Storm Relic  {GarrMission_ClassIcon-Warrior-Fury}#Gem" end
	end

	if faction == "Alliance" then
		name = string.gsub(name, "Kul Tiras/Zandalar", "Kul Tiras")
		name = string.gsub(name, "Kul Tiran/Zandalari", "Kul Tiran")
	end
	if faction == "Horde" then
		name = string.gsub(name, "Kul Tiras/Zandalar", "Zandalar")
		name = string.gsub(name, "Kul Tiran/Zandalari", "Zandalari")
	end

	name = string.gsub(name, "{([%d]+)}", "|T%1:18:18|t") -- texture id
	name = string.gsub(name, "{(Interface/)([%w%p]+)}", "|T%1%2:16:16|t") -- texture path
	name = string.gsub(name, "{([%w%p]+)}", CreateAtlasMarkup("%1")) -- atlas
	name = string.gsub(name, "%[(%x%x%x%x%x%x)%]", "|cff%1") -- color
	name = string.gsub(name, "%[", "|cffcc6633") -- subcategory color
	name = string.gsub(name, "%]", "|r") -- close color

	return name
end

function Zigi:CheckItem(id, bag, slot)
	local value = ZigiItems[id]

	if value then
		local name, conditions, alt = strsplit("|", value)

		local class = select(2, UnitClass("player"))
		local faction = UnitFactionGroup("player")

		local prof1, prof2 = GetProfessions()
		local profession = ""

		if prof1 then
			local prof = GetProfessionInfo(prof1)
			if prof ~= "Engineering" then
				profession = prof
			end
		end
		if prof2 then
			local prof = GetProfessionInfo(prof2)
			if prof ~= "Engineering" then
				profession = prof
			end
		end

		name = Zigi:FormatName(name, profession)

		if conditions then
			local values = { strsplit(",", conditions) }

			-- Check if it's a match
			local match_any = false

			for _, w in ipairs(values) do
				-- Any w match is a success
				local walues = { strsplit("&", w) }
				local match_w = true
				local match = false

				for _, v in ipairs(walues) do
					-- All of v must match
					match = false

					if v == class then
						match = true
					elseif v == profession then
						match = true
					elseif v == "XP" and (UnitLevel("player") <= 49) then
						match = true -- XP items can only be used until level 49
					elseif string.match(v, "Quest:(%d)") then
						if not C_QuestLog.IsQuestFlaggedCompleted(tonumber(string.gsub(v, "Quest:(%d)", "%1") or 0)) then
							match = true
						end
					elseif string.match(v, "Spell:(%d)") then
						if not IsPlayerSpell(tonumber(string.gsub(v, "Spell:(%d)", "%1") or 0)) then
							match = true
						end
					end

					if (tonumber(v) or 0) > 0 then -- Minimum item level
						match = true
						local link = GetContainerItemLink(bag, slot)
						local itemLevel = GetDetailedItemLevelInfo(link) or 1
						if itemLevel < (tonumber(v) or 0) then
							match = false
						end
					end

					if not match then match_w = false end
				end

				if match_w then match_any = true end
			end

			-- It was a match
			if match_any then
				return strsplit("#", name)
			end

			-- It wasn't a match
			if alt then
				-- Alternative category?
				alt = Zigi:FormatName(alt, profession)
				return strsplit("#", alt)
			else
				-- Otherwise classify as Junk
				return "Junk", "Junk"
			end
		else
			return strsplit("#", name)
		end
	end

	return false
end

function Zigi:Filter(slotData)
	local bag, slot = slotData.bag, slotData.slot
	local id = GetContainerItemID(bag, slot)

	if id and ZigiItems[id] then
		if Zigi:CheckItem(id, bag, slot) then
			return Zigi:CheckItem(id, bag, slot)
		end
	end
	return
end