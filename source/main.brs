sub Main()
    showMarkupSGScreen()
end sub

sub showMarkupSGScreen()
   
        '^' create screen
        screen = CreateObject("roSGScreen")
        m.port = CreateObject("roMessagePort")
        screen.setMessagePort(m.port)
    
    
        ' while (true)
        '     msg = Wait(0, m.port)
        '     msgType = Type(msg)
        '     if msg.IsScreenClosed()
        '         return false
        '     end if
        ' end while

        input = CreateObject("roInput")
        port = CreateObject("roMessagePort")
        input.SetMessagePort(port)

        input.enableTransportEvents()


            '^' create scene
            scene = screen.CreateScene("AppScene")
            screen.Show()
        
        player = "valid"

        ' App Manager for custom voice input strings. needs further handling(?)
        appMgr = CreateObject("roAppManager")

        profile1 = { text: "kids", link: "d46ge-i8Y5-192"}
        profile2 = { text: "Jane", link: "2a2Nu-u1D4-555"}
        profile3 = { text: "John", link: "6Nu70-N37x-901"}

        actions = [profile1, profile2, profile3]

        appMgr.SetVoiceActionStrings(actions)

    print "Waiting for messages..."
    while true
        msg = wait(0, port)
        
        if msg.IsInput()
            print "isInput"
        end if

        if type(msg) = "roInputEvent"
            info = msg.GetInfo()
            if info.type = "transport" then
                eventRet = {status: "unhandled"}
                ' player = m.top.getScene().findNode("myVideoPlayer")
                print "unhahndled"
                if player <> invalid then
                    eventRet = handleTransport(info)
                    print "player valid"
                end if
                eventRet.id = info.id
                input.EventResponse(eventRet)
            end if
            'else if ...
            ' ... handling of other events
        end if
    end while
end sub


function handleTransport(evt)
    cmd = evt.command
    ret = {status: "unhandled"}

    if cmd = "play"
        'handle "play" command
        ret.status = "success"

    else if cmd = "pause"
        'handle "pause" command
        ret.status = "success"

    else if cmd = "stop"
        'handle "stop" command
        ret.status = "success"

    else if cmd = "forward"
        'handle "forward" command
        ret.status = "success"

    else if cmd = "rewind"
        'handle "rewind" command
        ret.status = "success"

    else if cmd = "replay"
        'handle "replay" command
        ret.status = "success"

    else if cmd = "next"
        'skip to next content item in playlist'
        ret.status = "success"

    else if cmd = "nowplaying"
        'handle nowplaying command
        appmgr = CreateObject("roAppManager")
        appmgr.SetNowPlayingContentMetaData({
            title: "<title>",
            contentType: "<contentType>"
        })
        ret.status = "success"


    else if cmd = "loop"
        'handle "loop" command
         ret.status = "success"


    else if cmd = "shuffle"
        'handle "shuffle" command
        ret.status = "success"


    else if cmd = "skip"
        'handle "skip intro" command OR handle same as "next" if channel have no into/recap to skip
        ret.status = "success"


    else if cmd = "like"
        'handle "like" command
        'optionally display a song's artist, genre, or track, or playlist title in the Roku heads-up display
        ret.music_track = "Messages"
        ret.status = "success"
    end if

    return ret
end function