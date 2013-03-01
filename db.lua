module(..., package.seeall)

require "sqlite3"
--
---- deblare the class table first
--local db = {}
--
---- local variables and constants
local database

function printStuff()
    local t
    for row in database:nrows("SELECT * FROM item") do
            print("found items")
      local t = display.newText(row.name, 20, 30 * row.id, null, 16)
      t:setTextColor(255,0,255)
    end    
    return t
end

function initialize()
    local path = system.pathForFile("data.db", system.DocumentsDirectory)
    database = sqlite3.open(path)
    
    print("before execute")
    --function database:initialize()
    database:exec[[
            PRAGMA foreign_keys = ON;
            drop table if exists purchase;
            drop table if exists item;
            CREATE TABLE item (id integer PRIMARY KEY, name text, active integer);
            CREATE TABLE purchase (id integer PRIMARY KEY, itemid integer,
                    date integer, amount integer, active integer,
                    FOREIGN KEY(itemid) REFERENCES item(id));
    ]]
    
    
    database:exec[[
            insert into item (id, name, active) values (null, 'Diapers', 1);
            insert into item (id, name, active) values (null, 'Prius Gas', 1);
            insert into purchase (id, itemid, date, amount, active) values (null, 2, DATETIME('now'), 33.30, 1);
    ]]
    --end
    print("after execute")
    
    print( "version " .. sqlite3.version() )
    return database
end
--
--return db