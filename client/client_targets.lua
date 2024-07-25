local models = Config.TargetPropModels

local bones = Config.BonesForTarget



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
      exports['qb-target']:AddTargetBone(bones, { 
        options = { 
          { 
            type = "client", 
            event = "PS_Parking_meter_system:CheckParkingTime", 
            icon = 'fa-solid fa-square-parking', 
            label = translations.TargetLabelCheckParkingTime, 
			job = Config.JobCanCheckParkingTime,
            
          }
        },
        distance = Config.TargetDistance,
      })
	
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
exports.ox_target:addGlobalVehicle(
    { 
        {
            drawSprite = true,
            distance = 2.5,
            event = 'PS_Parking_meter_system:CheckParkingTime',   
            icon = "fa-solid fa-square-parking",              
            label = translations.TargetLabelCheckParkingTime,  
            groups = Config.JobCanCheckParkingTime,                
            debug = Config.Debug 
        }
    }
)
end
