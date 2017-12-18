<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0"
                xmlns:s11="http://www.sumtotalsystems.com/sumtotal7/sumtotalws/SupplementalData/"
                xmlns:s5="http://www.sumtotalsystems.com/sumtotal7/sumtotalws/TimeConversion/"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/"
                xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable"
                xmlns:tm="http://microsoft.com/wsdl/mime/textMatching/"
                xmlns:s3="http://www.sumtotalsystems.com/sumtotal7/sumtotalws/DomainManagement/"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:s7="http://www.sumtotalsystems.com/sumtotal7/sumtotalws/JobManagement/"
                xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions"
                xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/"
                xmlns:s12="http://www.sumtotalsystems.com/sumtotal7/sumtotalws/RosterCompletion/"
                xmlns:s13="http://www.sumtotalsystems.com/sumtotal7/sumtotalws/ActivityManagement/"
                xmlns:plnk="http://schemas.xmlsoap.org/ws/2003/05/partner-link/"
                xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/"
                xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/"
                xmlns:ns0="urn:enterprise.soap.sforce.com"
                xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:ora="http://schemas.oracle.com/xpath/extension"
                xmlns:s6="http://www.sumtotalsystems.com/sumtotal7/sumtotalws/Authentication/"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                xmlns:s2="http://www.sumtotalsystems.com/sumtotal7/sumtotalws/UserManagement/"
                xmlns:s10="http://www.sumtotalsystems.com/sumtotal7/sumtotalws/CompetencyManagement/"
                xmlns:s14="http://www.sumtotalsystems.com/sumtotal7/sumtotalws/TranscriptManagement/"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:tns="http://www.sumtotalsystems.com/sumtotal7/sumtotalws/"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath"
                xmlns:med="http://schemas.oracle.com/mediator/xpath"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath"
                xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk"
                xmlns:s0="http://www.sumtotalsystems.com/sumtotal7/sumtotalbo/"				          
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:fns="urn:fault.enterprise.soap.sforce.com"
                xmlns:client="http://xmlns.oracle.com/LatestCode/XREFInterface/XREFMultiLookUp"
                xmlns:s8="http://www.sumtotalsystems.com/sumtotal7/sumtotalws/OrganizationManagement/"
                xmlns:http="http://schemas.xmlsoap.org/wsdl/http/"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:s15="http://www.sumtotalsystems.com/lcms/services/contentissuetracker/1.0/"
                xmlns:ns1="http://schemas.oracle.com/bpel/extension"
                xmlns:s9="http://www.sumtotalsystems.com/sumtotal7/sumtotalws/SkillManagement/"
                xmlns:ns2="http://xmlns.oracle.com/XREFInterface"
                xmlns:s16="http://www.sumtotalsystems.com/servicecommon/1.0/"
                xmlns:ens="urn:sobject.enterprise.soap.sforce.com"
                xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap"
                exclude-result-prefixes="xsl s11 s5 tm s3 s7 soap12 s12 s13 plnk soapenc soap mime wsdl s6 s2 s10 s14 tns s0 client s8 http xsd s15 ns1 s9 ns2 s16 ns0 fns xp20 bpws bpel bpm ora socket mhdr oraext dvm hwf med ids xdk xref ldap">
   <xsl:param name="Invoke_XREFInterfaceMultiLookUp_OutputVariable.XREFOutput"/>
   <xsl:template match="/">
      <ns0:create>
         <xsl:for-each select="/s12:GetRosterDetailByTypeResponse/s12:GetRosterDetailByTypeResult/s12:ActAttemptCollection/s12:ActAttempt">
            <xsl:variable name="position" select="position()"/>
            <xsl:variable name="accountId" select="s0:PrimaryOrgCode"/>
            <xsl:variable name="contactId" select="s0:EmpNo"/>
			<xsl:variable name="ActivityCode"  select="dvm:lookupValue('oramds:/apps/dvm/SumTotalActivityTypeCode.dvm','SUMTOTAL',s0:ActivityCode,'SALESFORCE','NoCode')"/>
            <xsl:if test="($Invoke_XREFInterfaceMultiLookUp_OutputVariable.XREFOutput/ns2:xrefinput/ns2:operation[(contains($accountId,ns2:refHostRowId) and (ns2:recType = 'Account'))]/ns2:hostRowId != '' and $Invoke_XREFInterfaceMultiLookUp_OutputVariable.XREFOutput/ns2:xrefinput/ns2:operation[(contains($accountId,ns2:refHostRowId) and (ns2:recType = 'Account'))]/ns2:hostRowId != 'Failed') and  ($Invoke_XREFInterfaceMultiLookUp_OutputVariable.XREFOutput/ns2:xrefinput/ns2:operation[(contains($contactId,ns2:refHostRowId)) and (ns2:recType = 'CONTACT')]/ns2:hostRowId != '' and $Invoke_XREFInterfaceMultiLookUp_OutputVariable.XREFOutput/ns2:xrefinput/ns2:operation[(contains($contactId,ns2:refHostRowId)) and (ns2:recType = 'CONTACT')]/ns2:hostRowId != 'Failed' )  and ($ActivityCode !='NoCode')">
               <ns0:sObjects>
                  <xsl:attribute name="xsi:type">
                     <xsl:text disable-output-escaping="no">ens:Certification__c</xsl:text>
                  </xsl:attribute>
                  <xsl:if test="$Invoke_XREFInterfaceMultiLookUp_OutputVariable.XREFOutput/ns2:xrefinput/ns2:operation[(contains($accountId,ns2:refHostRowId) and (ns2:recType = 'Account'))]/ns2:hostRowId != '' and $Invoke_XREFInterfaceMultiLookUp_OutputVariable.XREFOutput/ns2:xrefinput/ns2:operation[(contains($accountId,ns2:refHostRowId) and (ns2:recType = 'Account'))]/ns2:hostRowId != 'Failed' ">
                     <ens:Account_ID__c>
                        <xsl:value-of select="$Invoke_XREFInterfaceMultiLookUp_OutputVariable.XREFOutput/ns2:xrefinput/ns2:operation[(contains($accountId,ns2:refHostRowId)) and (ns2:recType = 'Account')]/ns2:hostRowId"/>
                     </ens:Account_ID__c>
                  </xsl:if>
                  <ens:Activity_Type__c>
                     <xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/SumTrainigCourseActivityTypeCode.dvm','TRAINING_COURSE',s0:ActivityCode,'ACTIVITY_TYPE','NoCode')"/>
                  </ens:Activity_Type__c>
                  <ens:Certification_Code__c>
                     <!--xsl:value-of select="s0:ActivityCode"/-->
					  <xsl:value-of select="$ActivityCode"/>
					 
                  </ens:Certification_Code__c>
                  <xsl:choose>
                     <xsl:when test='s0:ActivityType = "GP-Certification"'>
                        <ens:Completion_Date__c>
                           <xsl:value-of select='substring(xp20:subtract-dayTimeDuration-from-dateTime(s0:EndDate/s0:Value,concat("PT",substring(xp20:timezone-from-dateTime(xp20:current-dateTime()),3.0,1.0),"H")),0.0,20.0)'/>
                        </ens:Completion_Date__c>
                     </xsl:when>
                     <xsl:when test='s0:ActivityType = "CE Requirement Group"'>
                        <ens:Completion_Date__c>
                           <xsl:value-of select='substring(xp20:subtract-dayTimeDuration-from-dateTime(s0:EndDate/s0:Value,concat("PT",substring(xp20:timezone-from-dateTime(xp20:current-dateTime()),3.0,1.0),"H")),0.0,20.0)'/>
                        </ens:Completion_Date__c>
                     </xsl:when>
                  </xsl:choose>
                  <xsl:if test="$Invoke_XREFInterfaceMultiLookUp_OutputVariable.XREFOutput/ns2:xrefinput/ns2:operation[(contains($contactId,ns2:refHostRowId)) and (ns2:recType = 'CONTACT')]/ns2:hostRowId != '' and $Invoke_XREFInterfaceMultiLookUp_OutputVariable.XREFOutput/ns2:xrefinput/ns2:operation[(contains($contactId,ns2:refHostRowId)) and (ns2:recType = 'CONTACT')]/ns2:hostRowId != 'Failed' ">
                     <ens:Contact_ID__c>
                        <xsl:value-of select="$Invoke_XREFInterfaceMultiLookUp_OutputVariable.XREFOutput/ns2:xrefinput/ns2:operation[(contains($contactId,ns2:refHostRowId)) and (ns2:recType = 'CONTACT')]/ns2:hostRowId"/>
                     </ens:Contact_ID__c>
                  </xsl:if>
                  <xsl:choose>
                     <xsl:when test="starts-with($ActivityCode,'MCPS') or starts-with($ActivityCode,'SBIS')">
                        <xsl:choose>
                           <xsl:when test="s0:ExpirationDate/s0:Value">
                              <ens:Expiration_Date__c>
                                 <xsl:value-of select="s0:ExpirationDate/s0:Value"/>
                              </ens:Expiration_Date__c>
                           </xsl:when>
                        </xsl:choose>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:choose>
                           <xsl:when test='s0:ActivityType = "GP-Certification"'>
                              <xsl:choose>
                                 <xsl:when test="s0:EndDate/s0:Value">
                                    <ens:Expiration_Date__c>
                                       <xsl:value-of select='concat(substring(substring(xp20:subtract-dayTimeDuration-from-dateTime(s0:EndDate/s0:Value,concat("PT",substring(xp20:timezone-from-dateTime(xp20:current-dateTime()),3.0,1.0),"H")),0.0,20.0),1.0,4.0) + 1.0,"-12-31T23:59:59")'/>
                                    </ens:Expiration_Date__c>
                                 </xsl:when>
                              </xsl:choose>
                           </xsl:when>
                           <xsl:when test='s0:ActivityType = "CE Requirement Group"'>
                              <ens:Expiration_Date__c>
                                 <xsl:value-of select='concat(substring($ActivityCode,string-length($ActivityCode) - number(3.0),4.0),"-12-31T23:59:59")'/>
                              </ens:Expiration_Date__c>
                           </xsl:when>
                        </xsl:choose>
                     </xsl:otherwise>
                  </xsl:choose>
                  <ens:Transaction_Key__c>
                     <xsl:value-of select="s0:Id"/>
                  </ens:Transaction_Key__c>
                  <ens:Vendor__c>
                     <xsl:text disable-output-escaping="no">SumTotal</xsl:text>
                  </ens:Vendor__c>
				   
				  <ens:Certification_Status__c>
                     <xsl:text disable-output-escaping="no">Complete</xsl:text>
                  </ens:Certification_Status__c>
				
               </ns0:sObjects>
            </xsl:if>
         </xsl:for-each>
      </ns0:create>
   </xsl:template>
</xsl:stylesheet>
   
   
