
# Step 1 
# Created assignment schema using MYSQL Workbench GUI
use assignment;

#Creating Table to Load the csv files of the 6 Stocks data porvided in the assignment
# 2 Approaches can be followed - 1. Analyze the csv and decide on the table structure and the data type
# required
# Approach 2 - there are many tools available that given a csv it can create and also load table using CSV file
# I have followed the tool csvsql - which allows to both create statements and also load simultaneously but I have only
# used csvsql to generate the CREATE SQL statement using the csv files provided...
# The SQLs below were generated using it...In the generated SQL i just updated the Date datatypes as DATE instead of VARCHAR that the tool generated

# TCS Create SQL
CREATE TABLE `TCS` (
        `Date` DATE NOT NULL,
        `Open Price` DECIMAL(38, 2) NOT NULL,
        `High Price` DECIMAL(38, 2) NOT NULL,
        `Low Price` DECIMAL(38, 2) NOT NULL,
        `Close Price` DECIMAL(38, 2) NOT NULL,
        `WAP` DECIMAL(38, 18) NOT NULL,
        `No.of Shares` DECIMAL(38, 0) NOT NULL,
        `No. of Trades` DECIMAL(38, 0) NOT NULL,
        `Total Turnover (Rs.)` DECIMAL(38, 0) NOT NULL,
        `Deliverable Quantity` DECIMAL(38, 0),
        `%% Deli. Qty to Traded Qty` DECIMAL(38, 2),
        `Spread High-Low` DECIMAL(38, 2) NOT NULL,
        `Spread Close-Open` DECIMAL(38, 2) NOT NULL
);

#Bajaj_Auto Create SQL
CREATE TABLE `Bajaj_Auto` (
        `Date` DATE NOT NULL,
        `Open Price` DECIMAL(38, 2) NOT NULL,
        `High Price` DECIMAL(38, 2) NOT NULL,
        `Low Price` DECIMAL(38, 2) NOT NULL,
        `Close Price` DECIMAL(38, 2) NOT NULL,
        `WAP` DECIMAL(38, 18) NOT NULL,
        `No.of Shares` DECIMAL(38, 0) NOT NULL,
        `No. of Trades` DECIMAL(38, 0) NOT NULL,
        `Total Turnover (Rs.)` DECIMAL(38, 0) NOT NULL,
        `Deliverable Quantity` DECIMAL(38, 0),
        `%% Deli. Qty to Traded Qty` DECIMAL(38, 2),
        `Spread High-Low` DECIMAL(38, 2) NOT NULL,
        `Spread Close-Open` DECIMAL(38, 2) NOT NULL
);

#Eicher_Motors Create SQL
CREATE TABLE `Eicher_Motors` (
        `Date` DATE NOT NULL,
        `Open Price` DECIMAL(38, 2) NOT NULL,
        `High Price` DECIMAL(38, 2) NOT NULL,
        `Low Price` DECIMAL(38, 2) NOT NULL,
        `Close Price` DECIMAL(38, 2) NOT NULL,
        `WAP` DECIMAL(38, 18) NOT NULL,
        `No.of Shares` DECIMAL(38, 0) NOT NULL,
        `No. of Trades` DECIMAL(38, 0) NOT NULL,
        `Total Turnover (Rs.)` DECIMAL(38, 0) NOT NULL,
        `Deliverable Quantity` DECIMAL(38, 0),
        `%% Deli. Qty to Traded Qty` DECIMAL(38, 2),
        `Spread High-Low` DECIMAL(38, 2) NOT NULL,
        `Spread Close-Open` DECIMAL(38, 2) NOT NULL
);

#Hero_Motocorp Create SQL
CREATE TABLE `Hero_Motocorp` (
        `Date` DATE NOT NULL,
        `Open Price` DECIMAL(38, 2) NOT NULL,
        `High Price` DECIMAL(38, 2) NOT NULL,
        `Low Price` DECIMAL(38, 2) NOT NULL,
        `Close Price` DECIMAL(38, 2) NOT NULL,
        `WAP` DECIMAL(38, 18) NOT NULL,
        `No.of Shares` DECIMAL(38, 0) NOT NULL,
        `No. of Trades` DECIMAL(38, 0) NOT NULL,
        `Total Turnover (Rs.)` DECIMAL(38, 0) NOT NULL,
        `Deliverable Quantity` DECIMAL(38, 0),
        `%% Deli. Qty to Traded Qty` DECIMAL(38, 2),
        `Spread High-Low` DECIMAL(38, 2) NOT NULL,
        `Spread Close-Open` DECIMAL(38, 2) NOT NULL
);


#Infosys Create SQL
CREATE TABLE `Infosys` (
        `Date` DATE NOT NULL,
        `Open Price` DECIMAL(38, 2) NOT NULL,
        `High Price` DECIMAL(38, 2) NOT NULL,
        `Low Price` DECIMAL(38, 2) NOT NULL,
        `Close Price` DECIMAL(38, 2) NOT NULL,
        `WAP` DECIMAL(38, 18) NOT NULL,
        `No.of Shares` DECIMAL(38, 0) NOT NULL,
        `No. of Trades` DECIMAL(38, 0) NOT NULL,
        `Total Turnover (Rs.)` DECIMAL(38, 0) NOT NULL,
        `Deliverable Quantity` DECIMAL(38, 0),
        `%% Deli. Qty to Traded Qty` DECIMAL(38, 2),
        `Spread High-Low` DECIMAL(38, 2) NOT NULL,
        `Spread Close-Open` DECIMAL(38, 2) NOT NULL
);

#TVS_Motors Create SQL
CREATE TABLE `TVS_Motors` (
        `Date` DATE NOT NULL,
        `Open Price` DECIMAL(38, 2) NOT NULL,
        `High Price` DECIMAL(38, 2) NOT NULL,
        `Low Price` DECIMAL(38, 2) NOT NULL,
        `Close Price` DECIMAL(38, 2) NOT NULL,
        `WAP` DECIMAL(38, 18) NOT NULL,
        `No.of Shares` DECIMAL(38, 0) NOT NULL,
        `No. of Trades` DECIMAL(38, 0) NOT NULL,
        `Total Turnover (Rs.)` DECIMAL(38, 0) NOT NULL,
        `Deliverable Quantity` DECIMAL(38, 0),
        `%% Deli. Qty to Traded Qty` DECIMAL(38, 2),
        `Spread High-Low` DECIMAL(38, 2) NOT NULL,
        `Spread Close-Open` DECIMAL(38, 2) NOT NULL
);

# LOADed The above tables with the csv files provideds using the LOAD scripts..the below SQLs were used to load this tables
# even import wizard can be used for the same purpose
# While loading the beloe load SQLs failed due to secure_file_priv

SHOW VARIABLES LIKE "secure_file_priv";

#AFter enabling the secure_file_priv, the following LOAD scripts ran successfully...

#LOAD bajaj_auto table

#Note the date format was changed and also columns with spaces are loaded as NULL

LOAD DATA  INFILE 'D:/Upgrad/SQL/Bajaj Auto.csv' INTO TABLE bajaj_auto
	 FIELDS TERMINATED BY ','   LINES TERMINATED BY '\n'
	 IGNORE 1 LINES  
     
 (@`Date`,`Open Price`,`High Price`,`Low Price`,`Close Price`,`WAP`,`No.of Shares`,`No. of Trades`,
  `Total Turnover (Rs.)`,@`Deliverable Quantity`,@`%% Deli. Qty to Traded Qty`,`Spread High-Low`,
  `Spread Close-Open`)
  
SET 
   `Date` = STR_TO_DATE(@`Date`,'%d-%M-%Y'),
   `Deliverable Quantity` = IF(@`Deliverable Quantity` ='',NULL,@`Deliverable Quantity`),
   `%% Deli. Qty to Traded Qty` = IF(@`%% Deli. Qty to Traded Qty` ='',NULL,@`%% Deli. Qty to Traded Qty`);

SELECT * FROM Bajaj_Auto ;


#LOAD eicher_motors table
LOAD DATA  INFILE 'D:/Upgrad/SQL/Eicher Motors.csv' INTO TABLE eicher_motors
	 FIELDS TERMINATED BY ','   LINES TERMINATED BY '\n'
	 IGNORE 1 LINES  
     
 (@`Date`,`Open Price`,`High Price`,`Low Price`,`Close Price`,`WAP`,`No.of Shares`,`No. of Trades`,
  `Total Turnover (Rs.)`,@`Deliverable Quantity`,@`%% Deli. Qty to Traded Qty`,`Spread High-Low`,
  `Spread Close-Open`)
  
SET 
   `Date` = STR_TO_DATE(@`Date`,'%d-%M-%Y'),
   `Deliverable Quantity` = IF(@`Deliverable Quantity` ='',NULL,@`Deliverable Quantity`),
   `%% Deli. Qty to Traded Qty` = IF(@`%% Deli. Qty to Traded Qty` ='',NULL,@`%% Deli. Qty to Traded Qty`);

SELECT * FROM eicher_motors ;

# Load hero_motocorp
LOAD DATA  INFILE 'D:/Upgrad/SQL/Hero Motocorp.csv' INTO TABLE hero_motocorp
	 FIELDS TERMINATED BY ','   LINES TERMINATED BY '\n'
	 IGNORE 1 LINES  
     
 (@`Date`,`Open Price`,`High Price`,`Low Price`,`Close Price`,`WAP`,`No.of Shares`,`No. of Trades`,
  `Total Turnover (Rs.)`,@`Deliverable Quantity`,@`%% Deli. Qty to Traded Qty`,`Spread High-Low`,
  `Spread Close-Open`)
  
SET 
   `Date` = STR_TO_DATE(@`Date`,'%d-%M-%Y'),
   `Deliverable Quantity` = IF(@`Deliverable Quantity` ='',NULL,@`Deliverable Quantity`),
   `%% Deli. Qty to Traded Qty` = IF(@`%% Deli. Qty to Traded Qty` ='',NULL,@`%% Deli. Qty to Traded Qty`);

SELECT * FROM hero_motocorp ;

# LOAD infosys table
LOAD DATA  INFILE 'D:/Upgrad/SQL/Infosys.csv' INTO TABLE infosys
	 FIELDS TERMINATED BY ','   LINES TERMINATED BY '\n'
	 IGNORE 1 LINES  
     
 (@`Date`,`Open Price`,`High Price`,`Low Price`,`Close Price`,`WAP`,`No.of Shares`,`No. of Trades`,
  `Total Turnover (Rs.)`,@`Deliverable Quantity`,@`%% Deli. Qty to Traded Qty`,`Spread High-Low`,
  `Spread Close-Open`)
  
SET 
   `Date` = STR_TO_DATE(@`Date`,'%d-%M-%Y'),
   `Deliverable Quantity` = IF(@`Deliverable Quantity` ='',NULL,@`Deliverable Quantity`),
   `%% Deli. Qty to Traded Qty` = IF(@`%% Deli. Qty to Traded Qty` ='',NULL,@`%% Deli. Qty to Traded Qty`);

SELECT * FROM infosys ;

# LOAD tcs table
LOAD DATA  INFILE 'D:/Upgrad/SQL/TCS.csv' INTO TABLE tcs
	 FIELDS TERMINATED BY ','   LINES TERMINATED BY '\n'
	 IGNORE 1 LINES  
     
 (@`Date`,`Open Price`,`High Price`,`Low Price`,`Close Price`,`WAP`,`No.of Shares`,`No. of Trades`,
  `Total Turnover (Rs.)`,@`Deliverable Quantity`,@`%% Deli. Qty to Traded Qty`,`Spread High-Low`,
  `Spread Close-Open`)
  
SET 
   `Date` = STR_TO_DATE(@`Date`,'%d-%M-%Y'),
   `Deliverable Quantity` = IF(@`Deliverable Quantity` ='',NULL,@`Deliverable Quantity`),
   `%% Deli. Qty to Traded Qty` = IF(@`%% Deli. Qty to Traded Qty` ='',NULL,@`%% Deli. Qty to Traded Qty`);

SELECT * FROM tcs ;

# LOAD tvs_motors
LOAD DATA  INFILE 'D:/Upgrad/SQL/TVS Motors.csv' INTO TABLE tvs_motors
	 FIELDS TERMINATED BY ','   LINES TERMINATED BY '\n'
	 IGNORE 1 LINES  
     
 (@`Date`,`Open Price`,`High Price`,`Low Price`,`Close Price`,`WAP`,`No.of Shares`,`No. of Trades`,
  `Total Turnover (Rs.)`,@`Deliverable Quantity`,@`%% Deli. Qty to Traded Qty`,`Spread High-Low`,
  `Spread Close-Open`)
  
SET 
   `Date` = STR_TO_DATE(@`Date`,'%d-%M-%Y'),
   `Deliverable Quantity` = IF(@`Deliverable Quantity` ='',NULL,@`Deliverable Quantity`),
   `%% Deli. Qty to Traded Qty` = IF(@`%% Deli. Qty to Traded Qty` ='',NULL,@`%% Deli. Qty to Traded Qty`);

SELECT * FROM tvs_motors ;
 
# Question 1
# For Create a new table named 'bajaj1' containing the date, close price, 20 Day MA and 50 Day MA. 
# (This has to be done for all 6 stocks)

# bajaj1 Create SQL
CREATE TABLE bajaj1 (
        `Date` DATE NOT NULL,
		`Close Price` DECIMAL(38, 2) NOT NULL,
        `20 Day MA` DECIMAL(10, 2),
        `50 Day MA` DECIMAL(10, 2)
);

# eicher1 Create SQL
CREATE TABLE eicher1 (
        `Date` DATE NOT NULL,
		`Close Price` DECIMAL(38, 2) NOT NULL,
        `20 Day MA` DECIMAL(10, 2),
        `50 Day MA` DECIMAL(10, 2)
);

# hero1 Create SQL
CREATE TABLE hero1 (
        `Date` DATE NOT NULL,
		`Close Price` DECIMAL(38, 2) NOT NULL,
        `20 Day MA` DECIMAL(10, 2),
        `50 Day MA` DECIMAL(10, 2)
);

#infosys1 Create SQL
CREATE TABLE infosys1 (
        `Date` DATE NOT NULL,
		`Close Price` DECIMAL(38, 2) NOT NULL,
        `20 Day MA` DECIMAL(10, 2),
        `50 Day MA` DECIMAL(10, 2)
);

#tcs1 Create SQL
CREATE TABLE tcs1 (
        `Date` DATE NOT NULL,
		`Close Price` DECIMAL(38, 2) NOT NULL,
        `20 Day MA` DECIMAL(10, 2),
        `50 Day MA` DECIMAL(10, 2)
);

#tvs1 Create SQL
CREATE TABLE tvs1 (
        `Date` DATE NOT NULL,
		`Close Price` DECIMAL(38, 2) NOT NULL,
        `20 Day MA` DECIMAL(10, 2),
        `50 Day MA` DECIMAL(10, 2)
);


# To load the above table with derived Moving averages values for '20 Day MA' and '50 Day MA', 2 appproaches I have followed
# Approach 1 - Use MS Excel - Data Analysis - Moving Averages option to create a csv file containing date, Close Price, 20 Day MA, 50 Day MA using the original csv file provided
# load this created CSV file like above into the bajaj1, eicher1 tables......
# Approach 2 - Using SQL query Insert the same into this tables....
# I have tested and validated both the apporaches and they give the samme output

#Approach 1
#LOAD Data in this above tables with new csv created that contains 20 Day MA and 50 day MA

# bajaj1 LOAD 
LOAD DATA  INFILE 'D:/Upgrad/SQL/bajaj1.csv' INTO TABLE bajaj1
	 FIELDS TERMINATED BY ','   LINES TERMINATED BY '\n'
	 IGNORE 1 LINES 
 (@Date, `Close Price`,`20 Day MA`,`50 Day MA`)
 SET 
   `Date` = STR_TO_DATE(@`Date`,'%d-%M-%Y');

 
Select * from bajaj1;

#eicher1 LOAD
LOAD DATA  INFILE 'D:/Upgrad/SQL/eicher1.csv' INTO TABLE eicher1
	 FIELDS TERMINATED BY ','   LINES TERMINATED BY '\n'
	 IGNORE 1 LINES 
 (@Date, `Close Price`,`20 Day MA`,`50 Day MA`)
 SET 
   `Date` = STR_TO_DATE(@`Date`,'%d-%M-%Y');
   
 
Select * from eicher1;

# hero1 LOAD
LOAD DATA  INFILE 'D:/Upgrad/SQL/hero1.csv' INTO TABLE hero1
	 FIELDS TERMINATED BY ','   LINES TERMINATED BY '\n'
	 IGNORE 1 LINES 
 (@Date, `Close Price`,`20 Day MA`,`50 Day MA`)
 SET 
   `Date` = STR_TO_DATE(@`Date`,'%d-%M-%Y');
   
   
# insosys1 LOAD   
LOAD DATA  INFILE 'D:/Upgrad/SQL/infosys1.csv' INTO TABLE infosys1
	 FIELDS TERMINATED BY ','   LINES TERMINATED BY '\n'
	 IGNORE 1 LINES 
 (@Date, `Close Price`,`20 Day MA`,`50 Day MA`)
 SET 
   `Date` = STR_TO_DATE(@`Date`,'%d-%M-%Y');
   
# tcs1 LOAD
LOAD DATA  INFILE 'D:/Upgrad/SQL/tcs1.csv' INTO TABLE tcs1
	 FIELDS TERMINATED BY ','   LINES TERMINATED BY '\n'
	 IGNORE 1 LINES 
 (@Date, `Close Price`,`20 Day MA`,`50 Day MA`)
 SET 
   `Date` = STR_TO_DATE(@`Date`,'%d-%M-%Y');
   
# tvs1 LOAD   
LOAD DATA  INFILE 'D:/Upgrad/SQL/tvs1.csv' INTO TABLE tvs1
	 FIELDS TERMINATED BY ','   LINES TERMINATED BY '\n'
	 IGNORE 1 LINES 
 (@Date, `Close Price`,`20 Day MA`,`50 Day MA`)
 SET 
   `Date` = STR_TO_DATE(@`Date`,'%d-%M-%Y');

Select * from tvs1;

# The new csv files created can also be provided if required to Upgrad evaluaion team...please let me know if need...
#Approach 2 --- Using the SQL queries that calcuates the 20 Day MA and 50 Day MA..same can be done
# the following query was tried to check if the SQL query also gives the same results as was done using the above approach...
#
# Approach 2 -- The query below was first used to validate with the earlier Approach 1 and then porgressed
WITH CTE_bajaj_auto (Date, `Close Price`, Rownumber, MA20, MA50)
AS
(
SELECT Date,
       `Close Price`,
       ROW_NUMBER() OVER (ORDER BY Date ASC) AS RowNumber,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 19 PRECEDING) AS MA20,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 49 PRECEDING) AS MA50
       FROM   bajaj_auto
)
select  Date
       ,`Close Price`
       , RowNumber
       ,if(RowNumber > 19, MA20, NULL) AS MA20
       ,if(RowNumber > 49, MA50, NULL) AS MA50       
FROM   CTE_bajaj_auto
ORDER BY Date;

# both the results matched.....
# After Confirmation the following query was used to load bajaj2...
Insert into 
       bajaj2
		   (`Date`
           ,`Close Price`
           ,`20 Day MA`
           ,`50 Day MA`
           )
           
		      Select `Date`
			         ,`Close Price`
               ,`MA20`
               ,`MA50`
                
           from
           ((WITH CTE_bajaj_auto (Date, `Close Price`, Rownumber, MA20, MA50)
AS
(
SELECT Date,
       `Close Price`,
       ROW_NUMBER() OVER (ORDER BY Date ASC) AS RowNumber,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 19 PRECEDING) AS MA20,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 49 PRECEDING) AS MA50
       FROM   bajaj_auto
)
select  Date
       ,`Close Price`
#       , RowNumber
       ,if(RowNumber > 19, MA20, NULL) AS MA20
       ,if(RowNumber > 49, MA50, NULL) AS MA50       
FROM   CTE_bajaj_auto
ORDER BY Date)) as T1 ;


# Same was followed for other Stocks...
## eicher2 load

Insert into 
       eicher2
		   (`Date`
           ,`Close Price`
           ,`20 Day MA`
           ,`50 Day MA`
           )
           
		      Select `Date`
			         ,`Close Price`
               ,`MA20`
               ,`MA50`
                
           from
           ((WITH CTE_eicher_motors (Date, `Close Price`, Rownumber, MA20, MA50)
AS
(
SELECT Date,
       `Close Price`,
       ROW_NUMBER() OVER (ORDER BY Date ASC) AS RowNumber,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 19 PRECEDING) AS MA20,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 49 PRECEDING) AS MA50
       FROM   eicher_motors
)
select  Date
       ,`Close Price`
#       , RowNumber
       ,if(RowNumber > 19, MA20, NULL) AS MA20
       ,if(RowNumber > 49, MA50, NULL) AS MA50       
FROM   CTE_eicher_motors
ORDER BY Date)) as T1 ;

##hero2 Load

Insert into 
       hero2
		   (`Date`
           ,`Close Price`
           ,`20 Day MA`
           ,`50 Day MA`
           )
           
		      Select `Date`
			         ,`Close Price`
               ,`MA20`
               ,`MA50`
                
           from
           ((WITH CTE_hero_motocorp (Date, `Close Price`, Rownumber, MA20, MA50)
AS
(
SELECT Date,
       `Close Price`,
       ROW_NUMBER() OVER (ORDER BY Date ASC) AS RowNumber,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 19 PRECEDING) AS MA20,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 49 PRECEDING) AS MA50
       FROM   hero_motocorp
)
select  Date
       ,`Close Price`
#       , RowNumber
       ,if(RowNumber > 19, MA20, NULL) AS MA20
       ,if(RowNumber > 49, MA50, NULL) AS MA50       
FROM   CTE_hero_motocorp
ORDER BY Date)) as T1 ;

##infosys2 LOAD

Insert into 
       infosys2
		   (`Date`
           ,`Close Price`
           ,`20 Day MA`
           ,`50 Day MA`
           )
           
		      Select `Date`
			         ,`Close Price`
               ,`MA20`
               ,`MA50`
                
           from
           ((WITH CTE_infosys (Date, `Close Price`, Rownumber, MA20, MA50)
AS
(
SELECT Date,
       `Close Price`,
       ROW_NUMBER() OVER (ORDER BY Date ASC) AS RowNumber,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 19 PRECEDING) AS MA20,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 49 PRECEDING) AS MA50
       FROM   infosys
)
select  Date
       ,`Close Price`
#       , RowNumber
       ,if(RowNumber > 19, MA20, NULL) AS MA20
       ,if(RowNumber > 49, MA50, NULL) AS MA50       
FROM   CTE_infosys
ORDER BY Date)) as T1 ;

#tcs2 load

Insert into 
       tcs2
		   (`Date`
           ,`Close Price`
           ,`20 Day MA`
           ,`50 Day MA`
           )
           
		      Select `Date`
			         ,`Close Price`
               ,`MA20`
               ,`MA50`
                
           from
           ((WITH CTE_tcs (Date, `Close Price`, Rownumber, MA20, MA50)
AS
(
SELECT Date,
       `Close Price`,
       ROW_NUMBER() OVER (ORDER BY Date ASC) AS RowNumber,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 19 PRECEDING) AS MA20,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 49 PRECEDING) AS MA50
       FROM   tcs
)
select  Date
       ,`Close Price`
#       , RowNumber
       ,if(RowNumber > 19, MA20, NULL) AS MA20
       ,if(RowNumber > 49, MA50, NULL) AS MA50       
FROM   CTE_tcs
ORDER BY Date)) as T1 ;

#tvs2 load

Insert into 
       tvs2
		   (`Date`
           ,`Close Price`
           ,`20 Day MA`
           ,`50 Day MA`
           )
           
		      Select `Date`
			         ,`Close Price`
               ,`MA20`
               ,`MA50`
                
           from
           ((WITH CTE_tvs (Date, `Close Price`, Rownumber, MA20, MA50)
AS
(
SELECT Date,
       `Close Price`,
       ROW_NUMBER() OVER (ORDER BY Date ASC) AS RowNumber,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 19 PRECEDING) AS MA20,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 49 PRECEDING) AS MA50
       FROM   tvs
)
select  Date
       ,`Close Price`
#       , RowNumber
       ,if(RowNumber > 19, MA20, NULL) AS MA20
       ,if(RowNumber > 49, MA50, NULL) AS MA50       
FROM   CTE_tvs
ORDER BY Date)) as T1 ;

# Now we have all the 6 stocks loaded as expected in #1 Results Expected....
## The Data loaded using both the approaches matched

# 2 ----Create a master table containing the date and close price of all the six stocks. 
#(Column header for the price is the name of the stock)

CREATE TABLE `Master Stock` (
        `Date` DATE NOT NULL,
         Bajaj DECIMAL(10, 2) NOT NULL,
         TCS   DECIMAL(10, 2) NOT NULL,
         TVS   DECIMAL(10, 2) NOT NULL,
         Infosys DECIMAL(10, 2) NOT NULL,
         Eicher  DECIMAL(10, 2) NOT NULL,
         Hero DECIMAL(10, 2) NOT NULL
         );
         
# To load the Master Stock table, the following query was used....

Insert into `Master Stock`
     (Date,
     Bajaj,
      TVS,
	   TCS,
       Infosys,
       Eicher,
       Hero)
          
       Select A.Date,
			   A.`Close Price`,
                B.`Close Price`,
                C.`Close Price`,
                D.`Close Price`,
                E.`Close Price`,
                F.`Close Price`
              
               FROM bajaj1 A
				LEFT JOIN (tvs1 B, tcs1 C, infosys1 D, eicher1 E, hero1 F)
				on (A.`Date` = B.`Date`
               AND  
                   B.`Date` = C.`Date`
               AND 
                   C.`Date` = D.`Date`
               AND 
                D.`Date` = E.`Date`
               AND 
				E.`Date` = F.`Date`)
               ;
               
select * from `Master Stock`;               

select count(*) from `Master Stock`;

# All 889 rows were loaded correcttly into the Master Table `Master Stock`

#3. Use the table created in Part(1) to generate buy and sell signal. Store this in another table named 'bajaj2'.
# Perform this operation for all stocks.

#Create table bajaj2 that stores with Stock Buy/Sell/Hold Signal
CREATE TABLE bajaj2 (
        `Date` DATE NOT NULL,
		`Close Price` DECIMAL(10, 2) NOT NULL,
        `Signal` Char(5) 
        );
        

# The below query was first tried and analyzed the results to confirm if trigger to Buy/Sell/Hold Bajaj table was
# generated correctly...

WITH CTE_bajaj1 (Date, `Close Price`, RowNumber, MA20, MA50, LAGMA20, LAGMA50)
AS
(
SELECT Date,
       `Close Price`,
       ROW_NUMBER() OVER (ORDER BY Date ASC) AS RowNumber,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 19 PRECEDING) AS MA20,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 49 PRECEDING) AS MA50,
       lag(`20 Day MA`,1,0) over w as LAG20MA, 
       lag(`50 Day MA`,1,0) over w as LAG50MA
	FROM   bajaj1
    window w as (order by Date)
)
select  Date
       ,`Close Price`
       , RowNumber
       ,if(RowNumber > 19, MA20, NULL) AS MA20
       ,if(RowNumber > 49, MA50, NULL) AS MA50
       ,LAGMA20
       ,LAGMA50
       ,(CASE
          WHEN (RowNumber > 50 AND MA20 > MA50 AND LAGMA20 < LAGMA50) THEN 'BUY'
          WHEN (RowNumber > 50 AND MA20 < MA50 AND LAGMA20 > LAGMA50) THEN 'SELL'
          ELSE 'HOLD'
       END) as 'Signal'
FROM   CTE_bajaj1
ORDER BY Date;

# After evaluation and confirmation, the following INSERT query was used to load bajaj2 table....alter

Insert into 
       bajaj2
           (`Date`
           ,`Close Price`
           ,`Signal`
           )
           Select `Date`
                  ,`Close Price`
                  ,`Signal`
                  
                  from 
              ((WITH CTE_bajaj1 (Date, `Close Price`, RowNumber, MA20, MA50, LAGMA20, LAGMA50)
AS
(
SELECT Date,
       `Close Price`,
       ROW_NUMBER() OVER (ORDER BY Date ASC) AS RowNumber,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 19 PRECEDING) AS MA20,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 49 PRECEDING) AS MA50,
       lag(`20 Day MA`,2,0) over w as LAG20MA, 
       lag(`50 Day MA`,2,0) over w as LAG50MA
	FROM   bajaj1
    window w as (order by Date)
)
select  Date
       ,`Close Price`
# #      , RowNumber
#       ,if(RowNumber > 19, MA20, NULL) AS MA20
#       ,if(RowNumber > 49, MA50, NULL) AS MA50
#       ,LAGMA20
#       ,LAGMA50
       ,(CASE
          WHEN (RowNumber > 50 AND MA20 > MA50 AND LAGMA20 < LAGMA50) THEN 'BUY'
          WHEN (RowNumber > 50 AND MA20 < MA50 AND LAGMA20 > LAGMA50) THEN 'SELL'
          ELSE 'HOLD'
       END) as 'Signal'
FROM   CTE_bajaj1
ORDER BY Date) ) AS T1;

Select count(*) from bajaj2 where `Signal` = 'BUY';
Select count(*) from bajaj2 where `Signal` = 'SELL';

# Some Market analysts suggest a 2-3 Lag window along with the Gold and Death Cross rule...
# The following were the results for bajaj stock...
## with Gold/Death Cross rule + 3 day LAG RULE on MA  -----> 35 - BUY , 34 - SELL 
# with Gold/Death Cross rule + 2 day LAG RULE on MA-----> 24 - BUY,  23 - SELL 
# with Gold/Death Cross rule + 1 day LAG RULE on MA -----> 12 - BUY , 11 - SELL

# Have finalized with 1 Day LAG i.e. Current Day + Previous Day and Cross Over Gold/Death Cross rule and used it
# for all the stocks....

# Same process was followed for all the Stocks
#Create table eicher2 that stores with Stock Buy/Sell/Hold Signal
CREATE TABLE eicher2 (
        `Date` DATE NOT NULL,
		`Close Price` DECIMAL(10, 2) NOT NULL,
        `Signal` Char(5) 
        );

Insert into 
       eicher2
           (`Date`
           ,`Close Price`
           ,`Signal`
           )
           Select `Date`
                  ,`Close Price`
                  ,`Signal`
                  
                  from 
              ((WITH CTE_eicher1 (Date, `Close Price`, RowNumber, MA20, MA50, LAGMA20, LAGMA50)
AS
(
SELECT Date,
       `Close Price`,
       ROW_NUMBER() OVER (ORDER BY Date ASC) AS RowNumber,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 19 PRECEDING) AS MA20,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 49 PRECEDING) AS MA50,
       lag(`20 Day MA`,1,0) over w as LAG20MA, 
       lag(`50 Day MA`,1,0) over w as LAG50MA
	FROM   eicher1
    window w as (order by Date)
)
select  Date
       ,`Close Price`
# #      , RowNumber
#       ,if(RowNumber > 19, MA20, NULL) AS MA20
#       ,if(RowNumber > 49, MA50, NULL) AS MA50
#       ,LAGMA20
#       ,LAGMA50
       ,(CASE
          WHEN (RowNumber > 50 AND MA20 > MA50 AND LAGMA20 < LAGMA50) THEN 'BUY'
          WHEN (RowNumber > 50 AND MA20 < MA50 AND LAGMA20 > LAGMA50) THEN 'SELL'
          ELSE 'HOLD'
       END) as 'Signal'
FROM   CTE_eicher1
ORDER BY Date) ) AS T1;

Select count(*) from eicher2 where `Signal` = 'BUY';
Select count(*) from eicher2 where `Signal` = 'SELL';

# Eicher  -  6 - BUY , 7 - SELL

#Create table hero2 that stores with Stock Buy/Sell Signal
CREATE TABLE hero2 (
        `Date` DATE NOT NULL,
		`Close Price` DECIMAL(10, 2) NOT NULL,
        `Signal` Char(5) 
        );
        
Insert into 
       hero2
           (`Date`
           ,`Close Price`
           ,`Signal`
           )
           Select `Date`
                  ,`Close Price`
                  ,`Signal`
                  
                  from 
              ((WITH CTE_hero1 (Date, `Close Price`, RowNumber, MA20, MA50, LAGMA20, LAGMA50)
AS
(
SELECT Date,
       `Close Price`,
       ROW_NUMBER() OVER (ORDER BY Date ASC) AS RowNumber,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 19 PRECEDING) AS MA20,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 49 PRECEDING) AS MA50,
       lag(`20 Day MA`,1,0) over w as LAG20MA, 
       lag(`50 Day MA`,1,0) over w as LAG50MA
	FROM   hero1
    window w as (order by Date)
)
select  Date
       ,`Close Price`
# #      , RowNumber
#       ,if(RowNumber > 19, MA20, NULL) AS MA20
#       ,if(RowNumber > 49, MA50, NULL) AS MA50
#       ,LAGMA20
#       ,LAGMA50
       ,(CASE
          WHEN (RowNumber > 50 AND MA20 > MA50 AND LAGMA20 < LAGMA50) THEN 'BUY'
          WHEN (RowNumber > 50 AND MA20 < MA50 AND LAGMA20 > LAGMA50) THEN 'SELL'
          ELSE 'HOLD'
       END) as 'Signal'
FROM   CTE_hero1
ORDER BY Date) ) AS T1;

Select count(*) from hero2 where `Signal` = 'BUY';
Select count(*) from hero2 where `Signal` = 'SELL';

# Hero - BUY - 9, SELL - 9

#Create table infosys2 that stores with Stock Buy/Sell Signal
CREATE TABLE infosys2 (
        `Date` DATE NOT NULL,
		`Close Price` DECIMAL(10, 2) NOT NULL,
        `Signal` Char(5) 
        );
        

Insert into 
       infosys2
           (`Date`
           ,`Close Price`
           ,`Signal`
           )
           Select `Date`
                  ,`Close Price`
                  ,`Signal`
                  
                  from 
              ((WITH CTE_infosys1 (Date, `Close Price`, RowNumber, MA20, MA50, LAGMA20, LAGMA50)
AS
(
SELECT Date,
       `Close Price`,
       ROW_NUMBER() OVER (ORDER BY Date ASC) AS RowNumber,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 19 PRECEDING) AS MA20,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 49 PRECEDING) AS MA50,
       lag(`20 Day MA`,1,0) over w as LAG20MA, 
       lag(`50 Day MA`,1,0) over w as LAG50MA
	FROM   infosys1
    window w as (order by Date)
)
select  Date
       ,`Close Price`
# #      , RowNumber
#       ,if(RowNumber > 19, MA20, NULL) AS MA20
#       ,if(RowNumber > 49, MA50, NULL) AS MA50
#       ,LAGMA20
#       ,LAGMA50
       ,(CASE
          WHEN (RowNumber > 50 AND MA20 > MA50 AND LAGMA20 < LAGMA50) THEN 'BUY'
          WHEN (RowNumber > 50 AND MA20 < MA50 AND LAGMA20 > LAGMA50) THEN 'SELL'
          ELSE 'HOLD'
       END) as 'Signal'
FROM   CTE_infosys1
ORDER BY Date) ) AS T1;

Select count(*) from infosys2 where `Signal` = 'BUY';
Select count(*) from infosys2 where `Signal` = 'SELL';

# Infosys - BUY -9, SELL -9

#Create table tcs2 that stores with Stock Buy/Sell Signal
CREATE TABLE tcs2 (
        `Date` DATE NOT NULL,
		`Close Price` DECIMAL(10, 2) NOT NULL,
        `Signal` Char(5) 
        );
        

Insert into 
       tcs2
           (`Date`
           ,`Close Price`
           ,`Signal`
           )
           Select `Date`
                  ,`Close Price`
                  ,`Signal`
                  
                  from 
              ((WITH CTE_tcs1 (Date, `Close Price`, RowNumber, MA20, MA50, LAGMA20, LAGMA50)
AS
(
SELECT Date,
       `Close Price`,
       ROW_NUMBER() OVER (ORDER BY Date ASC) AS RowNumber,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 19 PRECEDING) AS MA20,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 49 PRECEDING) AS MA50,
       lag(`20 Day MA`,1,0) over w as LAG20MA, 
       lag(`50 Day MA`,1,0) over w as LAG50MA
	FROM   tcs1
    window w as (order by Date)
)
select  Date
       ,`Close Price`
# #      , RowNumber
#       ,if(RowNumber > 19, MA20, NULL) AS MA20
#       ,if(RowNumber > 49, MA50, NULL) AS MA50
#       ,LAGMA20
#       ,LAGMA50
       ,(CASE
          WHEN (RowNumber > 50 AND MA20 > MA50 AND LAGMA20 < LAGMA50) THEN 'BUY'
          WHEN (RowNumber > 50 AND MA20 < MA50 AND LAGMA20 > LAGMA50) THEN 'SELL'
          ELSE 'HOLD'
       END) as 'Signal'
FROM   CTE_tcs1
ORDER BY Date) ) AS T1;

Select count(*) from tcs2 where `Signal` = 'BUY';
Select count(*) from tcs2 where `Signal` = 'SELL';

# TCS - BUY -12, SELL - 13

#Create table tvs2 that stores with Stock Buy/Sell Signal
CREATE TABLE tvs2 (
        `Date` DATE NOT NULL,
		`Close Price` DECIMAL(10, 2) NOT NULL,
        `Signal` Char(5) 
        );
        

Insert into 
       tvs2
           (`Date`
           ,`Close Price`
           ,`Signal`
           )
           Select `Date`
                  ,`Close Price`
                  ,`Signal`
                  
                  from 
              ((WITH CTE_tvs1 (Date, `Close Price`, RowNumber, MA20, MA50, LAGMA20, LAGMA50)
AS
(
SELECT Date,
       `Close Price`,
       ROW_NUMBER() OVER (ORDER BY Date ASC) AS RowNumber,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 19 PRECEDING) AS MA20,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 49 PRECEDING) AS MA50,
       lag(`20 Day MA`,1,0) over w as LAG20MA, 
       lag(`50 Day MA`,1,0) over w as LAG50MA
	FROM   tvs1
    window w as (order by Date)
)
select  Date
       ,`Close Price`
# #      , RowNumber
#       ,if(RowNumber > 19, MA20, NULL) AS MA20
#       ,if(RowNumber > 49, MA50, NULL) AS MA50
#       ,LAGMA20
#       ,LAGMA50
       ,(CASE
          WHEN (RowNumber > 50 AND MA20 > MA50 AND LAGMA20 < LAGMA50) THEN 'BUY'
          WHEN (RowNumber > 50 AND MA20 < MA50 AND LAGMA20 > LAGMA50) THEN 'SELL'
          ELSE 'HOLD'
       END) as 'Signal'
FROM   CTE_tvs1
ORDER BY Date) ) AS T1;

Select count(*) from tvs2 where `Signal` = 'BUY';
Select count(*) from tvs2 where `Signal` = 'SELL';

# TVS - BUY - 8, SELL -8 

#4. Create a User defined function, that takes the date as input and returns the signal for that particular day 
#(Buy/Sell/Hold) for the Bajaj stock.


# fUNCTION stock is created to return signal for Bajaj stock for a particular date 
DELIMITER $$
create function stock(stock_date DATE)
     returns Char(5)
       deterministic
begin
    declare day_signal char(5);
	Select `Signal` 
    into day_signal
	from bajaj2
	where `Date` = stock_date;
	return day_signal;
end $$

Select assignment.stock('2015-05-07') as `Bajaj Signal`;




