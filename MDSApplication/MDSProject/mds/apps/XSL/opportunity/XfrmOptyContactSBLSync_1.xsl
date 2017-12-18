<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:xsdLocal1="http://www.siebel.com/xml/ISG_SF_Opportunity_IO/Data" xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ns0="http://xmlns.oracle.com/Salesforce/OpportunityFromSFtoSiebel/OpportunityContactSync" xmlns:xsdLocal2="http://www.siebel.com/xml/ISG_SF_Opportunity_IO/Id" xmlns:tns1="http://siebel.com/webservices" xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" xmlns:plnk="http://schemas.xmlsoap.org/ws/2003/05/partner-link/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:tns="urn:enterprise.soap.sforce.com" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:ns3="http://siebel.com/CustomUI" xmlns:xsdLocal3="http://www.siebel.com/xml/ISG_SF_Opportunity_IO/Query" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:med="http://schemas.oracle.com/mediator/xpath" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:client="http://xmlns.oracle.com/LatestCode/XREFInterface/XREFMultiLookUp" xmlns:fns="urn:fault.enterprise.soap.sforce.com" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:ns1="http://schemas.oracle.com/bpel/extension" xmlns:ns2="http://xmlns.oracle.com/XREFInterface" xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap" xmlns:ens="urn:sobject.enterprise.soap.sforce.com" exclude-result-prefixes="xsi xsl ns0 plnk soap tns wsdl client fns xsd ns1 ns2 ens xsdLocal1 xsdLocal2 tns1 soapenc ns3 xsdLocal3 xp20 bpws bpel bpm ora socket mhdr oraext dvm hwf med ids xdk xref ldap">
   <xsl:param name="XREF_MultiLookUp_process_OutputVariable.XREFOutput"/>
   <xsl:param name="inputVariable.payload"/>
   <xsl:template match="/">
      <xsdLocal1:ListOfIsg_Sf_Opportunity_Io>
         <xsdLocal1:Opportunity Operation="update">
            <xsdLocal1:Id>
               <xsl:value-of select="$inputVariable.payload/ns0:process/ns0:opOptyId"/>
            </xsdLocal1:Id>
           <xsdLocal1:ListOfOpportunity_ContactRole>
               <xsl:apply-templates select="/tns:queryResponse/tns:result/tns:records"/>
            </xsdLocal1:ListOfOpportunity_ContactRole>
         </xsdLocal1:Opportunity>
      </xsdLocal1:ListOfIsg_Sf_Opportunity_Io>
   </xsl:template>
   <xsl:template match="/tns:queryResponse/tns:result/tns:records">
      <xsl:variable name="ContactId" select="ens:ContactId"/>
      <xsl:choose>
         <xsl:when test="$XREF_MultiLookUp_process_OutputVariable.XREFOutput/ns2:xrefinput/ns2:operation[ns2:refHostRowId = $ContactId]/ns2:hostRowId != ''">
           <xsdLocal1:Opportunity_ContactRole>
             <xsdLocal1:Id>
               <xsl:value-of select="$XREF_MultiLookUp_process_OutputVariable.XREFOutput/ns2:xrefinput/ns2:operation[ns2:refHostRowId = $ContactId]/ns2:hostRowId"/>
             </xsdLocal1:Id>
             <xsdLocal1:ISGSFOptyContactRole>
               <xsl:value-of select="ens:Role"/>
             </xsdLocal1:ISGSFOptyContactRole>
           </xsdLocal1:Opportunity_ContactRole>
         </xsl:when>
      </xsl:choose>
   </xsl:template>
</xsl:stylesheet>
