<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:ns2="http://xmlns.oracle.com/pcbpel/adapter/db/sp/getSFLogEvents" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable" xmlns:ns3="http://insecg-salesforce/sflogeventsobjects" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions" xmlns:ns0="http://SFLogQueryStrings" xmlns:ns5="http://paramsvar" xmlns:plt="http://schemas.xmlsoap.org/ws/2003/05/partner-link/" xmlns:ns4="urn:enterprise.soap.sforce.com" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:tns="http://xmlns.oracle.com/pcbpel/adapter/db/SalesforceProject/ProcessSFLogEvents/pollSourceObj" xmlns:top="http://xmlns.oracle.com/pcbpel/adapter/db/top/pollSourceObj" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:med="http://schemas.oracle.com/mediator/xpath" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:secure="http://www.oracle.com/XSL/Transform/java/com.Securedata" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:bpmn="http://schemas.oracle.com/bpm/xpath" xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap" exclude-result-prefixes="xsi xsl ns2 ns3 ns0 ns5 plt ns4 wsdl tns top xsd xp20 bpws bpel bpm ora socket mhdr oraext dvm hwf med ids xdk xref bpmn ldap">
   <xsl:template match="/">
      <ns0:QueryString>
         <ns0:UserQuery>
            <xsl:text disable-output-escaping="no">Alias,Username,UserType,AccountId,ContactId,City,CommunityNickname,Country,CountryCode,CreatedById,CreatedDate,DefaultCurrencyIsoCode,Email,EmployeeNumber,FirstName,Geo__c,Id,IsActive,LastModifiedById,LastModifiedDate,LastName,Legacy_Id__c,ManagerId,Middle_Name__c,MobilePhone,Phone,PostalCode,ProfileId,State,Street,Terminated_Date__c,TimeZoneSidKey,Title</xsl:text>
         </ns0:UserQuery>
         <ns0:AccountQuery>
            <xsl:text disable-output-escaping="no">AccountSource,Account_Currency__c,Account_DUNS__c,Account_Hierarchy__c,Account_Segment__c,Account_UCN__c,Alias__c,AnnualRevenue,BillingAddress,BillingCity,BillingCountry,BillingLatitude,BillingLongitude,BillingPostalCode,BillingCountryCode,BillingState,BillingStreet,Confidential__c,CreatedById,CreatedDate,CurrencyIsoCode,Customer_Account_Group__c,Customer_Status__c,Description,Diversity_Option__c,Domestic_Ultimate_DUNS__c,Fax,Global_Parent__c,Global_Total_AV_Account_Nodes__c,Global_UCN__c,Global_Ultimate_DUNS__c,Id,Industry,IsDeleted,IsPartner,Jigsaw,JigsawCompanyId,Language__c,LastActivityDate,LastModifiedById,LastModifiedDate,LastReferencedDate,LastViewedDate,LDR_Call_Flag__c,Legacy_Id__c,Local_Name__c,MasterRecordId,Name,Named_Non_Named_Partner__c,NumberOfEmployees,OwnerId,ParentId,Parent_DUNS__c,Parent_UCN__c,Partnership_Status__c,Partner_Type__c,Phone,PhotoUrl,Price_Band_Agreement__c,Publicly_Traded_Company__c,RecordTypeId,Geo__c,Resell_Level__c,Rewards_Approval__c,SAP_Customer_Number__c,ShippingAddress,ShippingCity,ShippingCountry,ShippingLatitude,ShippingLongitude,ShippingPostalCode,ShippingState,ShippingStreet,SicDesc,SIC_Override__c,Source_System__c,Subregion__c,SystemModstamp,Tax_ID_Number__c,Total_AV_Account_Nodes__c,Total_Global_Employee__c,Total_Site_Employee__c,Type,Vertical_Market_Focus__c,Website,Year_Established__c</xsl:text>
         </ns0:AccountQuery>
         <ns0:ContactQuery>
            <xsl:text disable-output-escaping="no">Id,Name,ContactId,CloseDate,StageName</xsl:text>
         </ns0:ContactQuery>
         <ns0:OpportunityQuery>
            <xsl:text disable-output-escaping="no">AccountId,Account_Record_Type__c,Account_Segment__c,Account_Type__c,All_partners__c,Amount,Booked_Amount__c,Bookings_Expected_Date__c,Budget__c,CampaignId,Channel__c,CloseDate,Compelling_Event__c,Competitive_Advantage__c,Competitive_Disadvantage__c,Competitor__c,CreatedById,CreatedDate,Critical_Success_Factors__c,CurrencyIsoCode,Customer_Business_Need__c,Customer_Pain_Points__c,Customer_Project_Name__c,Delete_Status__c,Describe_Win_Close_Strategy__c,Description,ExpectedRevenue,Fiscal,FiscalQuarter,FiscalYear,ForecastCategory,ForecastCategoryName,HasOpportunityLineItem,Id,IsClosed,IsDeleted,IsExcludedFromTerritory2Filter,IsSplit,IsWon,LastActivityDate,LastModifiedById,LastModifiedDate,LastReferencedDate,LastViewedDate,LeadSource,Legacy_Id__c,Legacy_Owner_Id__c,Length_of_Terms__c,Manager_Comment__c,Name,NextStep,OwnerId,POC__c,Pre_Bookings_Amount__c,Pricebook2Id,Probability,Product_Amount_USD__c,Prof_Serv_Customer_Training_Included__c,Promotion__c,QuoteInSync__c,Reason_for_Change_in_Close_Date_del__c,Reason_for_Change_in_Deal_Size_del__c,RecordTypeId,Red_Flags__c,Related_Opportunity__c,RFP__c,Route_to_Market__c,Royalty__c,Sales_Comment__c,SOW__c,StageName,SyncedQuoteId,Sync_Status__c,SystemModstamp,Territory2Id,Total_Amount__c,Type,Type__c,Upfront_Amount__c,Upside_Amount__c,Won_Lost_Reason__c</xsl:text>
         </ns0:OpportunityQuery>
         <ns0:CampaignQuery>
            <xsl:text disable-output-escaping="no">Id,Name,ContactId,CloseDate,StageName</xsl:text>
         </ns0:CampaignQuery>
         <ns0:CampaignMemeberQuery>
            <xsl:text disable-output-escaping="no">Id,Name,ContactId,CloseDate,StageName</xsl:text>
         </ns0:CampaignMemeberQuery>
         <ns0:UserInsertQuery>
            <xsl:text disable-output-escaping="no">Id,Name,ContactId,CloseDate,StageName</xsl:text>
         </ns0:UserInsertQuery>
         <ns0:UserUpdateQuery>
            <xsl:text disable-output-escaping="no">Id,Name,ContactId,CloseDate,StageName</xsl:text>
         </ns0:UserUpdateQuery>
         <ns0:UserDeleteQuery>
            <xsl:text disable-output-escaping="no">Id,Name,ContactId,CloseDate,StageName</xsl:text>
         </ns0:UserDeleteQuery>
      </ns0:QueryString>
   </xsl:template>
</xsl:stylesheet>
