-- key mapping for vim 
-- Convert input soruce as English and sends 'escape' if inputSource is not English.
-- Sends 'escape' if inputSource is English.
-- key bindding reference --> https://www.hammerspoon.org/docs/hs.hotkey.html
local inputEnglish = "com.apple.keylayout.ABC"
local esc_bind
--https://johngrib.github.io/wiki/hammerspoon-tutorial-03/
function convert_to_eng_with_esc()
	local inputSource = hs.keycodes.currentSourceID()
	if not (inputSource == inputEnglish) then
		--hs.eventtap.keyStroke({}, 'right')
		hs.keycodes.currentSourceID(inputEnglish)
	end
	esc_bind:disable()
	hs.eventtap.keyStroke({}, 'escape')
	esc_bind:enable()
end
--https://coldmater.tistory.com/177
function hello()
	local inputSource = hs.keycodes.currentSourceID()
	if not (inputSource == inputEnglish) then
		hs.keycodes.currentSourceID(inputEnglish)
	end
	hs.eventtap.keyStroke({}, 'escape')
end
hs.hotkey.bind({'control'}, 33, hello)
esc_bind = hs.hotkey.new({}, 'escape', convert_to_eng_with_esc):enable()
