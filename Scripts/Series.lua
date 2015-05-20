local AlwaysUp2Date = true

----------------------------------------------------------------------------------------------------------------------------------------------------------------

_G.BNSversion 	= 5.9
_G.BNSloaded 	= false

----------------------------------------------------------------------------------------------------------------------------------------------------------------

if GetGame().map.index ~= 10 and GetGame().map.index ~= 15 then return end--and myHero.charName ~= "Vi" then return end

function OnLoad()
	if AlwaysUp2Date then
		local ToUpdate = {}
		ToUpdate.Version = _G.BNSversion
		ToUpdate.UseHttps = true
		ToUpdate.Host = "raw.githubusercontent.com"
		ToUpdate.VersionPath = "/BOLprankSTAR/BoL/master/Version/Better%20Nerf%20Series.lua.version"
		ToUpdate.ScriptPath =  "/BOLprankSTAR/BoL/master/Scripts/Better%20Nerf%20Series.lua"
		ToUpdate.SavePath = SCRIPT_PATH.._ENV.FILE_NAME
		ToUpdate.CallbackUpdate = function(NewVersion,OldVersion) print("<font color=\"#FF794C\"><b>Better Nerf Smite v".._G.BNSversion.." -</b></font> <font color=\"#FFDFBF\">Updated to "..NewVersion..". </b></font>") end
		ToUpdate.CallbackNoUpdate = function(OldVersion) print("<font color=\"#FF794C\"><b>Better Nerf Smite v".._G.BNSversion.." -</b></font> <font color=\"#FFDFBF\">No Updates Found</b></font>") end
		ToUpdate.CallbackNewVersion = function(NewVersion) print("<font color=\"#FF794C\"><b>Better Nerf Smite v".._G.BNSversion.." -</b></font> <font color=\"#FFDFBF\">New Version found ("..NewVersion.."). Please wait until its downloaded</b></font>") end
		ToUpdate.CallbackError = function(NewVersion) print("<font color=\"#FF794C\"><b>Better Nerf Smite v".._G.BNSversion.." -</b></font> <font color=\"#FFDFBF\">Error while Downloading. Please try again.</b></font>") end
		ScriptUpdate(ToUpdate.Version,ToUpdate.UseHttps, ToUpdate.Host, ToUpdate.VersionPath, ToUpdate.ScriptPath, ToUpdate.SavePath, ToUpdate.CallbackUpdate,ToUpdate.CallbackNoUpdate, ToUpdate.CallbackNewVersion,ToUpdate.CallbackError)
	end
	Load()
end

function Load()
	Load_Variables()
	Load_Classes()
	Msg("Successfully loaded (</font><font color=\"#FACHED\">v".._G.BNSversion.."</font><font color=\"#B6FF61\">). Welcome back")
	_G.BNSloaded = true
end
function Load_Variables()
	Map				= GetGame().map.index
	Enemies 		= GetEnemyHeroes()
	Allies 			= GetAllyHeroes()
	aMobs 			= minionManager(MINION_ALLY, 25000, myHero, MINION_SORT_MAXHEALTH_DEC)
	eMobs 			= minionMan
