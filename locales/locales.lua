translations = {}

if Config.locales == "en" then 
	--Target
	translations.GetParkingTicket = "Get Ticket"
	translations.RobParkingMeter = "Rob Parkingmeter"
	translations.TargetLabelCheckParkingTime = "Check Parkingticket"

	--Input Menu
	translations.ParkinMeterMenuTitel = "Parking meter"
	translations.LicensePlate = "License Plate:"
	translations.DurationParkingTime = "Parking duration (min):"
	translations.StreetName = "Streetname:"
	translations.Date = "Date:"
	translations.Time = "Time:"
	translations.NoVehicleNearby = "No vehicles nearby!"

	--Notify 
	translations.ParkTicketBought = "You bought a parking ticket for %s minutes, you paid! %s€"
	translations.PrkingOvertime = "The parking time has been exceeded for %s!"
	translations.PrkingGood = "The car with the license plate %s has a parking ticket for this street!"
	translations.NoParkingTicketForThisStreet = "The car with the license plate %s has no parking ticket for this street!"
	translations.NoParkingTicket = "The car with the license plate %s has no parking ticket!"
	translations.DataBaseError = "Something went wrong!"
	translations.NotEnoughMoney = "You don`t have enough money!"
	translations.HasAllreadTicket = "The vehicle with the license plate %s already has a ticket for the street %s."

	--Notify robbery
	translations.YouCanNotRobberAgain = "You still have to wait until you can do that again!"
	translations.NoItemToRob = "You don't have the required item!"
	translations.NotEnoughPolice = "There aren't enough police officers!"
	translations.RobedParkingMeter = "You have robbed the parkingmeter and got %s€!"

elseif Config.locales == "de" then
    --Target
    translations.GetParkingTicket = "Ticket kaufen"
    translations.RobParkingMeter = "Parkuhr ausrauben"
    translations.TargetLabelCheckParkingTime = "Parkticket überprüfen"
    
    --Input Menu
    translations.ParkinMeterMenuTitel = "Parkuhr"
    translations.LicensePlate = "Kennzeichen:"
    translations.DurationParkingTime = "Parkdauer (Minuten):"
    translations.StreetName = "Straßenname:"
    translations.Date = "Datum:"
    translations.Time = "Uhrzeit:"
    translations.NoVehicleNearby = "Keine Fahrzeuge in der Nähe!"
    
    --Notify 
    translations.ParkTicketBought = "Sie haben ein Parkticket für %s Minuten gekauft, Sie haben %s€ bezahlt!"
    translations.PrkingOvertime = "Die Parkzeit wurde um %s überschritten!"
    translations.PrkingGood = "Das Auto mit dem Kennzeichen %s hat ein Parkticket für diese Straße!"
    translations.NoParkingTicketForThisStreet = "Das Auto mit dem Kennzeichen %s hat kein Parkticket für diese Straße!"
    translations.NoParkingTicket = "Das Auto mit dem Kennzeichen %s hat kein Parkticket!"
    translations.DataBaseError = "Etwas ist schief gelaufen!"
    translations.NotEnoughMoney = "Sie haben nicht genug Geld!"
    translations.HasAllreadTicket = "Das Fahrzeug mit dem Kennzeichen %s hat bereits ein Ticket für die Straße %s."
    
    --Notify robbery
    translations.YouCanNotRobberAgain = "Sie müssen noch warten, bis Sie das wieder tun können!"
    translations.NoItemToRob = "Sie haben den erforderlichen Gegenstand nicht!"
    translations.NotEnoughPolice = "Es sind nicht genug Polizisten da!"
    translations.RobedParkingMeter = "Sie haben die Parkuhr ausgeraubt und %s€ erhalten!"
	
elseif Config.locales == "pt" then

    translations.GetParkingTicket = "Pagar Estacionamento"
    translations.RobParkingMeter = "Roubar Parquímetro"
    translations.TargetLabelCheckParkingTime = "Verificar bilhete de estacionamento"

    --Input Menu
    translations.ParkinMeterMenuTitel = "Parquímetro"
    translations.LicensePlate = "Matrícula:"
    translations.DurationParkingTime = "Duração (min):"
    translations.StreetName = "Rua:"
    translations.Date = "Data:"
    translations.Time = "Tempo:"
    translations.NoVehicleNearby = "Nenhum veículo por perto!"

    --Notify 
    translations.ParkTicketBought = "Compraste um bilhete de estacionamento para %s minutos, pagaste %s€!"
    translations.PrkingOvertime = "O tempo de estacionamento foi excedido por %s!"
    translations.PrkingGood = "O carro com a matrícula %s tem um bilhete de estacionamento para esta rua!"
    translations.NoParkingTicketForThisStreet = "O carro com a matrícula %s não tem bilhete de estacionamento para esta rua!"
    translations.NoParkingTicket = "O carro com a matrícula %s não tem bilhete de estacionamento!"
    translations.DataBaseError = "Algo correu mal!"
    translations.NotEnoughMoney = "Não tens dinheiro suficiente!"
    translations.HasAllreadTicket = "O veículo com a matrícula %s já tem um bilhete para a rua %s."

    -- Notificar roubo
    translations.YouCanNotRobberAgain = "Ainda tens de esperar até que possas fazer isso novamente!"
    translations.NoItemToRob = "Não tens o item necessário!"
    translations.NotEnoughPolice = "Não há polícias suficientes!"
    translations.RobedParkingMeter = "Assaltaste o parquímetro e obtiveste %s€!"


end 