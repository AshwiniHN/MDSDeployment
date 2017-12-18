<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ns6="http://xmlns.oracle.com/UpdateBrokerEventStatus" xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions" xmlns:s12="http://www.sumtotalsystems.com/sumtotal7/sumtotalws/RosterCompletion/" xmlns:plnk="http://schemas.xmlsoap.org/ws/2003/05/partner-link/" xmlns:ns3="urn:enterprise.soap.sforce.com" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:ns5="http://www.siebel.com/xml/UpdateProcessedEventsInEAIBroker" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:med="http://schemas.oracle.com/mediator/xpath" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:client="http://xmlns.oracle.com/ProcessEventsFromBroker" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:s0="http://www.sumtotalsystems.com/sumtotal7/sumtotalbo/" xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:ns4="http://xmlns.oracle.com/LatestCode/XREFInterface/XREFMultiLookUp" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:ns2="http://schemas.oracle.com/bpel/extension" xmlns:ns1="http://www.siebel.com/xml/EventsToProcessFromBroker" xmlns:ns0="http://xmlns.oracle.com/XREFInterface" xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap" xmlns:s1="http://www.sumtotalsystems.com/sumtotal7/sumtotalbo/" exclude-result-prefixes="xsi xsl plnk ns3 wsdl client ns4 xsd ns2 ns1 ns0 ns6 ns5 xp20 bpws bpel bpm ora socket mhdr oraext dvm hwf med ids xdk xref ldap">
<xsl:param name="Invoke_XREFInterfaceMultiLookUp_OutputVariable.XREFOutput"/>
<xsl:template match="/">
<ns6:UpdateBrokerEventStatusProcessRequest>
<ns6:BrokerEvents>
<ns5:ListOfEvent>
<xsl:for-each select="/client:ProcessEventsFromBrokerResponse/client:EventsFromEAIBrokerToProcess/ns1:ListOfEvent/ns1:Event">
<xsl:variable name="eventId" select="ns1:EventId"/>
<xsl:variable name="eventId1" select="ns1:EventId"/>
<xsl:variable name="contactId" select="/client:ProcessEventsFromBrokerResponse/client:EventsFromEAIBrokerToProcess/ns1:ListOfEvent/ns1:Event[ns1:EventId = $eventId]/ns1:Document/s12:GetRosterDetailByTypeResult/s12:ActAttemptCollection/s12:ActAttempt/s0:EmpNo"/>
<xsl:variable name="accountId" select="/client:ProcessEventsFromBrokerResponse/client:EventsFromEAIBrokerToProcess/ns1:ListOfEvent/ns1:Event[ns1:EventId = $eventId]/ns1:Document/s12:GetRosterDetailByTypeResult/s12:ActAttemptCollection/s12:ActAttempt/s0:PrimaryOrgCode"/>
<xsl:variable name="xRefAccountId" select="$Invoke_XREFInterfaceMultiLookUp_OutputVariable.XREFOutput/ns0:xrefinput/ns0:operation[contains(/client:ProcessEventsFromBrokerResponse/client:EventsFromEAIBrokerToProcess/ns1:ListOfEvent/ns1:Event[ns1:EventId = $eventId]/ns1:Document/s12:GetRosterDetailByTypeResult/s12:ActAttemptCollection/s12:ActAttempt/s0:PrimaryOrgCode,ns0:refHostRowId)]/ns0:hostRowId"/>
<xsl:variable name="xRefContactId" select="$Invoke_XREFInterfaceMultiLookUp_OutputVariable.XREFOutput/ns0:xrefinput/ns0:operation[(contains(/client:ProcessEventsFromBrokerResponse/client:EventsFromEAIBrokerToProcess/ns1:ListOfEvent/ns1:Event[ns1:EventId = $eventId]/ns1:Document/s12:GetRosterDetailByTypeResult/s12:ActAttemptCollection/s12:ActAttempt/s0:EmpNo, ns0:refHostRowId) and (ns0:recType = &quot;CONTACT&quot;))]/ns0:hostRowId"/>
<xsl:choose>
<xsl:when test="((($xRefContactId != '') and ($xRefContactId != 'Failed')) and (($xRefAccountId != '') and ($xRefAccountId != 'Failed')))"/>
<xsl:otherwise>
<ns5:Event>
<ns5:EventId>
<xsl:value-of select="ns1:EventId"/>
</ns5:EventId>
<ns5:StatusId>
<xsl:text disable-output-escaping="no">900</xsl:text>
</ns5:StatusId>
<ns5:ErrorDescription>
<xsl:value-of select="concat(&quot;EventId=&quot;,$eventId,&quot;  XREFAccountId= &quot;,$xRefAccountId,&quot;  XREFContactId=&quot;,$xRefContactId,&quot;  ContactId=&quot;,$contactId,&quot;   AccountId=&quot;, $accountId,&quot;failure in XREF&quot;)"/>
</ns5:ErrorDescription>
</ns5:Event>
</xsl:otherwise>
</xsl:choose>
</xsl:for-each>
</ns5:ListOfEvent>
</ns6:BrokerEvents>
</ns6:UpdateBrokerEventStatusProcessRequest>
</xsl:template>
</xsl:stylesheet>
