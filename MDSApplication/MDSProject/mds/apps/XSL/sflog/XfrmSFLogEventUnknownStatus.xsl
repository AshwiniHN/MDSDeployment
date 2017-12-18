<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:ns2="http://xmlns.oracle.com/pcbpel/adapter/db/sp/getSFLogEvents" xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable" xmlns:ns3="http://insecg-salesforce/sflogeventsobjects" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions" xmlns:ns1="http://SFLogQueryStrings" xmlns:ns5="http://paramsvar" xmlns:plt="http://schemas.xmlsoap.org/ws/2003/05/partner-link/" xmlns:ns4="urn:enterprise.soap.sforce.com" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:tns="http://xmlns.oracle.com/pcbpel/adapter/db/SalesforceProject/ProcessSFLogEvents/pollSourceObj" xmlns:top="http://xmlns.oracle.com/pcbpel/adapter/db/top/pollSourceObj" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:med="http://schemas.oracle.com/mediator/xpath" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:ns6="http://xmlns.oracle.com/pcbpel/adapter/db/top/updateSFLogStatus" xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:ns0="http://xmlns.oracle.com/pcbpel/adapter/db/SalesforceProject/ProcessSFLogEvents/updateSFLogStatus" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:bpmn="http://schemas.oracle.com/bpm/xpath" xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap" exclude-result-prefixes="xsi xsl ns2 ns3 ns1 ns5 plt ns4 wsdl tns top xsd ns6 ns0 xp20 bpws bpel bpm ora socket mhdr oraext dvm hwf med ids xdk xref bpmn ldap">
   <xsl:template match="/">
      <ns6:SflogCollection>
         <xsl:for-each select="/ns3:SFLogObjectEvents/ns3:unknownobject">
            <ns6:Sflog>
               <ns6:sflogid>
                  <xsl:value-of select="ns3:SFLOGID"/>
               </ns6:sflogid>
               <ns6:sfeventid>
                  <xsl:value-of select="ns3:SFEVENTID"/>
               </ns6:sfeventid>
               <ns6:statusid>
                  <xsl:text disable-output-escaping="no">1100</xsl:text>
               </ns6:statusid>
               <ns6:errormessage>
                  <xsl:text disable-output-escaping="no">Object Type or Operation is not supported</xsl:text>
               </ns6:errormessage>
               <ns6:brokereventid>
                  <xsl:text disable-output-escaping="no">1111111</xsl:text>
               </ns6:brokereventid>
            </ns6:Sflog>
         </xsl:for-each>
      </ns6:SflogCollection>
   </xsl:template>
</xsl:stylesheet>
