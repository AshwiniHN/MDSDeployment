<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions" xmlns:plnk="http://schemas.xmlsoap.org/ws/2003/05/partner-link/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:tns="urn:enterprise.soap.sforce.com" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:ns3="http://SalesforceIntegration/User_SblId" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:med="http://schemas.oracle.com/mediator/xpath" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:fns="urn:fault.enterprise.soap.sforce.com" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:ns2="http://schemas.oracle.com/bpel/extension" xmlns:client="http://xmlns.oracle.com/User/SiebelToSFUserIntegration/UpdateUserSFProvABCSImpl" xmlns:ns1="http://www.siebel.com/xml/ISG%20SF%20Employee%20IO" xmlns:ens="urn:sobject.enterprise.soap.sforce.com" xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap" exclude-result-prefixes="xsi xsl plnk wsdl ns3 xsd ns2 client ns1 soap tns fns ens xp20 bpws bpel bpm ora socket mhdr oraext dvm hwf med ids xdk xref ldap">
<xsl:param name="Var_SBL_SystemId"/>
<xsl:template match="/">
<tns:create>
<tns:sObjects>
<xsl:attribute name="xsi:type">
<xsl:text disable-output-escaping="no">ens:User</xsl:text>
</xsl:attribute>
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:FirstName and /ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:LastName">
<ens:Alias>
<xsl:value-of select="substring(concat(substring(/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:FirstName,1,1),/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:LastName),1,8)"/>
</ens:Alias>
</xsl:if>
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:EMailAddr">
<ens:Username>
<xsl:value-of select="concat(/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:EMailAddr,$Var_SBL_SystemId/ns3:ids/ns3:UsernameSuffix)"/>
</ens:Username>
</xsl:if>
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:FirstName and /ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:LastName">
<ens:CommunityNickname>
<xsl:value-of select="concat(/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:FirstName,'_',/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:LastName)"/>
</ens:CommunityNickname>
</xsl:if>
<ens:EmailEncodingKey>
<xsl:value-of select="$Var_SBL_SystemId/ns3:ids/ns3:EmailEncodingKey"/>
</ens:EmailEncodingKey>
<ens:ProfileId>
<xsl:value-of select="$Var_SBL_SystemId/ns3:ids/ns3:ProfileId"/>
</ens:ProfileId>
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:CurrencyCode">
<ens:DefaultCurrencyIsoCode>
<xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/CurrencyCodesDVMSiebelToSF.dvm','Siebel',/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:CurrencyCode,'SalesForce','NoCode')"/>
</ens:DefaultCurrencyIsoCode>
</xsl:if>
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:EMailAddr">
<ens:Email>
<xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:EMailAddr"/>
</ens:Email>
</xsl:if>
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:HRMId">
<xsl:choose>
<xsl:when test="string-length(/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:HRMId) > 20">
<ens:EmployeeNumber>
<xsl:value-of select="substring(/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:HRMId,1,20)"/>
</ens:EmployeeNumber>
</xsl:when>
<xsl:otherwise>
<ens:EmployeeNumber>
<xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:HRMId"/>
</ens:EmployeeNumber>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:Fax">
<ens:Fax>
<xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:Fax"/>
</ens:Fax>
</xsl:if>
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:FirstName">
<xsl:choose>
<xsl:when test="string-length(/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:FirstName) > 40">
<ens:FirstName>
<xsl:value-of select="substring(/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:FirstName,1,40)"/>
</ens:FirstName>
</xsl:when>
<xsl:otherwise>
<ens:FirstName>
<xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:FirstName"/>
</ens:FirstName>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
<!--<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:Geo">
<ens:Geo__c>
<xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:Geo"/>
</ens:Geo__c>
</xsl:if>-->
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:ISGSFActiveFlag">
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:ISGSFActiveFlag='Y'">
<ens:IsActive>
<xsl:text disable-output-escaping="no">1</xsl:text>
</ens:IsActive>
</xsl:if>
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:ISGSFActiveFlag='N'">
<ens:IsActive>
<xsl:text disable-output-escaping="no">0</xsl:text>
</ens:IsActive>
</xsl:if>
</xsl:if>
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:LastName">
<ens:LastName>
<xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:LastName"/>
</ens:LastName>
</xsl:if>
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:Id">
<ens:Legacy_Id__c>
<xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:Id"/>
</ens:Legacy_Id__c>
</xsl:if>
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:PrimaryPositionId">
<ens:Legacy_Primary_Position_ID__c>
<xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:PrimaryPositionId"/>
</ens:Legacy_Primary_Position_ID__c>
</xsl:if>
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:PrimaryPosition">
<ens:Legacy_Primary_Position__c>
<xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:PrimaryPosition"/>
</ens:Legacy_Primary_Position__c>
</xsl:if>
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:LoginName">
<xsl:choose>
<xsl:when test="string-length(/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:LoginName) > 30">
<ens:Legacy_User_Id__c>
<xsl:value-of select="substring(/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:LoginName,1,30)"/>
</ens:Legacy_User_Id__c>
</xsl:when>
<xsl:otherwise>
<ens:Legacy_User_Id__c>
<xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:LoginName"/>
</ens:Legacy_User_Id__c>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:MiddleName">
<ens:Middle_Name__c>
<xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:MiddleName"/>
</ens:Middle_Name__c>
</xsl:if>
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:CellPhone">
<ens:MobilePhone>
<xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:CellPhone"/>
</ens:MobilePhone>
</xsl:if>
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:Phone">
<ens:Phone>
<xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:Phone"/>
</ens:Phone>
</xsl:if>
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:TimeZoneName">
<ens:TimeZoneSidKey>
<xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/TimeZoneCodeDVMSiebelToSF.dvm','Siebel',/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:TimeZoneName,'SalesForce','Pacific Daylight Time (America/Tijuana)')"/>
</ens:TimeZoneSidKey>
</xsl:if>
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:JobTitle">
<ens:Title>
<xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:JobTitle"/>
</ens:Title>
</xsl:if>
<xsl:if test="$Var_SBL_SystemId/ns3:ids/ns3:ManagerId and $Var_SBL_SystemId/ns3:ids/ns3:ManagerId != ''">
<ens:ManagerId>
<xsl:value-of select="$Var_SBL_SystemId/ns3:ids/ns3:ManagerId"/>
</ens:ManagerId>
</xsl:if>
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:SFId">
<ens:Id>
<xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:SFId"/>
</ens:Id>
</xsl:if>
<!--<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:SubRegion">
<ens:Region__c>
<xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:SubRegion"/>
</ens:Region__c>
</xsl:if>-->
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:PreferredLanguageCode">
<ens:LanguageLocaleKey>
<xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/LanguageCodesDVMSiebelToSF.dvm','Siebel',/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:PreferredLanguageCode,'Salesforce','No Code')"/>
</ens:LanguageLocaleKey>
</xsl:if>
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:PreferredLanguageCode">
<ens:LocaleSidKey>
<xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/LanguageCodesDVMSiebelToSF.dvm','Siebel',/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:PreferredLanguageCode,'Salesforce','No Code')"/>
</ens:LocaleSidKey>
</xsl:if>
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:ListOfEmployee_PersonalAddress/ns1:Employee_PersonalAddress/ns1:PersonalCity">
<xsl:choose>
<xsl:when test="string-length(/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:ListOfEmployee_PersonalAddress/ns1:Employee_PersonalAddress/ns1:PersonalCity) > 40">
<ens:City>
<xsl:value-of select="substring(/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:ListOfEmployee_PersonalAddress/ns1:Employee_PersonalAddress/ns1:PersonalCity,1,40)"/>
</ens:City>
</xsl:when>
<xsl:otherwise>
<ens:City>
<xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:ListOfEmployee_PersonalAddress/ns1:Employee_PersonalAddress/ns1:PersonalCity"/>
</ens:City>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:ListOfEmployee_PersonalAddress/ns1:Employee_PersonalAddress/ns1:PersonalPostalCode">
<xsl:choose>
<xsl:when test="string-length(/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:ListOfEmployee_PersonalAddress/ns1:Employee_PersonalAddress/ns1:PersonalPostalCode) > 20">
<ens:PostalCode>
<xsl:value-of select="substring(/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:ListOfEmployee_PersonalAddress/ns1:Employee_PersonalAddress/ns1:PersonalPostalCode,1,20)"/>
</ens:PostalCode>
</xsl:when>
<xsl:otherwise>
<ens:PostalCode>
<xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:ListOfEmployee_PersonalAddress/ns1:Employee_PersonalAddress/ns1:PersonalPostalCode"/>
</ens:PostalCode>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:ListOfEmployee_PersonalAddress/ns1:Employee_PersonalAddress/ns1:PersonalStreetAddress">
<ens:Street>
<xsl:value-of select="concat(/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:ListOfEmployee_PersonalAddress/ns1:Employee_PersonalAddress/ns1:PersonalStreetAddress,/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:ListOfEmployee_PersonalAddress/ns1:Employee_PersonalAddress/ns1:PersonalStreetAddress2,/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:ListOfEmployee_PersonalAddress/ns1:Employee_PersonalAddress/ns1:PersonalStreetAddress3)"/>
</ens:Street>
</xsl:if>
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:TerminationDate and /ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:TerminationDate !=&quot;&quot;">
<ens:Terminated_Date__c>
<xsl:call-template name="ConvertSiebelDate">
<xsl:with-param name="Date" select="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:TerminationDate"/>
</xsl:call-template>
</ens:Terminated_Date__c>
</xsl:if>
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:ListOfEmployee_PersonalAddress/ns1:Employee_PersonalAddress/ns1:PersonalCountry">
<ens:CountryCode>
<xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/Country_SFToSBL.dvm','SBL',/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:ListOfEmployee_PersonalAddress/ns1:Employee_PersonalAddress/ns1:PersonalCountry,'SALESFORCE','NoCode')"/>
</ens:CountryCode>
</xsl:if>
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:ListOfEmployee_PersonalAddress/ns1:Employee_PersonalAddress/ns1:PersonalState">
<ens:State>
<xsl:value-of select="substring-before(dvm:lookupValue('oramds:/apps/dvm/State_SFToSBL.dvm','SBL',/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:ListOfEmployee_PersonalAddress/ns1:Employee_PersonalAddress/ns1:PersonalState,'SALESFORCE','NoCode'),'-')"/>
</ens:State>
</xsl:if>
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:LoginName">
<xsl:choose>
<xsl:when test="string-length(/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:LoginName) > 30">
<ens:FederationIdentifier>
<xsl:value-of select="substring(/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:LoginName,1,30)"/>
</ens:FederationIdentifier>
</xsl:when>
<xsl:otherwise>
<ens:FederationIdentifier>
<xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:LoginName"/>
</ens:FederationIdentifier>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
</tns:sObjects>
</tns:create>
</xsl:template>
<xsl:template name="ConvertSiebelDate">
<xsl:param name="Date"/>
<xsl:if test="string-length($Date)!=0">
<xsl:variable name="Month" select="substring-before($Date,'/')"/>
<xsl:variable name="DateTmp" select="substring-after($Date,'/')"/>
<xsl:variable name="Date" select="substring-before($DateTmp,'/')"/>
<xsl:variable name="Year" select="substring-after($DateTmp,'/')"/>
<xsl:variable name="ModifiedDate" select="concat($Year,'-',$Month,'-',$Date)"/>
<xsl:value-of select="$ModifiedDate"/>
</xsl:if>
</xsl:template>
</xsl:stylesheet>
