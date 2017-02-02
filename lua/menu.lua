local Net = _G.LuaNetworking

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
	
	
end

if Net:IsMultiplayer() and Utils:IsInHeist() then
	local peer = managers.network._session:peer(id)
	local eu = Net:GetNameFromPeerID(Net:LocalPeerID())
	local menu_options = {}
	menu_options[#menu_options+1] = { text = eu, data = Net:LocalPeerID(), callback = info }
	for _, peer in pairs(managers.network:session():peers()) do
		menu_options[#menu_options+1] = { text = peer:name(), data = peer:id(), callback = info }
	end
	menu_options[#menu_options+1] = {text = "", is_cancel_button = true}
	menu_options[#menu_options+1] = {text = "Close", is_cancel_button = true}
	local muteMenu = QuickMenu:new("Fast Mute", "I want to mute...", menu_options)
	muteMenu:Show()
end
