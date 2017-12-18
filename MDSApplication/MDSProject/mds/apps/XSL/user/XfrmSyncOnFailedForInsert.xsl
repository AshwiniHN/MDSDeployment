<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ns2="http://SalesforceIntegration/User_SyncSblId" xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions" xmlns:plnk="http://schemas.xmlsoap.org/ws/2003/05/partner-link/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:ns0="http://xmlns.oracle.com/Siebel_Salesforce/InsertUserSFProvABCSImpl/InsertUserSFBPELProcess" xmlns:client="http://xmlns.oracle.com/Siebel_Salesforce/SyncOnUserSFProvABCSImpl/SyncOnUserSFProvABCSImpl" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:ns4="http://SalesforceIntegration/User_InsertSblId" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:med="http://schemas.oracle.com/mediator/xpath" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:ns3="http://schemas.oracle.com/bpel/extension" xmlns:ns1="http://www.siebel.com/xml/ISG%20SF%20Employee%20IO" xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap" exclude-result-prefixes="xsi xsl ns2 plnk wsdl ns0 client ns4 xsd ns3 ns1 xp20 bpws bpel bpm ora socket mhdr oraext dvm hwf med ids xdk xref ldap">
   <xsl:param name="Invoke_InsertUserSFProvABCSImpl_OutputVariable.InsertResponse"/>
   <xsl:template match="/">
      <ns1:ListOfIsgSfEmployeeIo>
         <ns1:Employee>
            <ns1:Id>
               <xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgSfEmployeeIo/ns1:Employee/ns1:Id"/>
            </ns1:Id>
            <ns1:SyncDescription>
               <xsl:value-of select="$Invoke_InsertUserSFProvABCSImpl_OutputVariable.InsertResponse/ns0:processResponse/ns0:ErrMsg"/>
            </ns1:SyncDescription>
            <ns1:SyncStatus>
               <xsl:text disable-output-escaping="no">SYNC_FAILED</xsl:text>
            </ns1:SyncStatus>
         </ns1:Employee>
      </ns1:ListOfIsgSfEmployeeIo>
   </xsl:template>
</xsl:stylesheet>
