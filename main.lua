require "CiderDebugger"
;-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
--Debug the smart way with Cider!
--start coding and press the debug button

local db = require("db")

db:initialize{}
db:printStuff{}

print("test")
--local function onSystemEvent( event )
--        if( event.type == "applicationExit" ) then              
--            db:close()
--        end
--end
--
--print("before item loop")
--for row in db:nrows("SELECT * FROM item") do
--	print("found items")
--  local t = display.newText(row.name, 20, 30 * row.id, null, 16)
--  t:setTextColor(255,0,255)
--end
