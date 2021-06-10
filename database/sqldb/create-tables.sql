IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GDELT_DAILYUPDATES]') AND type in (N'U'))
DROP TABLE [dbo].[GDELT_DAILYUPDATES]
GO

CREATE TABLE GDELT_DAILYUPDATES (
 GLOBALEVENTID int , 
 SQLDATE int , 
 MonthYear varchar(6) , 
 Year varchar(4) , 
 FractionDate NUMERIC , 
 Actor1Code varchar(3) , 
 Actor1Name varchar(255) , 
 Actor1CountryCode varchar(3) , 
 Actor1KnownGroupCode varchar(3) , 
 Actor1EthnicCode varchar(3) , 
 Actor1Religion1Code varchar(3) , 
 Actor1Religion2Code varchar(3) , 
 Actor1Type1Code varchar(3) , 
 Actor1Type2Code varchar(3) , 
 Actor1Type3Code varchar(3) , 
 Actor2Code varchar(3) , 
 Actor2Name varchar(255) , 
 Actor2CountryCode varchar(3) , 
 Actor2KnownGroupCode varchar(3) , 
 Actor2EthnicCode varchar(3) , 
 Actor2Religion1Code varchar(3) , 
 Actor2Religion2Code varchar(3) , 
 Actor2Type1Code varchar(3) , 
 Actor2Type2Code varchar(3) , 
 Actor2Type3Code varchar(3) , 
 IsRootEvent int , 
 EventCode varchar(4) , 
 EventBaseCode varchar(4) , 
 EventRootCode varchar(4) , 
 QuadClass int , 
 GoldsteinScale NUMERIC , 
 NumMentions int , 
 NumSources int , 
 NumArticles int , 
 AvgTone NUMERIC , 
 Actor1Geo_Type int , 
 Actor1Geo_FullName varchar(255) , 
 Actor1Geo_CountryCode varchar(2) , 
 Actor1Geo_ADM1Code varchar(4) , 
 Actor1Geo_Lat float , 
 Actor1Geo_Long float , 
 Actor1Geo_FeatureID varchar(10) , 
 Actor2Geo_Type int , 
 Actor2Geo_FullName varchar(255) , 
 Actor2Geo_CountryCode varchar(2) , 
 Actor2Geo_ADM1Code varchar(4) , 
 Actor2Geo_Lat float , 
 Actor2Geo_Long float , 
 Actor2Geo_FeatureID int , 
 ActionGeo_Type int , 
 ActionGeo_FullName varchar(255) , 
 ActionGeo_CountryCode varchar(2) , 
 ActionGeo_ADM1Code varchar(4) , 
 ActionGeo_Lat float , 
 ActionGeo_Long float , 
 ActionGeo_FeatureID varchar(10) , 
 DATEADDED varchar(255) ,
 SOURCEURL varchar(255)
);