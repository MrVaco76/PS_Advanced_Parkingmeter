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
	translations.PrkingGood = "The car with the license plate %s has a parking ticket for this street! Until: %s"
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
    translations.NotDoInCar = "You can't do this in the vehicle!"

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
    translations.PrkingGood = "Das Auto mit dem Kennzeichen %s hat ein Parkticket für diese Straße! Bis: %s"
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
    translations.NotDoInCar = "Du kannst das im Fahrzeug nicht machen!"
	
elseif Config.locales == "pt" then

    --Target
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
    translations.PrkingGood = "O carro com a matrícula %s tem um bilhete de estacionamento para esta rua! Até: %s"
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
    translations.NotDoInCar = "Você não pode fazer isso no veículo!"

elseif Config.locales == "fr" then

    --Target
    translations.GetParkingTicket = "Obtenir un ticket"
    translations.RobParkingMeter = "Voler le parcmètre"
    translations.TargetLabelCheckParkingTime = "Vérifier le ticket de stationnement"
    
    --Input Menu
    translations.ParkinMeterMenuTitel = "Parcmètre"
    translations.LicensePlate = "Plaque d’immatriculation:"
    translations.DurationParkingTime = "Durée de stationnement (min):"
    translations.StreetName = "Nom de rue:"
    translations.Date = "Date:"
    translations.Time = "Heure:"
    translations.NoVehicleNearby = "Aucun véhicule à proximité!"
    
    --Notify
    translations.ParkTicketBought = "Vous avez acheté un ticket de parking pour %s minutes, vous avez payé! %s€"
    translations.PrkingOvertime = "Le temps de stationnement a été dépassé pour %s!"
    translations.PrkingGood = "La voiture avec la plaque %s a un ticket de parking pour cette rue! Jusqu'à: %s"
    translations.NoParkingTicketForThisStreet = "La voiture avec la plaque %s n’a pas de ticket de parking pour cette rue!"
    translations.NoParkingTicket = "La voiture avec la plaque %s n’a pas de ticket de parking!"
    translations.DataBaseError = "Quelque chose a mal tourné!"
    translations.NotEnoughMoney = "Vous n’avez pas assez d’argent!"
    
     --Notify robbery
    translations.YouCanNotRobberAgain = "Tu dois encore attendre jusqu’à ce que tu puisses le refaire!"
    translations.NoItemToRob = "Vous n’avez pas l’article requis!"
    translations.NotEnoughPolice = "Il n’y a pas assez de policiers!"
    translations.RobedParkingMeter = "Vous avez volé le parcmètre et obtenu %s€!"
    translations.NotDoInCar = "Vous ne pouvez pas faire ça dans le véhicule!"

elseif Config.locales == "nl" then

    translations.GetParkingTicket = "Ticket Krijgen"
    translations.RobParkingMeter = "Parkeerautomaat Beroven"
    translations.TargetLabelCheckParkingTime = "Parkeerticket Controleren"

    --Input Menu
    translations.ParkinMeterMenuTitel = "Parkeerautomaat"
    translations.LicensePlate = "Kenteken:"
    translations.DurationParkingTime = "Parkeerduur (min):"
    translations.StreetName = "Straatnaam:"
    translations.Date = "Datum:"
    translations.Time = "Tijd:"
    translations.NoVehicleNearby = "Geen voertuigen in de buurt!"

    --Notify 
    translations.ParkTicketBought = "Je hebt een parkeerticket gekocht voor %s minuten, je hebt betaald! %s€"
    translations.PrkingOvertime = "De parkeertijd is overschreden voor %s!"
    translations.PrkingGood = "De auto met het kenteken %s heeft een parkeerticket voor deze straat! Tot: %s"
    translations.NoParkingTicketForThisStreet = "De auto met het kenteken %s heeft geen parkeerticket voor deze straat!"
    translations.NoParkingTicket = "De auto met het kenteken %s heeft geen parkeerticket!"
    translations.DataBaseError = "Er is iets misgegaan!"
    translations.NotEnoughMoney = "Je hebt niet genoeg geld!"
    translations.HasAllreadTicket = "Het voertuig met het kenteken %s heeft al een ticket voor de straat %s."

    --Notify robbery
    translations.YouCanNotRobberAgain = "Je moet nog wachten voordat je dat weer kunt doen!"
    translations.NoItemToRob = "Je hebt het vereiste item niet!"
    translations.NotEnoughPolice = "Er zijn niet genoeg politieagenten!"
    translations.RobedParkingMeter = "Je hebt de parkeerautomaat beroofd en %s€ gekregen!"
    translations.NotDoInCar = "Dit kan niet in de auto!"


end 