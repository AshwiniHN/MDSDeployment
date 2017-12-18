<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ns0="http://www.example.org" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:client="http://xmlns.oracle.com/ProcessEventsFromBroker" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:med="http://schemas.oracle.com/mediator/xpath" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions" xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:plnk="http://schemas.xmlsoap.org/ws/2003/05/partner-link/" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:ns2="http://schemas.oracle.com/bpel/extension" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:ns1="http://www.siebel.com/xml/EventsToProcessFromBroker" xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap" exclude-result-prefixes="xsi xsl ns0 client plnk xsd ns2 ns1 bpws xp20 mhdr bpel oraext dvm hwf med ids bpm xdk xref ora socket ldap">
<xsl:param name="FlowNSUMTotalToSFTxnProcessor_Variable"/>
<xsl:template match="/">
<xsl:variable name="count" select="$FlowNSUMTotalToSFTxnProcessor_Variable "/>
<client:ProcessEventsFromBrokerResponse>
<client:EventsFromEAIBrokerToProcess>
<ns1:ListOfEvent>
<xsl:for-each select="/client:ProcessEventsFromBrokerResponse/client:EventsFromEAIBrokerToProcess/ns1:ListOfEvent/ns1:Event">
<xsl:if test="(position() > (0.0 + (($count - 1.0) * 2))) and (position() &lt;= (2 + (($count - 1.0) * 2)))">
<xsl:copy-of select="."/>
</xsl:if>
</xsl:for-each>
</ns1:ListOfEvent>
</client:EventsFromEAIBrokerToProcess>
</client:ProcessEventsFromBrokerResponse>
</xsl:template>
</xsl:stylesheet>
