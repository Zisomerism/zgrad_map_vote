local CATEGORY_NAME = "MapVote"
------------------------------ VoteMap ------------------------------
local function AMB_forcemapvote( calling_ply, votetime, should_cancel )
	if not should_cancel then
		MapVote.Start( votetime )
		ulx.fancyLogAdmin( calling_ply, "#A called a votemap!" )
	else
		MapVote.Cancel()
		ulx.fancyLogAdmin( calling_ply, "#A canceled the votemap" )
	end
end

local forcemapvotecmd = ulx.command( CATEGORY_NAME, "forcemapvote", AMB_forcemapvote, "!forcemapvote" )
forcemapvotecmd:addParam{ type = ULib.cmds.NumArg, min = 15, default = 25, hint = "time", ULib.cmds.optional, ULib.cmds.round }
forcemapvotecmd:addParam{ type = ULib.cmds.BoolArg, invisible = true }
forcemapvotecmd:defaultAccess( ULib.ACCESS_ADMIN )
forcemapvotecmd:help( "Invokes the map vote logic" )
forcemapvotecmd:setOpposite( "unforcemapvote", { _, _, true }, "!unforcemapvote" )
