<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:client="http://xmlns.oracle.com/Siebel_Salesforce/InsertUserSFProvABCSImpl/InsertUserSFBPELProcess" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:ns5="http://SalesforceIntegration/User_SblId" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:med="http://schemas.oracle.com/mediator/xpath" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions" xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:plnk="http://schemas.xmlsoap.org/ws/2003/05/partner-link/" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:ns2="http://schemas.oracle.com/bpel/extension" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:ns1="http://www.siebel.com/xml/ISG%20SF%20Employee%20IO" xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap" exclude-result-prefixes="xsi xsl client ns5 plnk xsd ns2 wsdl ns1 bpws xp20 mhdr bpel oraext dvm hwf med ids bpm xdk xref ora socket ldap">
<xsl:template match="/">
<ns5:ids>
<xsl:choose>
<xsl:when test="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:ManagerId">
<ns5:ManagerId>
<xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:ManagerId"/>
</ns5:ManagerId>
</xsl:when>
<xsl:otherwise>
<ns5:ManagerId>
<xsl:text disable-output-escaping="no">blank</xsl:text>
</ns5:ManagerId>
</xsl:otherwise>
</xsl:choose>
<ns5:UsernameSuffix>
<xsl:text disable-output-escaping="no">.isecg.crmqa1</xsl:text>
</ns5:UsernameSuffix>
<ns5:EmailEncodingKey>
<xsl:text disable-output-escaping="no">ISO-8859-1</xsl:text>
</ns5:EmailEncodingKey>
<ns5:ProfileId>
<xsl:text disable-output-escaping="no">00eo00000011hjiAAA</xsl:text>
</ns5:ProfileId>
</ns5:ids>
</xsl:template>
</xsl:stylesheet>
