DROP TABLE [dbo].[GDELT_DAILYUPDATES_ENHANCED];

SELECT
    data.*,
    a1Country.Label as Actor1Country,
    a2Country.Label as Actor2Country,
    a1KnownGroups.Label as Actor1KnownGroup,
    a2KnownGroups.Label as Actor2KnownGroup,
    a1Ethnic.Label as Actor1Ethnic,
    a2Ethnic.Label as Actor2Ethnic,
    a1Religion.Label as Actor1Religion1,
    a2Religion.Label as Actor2Religion1,
    a1Type.Label as Actor1Type1,
    a2Type.Label as Actor2Type1,
    eventCodes.Label as [Event]
INTO [dbo].[GDELT_DAILYUPDATES_ENHANCED]
FROM [dbo].[GDELT_DAILYUPDATES] data
LEFT JOIN [dbo].[LOOKUP_COUNTRY] a1Country on data.Actor1CountryCode = a1Country.Code
LEFT JOIN [dbo].[LOOKUP_COUNTRY] a2Country on data.Actor2CountryCode = a2Country.Code
LEFT JOIN [dbo].[LOOKUP_KNOWN_GROUPS] a1KnownGroups on data.Actor1KnownGroupCode = a1KnownGroups.Code
LEFT JOIN [dbo].[LOOKUP_KNOWN_GROUPS] a2KnownGroups on data.Actor2KnownGroupCode = a2KnownGroups.Code
LEFT JOIN [dbo].[LOOKUP_ETHNIC] a1Ethnic on data.Actor1EthnicCode = a1Ethnic.Code
LEFT JOIN [dbo].[LOOKUP_ETHNIC] a2Ethnic on data.Actor2EthnicCode = a2Ethnic.Code
LEFT JOIN [dbo].[LOOKUP_RELIGION] a1Religion on data.Actor1Religion1Code = a1Religion.Code
LEFT JOIN [dbo].[LOOKUP_RELIGION] a2Religion on data.Actor2Religion1Code = a2Religion.Code
LEFT JOIN [dbo].[LOOKUP_TYPE] a1Type on data.Actor1Type1Code = a1Type.Code
LEFT JOIN [dbo].[LOOKUP_TYPE] a2Type on data.Actor2Type1Code = a2Type.Code
LEFT JOIN [dbo].[LOOKUP_EVENT_CODES] eventCodes on data.EventCode = eventCodes.Code;
