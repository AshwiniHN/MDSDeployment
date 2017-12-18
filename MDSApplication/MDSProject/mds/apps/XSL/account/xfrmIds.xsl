<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:aia="http://www.oracle.com/XSL/Transform/java/oracle.apps.aia.core.xpath.AIAFunctions" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ns1="http://www.example.org" xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:tns="urn:enterprise.soap.sforce.com" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:ns0="http://SalesforceIntegration/account_SFIds" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:med="http://schemas.oracle.com/mediator/xpath" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:fns="urn:fault.enterprise.soap.sforce.com" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap" xmlns:ens="urn:sobject.enterprise.soap.sforce.com" exclude-result-prefixes="xsi xsl soap tns fns xsd ens ns1 ns0 aia bpws xp20 bpel bpm ora socket mhdr oraext dvm hwf med ids xdk xref ldap">
<xsl:template match="/">
<ns0:ids>
<xsl:choose>
<xsl:when test="/tns:retrieveResponse/tns:result/ens:Id">
<ns0:SFAccountId>
<xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Id"/>
</ns0:SFAccountId>
</xsl:when>
<xsl:otherwise>
<ns0:SFAccountId>
<xsl:text disable-output-escaping="no"/>
</ns0:SFAccountId>
</xsl:otherwise>
</xsl:choose>
<xsl:choose>
<xsl:when test="/tns:retrieveResponse/tns:result/ens:Legacy_Id__c">
<ns0:SBLAccountId>
<xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Legacy_Id__c"/>
</ns0:SBLAccountId>
</xsl:when>
<xsl:otherwise>
<ns0:SBLAccountId>
<xsl:text disable-output-escaping="no"/>
</ns0:SBLAccountId>
</xsl:otherwise>
</xsl:choose>
<xsl:choose>
<xsl:when test="/tns:retrieveResponse/tns:result/ens:OwnerId">
<ns0:SFOwnerId>
<xsl:value-of select="/tns:retrieveResponse/tns:result/ens:OwnerId"/>
</ns0:SFOwnerId>
</xsl:when>
<xsl:otherwise>
<ns0:SFOwnerId>
<xsl:text disable-output-escaping="no"/>
</ns0:SFOwnerId>
</xsl:otherwise>
</xsl:choose>
<xsl:choose>
<xsl:when test="/tns:retrieveResponse/tns:result/ens:RecordType/ens:DeveloperName and /tns:retrieveResponse/tns:result/ens:RecordType/ens:DeveloperName='Partner_Account'">
<ns0:PartnerFlag>
<xsl:text disable-output-escaping="no">true</xsl:text>
</ns0:PartnerFlag>
</xsl:when>
<xsl:otherwise>
<ns0:PartnerFlag>
<xsl:text disable-output-escaping="no">false</xsl:text> 
</ns0:PartnerFlag>
</xsl:otherwise>
</xsl:choose>
<!--<xsl:choose>
<xsl:when test="/tns:retrieveResponse/tns:result/ens:IsPartner">
<ns0:PartnerFlag>
<xsl:value-of select="/tns:retrieveResponse/tns:result/ens:IsPartner"/>
</ns0:PartnerFlag>
</xsl:when>
<xsl:otherwise>
<ns0:PartnerFlag>
<xsl:text disable-output-escaping="no"/>
</ns0:PartnerFlag>
</xsl:otherwise>
</xsl:choose> -->
<xsl:choose>
<xsl:when test="/tns:retrieveResponse/tns:result/ens:ParentId">
<ns0:SFParentId>
<xsl:value-of select="/tns:retrieveResponse/tns:result/ens:ParentId"/>
</ns0:SFParentId>
</xsl:when>
<xsl:otherwise>
<ns0:SFParentId>
<xsl:text disable-output-escaping="no"/>
</ns0:SFParentId>
</xsl:otherwise>
</xsl:choose>
</ns0:ids>
</xsl:template>
</xsl:stylesheet>
