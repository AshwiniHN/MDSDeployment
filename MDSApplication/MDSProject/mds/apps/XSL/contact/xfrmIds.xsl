<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ns2="http://SalesforceIntegration/contact_SFIds" xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:tns="urn:enterprise.soap.sforce.com" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:client="http://xmlns.oracle.com/ContactDev/SFToSiebel_Contact/UpsertContactSiebelProvABCSImpl" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype" xmlns:med="http://schemas.oracle.com/mediator/xpath" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:fns="urn:fault.enterprise.soap.sforce.com" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:ens="urn:sobject.enterprise.soap.sforce.com" xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap" exclude-result-prefixes="xsi xsl soap tns fns xsd ens ns2 wsdl client plnk xp20 bpws bpel bpm ora socket mhdr oraext dvm hwf med ids xdk xref ldap">
<xsl:template match="/">
<ns2:ids>
<xsl:choose>
<xsl:when test="/tns:retrieveResponse/tns:result/ens:AccountId">
<ns2:SFAccountId>
<xsl:value-of select="/tns:retrieveResponse/tns:result/ens:AccountId"/>
</ns2:SFAccountId>
</xsl:when>
<xsl:otherwise>
<ns2:SFAccountId>
<xsl:text disable-output-escaping="no">no</xsl:text>
</ns2:SFAccountId>
</xsl:otherwise>
</xsl:choose>
<xsl:choose>
<xsl:when test="/tns:retrieveResponse/tns:result/ens:Id">
<ns2:SFContactId>
<xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Id"/>
</ns2:SFContactId>
</xsl:when>
<xsl:otherwise>
<ns2:SFContactId>
<xsl:text disable-output-escaping="no">no</xsl:text>
</ns2:SFContactId>
</xsl:otherwise>
</xsl:choose>
<xsl:choose>
<xsl:when test="/tns:retrieveResponse/tns:result/ens:Id">
<ns2:SFCutAddressId>
<xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Id"/>
</ns2:SFCutAddressId>
</xsl:when>
<xsl:otherwise>
<ns2:SFCutAddressId>
<xsl:text disable-output-escaping="no">no</xsl:text>
</ns2:SFCutAddressId>
</xsl:otherwise>
</xsl:choose>
<xsl:choose>
<xsl:when test="/tns:retrieveResponse/tns:result/ens:Id">
<ns2:CutAddressIdInSF>
<xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Id"/>
</ns2:CutAddressIdInSF>
</xsl:when>
<xsl:otherwise>
<ns2:CutAddressIdInSF>
<xsl:text disable-output-escaping="no">no</xsl:text>
</ns2:CutAddressIdInSF>
</xsl:otherwise>
</xsl:choose>
<xsl:choose>
<xsl:when test="/tns:retrieveResponse/tns:result/ens:OwnerId">
<ns2:SFOwnerId>
<xsl:value-of select="/tns:retrieveResponse/tns:result/ens:OwnerId"/>
</ns2:SFOwnerId>
</xsl:when>
<xsl:otherwise>
<ns2:SFOwnerId>
<xsl:text disable-output-escaping="no">no</xsl:text>
</ns2:SFOwnerId>
</xsl:otherwise>
</xsl:choose>
<ns2:SFPartnerId>
<xsl:text disable-output-escaping="no">no</xsl:text>
</ns2:SFPartnerId>
<ns2:OPAccountId>
<xsl:text disable-output-escaping="no">no</xsl:text>
</ns2:OPAccountId>
<ns2:OPContactId>
<xsl:text disable-output-escaping="no">no</xsl:text>
</ns2:OPContactId>
<ns2:OPOwnerId>
<xsl:text disable-output-escaping="no">no</xsl:text>
</ns2:OPOwnerId>
<ns2:OPPartnerId>
<xsl:text disable-output-escaping="no">no</xsl:text>
</ns2:OPPartnerId>
<ns2:OPIdInXREF>
<xsl:text disable-output-escaping="no">no</xsl:text>
</ns2:OPIdInXREF>
<xsl:choose>
<xsl:when test="/tns:retrieveResponse/tns:result/ens:Legacy_Id__c">
<ns2:OPIdInSFPayload>
<xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Legacy_Id__c"/>
</ns2:OPIdInSFPayload>
</xsl:when>
<xsl:otherwise>
<ns2:OPIdInSFPayload>
<xsl:text disable-output-escaping="no"/>
</ns2:OPIdInSFPayload>
</xsl:otherwise>
</xsl:choose>
</ns2:ids>
</xsl:template>
</xsl:stylesheet>
