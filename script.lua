-- ping when the first message in the chatbox is a slash
local hasSlash = false
function pings.sad(x)
    hasSlash = x == "/"
end

function pings.csend()
animations.cbubble.ChatSend:play()
end

-- play chat send when message is sent
function events.CHAT_SEND_MESSAGE(message)
	pings.csend()
	return message
end

-- play chat close when chat is closing and send chat isn't playing
local hasChat = false
function pings.setChat(bool)
    hasChat = bool
    pings.cclose()
end

function pings.cclose()
    animations.cbubble.ChatClose:setPlaying(not hasChat and not animations.cbubble.ChatSend:isPlaying())
end

-- sending pings for opening chat and getting the slash
local wasSlash = false
local wasChatOpen=false
function events.tick()
    local isChatOpen=host:isChatOpen()
    if isChatOpen ~= wasChatOpen then
        pings.setChat(isChatOpen)
    end
    wasChatOpen=isChatOpen

    local isSlash=host:isChatOpen() and host:getChatText():match("^/")
    if isSlash ~= wasSlash then
        pings.sad(isSlash)
    end
    wasSlash=isSlash

    -- playing chattin and slashin depending on if chat is open and if the first character is a slash
    animations.cbubble.Chattin:setPlaying(hasChat and not hasSlash)
    animations.cbubble.Slashin:setPlaying(hasChat and hasSlash)
end
