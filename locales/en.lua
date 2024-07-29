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

end 