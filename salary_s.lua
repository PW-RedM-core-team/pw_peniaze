VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)


local isSalary = false
RegisterServerEvent("salaryJobs:GIVE")
scriptName = "vorp_salary"
local g = {}


------------------------------------------------------------------------
-- Config Zone (obviously, now you can touch :))
------------------------------------------------------------------------
local canServerConsoleDebugs = false
-- Let this false to remove console prints!
local salaryMessages= {
	["Money_Salary_Recive"] = "Bank: You receive a paycheck face value: $",
}
local noSalaryMessages={
	["Money_Salary_Recive_No_Recive"]  = "Bank: No salary?",
}
-- Tip Notifications
local messageSecondsInScreen = 8 --20 by default 
-- When the user recive a salary, a tip notif appear in screen. What secoends this notification needs to be on screen?

---------------- Salary Configuration: 
-- :::: JOB l MONEY l GOLD l XP ::::: 
-- If you don't want to give gold, per exemple, leave the value on 0!
-- just follow the examples 
-- don't forgot the [,] in final of }
------------------------------------------------------------------------------------------
g.salaryJobs = {
{"police", 4,0,0},
{"medic", 3,0,0},
{"bartender", 1,0,0},
{"miner", 2,0,0},
{"banker", 2,0,0}
}

function g:giveSalary(_verifyAntiAbuse)
if _verifyAntiAbuse == "0x089027928098908"  then 
local source = source 
for _k,_v in pairs (g.salaryJobs) do 
	local money = {}
	if canServerConsoleDebugs then 
	print("--------------!!!!!!!! Alerta PayCheck !!!!!!!!--------------")
	print("DEBUG: Trying to give salary to source: "..source)
	print("--------------------------------------------------------------")	
	end

	
    
local user = VorpCore.getUser(source)
local User = VorpCore.getUser(source)
local character = User.getUsedCharacter
if character.job == _v[1] then 
isSalary=true
							money   [source] = _v[2]
							if canServerConsoleDebugs then 
							print("--------------!!!!!!!! Alerta PayCheck !!!!!!!!--------------")
							print("DEBUG: Giving Salary to Source: "..source.. " D_INFO>> ", money[source],gold[source],xp[source])
							print("--------------------------------------------------------------")		
							end
					
							if money[source]>=1 then 
								TriggerEvent("vorp:addMoney", source, 0, money[source]);
					
							end 
						
							local mensagens_U = {}
							mensagens_U.money= noSalaryMessages["Xp_Salary_Recive_No_Recive"]
							if money[source]>= 1 then 
								mensagens_U.money = salaryMessages["Money_Salary_Recive"]..money[source]
							end
							mensagens_U.finalMessage = mensagens_U.money
                            if isSalary then 
							g:Notify(mensagens_U.finalMessage)
                            end
			
							money   [source] = 0
							isSalary         = false
						 end end 
else
	if canServerConsoleDebugs then 
	print("Salary: no;")
	end end end

function g:Notify(msg)
local source=source
TriggerClientEvent("vorp:Tip", source, msg, messageSecondsInScreen*1000) 
end
------------------------------------------------------------------------------------------

-- Evento para usar a função acima no client.lua

------------------------------------------------------------------------------------------

AddEventHandler("salaryJobs:GIVE",function (_verifyAntiAbuse,_2)
	if _2 == 'b' then 
    if _verifyAntiAbuse == "0x089027928098908_"  then    
    g:giveSalary("0x089027928098908");
	end end end) 
