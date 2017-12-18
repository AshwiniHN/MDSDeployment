<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ns1="http://www.intel.org/AccountContactAssociationProvider/v1.0" xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions" xmlns:client="http://xmlns.oracle.com/Application1/AccountContactAssociationProvider/AccountContactAssociation" xmlns:plnk="http://schemas.xmlsoap.org/ws/2003/05/partner-link/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:tns="urn:enterprise.soap.sforce.com" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:med="http://schemas.oracle.com/mediator/xpath" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns3="http://www.siebel.com/xml/ISGSFContactIO" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:ns5="http://xmlns.oracle.com/LatestCode/XREFInterface/XREFMultiLookUp" xmlns:fns="urn:fault.enterprise.soap.sforce.com" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:ns2="http://schemas.oracle.com/bpel/extension" xmlns:ns0="http://www.siebel.com/xml/ISGSFAccountIO" xmlns:ns4="http://xmlns.oracle.com/XREFInterface" xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap" exclude-result-prefixes="xsi xsl ns1 client plnk wsdl ns3 ns5 xsd ns2 ns0 ns4 soap tns fns ens xp20 bpws bpel bpm ora socket mhdr oraext dvm hwf med ids xdk xref ldap">
   <xsl:param name="InvokeXREFMultiLookUp_OutputVar.XREFOutput"/>
   <xsl:template match="/">
      <tns:create>
         <xsl:choose>
            <xsl:when test="/ns1:AccountContactAssociationRequest/ns1:CallerType='Contact'">
               <xsl:for-each select="/ns1:AccountContactAssociationRequest/ns1:Contact/ns3:ListOfIsgsfcontactio/ns3:Contact/ns3:ListOfAccount/ns3:Account">
                  <xsl:variable name="AccId" select="ns3:Id"/>
                  <xsl:variable name="ConId" select="/ns1:AccountContactAssociationRequest/ns1:Contact/ns3:ListOfIsgsfcontactio/ns3:Contact/ns3:Id"/>
                  <xsl:variable name="AccConId" select="concat($AccId,'++',$ConId)"/>
                  <xsl:if test="string-length($InvokeXREFMultiLookUp_OutputVar.XREFOutput/ns4:xrefinput/ns4:operation[ns4:refHostRowId = $AccId]/ns4:hostRowId)>0 and string-length($InvokeXREFMultiLookUp_OutputVar.XREFOutput/ns4:xrefinput/ns4:operation[ns4:refHostRowId = $ConId]/ns4:hostRowId)>0">
                     <tns:sObjects>
                        <xsl:attribute name="xsi:type">
                           <xsl:text disable-output-escaping="no">AccountContactRole</xsl:text>
                        </xsl:attribute>
                        <xsl:choose>
                           <xsl:when test="$InvokeXREFMultiLookUp_OutputVar.XREFOutput/ns4:xrefinput/ns4:operation[ns4:refHostRowId = $AccConId]/ns4:hostRowId != ''">
                              <tns:Id>
                                 <xsl:value-of select="$InvokeXREFMultiLookUp_OutputVar.XREFOutput/ns4:xrefinput/ns4:operation[ns4:refHostRowId = $AccConId]/ns4:hostRowId"/>
                              </tns:Id>
                           </xsl:when>
                           <xsl:otherwise>
                              <tns:Id/>
                           </xsl:otherwise>
                        </xsl:choose>
                        <tns:ContactId>
                           <xsl:value-of select="$InvokeXREFMultiLookUp_OutputVar.XREFOutput/ns4:xrefinput/ns4:operation[ns4:refHostRowId = $ConId]/ns4:hostRowId"/>
                        </tns:ContactId>
                        <tns:AccountId>
                           <xsl:value-of select="$InvokeXREFMultiLookUp_OutputVar.XREFOutput/ns4:xrefinput/ns4:operation[ns4:refHostRowId = $AccId]/ns4:hostRowId"/>
                        </tns:AccountId>
                     </tns:sObjects>
                  </xsl:if>
               </xsl:for-each>
            </xsl:when>
            <xsl:when test="/ns1:AccountContactAssociationRequest/ns1:CallerType='Account'">
               <xsl:for-each select="/ns1:AccountContactAssociationRequest/ns1:Account/ns0:ListOfIsgsfaccountio/ns0:Account/ns0:ListOfContact/ns0:Contact">
                  <xsl:variable name="AccId" select="/ns1:AccountContactAssociationRequest/ns1:Account/ns0:ListOfIsgsfaccountio/ns0:Account/ns0:Id"/>
                  <xsl:variable name="ConId" select="ns0:Id"/>
                  <xsl:variable name="AccConId" select="concat($AccId,'++',$ConId)"/>
                  <xsl:if test="string-length($InvokeXREFMultiLookUp_OutputVar.XREFOutput/ns4:xrefinput/ns4:operation[ns4:refHostRowId = $AccId]/ns4:hostRowId) > 0.0 and string-length($InvokeXREFMultiLookUp_OutputVar.XREFOutput/ns4:xrefinput/ns4:operation[ns4:refHostRowId = $ConId]/ns4:hostRowId) > 0">
                     <tns:sObjects>
                        <xsl:attribute name="xsi:type">
                           <xsl:text disable-output-escaping="no">AccountContactRole</xsl:text>
                        </xsl:attribute>
                        <xsl:choose>
                           <xsl:when test="$InvokeXREFMultiLookUp_OutputVar.XREFOutput/ns4:xrefinput/ns4:operation[ns4:refHostRowId = $AccConId]/ns4:hostRowId != ''">
                              <tns:Id>
                                 <xsl:value-of select="$InvokeXREFMultiLookUp_OutputVar.XREFOutput/ns4:xrefinput/ns4:operation[ns4:refHostRowId = $AccConId]/ns4:hostRowId"/>
                              </tns:Id>
                           </xsl:when>
                           <xsl:otherwise>
                              <tns:Id/>
                           </xsl:otherwise>
                        </xsl:choose>
                        <tns:ContactId>
                           <xsl:value-of select="$InvokeXREFMultiLookUp_OutputVar.XREFOutput/ns4:xrefinput/ns4:operation[ns4:refHostRowId = $ConId]/ns4:hostRowId"/>
                        </tns:ContactId>
                        <tns:AccountId>
                           <xsl:value-of select="$InvokeXREFMultiLookUp_OutputVar.XREFOutput/ns4:xrefinput/ns4:operation[ns4:refHostRowId = $AccId]/ns4:hostRowId"/>
                        </tns:AccountId>
                     </tns:sObjects>
                  </xsl:if>
               </xsl:for-each>
            </xsl:when>
         </xsl:choose>
      </tns:create>
   </xsl:template>
</xsl:stylesheet>
