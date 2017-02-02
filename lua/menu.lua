local Net = _G.LuaNetworking
--[[
function info(id)
	local peer = managers.network._session:peer(id)
	local peerName = peer:name()
	local peerIP = peer:ip()
	local peerID = peer:id()
	local peerRpc = peer:rpc()
	local peerSteamRpc = peer:steam_rpc()
	local peerChar = peer:character()
	local peerPing = peer:qos()
	local peerLevel = peer:level()
	local peerRank = peer:rank()
	
	managers.chat:_receive_message(1, "Player Info", "Infos of " .. Net:GetNameFromPeerID(id), Color.green)
	managers.chat:_receive_message(1, "Name", peerName, Color.red)
	managers.chat:_receive_message(1, "ID", peerID, Color.red)
	managers.chat:_receive_message(1, "Character", peerChar, Color.red)
	managers.chat:_receive_message(1, "Level and rank", "(" .. peer:rank() .. ") " .. peerLevel, Color.red)
end
]]
if Net:IsMultiplayer() then
	local peer = managers.network._session:peer(id)
	local meuId = Net:LocalPeerID()
	local eu = Net:GetNameFromPeerID(meuIp)
	local menu_options = {}
	--menu_options[#menu_options+1] = { text = eu, data = meuId, callback = info }
	for _, peer in pairs(managers.network:session():peers()) do
		menu_options[#menu_options+1] = { text = peer:name(), data = peer:id(), callback = info }
	end
	menu_options[#menu_options+1] = {text = "", is_cancel_button = true}
	menu_options[#menu_options+1] = {text = "Close", is_cancel_button = true}
	local infoMenu = QuickMenu:new("Player Info", "Show the infos of...", menu_options)
	infoMenu:Show()
end
