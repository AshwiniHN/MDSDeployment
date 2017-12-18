<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0"
                xmlns:client="http://xmlns.oracle.com/HTTPServices/SAPHRFileCreateService/HRFileService"
                xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:xsdLocal="http://SFEndpoint/url"
                xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions"
                xmlns:plnk="http://schemas.xmlsoap.org/ws/2003/05/partner-link/"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:ora="http://schemas.oracle.com/xpath/extension"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                xmlns:ns1="http://www.denodo.com/restful/worker_lab/views/MFEWorkerData"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath"
                xmlns:med="http://schemas.oracle.com/mediator/xpath"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath"
                xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:ns3="http://schemas.oracle.com/bpel/extension"
                xmlns:bpmn="http://schemas.oracle.com/bpm/xpath"
                xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap"
                exclude-result-prefixes="xsi xsl client xsdLocal plnk wsdl ns1 xsd ns3 bpws xp20 bpel bpm ora socket mhdr oraext dvm hwf secure med ids xdk xref bpmn ldap">
  <xsl:template match="/">
    <xsdLocal:ServiceDetails>
	  <xsdLocal:SBLEndpointURL>
        <xsl:text disable-output-escaping="no">http://dnvdevwebosbl1.corp.nai.org/eai_enu/start.swe?SWEExtSource=WebService&amp;SWEExtCmd=Execute&amp;UserName=SFAGENT&amp;Password=Insight-2013</xsl:text>
      </xsdLocal:SBLEndpointURL>
      <xsdLocal:username>
        <xsl:text disable-output-escaping="no">intuser@mcafee.com.isecg.crmdev1</xsl:text>
      </xsdLocal:username>
      <xsdLocal:password>
        <xsl:text disable-output-escaping="no">iu1115@crmdev18Z0pg5VCzW11c4RJj5gCATIre</xsl:text>
      </xsdLocal:password>
    </xsdLocal:ServiceDetails>
  </xsl:template>
</xsl:stylesheet>