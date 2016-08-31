local ACB2_Temp = {}
if ( _G.ACB2_Temp == nil ) then
	_G.ACB2_Temp = ACB2_Temp
else
	ACB2_Temp = _G.ACB2_Temp
end

ACB2_Temp.Ordklasser = {}

function ACB2_Temp.Ordklasser:SjekkOrdklasser( Forrest, Bakerst ) --Forsøker å finne frem til ordklassen for forskjellige ord, ved hjelp av elimineringsmetoden

end

function ACB2_Temp.Ordklasser:VurderOrdklasser()

end

function ACB2_Temp.Ordklasser:SjekkOmOrdklasserMatcher( Forrest, Bakerst ) --passer på at boten ikke setter to ord ved siden av hverandre som er grammatisk ulovlig

end

function ACB2_Temp.Ordklasser:FinnOrdKlasse( Ordet )

end

function ACB2_Temp.Ordklasser:ValidierSomOrdklasse( Ordklasse, Ord )

end

function ACB2_Temp.Ordklasser:LagSubstantiv( Entall )
	
	local Temp = {}
	
	Temp.OrdKlasse = "Substantiv"
	Temp.Ordformer = {}
	Temp.Ordformer.Entall = Entall
	Temp.Ordformer.Flertall = ""
	
	return Temp
end

function ACB2_Temp.Ordklasser:LagVerb( Infinitiv )
	
	local Temp = {}
	
	Temp.OrdKlasse = "Verb"
	Temp.Ordformer = {}
	Temp.Ordformer.Imperativ = ""
	Temp.Ordformer.Infinitiv = Infinitiv
	Temp.Ordformer.Presens = ""
	Temp.Ordformer.Preteritum = ""
	Temp.Ordformer.PerfektumPartisipp = ""
	Temp.Ordformer.PresensPartisipp = ""
	
	return Temp
end