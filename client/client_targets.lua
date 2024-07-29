local models = Config.TargetPropModels

local bones = Config.BonesForTarget

local Jobs = Config.JobCanCheckParkingTime

if Config.TargetSystem == "qb-target" then 
    exports["qb-target"]:AddTargetModel(
        models,  
        { 
            options = { 
                { 
                    type = "client", 
                    event = "PS_Parking_meter_system:OpenMenu", 
                    icon = 'fa-solid fa-square-parking',  
                    label = translations.GetParkingTicket, 
					
                } 
            }, 
            distance = 2.5, 
        }
    )
	if Config.UseRobbery then 
	    exports["qb-target"]:AddTargetModel(
        models,  
        { 
            options = { 
                { 
                    type = "client", 
                    event = "PS_Parking_meter_system:PoliceCheckResult", 
                    icon = 'fa-solid fa-sack-dollar',  
                    label = translations.RobParkingMeter, 
					
                } 
            }, 
            distance = 2.5, 
        }
    )

end
if Config.AllCanCheckVehicle then 
      exports['qb-target']:AddTargetBone(bones, { 
        options = { 
          { 
            type = "client", 
            event = "PS_Parking_meter_system:CheckParkingTime", 
            icon = 'fa-solid fa-square-parking', 
            label = translations.TargetLabelCheckParkingTime, 
            
          }
        },
        distance = Config.TargetDistance,
      })
elseif not Config.AllCanCheckVehicle then 
      exports['qb-target']:AddTargetBone(bones, { 
        options = { 
          { 
            type = "client", 
            event = "PS_Parking_meter_system:CheckParkingTime", 
            icon = 'fa-solid fa-square-parking', 
            label = translations.TargetLabelCheckParkingTime, 
			job = Jobs,
            
          }
        },
        distance = Config.TargetDistance,
      })
	 end
	
elseif Config.TargetSystem == "ox-target" then 

exports.ox_target:addModel(
    models, 
    { 
        {
            drawSprite = true,
            distance = 2.5,
            event = "PS_Parking_meter_system:OpenMenu",   
            icon = 'fa-solid fa-square-parking',              
            label = translations.GetParkingTicket,     
            debug = Config.Debug 
        }
    }
)
if Config.UseRobbery then
exports.ox_target:addModel(
    models, 
    { 
        {
            drawSprite = true,
            distance = 2.5,
            event = "PS_Parking_meter_system:PoliceCheckResult",   
            icon = 'fa-solid fa-sack-dollar',              
            label = translations.RobParkingMeter,     
            debug = Config.Debug 
        }
    }
)
end
if Config.AllCanCheckVehicle then 
exports.ox_target:addGlobalVehicle(
    { 
        {
            drawSprite = true,
            distance = 2.5,
            event = 'PS_Parking_meter_system:CheckParkingTime',   
            icon = "fa-solid fa-square-parking",              
            label = translations.TargetLabelCheckParkingTime,                 
            debug = Config.Debug 
        }
    }
)
elseif not Config.AllCanCheckVehicle then 
exports.ox_target:addGlobalVehicle(
    { 
        {
            drawSprite = true,
            distance = 2.5,
            event = 'PS_Parking_meter_system:CheckParkingTime',   
            icon = "fa-solid fa-square-parking",              
            label = translations.TargetLabelCheckParkingTime,  
            groups = Jobs,                
            debug = Config.Debug 
        }
    }
)
end

end
