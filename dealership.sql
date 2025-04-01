CREATE TABLE Mechanic (
  IDMechanic INTEGER  NOT NULL  ,
  FirstName VARCHAR(50)  NOT NULL  ,
  LastName VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(IDMechanic));



CREATE TABLE Seller (
  IDSeller INTEGER  NOT NULL  ,
  FirstName VARCHAR(50)  NOT NULL  ,
  LastName VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(IDSeller));


CREATE TABLE Car (
  IDCar INTEGER  NOT NULL  ,
  Manufacturer VARCHAR(50)    ,
  Model VARCHAR(50)    ,
  Color VARCHAR(20)    ,
  Year  INTEGER    ,
  SerialNumber VARCHAR(100)  NOT NULL UNIQUE ,
  IsForSale BOOL  NOT NULL    ,
PRIMARY KEY(IDCar));



CREATE TABLE Customer (
  IDCustomer INTEGER  NOT NULL  ,
  FirstName VARCHAR(50)  NOT NULL  ,
  LastName VARCHAR(50)  NOT NULL  ,
  PhoneNumber VARCHAR(10)  NOT NULL UNIQUE ,
  City VARCHAR(50)    ,
  PostalCode VARCHAR(10)    ,
  Street VARCHAR(50)    ,
  StreetNumber VARCHAR(15)      ,
PRIMARY KEY(IDCustomer));



CREATE TABLE ServiceTicket (
  IDServiceTicket INTEGER  NOT NULL  ,
  IDCar INTEGER  NOT NULL  ,
  IDCustomer INTEGER  NOT NULL  ,
  StartDate DATE  NOT NULL  ,
  EndDate DATE    ,
  Comments TEXT    ,
  Cost DECIMAL  NOT NULL    ,
PRIMARY KEY(IDServiceTicket) ,
FOREIGN KEY(IDCar)
    REFERENCES Car(IDCar)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  FOREIGN KEY(IDCustomer)
    REFERENCES Customer(IDCustomer)
      ON DELETE CASCADE
      ON UPDATE CASCADE);


CREATE TABLE IsServicing (
  IDServiceTicket INTEGER  NOT NULL  ,
  IDMechanic INTEGER  NOT NULL  ,
  WorkHours DECIMAL    ,
  Comments TEXT      ,
PRIMARY KEY(IDServiceTicket, IDMechanic)
  FOREIGN KEY(IDServiceTicket)
    REFERENCES ServiceTicket(IDServiceTicket)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  FOREIGN KEY(IDMechanic)
    REFERENCES Mechanic(IDMechanic)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


CREATE TABLE Invoice (
  IDInvoice INTEGER  NOT NULL  ,
  IDCar INTEGER  NOT NULL  ,
  IDSeller INTEGER  NOT NULL  ,
  IDCustomer INTEGER  NOT NULL  ,
  IssueDate DATE    ,
  Amount DECIMAL      ,
PRIMARY KEY(IDInvoice)      ,
  FOREIGN KEY(IDCar)
    REFERENCES Car(IDCar)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  FOREIGN KEY(IDSeller)
    REFERENCES Seller(IDSeller)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  FOREIGN KEY(IDCustomer)
    REFERENCES Customer(IDCustomer)
      ON DELETE CASCADE
      ON UPDATE CASCADE);
