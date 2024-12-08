-- /Users/yu/.hammerspoon/init.lua
-- key mapping for vim
-- Convert input soruce as English and sends 'escape' if inputSource is not English.
-- Sends 'escape' if inputSource is English.
-- key bindding reference --> https://www.hammerspoon.org/docs/hs.hotkey.html
-- /Users/yu/.hammerspoon/init.lua
-- Key mapping for Vim with Hammerspoon
-- Automatically switches input source to English when necessary.

local inputEnglish = "com.apple.keylayout.ABC"
local esc_bind

-- Function to switch input source to English
function convert_to_eng()
    local inputSource = hs.keycodes.currentSourceID()
    if not (inputSource == inputEnglish) then
        hs.keycodes.currentSourceID(inputEnglish)
    end
end

-- Spotlight: Cmd + Space
-- Modified to execute Spotlight and input source switching in parallel
-- Spotlight: Cmd + Space
hs.hotkey.bind({"cmd"}, "space", function()
    -- 입력 소스를 먼저 영어로 전환
    convert_to_eng()
    -- Spotlight 열기
    hs.eventtap.keyStroke({"cmd"}, "\\")
end)

-- Ctrl + Esc
function convert_to_eng_with_esc()
    local inputSource = hs.keycodes.currentSourceID()
    if not (inputSource == inputEnglish) then
        hs.keycodes.currentSourceID(inputEnglish)
    end
    esc_bind:disable()
    hs.eventtap.keyStroke({}, "escape")
    esc_bind:enable()
end

-- Bind Ctrl + [
hs.hotkey.bind({ "control" }, 33, convert_to_eng_with_esc)

-- Esc bind setup
esc_bind = hs.hotkey.new({}, "escape", convert_to_eng_with_esc):enable()





--https://coldmater.tistory.com/177
-- ctrl+[
-- function hello()
-- 	local inputSource = hs.keycodes.currentSourceID()
-- 	if not (inputSource == inputEnglish) then
-- 		hs.keycodes.currentSourceID(inputEnglish)
-- 	end
-- 	hs.eventtap.keyStroke({}, 'escape')
-- end

-- function changeInput()
-- 	local inputSource =hs.keycodes.currentSourceID()
-- 	if not inputSource == inputEnglish then
-- 		hs.keycodes.currentSourceID(inputEnglish)
-- 	end
-- end
-- ctrl + o

-- function conver_to_eng()
-- 	local inputSource = hs.keycodes.currentSourceID()
-- 	if not (inputSource == inputEnglish) then
-- 		hs.keycodes.currentSourceID(inputEnglish)
-- 	end
-- end



-- for iPad
-- Option + Space -> Command + Space
-- hs.hotkey.bind({"alt"}, "space", function()
--     hs.eventtap.keyStroke({"cmd"}, "space")
-- end)


-- command + esc -> command + `

--[[function convertab()
	esc_bind:disable()
	hs.eventtap.keyStroke({"cmd"},'`')
	esc_bind:enable()
end
hs.hotkey.bind({"cmd"},'escape',convertab)
]]
-- control to capslock

-- ctrl opt tab
--[[
function ctrlopt()
	hs.eventtap.keyStroke({'cmd','option'},"tab")
end
hs.hotkey.bind({"cmd"},"tab",ctrlopt)
]]

-- function convert_to_eng()
-- 	local inputSource = hs.keycodes.currentSourceID()
-- 	if not (inputSource == inputEnglish) then
-- 		--hs.eventtap.keyStroke({}, 'right')  -- right click
-- 		hs.keycodes.currentSourceID(inputEnglish)
-- 	end
-- 	hs.eventtap.keyStroke({"control"}, "o")
-- 	-- ctrl_o:disable()
-- 	-- hs.eventtap.keyStroke({"control"}, "o")
-- 	-- ctrl_o:enable()
-- end

-- hs.hotkey.bind({"control"}, "o",convert_to_eng_with_esc)
-- ctrl_o =  hs.hotkey.new({"control"}, "o", convert_to_eng):enable()

-- function convert_to_normal_mode()

--     -- Ctrl + O 키 조합을 눌러 이전 모드로 돌아감
--     hs.eventtap.keyStroke({"control"}, "o")
-- end

-- -- Ctrl + O 키 조합에 대한 hotkey 바인딩
-- hs.hotkey.bind({"control"}, "o", convert_to_normal_mode)
-- local FRemap = require("foundation_remapping")
-- local remapper = FRemap.new()
-- remapper:remap("rcmd", "rcmd")
-- remapper:remap("ralt", "ralt")
-- -- remapper:remap("rcmd", "f18")
-- -- remapper:remap("ralt", "rcmd")
-- remapper:register()

-- ctrl + esc -> ctrl + `
--[[
function ctrlesc()
	esc_bind:disable()
	hs.eventtap.keyStroke({"ctrl"},'`')
	esc_bind:enable()
end
hs.hotkey.bind({"ctrl"},'escape',ctrlesc)



-- opt + esc -> opt + `
function optesc()
	esc_bind:disable()
	hs.eventtap.keyStroke({"option"},'`')
	esc_bind:enable()
end
hs.hotkey.bind({"option"},'escape',optesc)
]]

