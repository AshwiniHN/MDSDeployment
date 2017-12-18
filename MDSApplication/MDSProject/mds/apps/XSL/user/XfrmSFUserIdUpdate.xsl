<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/"
                xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions"
                xmlns:plnk="http://schemas.xmlsoap.org/ws/2003/05/partner-link/"
                xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/"
                xmlns:tns="urn:enterprise.soap.sforce.com"
                xmlns:ora="http://schemas.oracle.com/xpath/extension"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath"
                xmlns:med="http://schemas.oracle.com/mediator/xpath"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath"
                xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:fns="urn:fault.enterprise.soap.sforce.com"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:bpmn="http://schemas.oracle.com/bpm/xpath"
                xmlns:ns2="http://xmlns.oracle.com/XREFInterface"
                xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap"
                xmlns:ens="urn:sobject.enterprise.soap.sforce.com"
                exclude-result-prefixes="xsi xsl plnk xsd ns2 soap tns fns ens xp20 bpws bpel bpm ora socket mhdr oraext dvm hwf med ids xdk xref bpmn ldap">
  <xsl:param name="sFederationId"/>
  <xsl:param name="userTpe"/>
  <xsl:param name="FinalUserName"/>
  <xsl:template match="/">
    <tns:create>
      <xsl:for-each select="/ns2:xrefinput/ns2:operation">
        <tns:sObjects xsi:type="urn:User">
          <ens:Legacy_Id__c>
            <xsl:value-of select="ns2:hostRowId"/>
          </ens:Legacy_Id__c>
          <ens:Id>
            <xsl:value-of select="ns2:refHostRowId"/>
          </ens:Id>
          <ens:Legacy_User_Id__c>
            <xsl:value-of select="ns2:SFHostId"/>
          </ens:Legacy_User_Id__c>
		  <xsl:if test="$userTpe = 'PowerPartner'">
		  <ens:Username>
            <xsl:value-of select="$FinalUserName"/>
          </ens:Username>
		  </xsl:if>
          <xsl:choose>
            <xsl:when test="$userTpe = 'PowerPartner'">
              <xsl:choose>
                <xsl:when test="$sFederationId=''">
                  <ens:FederationIdentifier>
                    <xsl:value-of select="xp20:upper-case(ns2:SFHostId)"/>
                  </ens:FederationIdentifier>
                </xsl:when>
                <xsl:otherwise>
                  <ens:FederationIdentifier>
                    <xsl:value-of select="xp20:upper-case($sFederationId)"/>
                  </ens:FederationIdentifier>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
              <xsl:choose>
                <xsl:when test="$sFederationId=''">
                  <ens:FederationIdentifier>
                    <xsl:value-of select="xp20:lower-case(ns2:SFHostId)"/>
                  </ens:FederationIdentifier>
                </xsl:when>
                <xsl:otherwise>
                  <ens:FederationIdentifier>
                    <xsl:value-of select="xp20:lower-case($sFederationId)"/>
                  </ens:FederationIdentifier>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:otherwise>


          </xsl:choose>
          <ens:Sync_Status__c>
            <xsl:text disable-output-escaping="no">Success</xsl:text>
          </ens:Sync_Status__c>
        </tns:sObjects>
      </xsl:for-each>
    </tns:create>
  </xsl:template>
</xsl:stylesheet>
