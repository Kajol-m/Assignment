CREATE TABLE Customer(
  Cust_No LENGTH(5) NOT NULL PRIMARY KEY CHECK(Cust_No LIKE '%C'),
  Name VARCHAR(30) NOT NULL,
  Phone_No INT,
  City VARCHAR(20)
  );
  
CREATE TABLE Account(
  Account_No LENGTH(5) NOT NULL PRIMARY KEY CHECK(Account_No LIKE '%A'),
  Type CHAR(2),
  Balance LONG,
  Branch_Code VARCHAR(10),
  FOREIGN KEY (Branch_Code) REFERENCES Branch(Branch_Code),
  CONSTRAINT CHK_Account CHECK (Type IN ('SB','FD','CA') AND Balance<10000000)
 );
 
 CREATE TABLE Depositor(
   Cust_No LENGTH(5),
   Account_No LENGTH(5),
   FOREIGN KEY (Cust_No) REFERENCES Customer(Cust_No),
   FOREIGN KEY (Account_No) REFERENCES Account(Account_No)
   );
   
 CREATE TABLE Loan(
   Loan_No VARCHAR(10) NOT NULL PRIMARY KEY CHECK(Loan_No LIKE '%L'),
   Cust_No LENGTH(5),
   Amount INT CHECK (Amount>1000),
   Branch_Code VARCHAR(10),
   FOREIGN KEY (Cust_No) REFERENCES Customer(Cust_No),
   
   FOREIGN KEY (Branch_Code) REFERENCES Branch(Branch_Code)
   );
   
 CREATE TABLE Branch(
   Branch_Code VARCHAR(10) NOT NULL PRIMARY KEY,
   Branch_Name VARCHAR(30) NOT NULL,
   Branch_City VARCHAR(20) CHECK (Branch_City IN ('Delhi','Mumbai','Kolkata','Chennai'))
   );
   
 CREATE TABLE Installment(
   Inst_No VARCHAR(10) NOT NULL PRIMARY KEY,
   Loan_No VARCHAR(10),
   Inst_Amount INT NOT NULL,
   FOREIGN KEY (Loan_No) REFERENCES Loan(Loan_No)
);
                                  
   
 
  
  
  
