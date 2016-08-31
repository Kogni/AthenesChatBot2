local ACB2_Temp = {}
if ( _G.ACB2_Temp == nil ) then
	_G.ACB2_Temp = ACB2_Temp
else
	ACB2_Temp = _G.ACB2_Temp
end

ACB2_Temp.Ordforraad = {}

if ( _G.ACB2_ordforraad == nil ) then
	_G.ACB2_ordforraad = {}
end
ACB2_Temp.Ordbok.ImplementerOrdbok(  )

function ACB2_Temp.Ordforraad:FormOrd( Ord ) --Lager en base som inkluderer alle egenskaper som alle ord trenger, for at addonen skal kunne gjøre nødvendige vurderinger av alle slags ord.

end

function ACB2_Temp.Ordforraad:SjekkOmSpraakeneMatcher( Forrest, Bakerst )

end