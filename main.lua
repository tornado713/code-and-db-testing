require "CiderDebugger"
-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
--Debug the smart way with Cider!
--start coding and press the debug button

local db = require("db")

db:initialize{}
db:printStuff{}

local function onSystemEvent( event )
        if( event.type == "applicationExit" ) then              
            db:close()
        end
end