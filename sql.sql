CREATE TABLE PS_ParkingMeter (
    licenseplate VARCHAR(75) PRIMARY KEY,
    parkduration INT,
    streetname VARCHAR(75),
    parkingdate DATE,
    parkingtime TIME,
    expiration_time DATETIME

);

CREATE TABLE PS_ParkingMeter_robbery (
    identifier VARCHAR(125) PRIMARY KEY,
    robberydate DATE,
    robberytime TIME,
    robbery_expiration_time DATETIME

);


