<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:ns2="http://SalesforceIntegration/Opty_SFIds" xmlns:tns="urn:enterprise.soap.sforce.com" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:ns1="http://www.siebel.com/xml/ISG_SF_Opportunity_IO" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype" xmlns:med="http://schemas.oracle.com/mediator/xpath" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:fns="urn:fault.enterprise.soap.sforce.com" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:client="http://Isecg-SalesforceProject/UpsertOpportunityRevenueSFProvABCSImpl" xmlns:ens="urn:sobject.enterprise.soap.sforce.com" xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap" exclude-result-prefixes="xsi xsl ns2 wsdl ns1 plnk xsd client soap tns fns ens xp20 bpws bpel bpm ora socket mhdr oraext dvm hwf med ids xdk xref ldap">
<xsl:param name="consolidateXREFIdsByEvent"/>
<xsl:param name="finalRevenueUpdateData_temp"/>
<xsl:template match="/">
<tns:create>
<xsl:for-each select="$consolidateXREFIdsByEvent/ns2:OptyLineItem_ids/ns2:Lineitem_ids">
<xsl:variable name="sfRevenueId" select="ns2:SFRevenueId"/>
<xsl:variable name="sfProductId" select="ns2:SFProductId"/>
<xsl:variable name="sfOptyId" select="ns2:SFOptyId"/>
<xsl:variable name="opRevenueId" select="ns2:SiebelRevenueId"/>
<xsl:for-each select="/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:ListOfRevenue/ns1:Revenue">
<xsl:if test="ns1:Id = $opRevenueId">
<tns:sObjects xsi:type="urn:OpportunityLineItem">
<xsl:if test="$sfRevenueId != ''">
<ens:Id>
<xsl:value-of select="$sfRevenueId"/>
</ens:Id>
</xsl:if>
<xsl:if test="ns1:Currency != ''">
<ens:CurrencyIsoCode>
<xsl:value-of select="ns1:Currency"/>
</ens:CurrencyIsoCode>
</xsl:if>
<xsl:if test="ns1:GrantNumber != ''">
<ens:GrantNumber__c>
<xsl:value-of select="ns1:GrantNumber"/>
</ens:GrantNumber__c>
</xsl:if>
<xsl:if test="ns1:NAIGrantNumber != ''">
<ens:Grant_Number__c>
<xsl:value-of select="ns1:NAIGrantNumber"/>
</ens:Grant_Number__c>
</xsl:if>
<xsl:if test="ns1:MFEOpportunityType != ''">
<ens:Program_Type__c>
<xsl:value-of select="ns1:MFEOpportunityType"/>
</ens:Program_Type__c>
</xsl:if>
<ens:Legacy_Id__c>
<xsl:value-of select="ns1:Id"/>
</ens:Legacy_Id__c>
<xsl:if test="ns1:Comments != ''">
<ens:Description>
<xsl:value-of select="ns1:Comments"/>
</ens:Description>
</xsl:if>
<ens:OpportunityId>
<xsl:value-of select="../../ns1:ISGSFId"/>
</ens:OpportunityId>
<ens:PricebookEntryId>
<xsl:value-of select="$sfProductId"/>
</ens:PricebookEntryId>
<xsl:if test="ns1:ISGSFProgramBenefitRequest != ''">
<ens:Program_Benefit__c>
<xsl:value-of select="ns1:ISGSFProgramBenefitRequest"/>
</ens:Program_Benefit__c>
</xsl:if>
<xsl:if test="ns1:Quantity != ''">
<xsl:choose>
<xsl:when test="ns1:Quantity != 0">
<ens:Quantity>
<xsl:value-of select="ns1:Quantity"/>
</ens:Quantity>
</xsl:when>
<xsl:otherwise>
<ens:Quantity>
             <xsl:text disable-output-escaping="no">1</xsl:text>
            </ens:Quantity>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
<xsl:choose>
<xsl:when test="ns1:Price != ''">
<xsl:choose>
<xsl:when test="ns1:Quantity != '' and ns1:Quantity = 0">
<ens:UnitPrice>
                <xsl:text disable-output-escaping="no">0</xsl:text>
              </ens:UnitPrice>
</xsl:when>
<xsl:otherwise>
<ens:UnitPrice>
<xsl:value-of select="ns1:Price"/>
</ens:UnitPrice>
</xsl:otherwise>
</xsl:choose>
</xsl:when>
<xsl:otherwise>
<ens:UnitPrice>
<xsl:text disable-output-escaping="no">0</xsl:text>
</ens:UnitPrice>
</xsl:otherwise>
</xsl:choose>
<xsl:if test="ns1:Revenue != ''">
<ens:TotalPrice>
<xsl:value-of select="ns1:Revenue"/>
</ens:TotalPrice>
</xsl:if>
</tns:sObjects>
</xsl:if>
</xsl:for-each>
<xsl:for-each select="$finalRevenueUpdateData_temp/ns1:SiebelMessage/ns1:ListOfIsg_Sf_Opportunity_Io/ns1:Opportunity/ns1:ListOfRevenue/ns1:Revenue">
<xsl:if test="ns1:Id = $opRevenueId">
<tns:sObjects xsi:type="urn:OpportunityLineItem">
<xsl:if test="$sfRevenueId != ''">
<ens:Id>
<xsl:value-of select="$sfRevenueId"/>
</ens:Id>
</xsl:if>
<xsl:if test="ns1:GrantNumber != ''">
<ens:GrantNumber__c>
<xsl:value-of select="ns1:GrantNumber"/>
</ens:GrantNumber__c>
</xsl:if>
<ens:Legacy_Id__c>
<xsl:value-of select="ns1:Id"/>
</ens:Legacy_Id__c>
<xsl:if test="ns1:Comments != ''">
<ens:Description>
<xsl:value-of select="ns1:Comments"/>
</ens:Description>
</xsl:if>
<ens:OpportunityId>
<xsl:value-of select="../../ns1:ISGSFId"/>
</ens:OpportunityId>
<xsl:if test="ns1:ISGSFProgramBenefitRequest != ''">
<ens:Program_Benefit__c>
<xsl:value-of select="ns1:ISGSFProgramBenefitRequest"/>
</ens:Program_Benefit__c>
</xsl:if>
<xsl:if test="ns1:Quantity != ''">
<ens:Quantity>
<xsl:value-of select="ns1:Quantity"/>
</ens:Quantity>
</xsl:if>
<xsl:choose>
<xsl:when test="ns1:Price != ''">
<ens:UnitPrice>
<xsl:value-of select="ns1:Price"/>
</ens:UnitPrice>
</xsl:when>
<xsl:otherwise>
<ens:UnitPrice>
<xsl:text disable-output-escaping="no">0</xsl:text>
</ens:UnitPrice>
</xsl:otherwise>
</xsl:choose>
<xsl:if test="ns1:Revenue != ''">
<ens:TotalPrice>
<xsl:value-of select="ns1:Revenue"/>
</ens:TotalPrice>
</xsl:if>
</tns:sObjects>
</xsl:if>
</xsl:for-each>
</xsl:for-each>
</tns:create>
</xsl:template>
</xsl:stylesheet>
