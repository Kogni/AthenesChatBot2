local ACB2_Temp = {}
if ( _G.ACB2_Temp == nil ) then
	_G.ACB2_Temp = ACB2_Temp
else
	ACB2_Temp = _G.ACB2_Temp
end

if ( ACB2_Ordliste == nil ) then
	ACB2_Ordliste = {}
end

ACB2_Temp.Ordbok = {}
ACB2_Temp.Ordbok.Substantivliste = {}
ACB2_Temp.Ordbok.Verbliste = {}
ACB2_Synonymliste = {}

function ACB2_Temp.Ordbok:ImplementerOrdbok(  )
	local Temp = ""

	--Artikkel
	ACB2_Ordliste["et"] = {}
	ACB2_Ordliste["et"].OrdKlasse = "Artikkel"
	
	ACB2_Ordliste["en"] = {}
	ACB2_Ordliste["en"].OrdKlasse = "Artikkel"
	
	ACB2_Ordliste["ei"] = {}
	ACB2_Ordliste["ei"].OrdKlasse = "Artikkel"
	
	--Pronomen
	ACB2_Ordliste["det"] = {}
	ACB2_Ordliste["det"].OrdKlasse = "Pronomen"
	
	ACB2_Ordliste["den"] = {}
	ACB2_Ordliste["den"].OrdKlasse = "Pronomen"
	
	ACB2_Ordliste["de"] = {}
	ACB2_Ordliste["de"].OrdKlasse = "Pronomen"
	
	--Substantiver
	ACB2_Ordliste["heroic"] = ACB2_Temp.Ordklasser:LagSubstantiv( "heroic" )
	ACB2_Ordliste["heroic"].Ordformer.Flertall = "heroics"
	ACB2_Synonymliste["hc"] = "heroic"
	ACB2_Temp.Ordbok:InsertSubstantiv( "heroic" )
	
	--Verb
	Temp = "være"
	ACB2_Ordliste[ Temp ] = ACB2_Temp.Ordklasser:LagVerb( Temp )
	ACB2_Ordliste[ Temp ].Ordformer.Imperativ = "vær"
	ACB2_Ordliste[ Temp ].Ordformer.Infinitiv = Temp
	ACB2_Ordliste[ Temp ].Ordformer.Presens = "er"
	ACB2_Ordliste[ Temp ].Ordformer.Preteritum = "var"
	ACB2_Ordliste[ Temp ].Ordformer.PerfektumPartisipp = "vært"
	ACB2_Ordliste[ Temp ].Ordformer.PresensPartisipp = "værende"
	ACB2_Temp.Ordbok:InsertVerb( Temp )
	
	Temp = "ville"
	ACB2_Ordliste[ Temp ] = ACB2_Temp.Ordklasser:LagVerb( Temp )
	ACB2_Ordliste[ Temp ].Ordformer.Imperativ = "vil"
	ACB2_Ordliste[ Temp ].Ordformer.Infinitiv = Temp
	ACB2_Ordliste[ Temp ].Ordformer.Presens = "vil"
	ACB2_Ordliste[ Temp ].Ordformer.Preteritum = "ville"
	ACB2_Ordliste[ Temp ].Ordformer.PerfektumPartisipp = "villet"
	ACB2_Ordliste[ Temp ].Ordformer.PresensPartisipp = "villende"
	ACB2_Temp.Ordbok:InsertVerb( Temp )
	
	Temp = "ha"
	ACB2_Ordliste[ Temp ] = ACB2_Temp.Ordklasser:LagVerb( Temp )
	ACB2_Ordliste[ Temp ].Ordformer.Imperativ = "ha"
	ACB2_Ordliste[ Temp ].Ordformer.Infinitiv = Temp
	ACB2_Ordliste[ Temp ].Ordformer.Presens = "har"
	ACB2_Ordliste[ Temp ].Ordformer.Preteritum = "hadde"
	ACB2_Ordliste[ Temp ].Ordformer.PerfektumPartisipp = "hatt"
	ACB2_Ordliste[ Temp ].Ordformer.PresensPartisipp = "havende"
	ACB2_Temp.Ordbok:InsertVerb( Temp )
	
	Temp = "gjøre"
	ACB2_Ordliste[ Temp ] = ACB2_Temp.Ordklasser:LagVerb( Temp )
	ACB2_Ordliste[ Temp ].Ordformer.Imperativ = "gjør"
	ACB2_Ordliste[ Temp ].Ordformer.Infinitiv = Temp
	ACB2_Ordliste[ Temp ].Ordformer.Presens = "gjør"
	ACB2_Ordliste[ Temp ].Ordformer.Preteritum = "gjorde"
	ACB2_Ordliste[ Temp ].Ordformer.PerfektumPartisipp = "gjort"
	ACB2_Ordliste[ Temp ].Ordformer.PresensPartisipp = "gjørende"
	ACB2_Temp.Ordbok:InsertVerb( Temp )
	
end

function ACB2_Temp.Ordbok:InsertVerb( Verbet )

	ACB2_Temp.Ordbok.Verbliste[ Verbet ] = ACB2_Ordliste[ Verbet ]
	
end

function ACB2_Temp.Ordbok:InsertSubstantiv( Substantivet )

	ACB2_Temp.Ordbok.Substantivliste[ Substantivet ] = ACB2_Ordliste[ Substantivet ]
	
end