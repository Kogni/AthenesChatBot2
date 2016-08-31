local ACB2_Temp = {}
if ( _G.ACB2_Temp == nil ) then
	_G.ACB2_Temp = ACB2_Temp
else
	ACB2_Temp = _G.ACB2_Temp
end

if ( ACB2_Settings == nil ) then
	ACB2_Settings = {}
	ACB2_Settings.Snakk = true
end

if ( ACB2_ordforraad == nil ) then
	ACB2_ordforraad = {}
end
for Ord, Data in pairs( ACB2_ordforraad ) do
	if ( Ord == nil ) then
		Data = nil
	end
end

if ( ACB2_Chatlog == nil ) then
	ACB2_Chatlog = {}
end

function ACB2_Temp.OnEvent( ukjent, event, melding, avsender, spraak, arg1, arg2, arg3, arg4, arg5, arg6, arg7 )
	local ChannelID = arg4
	_G.Event = event
	_G.Spoersmaal = strlower(melding)
	if ( avsender ) then
		avsender = strlower(avsender)
	end
	_G.Avsender = avsender
	_G.Spraak = spraak
	_G.KanalID = arg4
	if ( event == "ADDON_LOADED" ) then
		SlashCmdList["AthenesChatBot"] = ACB2_Temp.SlashHandler;
		SLASH_AthenesMasterControl1 = "/AthenesChatBot";
		SLASH_AthenesMasterControl2 = "/ACB";
		SLASH_AthenesMasterControl3 = "/acb";
		ACB2_Temp:SlettAlleOrdklasser()
		ACB2_Temp:NicksTilSubstantiver()
	elseif ( event == "CHAT_MSG_RAID" ) or ( event == "CHAT_MSG_GUILD" ) then --steder den ikke får lov å snakke
		melding = strlower(melding)
		ACB2_Temp.Lesing:StuderSetning( melding, _G.Avsender ) --lærer uten å svare
	elseif ( string.find(strlower(melding), "pia") ) then
		local Dato = date("%m/%d/%y %H:%M:%S")
		melding = strlower(melding)
		ACB2_Chatlog[Dato] = {}
		ACB2_Chatlog[Dato].Melding = melding
		ACB2_Chatlog[Dato].Kanal = event
		
		if ( string.find(strlower(melding), "-pia-") ) then
			ACB2_Chatlog[Dato].Avsender = "PIA"
			return
		else
			ACB2_Chatlog[Dato].Avsender = avsender
			if ( string.find(strlower(melding), "hold kjeft") ) and ( avsender == strlower(UnitName("player")) ) then
				ACB2_Temp:FinnKanal( "-PIA-: Unnskyld, jeg skal holde kjeft", event, nil )
				ACB2_Settings.Snakk = false
				return
			end
			if ( string.find(strlower(melding), "du får snakke") ) and ( avsender == strlower(UnitName("player")) ) then
				ACB2_Temp:FinnKanal( "-PIA-: Takk:)", event, nil )
				ACB2_Settings.Snakk = true
				return
			end
			if ( ACB2_Settings.Snakk == true ) then
				local kanal = event
				ACB2_Temp.Lesing:Leslinje( melding, _G.Avsender, kanal, ChannelID ) --vil prøve å svare
			end
		end
	else
		melding = strlower(melding)
		ACB2_Temp.Lesing:StuderSetning( melding, _G.Avsender ) --lærer uten å svare
	end
end

function ACB2_Temp:SlettAlleOrdklasser()
	for Assosiert, Data in pairs( ACB2_ordforraad ) do
		Data.OrdKlasse = ""
		Data.AdvMulig = true
		Data.AdjMulig = true
		Data.DMulig = true
		Data.KMulig = true
		Data.PrnMulig = true
		Data.PrpMulig = true
		Data.SbsMulig = true
		Data.VMulig = true
	end
end

function ACB2_Temp:NicksTilSubstantiver()
	for Assosiert, Data in pairs( ACB2_ordforraad ) do
		if ( ACB2_ordforraad[strlower(Assosiert)] ) and ( ACB2_ordforraad[strlower(Assosiert)] ~= ACB2_ordforraad[Assosiert] ) then
			if ( ACB2_ordforraad[Assosiert].OrdKlasse ~= "" ) then
				for Variabel, Verdi in pairs( ACB2_ordforraad[strlower(Assosiert)] ) do
					if ( type(Variabel) == "number" ) then
						Verdi = Verdi + Data[Variabel]
						Data[Variabel] = 0
					end
					if ( type(Variabel) == "table" ) then
						Verdi = Data[Variabel]
						Data[Variabel] = nil
					end
				end
				ACB2_ordforraad[strlower(Assosiert)].OrdKlasse = ACB2_ordforraad[Assosiert].OrdKlasse
				
				ACB2_ordforraad[Assosiert] = nil
				Data = nil
			end
		end
	end
end

function ACB2_Temp:Snakk( melding, kanal, ChannelID )
	if ( kanal == "Whisper" ) then
		SendChatMessage( melding, kanal, nil, _G.KanalID)
	else
		SendChatMessage( melding, kanal, nil, _G.Avsender)
	end
end

function ACB2_Temp.PrintChatLog()
	for Dato, Data in pairs( SisteOrdbruk ) do
		print( Dato, Data.Avsender, Data.Kanal, Data.Melding )
	end
end

function ACB2_Temp.SlashHandler(cmd)
	cmd = strlower(cmd);
	if ( cmd == "print chatlog" ) then
		ACB2_Temp.PrintChatLog()
	else
		print( "Athene's Chat Bot:" )
	end
end

function ACB2_Temp:FinnKanal( melding, kanal, ChannelID )

	local Kanalen
	if ( kanal == "CHAT_MSG_WHISPER" ) then
		Kanalen = "WHISPER"
	elseif ( kanal == "CHAT_MSG_CHANNEL" ) then
		Kanalen = "CHANNEL"
	elseif ( kanal == "CHAT_MSG_GUILD" ) then
		Kanalen = "GUILD"
	elseif ( kanal == "CHAT_MSG_PARTY" ) then
		Kanalen = "PARTY"
	elseif ( kanal == "CHAT_MSG_SAY" ) then
		Kanalen = "SAY"
	end

	ACB2_Temp:Snakk( melding, Kanalen, ChannelID )
end
 
local f = CreateFrame("Frame", "ACB2", UIParent);
f:SetScript("OnEvent", ACB2_Temp.OnEvent);
f:RegisterEvent("ADDON_LOADED");
f:RegisterEvent("CHAT_MSG_RAID");
f:RegisterEvent("CHAT_MSG_CHANNEL");
f:RegisterEvent("CHAT_MSG_WHISPER");
f:RegisterEvent("CHAT_MSG_GUILD");
f:RegisterEvent("CHAT_MSG_PARTY");
f:RegisterEvent("CHAT_MSG_SAY");