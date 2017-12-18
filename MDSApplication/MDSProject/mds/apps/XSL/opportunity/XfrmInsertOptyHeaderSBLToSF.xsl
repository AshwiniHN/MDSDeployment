<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:ns1="http://www.siebel.com/xml/ISG_SF_Opportunity_IO" xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable" xmlns:client="http://xmlns.oracle.com/NewDevelopmentSiebelToSalesforce/InsertOpportunitySFProvABCSImpl/InsertOpportunityBPELProcess" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions" xmlns:plnk="http://schemas.xmlsoap.org/ws/2003/05/partner-link/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:tns="urn:enterprise.soap.sforce.com" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:ns2="http://SalesforceIntegration/Opty_InsertSblId" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:med="http://schemas.oracle.com/mediator/xpath" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:ns3="http://SalesforceIntegration/OptyIds" xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:fns="urn:fault.enterprise.soap.sforce.com" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:ens="urn:sobject.enterprise.soap.sforce.com" xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap" exclude-result-prefixes="xsi xsl ns1 client plnk wsdl ns2 ns3 xsd soap tns fns ens xp20 bpws bpel bpm ora socket mhdr oraext dvm hwf med ids xdk xref ldap">
<xsl:param name="inputVariable.SFOptyIds"/>
<xsl:template match="/">
<tns:create>
<tns:sObjects>
<xsl:attribute name="xsi:type">
<xsl:text disable-output-escaping="no">ens:Opportunity</xsl:text>
</xsl:attribute>
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:ISGSFCreatedBy!=''">
<ens:CreatedById>
<xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:ISGSFCreatedBy"/>
</ens:CreatedById>
</xsl:if>
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:CurrencyCode!=''">
<ens:CurrencyIsoCode>
<xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:CurrencyCode"/>
</ens:CurrencyIsoCode>
</xsl:if>
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:Description!=''">
<ens:Description>
<xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:Description"/>
</ens:Description>
</xsl:if>
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:Id!=''">
<ens:Legacy_Id__c>
<xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:Id"/>
</ens:Legacy_Id__c>
</xsl:if>
<xsl:if test="$inputVariable.SFOptyIds/ns3:ids/ns3:AccountIdInSBL !=''">
<ens:AccountId>
<xsl:value-of select="$inputVariable.SFOptyIds/ns3:ids/ns3:AccountIdInSBL"/>
</ens:AccountId>
</xsl:if>
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:BookingsDBValue!=''">
<ens:Amount>
<xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:BookingsDBValue"/>
</ens:Amount>
</xsl:if>
<!--
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:Channel!=''">
<ens:Route_to_Market__c>
<xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/OpportunityChannel.dvm','Siebel',/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:Channel,'Salesforce','No Code Found')"/>
</ens:Route_to_Market__c>
</xsl:if> -->
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:NAIOptyCompetitor!=''">
<ens:Competitor__c>
<xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:NAIOptyCompetitor"/>
</ens:Competitor__c>
</xsl:if>
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:PrimaryRevenueCloseDate!=''">
<ens:CloseDate>
<xsl:call-template name="ConvertSiebelDateToSalesforce">
<xsl:with-param name="Date" select="/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:PrimaryRevenueCloseDate"/>
</xsl:call-template>
</ens:CloseDate>
</xsl:if>
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:ISGSFUpdatedBy!=''">
<ens:LastModifiedById>
<xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:ISGSFUpdatedBy"/>
</ens:LastModifiedById>
</xsl:if>
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:ISGSFUpdated!=''">
<ens:LastModifiedDate>
<xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:ISGSFUpdated"/>
</ens:LastModifiedDate>
</xsl:if>
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:MFEOpportunitySource!=''">
<ens:LeadSource>
<xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/OpportunitySourceSiebelToSF.dvm','Siebel',/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:MFEOpportunitySource,'Salesforce','No Code Found')"/>
</ens:LeadSource>
</xsl:if>
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:PrimaryEmployeeId!=''">
<ens:Legacy_Owner_Id__c>
<xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:PrimaryEmployeeId"/>
</ens:Legacy_Owner_Id__c>
</xsl:if>
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:SalesStageId!=''">
<ens:StageName>
<xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/OpportunitySTAGE.dvm','Siebel',/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:SalesStageId,'Salesforce','No Code Found')"/>
</ens:StageName>
</xsl:if>
<!--
<xsl:if test="ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:MFEOpportunityTotal!=''">
<ens:Total_Amount__c>
<xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:MFEOpportunityTotal"/>
</ens:Total_Amount__c>
</xsl:if> -->
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:NAIOpportunityType!=''">
<ens:Type>
<xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/OpportunityType.dvm','Siebel',/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:NAIOpportunityType,'Salesforce','No Code Found')"/>
</ens:Type>
</xsl:if>
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:MFEUpsideAmountLocal!=''">
<ens:Upside_Amount__c>
<xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:MFEUpsideAmountLocal"/>
</ens:Upside_Amount__c>
</xsl:if>
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:ReasonWonLost!=''">
<ens:Won_Lost_Reason__c>
<xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:ReasonWonLost"/>
</ens:Won_Lost_Reason__c>
</xsl:if>
<xsl:if test="$inputVariable.SFOptyIds/ns3:ids/ns3:SFIdInSBL !=''">
<ens:Id>
<xsl:value-of select="$inputVariable.SFOptyIds/ns3:ids/ns3:SFIdInSBL"/>
</ens:Id>
</xsl:if>
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:Name!=''">
<ens:Name>
<xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:Name"/>
</ens:Name>
</xsl:if>
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:MFEDealRegProducts!=''">
<ens:Approved_Product_Types__c>
<xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:MFEDealRegProducts"/>
</ens:Approved_Product_Types__c>
</xsl:if>
<!--xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:MFEDealDriver!=''">
<ens:Deal_Driver__c>
<xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:MFEDealDriver"/>
</ens:Deal_Driver__c>
</xsl:if>
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:MFEDealRegOverrideComments!=''">
<ens:DealReg_Comments__c>
<xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:MFEDealRegOverrideComments"/>
</ens:DealReg_Comments__c>
</xsl:if>
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:MFEDealRegExpirationDate!=''">
<ens:DealReg_ExpirationDate__c>
<xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:MFEDealRegExpirationDate"/>
</ens:DealReg_ExpirationDate__c>
</xsl:if-->
<!--xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:NAIContactEmailAddr!=''">
<ens:Partner_Contact_Email__c>
<xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:NAIContactEmailAddr"/>
</ens:Partner_Contact_Email__c>
</xsl:if-->
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:NAIOpportunitySize!=''">
<ens:TotalOpportunityQuantity>
<xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:NAIOpportunitySize"/>
</ens:TotalOpportunityQuantity>
</xsl:if>
<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:NAIDealStatus!=''">
<ens:Deal_Registration_Status__c>
<xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/OpportunityDealStatus.dvm','Siebel',/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:NAIDealStatus,'Salesforce','No Code Found')"/>
</ens:Deal_Registration_Status__c>
</xsl:if>
</tns:sObjects>
</tns:create>
</xsl:template>
<xsl:template name="ConvertSiebelDateToSalesforce">
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
