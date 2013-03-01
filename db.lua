module(..., package.seeall)

require "sqlite3"

---- local variables and constants
local database = nil
-- database query strings
local data_SelectAllFromItem = [[ Select * from item; ]]

function checkDataBaseState()
    if (database == nil or database.isopen(database) == false) then
        local path = system.pathForFile("data.db", system.DocumentsDirectory)
        database = sqlite3.open(path)
    end
end

function printStuff()
    checkDataBaseState{}
    for row in database:nrows(data_SelectAllFromItem) do
        local t = display.newText(row.name, 20, 30 * row.id, null, 16)
        t:setTextColor(255,0,255)
    end    
end

function initialize()
    checkDataBaseState{}
    
    rows = database:nrows(data_SelectAllFromItem)
    
    if (rows ~= "0") then
        database:execute(
        [[ PRAGMA foreign_keys = ON;
            drop table if exists purchase;
            drop table if exists item;
            CREATE TABLE item (id integer PRIMARY KEY, name text, active integer);
            CREATE TABLE purchase (id integer PRIMARY KEY, itemid integer,
                    date integer, amount integer, active integer,
                    FOREIGN KEY(itemid) REFERENCES item(id)); 
        ]])
    end
    
    database:execute(
    [[
        insert into item (id, name, active) values (null, 'Diapers', 1);
        insert into item (id, name, active) values (null, 'Prius Gas', 1);
        insert into purchase (id, itemid, date, amount, active) values (null, 2, DATETIME('now'), 33.30, 1);
    ]])
        
    return database
end
--
--return db