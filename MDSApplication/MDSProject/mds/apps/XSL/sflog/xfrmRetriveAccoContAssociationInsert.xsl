<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:ns2="http://xmlns.oracle.com/pcbpel/adapter/db/sp/getSFLogEvents" xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable" xmlns:ns3="http://insecg-salesforce/sflogeventsobjects" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions" xmlns:ns1="http://SFLogQueryStrings" xmlns:plt="http://schemas.xmlsoap.org/ws/2003/05/partner-link/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:ns0="urn:enterprise.soap.sforce.com" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:tns="http://xmlns.oracle.com/pcbpel/adapter/db/SalesforceProject/ProcessSFLogEvents/pollSourceObj" xmlns:top="http://xmlns.oracle.com/pcbpel/adapter/db/top/pollSourceObj" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:secure="http://www.oracle.com/XSL/Transform/java/com.Securedata" xmlns:med="http://schemas.oracle.com/mediator/xpath" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:fns="urn:fault.enterprise.soap.sforce.com" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:bpmn="http://schemas.oracle.com/bpm/xpath" xmlns:ens="urn:sobject.enterprise.soap.sforce.com" xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap" exclude-result-prefixes="xsi xsl ns2 ns3 ns1 plt wsdl tns top xsd soap ns0 fns ens bpws xp20 bpel bpm ora socket mhdr oraext dvm hwf secure med ids xdk xref bpmn ldap">
   <xsl:template match="/">
      <ns0:retrieve>
         <ns0:fieldList>
            <xsl:text disable-output-escaping="no">AccountId,ContactId,Role</xsl:text>
         </ns0:fieldList>
         <ns0:sObjectType>
            <xsl:text disable-output-escaping="no">AccountContactRole</xsl:text>
         </ns0:sObjectType>
         <xsl:for-each select="/ns3:SFLogObjectEvents/ns3:accountInsertEvents">
            <ns0:ids>
               <xsl:value-of select="ns3:OBJECTID"/>
            </ns0:ids>
         </xsl:for-each>
      </ns0:retrieve>
   </xsl:template>
</xsl:stylesheet>
