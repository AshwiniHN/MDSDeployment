<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="2.0" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ns2="http://SalesforceIntegration/contact_SFIds" xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions" xmlns:ns4="http://schemas.xmlsoap.org/ws/2003/05/partner-link/" xmlns:ns1="urn:enterprise.soap.sforce.com" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:client="http://xmlns.oracle.com/ContactDev/SFToSiebel_Contact/UpsertContactSiebelProvABCSImpl" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype" xmlns:med="http://schemas.oracle.com/mediator/xpath" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:ns5="http://xmlns.oracle.com/LatestCode/XREFInterface/XREFMultiLookUp" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:ns3="http://schemas.oracle.com/bpel/extension" xmlns:ns0="http://xmlns.oracle.com/XREFInterface" xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap" exclude-result-prefixes="xsi xsl ns2 ns1 wsdl client plnk xsd ns4 ns5 ns3 ns0 xp20 bpws bpel bpm ora socket mhdr oraext dvm hwf med ids xdk xref ldap">
<xsl:template match="/">
<ns0:xrefinput>
<xsl:for-each select="for $i in 1 to 5 return $i">
<ns0:operation>
<ns0:name>
<xsl:text disable-output-escaping="no">lookUp</xsl:text>
</ns0:name>
<ns0:refHostName>
<xsl:text disable-output-escaping="no">SALESFORCE</xsl:text>
</ns0:refHostName>
<ns0:hostName>
<xsl:text disable-output-escaping="no">SIEBEL</xsl:text>
</ns0:hostName>
<ns0:hostRowId>
<xsl:text disable-output-escaping="no"/>
</ns0:hostRowId>
<ns0:SFHostId>
<xsl:text disable-output-escaping="no"/>
</ns0:SFHostId>
<xsl:choose>
<xsl:when test="position() = 1  and /ns2:ids/ns2:SFAccountId">
<ns0:recType>
<xsl:text disable-output-escaping="no">ACCOUNT</xsl:text>
</ns0:recType>
<ns0:refHostRowId>
<xsl:value-of select="/ns2:ids/ns2:SFAccountId"/>
</ns0:refHostRowId>
</xsl:when>
</xsl:choose>
<xsl:choose>
<xsl:when test="position() = 2 and /ns2:ids/ns2:SFContactId ">
<ns0:recType>
<xsl:text disable-output-escaping="no">CONTACT</xsl:text>
</ns0:recType>
<ns0:refHostRowId>
<xsl:value-of select="/ns2:ids/ns2:SFContactId"/>
</ns0:refHostRowId>
</xsl:when>
</xsl:choose>
<xsl:choose>
<xsl:when test="position() = 3 and /ns2:ids/ns2:SFOwnerId ">
<ns0:recType>
<xsl:text disable-output-escaping="no">OWNER</xsl:text>
</ns0:recType>
<ns0:refHostRowId>
<xsl:value-of select="/ns2:ids/ns2:SFOwnerId"/>
</ns0:refHostRowId>
</xsl:when>
</xsl:choose>
<xsl:choose>
<xsl:when test="position() = 4 and /ns2:ids/ns2:SFPartnerId ">
<ns0:recType>
<xsl:text disable-output-escaping="no">PARTNER</xsl:text>
</ns0:recType>
<ns0:refHostRowId>
<xsl:value-of select="/ns2:ids/ns2:SFPartnerId"/>
</ns0:refHostRowId>
</xsl:when>
</xsl:choose>
<xsl:choose>
<xsl:when test="position() = 5  and /ns2:ids/ns2:SFCutAddressId">
<ns0:recType>
<xsl:text disable-output-escaping="no">CONTACTADDRESS</xsl:text>
</ns0:recType>
<ns0:refHostRowId>
<xsl:value-of select="/ns2:ids/ns2:SFCutAddressId"/>
</ns0:refHostRowId>
</xsl:when>
</xsl:choose>
</ns0:operation>
</xsl:for-each>
</ns0:xrefinput>
</xsl:template>
</xsl:stylesheet>
