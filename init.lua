-- key mapping for vim 
-- Convert input soruce as English and sends 'escape' if inputSource is not English.
-- Sends 'escape' if inputSource is English.
-- key bindding reference --> https://www.hammerspoon.org/docs/hs.hotkey.html
local inputEnglish = "com.apple.keylayout.ABC"
local esc_bind
--https://johngrib.github.io/wiki/hammerspoon-tutorial-03/
-- ctrl+esc
function convert_to_eng_with_esc()
	local inputSource = hs.keycodes.currentSourceID()
	if not (inputSource == inputEnglish) then
		hs.eventtap.keyStroke({}, 'right')  -- right click
		hs.keycodes.currentSourceID(inputEnglish)
	end
	esc_bind:disable()
	hs.eventtap.keyStroke({}, 'escape')
	esc_bind:enable()
end
--https://coldmater.tistory.com/177
-- ctrl+[
function hello()
	local inputSource = hs.keycodes.currentSourceID()
	if not (inputSource == inputEnglish) then
		hs.keycodes.currentSourceID(inputEnglish)
	end
	hs.eventtap.keyStroke({}, 'escape')
end
hs.hotkey.bind({'control'}, 33, convert_to_eng_with_esc)


function changeInput()
	local inputSource =hs.keycodes.currentSourceID()
	if not inputSource == inputEnglish then
		hs.keycodes.currentSourceID(inputEnglish)
	end	
end
hs.hotkey.bind({'control'}, 'o',convert_to_eng_with_esc)


esc_bind = hs.hotkey.new({}, 'escape', convert_to_eng_with_esc):enable()

-- command + esc -> command + `
function convertab()
	esc_bind:disable()
	hs.eventtap.keyStroke({"cmd"},'`')
	esc_bind:enable()
end
hs.hotkey.bind({"cmd"},'escape',convertab)
-- control to capslock

-- ctrl opt tab
--[[
function ctrlopt()
	hs.eventtap.keyStroke({'cmd','option'},"tab")
end
hs.hotkey.bind({"cmd"},"tab",ctrlopt)
]]

local FRemap = require('foundation_remapping')
local remapper = FRemap.new()
remapper:remap('rcmd', 'f18')
remapper:remap('ralt','lcmd')
remapper:register()
