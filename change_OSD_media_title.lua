function set_osd_title()
	local name = mp.get_property("filename")
	local percent_pos = " - " .. mp.get_property_osd("percent-pos") .. "%"
	local chapter = " - Chapter: " .. mp.get_property_osd("chapter")
	local frames_dropped = " - Dropped frames: " .. mp.get_property_osd("vo-drop-frame-count")

	if mp.get_property_osd("chapter") == "" then
		chapter = ""
	end
	if mp.get_property_osd("percent-pos") == "" then
		percent_pos = ""
	end
	if mp.get_property_osd("vo-drop-frame-count") == "0" then
		frames_dropped = ""
	end
	mp.set_property("force-media-title", name .. percent_pos .. chapter .. frames_dropped)

end

mp.register_event("start-file", set_osd_title)
mp.observe_property("percent-pos", "string", set_osd_title)
mp.observe_property("chapter", "string", set_osd_title)
mp.observe_property("vo-drop-frame-count", "number", set_osd_title)
