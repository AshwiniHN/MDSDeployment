<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions" xmlns:plnk="http://schemas.xmlsoap.org/ws/2003/05/partner-link/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:tns="urn:enterprise.soap.sforce.com" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:med="http://schemas.oracle.com/mediator/xpath" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:client="http://xmlns.oracle.com/LatestCode/XREFInterface/XREFMultiLookUp" xmlns:fns="urn:fault.enterprise.soap.sforce.com" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:ns1="http://schemas.oracle.com/bpel/extension" xmlns:ns2="http://xmlns.oracle.com/XREFInterface" xmlns:ens="urn:sobject.enterprise.soap.sforce.com" xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap" exclude-result-prefixes="xsl plnk wsdl client xsd ns1 ns2 soap tns fns xp20 bpws bpel bpm ora socket mhdr oraext dvm hwf med ids xdk xref ldap">
<xsl:template match="/">
<tns:create>
<xsl:for-each select="/ns2:xrefinput/ns2:operation">
<xsl:if test="ns2:recType = &quot;CONTACT&quot;">
<tns:sObjects>
<xsl:attribute name="xsi:type">
<xsl:text disable-output-escaping="no">ens:Contact</xsl:text>
</xsl:attribute>
<ens:Id>
<xsl:value-of select="ns2:hostRowId"/>
</ens:Id>
<ens:Legacy_Id__c>
<xsl:value-of select="ns2:refHostRowId"/>
</ens:Legacy_Id__c>
</tns:sObjects>
</xsl:if>
</xsl:for-each>
</tns:create>
</xsl:template>
</xsl:stylesheet>
