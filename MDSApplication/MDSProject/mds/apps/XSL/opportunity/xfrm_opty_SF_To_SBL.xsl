<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:xsdLocal1="http://www.siebel.com/xml/ISG_SF_Opportunity_IO/Data" xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsdLocal2="http://www.siebel.com/xml/ISG_SF_Opportunity_IO/Id" xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions" xmlns:tns1="http://siebel.com/webservices" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:tns="urn:enterprise.soap.sforce.com" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:ns0="http://siebel.com/CustomUI" xmlns:xsdLocal3="http://www.siebel.com/xml/ISG_SF_Opportunity_IO/Query" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:med="http://schemas.oracle.com/mediator/xpath" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:fns="urn:fault.enterprise.soap.sforce.com" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap" xmlns:ens="urn:sobject.enterprise.soap.sforce.com" xmlns:ns3="http://SalesforceIntegration/Opty_SFIds" exclude-result-prefixes="xsi xsl soap tns fns xsd ens xsdLocal1 xsdLocal2 tns1 soapenc ns0 xsdLocal3 xp20 bpws bpel bpm ora socket mhdr oraext dvm hwf med ids xdk xref ldap">
  <xsl:param name="xrefIds"/>
  <xsl:template match="/">
    <xsdLocal1:ListOfIsg_Sf_Opportunity_Io>
      <xsdLocal1:Opportunity>
        <xsl:if test="$xrefIds/ns3:ids/ns3:SiebelAccId!=''">
          <xsdLocal1:AccountId>
            <xsl:value-of select="$xrefIds/ns3:ids/ns3:SiebelAccId"/>
          </xsdLocal1:AccountId>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:USDValue!=''">
          <xsdLocal1:MFEForecastedOpportunityUSD>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:USDValue"/>
          </xsdLocal1:MFEForecastedOpportunityUSD>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Amount!=''">
          <xsdLocal1:BookingsDBValue>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Amount"/>
          </xsdLocal1:BookingsDBValue>
        </xsl:if>

        <xsl:choose>
          <xsl:when test="/tns:retrieveResponse/tns:result/ens:RFP__c!='' and /tns:retrieveResponse/tns:result/ens:RFP__c='Yes'">
            <xsdLocal1:RFP>
              <xsl:text disable-output-escaping="no">Y</xsl:text>
            </xsdLocal1:RFP>
          </xsl:when>
          <xsl:otherwise>
            <xsdLocal1:RFP>
              <xsl:text disable-output-escaping="no">N</xsl:text>
            </xsdLocal1:RFP>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:choose>
          <xsl:when test="string-length(/tns:retrieveResponse/tns:result/ens:Description) >  255">
            <xsdLocal1:Description>
              <xsl:value-of select="substring(/tns:retrieveResponse/tns:result/ens:Description, 1, 255)"/>
            </xsdLocal1:Description>
          </xsl:when>
          <xsl:otherwise>
            <xsdLocal1:Description>
              <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Description"/>
            </xsdLocal1:Description>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Id!=''">
          <xsdLocal1:ISGSFId>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Id"/>
          </xsdLocal1:ISGSFId>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:LeadSource!=''">
          <xsdLocal1:MFEOpportunitySource>
            <xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/OpportunitySource.dvm','Salesforce',/tns:retrieveResponse/tns:result/ens:LeadSource,'Siebel','No Code Found')"/>
          </xsdLocal1:MFEOpportunitySource>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Name!=''">
          <xsdLocal1:Name>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Name"/>
          </xsdLocal1:Name>
        </xsl:if>
        <xsl:choose>
          <xsl:when test="$xrefIds/ns3:ids/ns3:SiebelOptyId !=''">
            <xsdLocal1:Id>
              <xsl:value-of select="$xrefIds/ns3:ids/ns3:SiebelOptyId "/>
            </xsdLocal1:Id>
          </xsl:when>
          <xsl:otherwise>
            <xsdLocal1:Id>
              <xsl:text disable-output-escaping="no">1++1</xsl:text>
            </xsdLocal1:Id>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:CurrencyIsoCode!=''">
          <xsdLocal1:CurrencyCode>
            <xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/currencycode.dvm','Salesforce',/tns:retrieveResponse/tns:result/ens:CurrencyIsoCode,'Siebel','No Code Found')"/>
          </xsdLocal1:CurrencyCode>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Type!=''">
          <xsdLocal1:NAIOpportunityType>
            <xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/OpportunityType_SFToSBL.dvm','Salesforce',/tns:retrieveResponse/tns:result/ens:Type,'Siebel','No Code Found')"/>
          </xsdLocal1:NAIOpportunityType>
        </xsl:if>

        <xsl:if test="/tns:retrieveResponse/tns:result/ens:StageName!=''">
          <xsdLocal1:SalesStageId>
            <xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/OpportunitySTAGE_SFToOP.dvm','Salesforce',/tns:retrieveResponse/tns:result/ens:StageName,'Siebel','No Code Found')"/>
          </xsdLocal1:SalesStageId>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Total_Amount__c!=''">
          <xsdLocal1:MFEOpportunityTotalLocal>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Total_Amount__c"/>
          </xsdLocal1:MFEOpportunityTotalLocal>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Upside_Amount__c!=''">
          <xsdLocal1:MFEUpsideAmountLocal>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Upside_Amount__c"/>
          </xsdLocal1:MFEUpsideAmountLocal>
        </xsl:if>
        <!--    <xsl:choose>
            <xsl:when test="/tns:retrieveResponse/tns:result/ens:ForecastCategory!='' and /tns:retrieveResponse/tns:result/ens:ForecastCategory='Commit'">
            <xsdLocal1:PrimaryRevenueCommittedFlag>
            <xsl:text disable-output-escaping="no">Y</xsl:text>
            </xsdLocal1:PrimaryRevenueCommittedFlag>
            </xsl:when>
            <xsl:otherwise>
            <xsdLocal1:PrimaryRevenueCommittedFlag>
            <xsl:text disable-output-escaping="no">N</xsl:text>
            </xsdLocal1:PrimaryRevenueCommittedFlag>
            </xsl:otherwise>
            </xsl:choose> -->
        <!--  <xsl:if test="/tns:retrieveResponse/tns:result/ens:CloseDate!=''">
               <xsdLocal1:PrimaryRevenueCloseDate>                  
                  <xsl:call-template name="ConvertSFDateToSiebel">
                  <xsl:with-param name="Date" select="/tns:retrieveResponse/tns:result/ens:CloseDate"/>
                </xsl:call-template>
               </xsdLocal1:PrimaryRevenueCloseDate>
            </xsl:if>-->
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:CloseDate!=''">
          <xsdLocal1:PrimaryRevenueCloseDate>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:CloseDate"/>
          </xsdLocal1:PrimaryRevenueCloseDate>
        </xsl:if>


        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Promotion_Code__c!=''">
          <xsdLocal1:ISGSFPromoCode>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Promotion_Code__c"/>
          </xsdLocal1:ISGSFPromoCode>
        </xsl:if>

        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Promotion_End_Date__c!=''">
          <xsdLocal1:ISGSFPromoExpiryDate>
            <!-- <xsl:value-of  select="concat(substring-before(/tns:retrieveResponse/tns:result/ens:Promotion_End_Date__c,'.'),'z')"/>  -->
            <xsl:value-of  select="/tns:retrieveResponse/tns:result/ens:Promotion_End_Date__c"/>
          </xsdLocal1:ISGSFPromoExpiryDate>
        </xsl:if>

        <xsl:if test="/tns:retrieveResponse/tns:result/ens:CreatedDate!=''">
          <xsdLocal1:ISGSFCreated>
            <xsl:value-of  select="concat(substring-before(/tns:retrieveResponse/tns:result/ens:CreatedDate,'.'),'z')"/>
          </xsdLocal1:ISGSFCreated>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:CreatedById!=''">
          <xsdLocal1:ISGSFCreatedBy>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:CreatedById"/>
          </xsdLocal1:ISGSFCreatedBy>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:LastModifiedDate!=''">
          <xsdLocal1:ISGSFUpdated>
            <xsl:value-of  select="concat(substring-before(/tns:retrieveResponse/tns:result/ens:LastModifiedDate,'.'),'z')"/>
          </xsdLocal1:ISGSFUpdated>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:LastModifiedById!=''">
          <xsdLocal1:ISGSFUpdatedBy>
            <xsl:value-of  select="/tns:retrieveResponse/tns:result/ens:LastModifiedById"/>
          </xsdLocal1:ISGSFUpdatedBy>
        </xsl:if>
        <xsdLocal1:ISGSFSyncStatus>
          <xsl:text disable-output-escaping="no">SYNC_ON</xsl:text>
        </xsdLocal1:ISGSFSyncStatus>
        <!-- Related_Opportunity__c commented for INSALES-4140 <xsl:if test="/tns:retrieveResponse/tns:result/ens:Related_Opportunity__c!=''">
               <xsdLocal1:ParentOpportunityName>                
              <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Related_Opportunity__c"/>                                                           
               </xsdLocal1:ParentOpportunityName>
            </xsl:if>	-->
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:TotalOpportunityQuantity!=''">
          <xsdLocal1:NAIOpportunitySize>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:TotalOpportunityQuantity"/>
          </xsdLocal1:NAIOpportunitySize>
        </xsl:if>
      </xsdLocal1:Opportunity>
    </xsdLocal1:ListOfIsg_Sf_Opportunity_Io>
  </xsl:template>
  <xsl:template name="ConvertSFDateToSiebel">
    <xsl:param name="Date"/>
    <xsl:if test="string-length($Date) != 0">
      <xsl:variable name="Year" select="substring-before ($Date, '-')"/>
      <xsl:variable name="MonthTmp" select="substring-after($Date, '-')"/>
      <xsl:variable name="Month" select="substring-before ($MonthTmp, '-')"/>
      <xsl:variable name="DayTemp" select="substring-after($MonthTmp, '-')"/>
      <xsl:variable name="Day" select="substring-before ($DayTemp,'T')"/>
      <xsl:variable name="TimeTmp" select="substring-after ($DayTemp,'T')"/>
      <xsl:variable name="hrs" select="substring-before ($TimeTmp,':')"/>
      <xsl:variable name="MtsTmp" select="substring-after ($TimeTmp,':')"/>
      <xsl:variable name="Mins" select="substring-before($MtsTmp,':')"/>
      <xsl:variable name="scTmp" select="substring-after($MtsTmp,':')"/>
      <xsl:variable name="scs" select="substring-before($scTmp,'.')"/>
      <xsl:variable name="ModifiedDate" select="concat ($Month , '/', $Day ,'/',$Year,' ',$hrs,':',$Mins,':',$scs)"/>
      <xsl:value-of select="$ModifiedDate"/>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
