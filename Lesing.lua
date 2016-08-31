local ACB2_Temp = {}
if ( _G.ACB2_Temp == nil ) then
	_G.ACB2_Temp = ACB2_Temp
else
	ACB2_Temp = _G.ACB2_Temp
end

ACB2_Temp.Lesing = {}

function ACB2_Temp.Lesing:Test( melding )
	--print( "ACB Lesing 11" )
end

function ACB2_Temp.Lesing:Leslinje( melding, Avsender, kanal, ChannelID )

	ACB2_Temp.Lesing:StuderSetning( melding, Avsender )
	ACB2_Temp.Skriving:LagSvar( kanal, ChannelID )
end

function ACB2_Temp.Lesing:StuderSetning( melding, Avsender )

	ACB2_ordforraad[Avsender] = ACB2_Temp.Ordforraad:FormOrd( Avsender )
	
	local Unprocessed = melding
	local OrdPrev = ""
	local OrdCurr = ""
	local Count = 0
	local Question = false
	local startPos, endPos = string.find( melding, "?");
	if startpos then
		Question = true
	end
	while ( strlen(Unprocessed) > 0 ) do
		if ( string.sub(Unprocessed, 0, 1 ) == " " ) then
			Unprocessed = string.sub(Unprocessed, 2, strlen(Unprocessed) )
		else
			Count = Count+1
			local startPos1, endPos1 = string.find( Unprocessed, " ")
			local startPos2, endPos2 = string.find( Unprocessed, ". ")
			local startPos3, endPos3 = string.find( Unprocessed, ", ")
			local startPos4, endPos4 = string.find( Unprocessed, "?")
			local startPos5, endPos5 = string.find( Unprocessed, "!")
			local First = startPos1
			local Last = endPos1
			
			if ( startPos2 ) then
				if ( ( First ) and ( startPos2 < First ) ) or ( First == nil ) then
					First = startPos2
					Last = endPos2
				end
			end
			if ( startPos3 ) then
				if ( ( First ) and ( startPos3 < First ) ) or ( First == nil ) then
					First = startPos3
					Last = endPos3
				end
			end
			if ( startPos4 ) then
				if ( ( First ) and ( startPos4 < First ) ) or ( First == nil ) then
					First = startPos4
					Last = endPos4
				end
			end
			if ( startPos5 ) then
				if ( ( First ) and ( startPos5 < First ) ) or ( First == nil ) then
					First = startPos5
					Last = endPos5
				end
			end
			
			if ( First ) then
				local OrdCurrA = string.sub(Unprocessed, 0, First )
				local AUnprocessed = string.sub(Unprocessed, (Last+0), strlen(Unprocessed))
				local OrdCurrB = string.sub(Unprocessed, 0, First )
				local BUnprocessed = string.sub(Unprocessed, (Last+0), strlen(Unprocessed))
				if ( string.sub(OrdCurrB, (strlen(OrdCurrB)), (strlen(OrdCurrB)+1) ) == "," ) and ( OrdCurrB ~= ",") then --hvis siste char er komma, og ikke hele stringen er komma
					OrdCurrB = string.sub(Unprocessed, 0, (First-1) )
					BUnprocessed = string.sub(Unprocessed, (Last-1), strlen(Unprocessed))
				elseif ( string.sub(OrdCurrB, (strlen(OrdCurrB)), (strlen(OrdCurrB)+1) ) == "?" ) and ( OrdCurrB ~= "?") then --hvis siste char er komma, og ikke hele stringen er komma
					OrdCurrB = string.sub(Unprocessed, 0, (First-1) )
					BUnprocessed = string.sub(Unprocessed, (Last-1), strlen(Unprocessed))
				elseif ( string.sub(OrdCurrB, (strlen(OrdCurrB)), (strlen(OrdCurrB)+1) ) == "!" ) and ( OrdCurrB ~= "!") then --hvis siste char er komma, og ikke hele stringen er komma
					OrdCurrB = string.sub(Unprocessed, 0, (First-1) )
					BUnprocessed = string.sub(Unprocessed, (Last-1), strlen(Unprocessed))
				elseif ( string.sub(OrdCurrB, (strlen(OrdCurrB)), (strlen(OrdCurrB)+1) ) == "." ) and ( OrdCurrB ~= ".") then --hvis siste char er komma, og ikke hele stringen er komma
					OrdCurrB = string.sub(Unprocessed, 0, (First-1) )
					BUnprocessed = string.sub(Unprocessed, (Last-1), strlen(Unprocessed))
				end
				OrdCurr = OrdCurrB
				if ( Unprocessed ~= BUnprocessed ) then
					Unprocessed = BUnprocessed
				else
					Unprocessed = string.sub(Unprocessed, (Last+1), strlen(Unprocessed))
				end
			else
				OrdCurr = Unprocessed
				Unprocessed = ""
			end
			if ( OrdCurr ) then
				if ( OrdCurr ~= " " ) and ( OrdCurr ~= "" ) and ( strlen(OrdCurr) < 11 ) then
					ACB2_ordforraad[OrdCurr] = ACB2_Temp.Ordforraad:FormOrd( OrdCurr )
					ACB2_ordforraad[OrdPrev] = ACB2_Temp.Ordforraad:FormOrd( OrdPrev )
					ACB2_Temp.Lesing:AssosierNaboOrd( OrdCurr, OrdPrev, Avsender )
					ACB2_Temp.Ordklasser:SjekkOrdklasser( OrdPrev, OrdCurr )

					--if ( string.find( Unprocessed, "?") ) then
					--	ACB2_ordforraad[OrdCurr].SpmTeller = ACB2_ordforraad[OrdCurr].SpmTeller + 1
					--end
					--ACB2_ordforraad[OrdCurr].SpmNevner = ACB2_ordforraad[OrdCurr].SpmNevner + 1
					
					--SisteOrdbruk[Count] = OrdCurr
					OrdPrev = OrdCurr
				end
			else
			end
		end
	end
	
end

function ACB2_Temp.Lesing:AssosierNaboOrd( Bakerst, Forrest, Avsender )

end