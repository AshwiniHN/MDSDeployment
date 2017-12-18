<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:xpath20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:client="http://xmlns.oracle.com/EAIBrokerProcessor" xmlns:ns1="http://www.siebel.com/xml/EAIBrokerTxnMessage" xmlns:ns2="http://www.siebel.com/xml/ISGSFAccountIO" xmlns:ns3="http://www.siebel.com/xml/ISG_SF_Opportunity_IO" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:med="http://schemas.oracle.com/mediator/xpath" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:plnk="http://schemas.xmlsoap.org/ws/2003/05/partner-link/" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap" exclude-result-prefixes="xsi xsl client ns1 plnk xsd xpath20 bpws mhdr oraext dvm hwf med ids xdk xref ora socket ldap">
<xsl:template match="/">
<ns1:TxnMessage>
<xsl:attribute name="ObjectType">
<xsl:text disable-output-escaping="no">OpportunityPartner</xsl:text>
</xsl:attribute>
<xsl:choose>
<xsl:when test="/client:EAIBrokerProcessorProcessRequest/client:TxnMessage/@Operation ='OPTY PRTNR Sync On'">
<xsl:attribute name="Operation">
<xsl:text disable-output-escaping="no">Association</xsl:text>
</xsl:attribute>
</xsl:when>
<xsl:when test="/client:EAIBrokerProcessorProcessRequest/client:TxnMessage/@Operation ='OPTY PRTNR Sync Del'">
<xsl:attribute name="Operation">
<xsl:text disable-output-escaping="no">Dissociation</xsl:text>
</xsl:attribute>
</xsl:when>
</xsl:choose>
<ns1:SourceType>
<xsl:value-of select="/client:EAIBrokerProcessorProcessRequest/@SourceType"/>
</ns1:SourceType>
<ns1:ListOfDocument>
<ns1:Document>
<ns1:DocumentMessage>
<xsl:copy-of select="/client:EAIBrokerProcessorProcessRequest/client:TxnMessage"/>
</ns1:DocumentMessage>
</ns1:Document>
</ns1:ListOfDocument>
<ns1:ListOfBlock>
<ns1:Block>
<ns1:BlockType>
<xsl:text disable-output-escaping="no">Opportunity</xsl:text>
</ns1:BlockType>
<ns1:BlockKey>
<xsl:value-of select="/client:EAIBrokerProcessorProcessRequest/client:TxnMessage/ns3:ListOfIsg_Sf_Opportunity_Io/ns3:Opportunity/ns3:Id"/>
</ns1:BlockKey>
</ns1:Block>
</ns1:ListOfBlock>
<ns1:ListOfDependency>
<ns1:Dependency>
<ns1:DependencyType>
<xsl:text disable-output-escaping="no">Opportunity</xsl:text>
</ns1:DependencyType>
<ns1:DependencyKey>
<xsl:value-of select="/client:EAIBrokerProcessorProcessRequest/client:TxnMessage/ns3:ListOfIsg_Sf_Opportunity_Io/ns3:Opportunity/ns3:Id"/>
</ns1:DependencyKey>
<ns1:Operation>
<xsl:text disable-output-escaping="no">Sync On</xsl:text>
</ns1:Operation>
</ns1:Dependency>
<ns1:Dependency>
<ns1:DependencyType>
<xsl:text disable-output-escaping="no">Account</xsl:text>
</ns1:DependencyType>
<ns1:DependencyKey>
<xsl:value-of select="/client:EAIBrokerProcessorProcessRequest/client:TxnMessage/ns3:ListOfIsg_Sf_Opportunity_Io/ns3:Opportunity/ns3:ListOfOpportunity_Organization/ns3:Opportunity_Organization[1]/ns3:Id"/>
</ns1:DependencyKey>
<ns1:Operation>
<xsl:text disable-output-escaping="no">Sync On</xsl:text>
</ns1:Operation>
</ns1:Dependency>
</ns1:ListOfDependency>
</ns1:TxnMessage>
</xsl:template>
</xsl:stylesheet>
