CREATE TABLE PS_ParkingMeter (
    licenseplate VARCHAR(75),
    streetname VARCHAR(75),
    parkduration INT,
    parkingdate DATE,
    parkingtime TIME,
    expiration_time DATETIME,
    PRIMARY KEY (licenseplate, streetname)
);


CREATE TABLE PS_ParkingMeter_robbery (
    identifier VARCHAR(125) PRIMARY KEY,
    robberydate DATE,
    robberytime TIME,
    robbery_expiration_time DATETIME

);


