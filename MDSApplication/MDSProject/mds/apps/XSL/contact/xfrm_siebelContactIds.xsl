<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:aia="http://www.oracle.com/XSL/Transform/java/oracle.apps.aia.core.xpath.AIAFunctions" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ns0="http://SalesforceIntegration/contact_SFIds" xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions" xmlns:od="urn:/crmondemand/xml/account" xmlns:ns6="http://SalesforceProject/SFEndpointProcess" xmlns:plnk="http://schemas.xmlsoap.org/ws/2003/05/partner-link/" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:ns3="http://SalesforceIntegration/account_SFIds" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:med="http://schemas.oracle.com/mediator/xpath" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns2="http://www.siebel.com/xml/ISGSFContactIO" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:client="http://xmlns.oracle.com/InsertContactSFProvABCSImpl" xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:ns4="http://schemas.oracle.com/bpel/extension" xmlns:ns1="http://xmlns.oracle.com/OP_SF_Contact/InsertContactSFProvABCSImpl/InsertContactSFProvABCSImpl" xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap" exclude-result-prefixes="xsi xsl ns0 od ns6 plnk ns3 ns2 client xsd ns4 ns1 aia bpws xp20 bpel bpm ora socket mhdr oraext dvm hwf med ids xdk xref ldap">
<xsl:template match="/">
<ns0:ids>
<xsl:choose>
<xsl:when test="/ns2:SiebelMessage/ns2:ListOfIsgsfcontactio/ns2:Contact/ns2:ISGSFId">
<ns0:SFIdInSBL>
<xsl:value-of select="/ns2:SiebelMessage/ns2:ListOfIsgsfcontactio/ns2:Contact/ns2:ISGSFId"/>
</ns0:SFIdInSBL>
</xsl:when>
<xsl:otherwise>
<ns0:SFIdInSBL>
<xsl:text disable-output-escaping="no"/>
</ns0:SFIdInSBL>
</xsl:otherwise>
</xsl:choose>
<xsl:choose>
<xsl:when test="/ns2:SiebelMessage/ns2:ListOfIsgsfcontactio/ns2:Contact/ns2:Id">
<ns0:SBLContactId>
<xsl:value-of select="/ns2:SiebelMessage/ns2:ListOfIsgsfcontactio/ns2:Contact/ns2:Id"/>
</ns0:SBLContactId>
</xsl:when>
<xsl:otherwise>
<ns0:SBLContactId>
<xsl:text disable-output-escaping="no"/>
</ns0:SBLContactId>
</xsl:otherwise>
</xsl:choose>
<xsl:choose>
<xsl:when test="/ns2:SiebelMessage/ns2:ListOfIsgsfcontactio/ns2:Contact/ns2:AccountId">
<ns0:SBLAccountId>
<xsl:value-of select="/ns2:SiebelMessage/ns2:ListOfIsgsfcontactio/ns2:Contact/ns2:AccountId"/>
</ns0:SBLAccountId>
</xsl:when>
<xsl:otherwise>
<ns0:SBLAccountId>
<xsl:text disable-output-escaping="no"/>
</ns0:SBLAccountId>
</xsl:otherwise>
</xsl:choose>
<xsl:choose>
<xsl:when test="/ns2:SiebelMessage/ns2:ListOfIsgsfcontactio/ns2:Contact/ns2:ListOfPersonalAddress/ns2:PersonalAddress/ns2:Id">
<ns0:SBLContactAddrId>
<xsl:value-of select="/ns2:SiebelMessage/ns2:ListOfIsgsfcontactio/ns2:Contact/ns2:ListOfPersonalAddress/ns2:PersonalAddress/ns2:Id"/>
</ns0:SBLContactAddrId>
</xsl:when>
<xsl:otherwise>
<ns0:SBLContactAddrId>
<xsl:text disable-output-escaping="no"/>
</ns0:SBLContactAddrId>
</xsl:otherwise>
</xsl:choose>
</ns0:ids>
</xsl:template>
</xsl:stylesheet>
