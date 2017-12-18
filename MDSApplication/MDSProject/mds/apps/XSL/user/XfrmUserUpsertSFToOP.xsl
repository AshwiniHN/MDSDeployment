<xsl:stylesheet version="1.0"
                exclude-result-prefixes="xsi xsl soap tns fns xsd ens soapenc ns0 xsdLocal1 xp20 bpws bpel bpm ora socket mhdr oraext dvm hwf med ids xdk xref ldap"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/"
                xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions"
                xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/"
                xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/"
                xmlns:ora="http://schemas.oracle.com/xpath/extension"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                xmlns:ns0="http://siebel.com/CustomUI"
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
                xmlns:xsdLocal1="http://www.siebel.com/xml/ISG%20SF%20Employee%20IO"
                xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap"
                xmlns:tns="urn:sobject.enterprise.soap.sforce.com"
                xmlns:ens="urn:enterprise.soap.sforce.com">
   <xsl:template match="/">
      <xsdLocal1:ListOfIsgSfEmployeeIo>
         <xsdLocal1:Employee>
            <xsl:if test="/ens:retrieveResponse/ens:result/tns:MobilePhone!=''">
               <xsdLocal1:CellPhone>
                  <xsl:value-of select="/ens:retrieveResponse/ens:result/tns:MobilePhone"/>
               </xsdLocal1:CellPhone>
            </xsl:if>
            <xsl:if test="/ens:retrieveResponse/ens:result/tns:Email!=''">
               <xsdLocal1:EMailAddr>
                  <xsl:value-of select="/ens:retrieveResponse/ens:result/tns:Email"/>
               </xsdLocal1:EMailAddr>
            </xsl:if>
            <xsl:if test="/ens:retrieveResponse/ens:result/tns:Fax!=''">
               <xsdLocal1:Fax>
                  <xsl:value-of select="/ens:retrieveResponse/ens:result/tns:Fax"/>
               </xsdLocal1:Fax>
            </xsl:if>
            <xsl:if test="/ens:retrieveResponse/ens:result/tns:FirstName!=''">
               <xsdLocal1:FirstName>
                  <xsl:value-of select="/ens:retrieveResponse/ens:result/tns:FirstName"/>
               </xsdLocal1:FirstName>
            </xsl:if>
            <xsdLocal1:SFId>
               <xsl:value-of select="/ens:retrieveResponse/ens:result/tns:Id"/>
            </xsdLocal1:SFId>
            <xsl:choose>
               <xsl:when test="/ens:retrieveResponse/ens:result/tns:Legacy_User_Id__c!=''">
                  <xsdLocal1:LoginName>
                     <xsl:value-of select="/ens:retrieveResponse/ens:result/tns:Legacy_User_Id__c"/>
                  </xsdLocal1:LoginName>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:if test="/ens:retrieveResponse/ens:result/tns:UserType!=''">
                     <xsl:choose>
                        <xsl:when test="/ens:retrieveResponse/ens:result/tns:UserType = 'PowerPartner'">
                           <xsdLocal1:LoginName>
                              <xsl:value-of select="/ens:retrieveResponse/ens:result/tns:Email"/>
                           </xsdLocal1:LoginName>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsdLocal1:LoginName>
                              <xsl:value-of select="translate(normalize-space(concat(substring(/ens:retrieveResponse/ens:result/tns:FirstName,1,1),/ens:retrieveResponse/ens:result/tns:LastName)),' ','')"/>
                           </xsdLocal1:LoginName>
                        </xsl:otherwise>
                     </xsl:choose>
                  </xsl:if>
               </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="/ens:retrieveResponse/ens:result/tns:Title!=''">
               <xsdLocal1:JobTitle>
                  <xsl:value-of select="/ens:retrieveResponse/ens:result/tns:Title"/>
               </xsdLocal1:JobTitle>
            </xsl:if>
            <xsl:if test="/ens:retrieveResponse/ens:result/tns:LastName != ''">
               <xsl:choose>
                  <xsl:when test="string-length(/ens:retrieveResponse/ens:result/tns:LastName) > 50">
                     <xsdLocal1:LastName>
                        <xsl:value-of select="substring(/ens:retrieveResponse/ens:result/tns:LastName,1,50)"/>
                     </xsdLocal1:LastName>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsdLocal1:LastName>
                        <xsl:value-of select="/ens:retrieveResponse/ens:result/tns:LastName"/>
                     </xsdLocal1:LastName>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:if>
            <xsl:if test="/ens:retrieveResponse/ens:result/tns:ManagerId != ''">
               <xsdLocal1:ManagerId>
                  <xsl:value-of select="/ens:retrieveResponse/ens:result/tns:ManagerId"/>
               </xsdLocal1:ManagerId>
            </xsl:if>
            <xsl:if test="/ens:retrieveResponse/ens:result/tns:EmployeeNumber!=''">
               <xsdLocal1:HRMId>
                  <xsl:value-of select="/ens:retrieveResponse/ens:result/tns:EmployeeNumber"/>
               </xsdLocal1:HRMId>
            </xsl:if>
            <xsl:if test="/ens:retrieveResponse/ens:result/tns:UserType!=''">
               <xsl:choose>
                  <xsl:when test="/ens:retrieveResponse/ens:result/tns:UserType = 'PowerPartner'">
                     <xsl:if test="/ens:retrieveResponse/ens:result/tns:Partner_Contact_Active__c!=''">
                        <xsl:choose>
                           <xsl:when test="/ens:retrieveResponse/ens:result/tns:Partner_Contact_Active__c = 'true'">
                              <xsdLocal1:ActiveFlag>
                                 <xsl:text disable-output-escaping="no">Y</xsl:text>
                              </xsdLocal1:ActiveFlag>
                           </xsl:when>
                           <xsl:otherwise>
                              <xsdLocal1:ActiveFlag>
                                 <xsl:text disable-output-escaping="no">N</xsl:text>
                              </xsdLocal1:ActiveFlag>
                           </xsl:otherwise>
                        </xsl:choose>
                     </xsl:if>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:if test="/ens:retrieveResponse/ens:result/tns:IsActive!=''">
                        <xsl:choose>
                           <xsl:when test="/ens:retrieveResponse/ens:result/tns:IsActive = 'true'">
                              <xsdLocal1:ActiveFlag>
                                 <xsl:text disable-output-escaping="no">Y</xsl:text>
                              </xsdLocal1:ActiveFlag>
                           </xsl:when>
                           <xsl:otherwise>
                              <xsdLocal1:ActiveFlag>
                                 <xsl:text disable-output-escaping="no">N</xsl:text>
                              </xsdLocal1:ActiveFlag>
                           </xsl:otherwise>
                        </xsl:choose>
                     </xsl:if>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:if>
            <xsl:if test="/ens:retrieveResponse/ens:result/tns:UserType!=''">
               <xsl:choose>
                  <xsl:when test="/ens:retrieveResponse/ens:result/tns:UserType = 'PowerPartner'">
                     <xsl:if test="/ens:retrieveResponse/ens:result/tns:IsActive!=''">
                        <xsl:choose>
                           <xsl:when test="/ens:retrieveResponse/ens:result/tns:IsActive = 'true'">
                              <xsdLocal1:ISGSFActiveFlag>
                                 <xsl:text disable-output-escaping="no">Y</xsl:text>
                              </xsdLocal1:ISGSFActiveFlag>
                           </xsl:when>
                           <xsl:otherwise>
                              <xsdLocal1:ISGSFActiveFlag>
                                 <xsl:text disable-output-escaping="no">N</xsl:text>
                              </xsdLocal1:ISGSFActiveFlag>
                           </xsl:otherwise>
                        </xsl:choose>
                     </xsl:if>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:if test="/ens:retrieveResponse/ens:result/tns:IsActive!=''">
                        <xsl:choose>
                           <xsl:when test="/ens:retrieveResponse/ens:result/tns:IsActive = 'true'">
                              <xsdLocal1:ISGSFActiveFlag>
                                 <xsl:text disable-output-escaping="no">Y</xsl:text>
                              </xsdLocal1:ISGSFActiveFlag>
                           </xsl:when>
                           <xsl:otherwise>
                              <xsdLocal1:ISGSFActiveFlag>
                                 <xsl:text disable-output-escaping="no">N</xsl:text>
                              </xsdLocal1:ISGSFActiveFlag>
                           </xsl:otherwise>
                        </xsl:choose>
                     </xsl:if>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:if>
            <xsl:choose>
               <xsl:when test="/ens:retrieveResponse/ens:result/tns:Legacy_Id__c != ''">
                  <xsdLocal1:Id>
                     <xsl:value-of select="/ens:retrieveResponse/ens:result/tns:Legacy_Id__c"/>
                  </xsdLocal1:Id>
               </xsl:when>
               <xsl:otherwise>
                  <xsdLocal1:Id/>
               </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="/ens:retrieveResponse/ens:result/tns:DefaultCurrencyIsoCode!=''">
               <xsdLocal1:CurrencyCode>
                  <xsl:text disable-output-escaping="no">USD</xsl:text>
               </xsdLocal1:CurrencyCode>
            </xsl:if>
            <!--<xsl:if test="/ens:retrieveResponse/ens:result/tns:Geo__c!=''">
               <xsdLocal1:Geo>
                  <xsl:value-of select="/ens:retrieveResponse/ens:result/tns:Geo__c"/>
               </xsdLocal1:Geo>
            </xsl:if>-->
           <!-- <xsl:if test="/ens:retrieveResponse/ens:result/tns:Region__c!=''">
               <xsdLocal1:SubRegion>
                  <xsl:value-of select="/ens:retrieveResponse/ens:result/tns:Region__c"/>
               </xsdLocal1:SubRegion>
            </xsl:if>-->
            <xsl:if test="/ens:retrieveResponse/ens:result/tns:Sync_Description__c!=''">
               <xsdLocal1:SyncDescription>
                  <xsl:value-of select="/ens:retrieveResponse/ens:result/tns:Sync_Description__c"/>
               </xsdLocal1:SyncDescription>
            </xsl:if>
            <xsl:if test="/ens:retrieveResponse/ens:result/tns:Middle_Name__c!=''">
               <xsdLocal1:MiddleName>
                  <xsl:value-of select="/ens:retrieveResponse/ens:result/tns:Middle_Name__c"/>
               </xsdLocal1:MiddleName>
            </xsl:if>
            <xsl:if test="/ens:retrieveResponse/ens:result/tns:Phone!=''">
               <xsdLocal1:Phone>
                  <xsl:value-of select="/ens:retrieveResponse/ens:result/tns:Phone"/>
               </xsdLocal1:Phone>
            </xsl:if>
            <xsl:if test="/ens:retrieveResponse/ens:result/tns:LanguageLocaleKey">
               <xsdLocal1:PreferredLanguageCode>
                  <xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/LanguageCodes_SFToSBL.dvm','Salesforce',/ens:retrieveResponse/ens:result/tns:LanguageLocaleKey,'Siebel','ENU')"/>
               </xsdLocal1:PreferredLanguageCode>
            </xsl:if>
			<xsl:if test="/ens:retrieveResponse/ens:result/tns:Preferred_Language__c">
               <xsdLocal1:PreferredLanguageId>
                  <xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/PreferredLanguageCode.dvm','Salesforce',/ens:retrieveResponse/ens:result/tns:Preferred_Language__c,'Siebel','ENU')"/>
               </xsdLocal1:PreferredLanguageId>
            </xsl:if>
            <xsl:if test="/ens:retrieveResponse/ens:result/tns:Terminated_Date__c!=''">
               <xsdLocal1:TerminationDate>
                  <xsl:value-of select="/ens:retrieveResponse/ens:result/tns:Terminated_Date__c"/>
               </xsdLocal1:TerminationDate>
            </xsl:if>
            <xsl:if test="/ens:retrieveResponse/ens:result/tns:CreatedDate!=''">
               <xsdLocal1:SFCreated>
                  <xsl:value-of select="/ens:retrieveResponse/ens:result/tns:CreatedDate"/>
               </xsdLocal1:SFCreated>
            </xsl:if>
            <xsl:if test="/ens:retrieveResponse/ens:result/tns:LastModifiedDate!=''">
               <xsdLocal1:SFUpdated>
                  <xsl:value-of select="/ens:retrieveResponse/ens:result/tns:LastModifiedDate"/>
               </xsdLocal1:SFUpdated>
            </xsl:if>
            <xsl:if test="/ens:retrieveResponse/ens:result/tns:CreatedById!=''">
               <xsdLocal1:SFCreatedBy>
                  <xsl:value-of select="/ens:retrieveResponse/ens:result/tns:CreatedById"/>
               </xsdLocal1:SFCreatedBy>
            </xsl:if>
            <xsl:if test="/ens:retrieveResponse/ens:result/tns:LastModifiedById != ''">
               <xsdLocal1:SFUpdatedBy>
                  <xsl:value-of select="/ens:retrieveResponse/ens:result/tns:LastModifiedById"/>
               </xsdLocal1:SFUpdatedBy>
            </xsl:if>
            <xsl:if test="/ens:retrieveResponse/ens:result/tns:TimeZoneSidKey!=''">
               <xsdLocal1:TimeZoneName>
                  <xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/TimeZoneCodeDVMSFToSBL.dvm','SalesForce',/ens:retrieveResponse/ens:result/tns:TimeZoneSidKey,'Siebel','(GMT-08:00) Pacific Time (US &amp; Canada); Tijuana')"/>
               </xsdLocal1:TimeZoneName>
            </xsl:if>
            <xsl:if test="/ens:retrieveResponse/ens:result/tns:City and /ens:retrieveResponse/ens:result/tns:CountryCode and /ens:retrieveResponse/ens:result/tns:PostalCode and /ens:retrieveResponse/ens:result/tns:Address_Street1__c">
               <xsdLocal1:ListOfEmployee_PersonalAddress>
                  <xsdLocal1:Employee_PersonalAddress IsPrimaryMVG="Y">
                     <xsdLocal1:PersonalAddressId>
                        <xsl:text disable-output-escaping="no"></xsl:text>
                     </xsdLocal1:PersonalAddressId>
                     <xsl:if test="/ens:retrieveResponse/ens:result/tns:City!=''">
                        <xsdLocal1:PersonalCity>
                           <xsl:value-of select="/ens:retrieveResponse/ens:result/tns:City"/>
                        </xsdLocal1:PersonalCity>
                     </xsl:if>
                     <xsl:if test="/ens:retrieveResponse/ens:result/tns:CountryCode!=''">
                        <xsdLocal1:PersonalCountry>
                           <xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/Country_SFToSBL.dvm','SALESFORCE',/ens:retrieveResponse/ens:result/tns:CountryCode,'SBL','NoCode')"/>
                        </xsdLocal1:PersonalCountry>
                     </xsl:if>
                     <xsl:if test="/ens:retrieveResponse/ens:result/tns:PostalCode!=''">
                        <xsdLocal1:PersonalPostalCode>
                           <xsl:value-of select="/ens:retrieveResponse/ens:result/tns:PostalCode"/>
                        </xsdLocal1:PersonalPostalCode>
                     </xsl:if>
                     <xsl:if test="/ens:retrieveResponse/ens:result/tns:State!=''">
					 <xsl:choose>
					 <xsl:when test="string-length(dvm:lookupValue('oramds:/apps/dvm/State_SFToSBL.dvm','SALESFORCE',concat(/ens:retrieveResponse/ens:result/tns:State,'-'/ens:retrieveResponse/ens:result/tns:CountryCode),'SBL','NoCode')) &lt;= 10">
                        <xsdLocal1:PersonalState>
						  <xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/State_SFToSBL.dvm','SALESFORCE',concat(/ens:retrieveResponse/ens:result/tns:State,'-'/ens:retrieveResponse/ens:result/tns:CountryCode),'SBL','NoCode')"/>
                        </xsdLocal1:PersonalState>
						</xsl:when>
						<xsl:otherwise>
						</xsl:otherwise>
						</xsl:choose>
                     </xsl:if>
                     <xsl:if test="/ens:retrieveResponse/ens:result/tns:Address_Street1__c">
                        <xsdLocal1:PersonalStreetAddress>
                           <xsl:value-of select="/ens:retrieveResponse/ens:result/tns:Address_Street1__c"/>
                        </xsdLocal1:PersonalStreetAddress>
                     </xsl:if>
                     <xsl:if test="/ens:retrieveResponse/ens:result/tns:Address_Street2__c">
                        <xsdLocal1:PersonalStreetAddress2>
                           <xsl:value-of select="/ens:retrieveResponse/ens:result/tns:Address_Street2__c"/>
                        </xsdLocal1:PersonalStreetAddress2>
                     </xsl:if>
                     <xsl:if test="/ens:retrieveResponse/ens:result/tns:Address_Street3__c">
                        <xsdLocal1:PersonalStreetAddress3>
                           <xsl:value-of select="/ens:retrieveResponse/ens:result/tns:Address_Street3__c"/>
                        </xsdLocal1:PersonalStreetAddress3>
                     </xsl:if>
                  </xsdLocal1:Employee_PersonalAddress>
               </xsdLocal1:ListOfEmployee_PersonalAddress>
            </xsl:if>
            <!--xsdLocal1:ListOfEmployee_Position>
               <xsdLocal1:Employee_Position IsPrimaryMVG="Y">
                  <xsdLocal1:PositionId>1-1E5MBU</xsdLocal1:PositionId>
               </xsdLocal1:Employee_Position>
            </xsdLocal1:ListOfEmployee_Position>
            <xsdLocal1:ListOfEmployee_Responsibility>
               <xsdLocal1:Employee_Responsibility IsPrimaryMVG="Y">
                  <xsdLocal1:ResponsibilityId>1-19A5VI</xsdLocal1:ResponsibilityId>
               </xsdLocal1:Employee_Responsibility>
            </xsdLocal1:ListOfEmployee_Responsibility-->
            <xsdLocal1:ListOfEmployee_EmployeeOrganization>
               <xsdLocal1:Employee_EmployeeOrganization IsPrimaryMVG="Y">
                  <xsdLocal1:EmployeeOrganizationId/>
               </xsdLocal1:Employee_EmployeeOrganization>
            </xsdLocal1:ListOfEmployee_EmployeeOrganization>
            <xsdLocal1:ListOfEmployee_Subcontractor>
               <xsdLocal1:Employee_Subcontractor IsPrimaryMVG="Y">
                  <xsdLocal1:SubcontractorAccountId/>
               </xsdLocal1:Employee_Subcontractor>
            </xsdLocal1:ListOfEmployee_Subcontractor>
            <xsl:if test="/ens:retrieveResponse/ens:result/tns:User_Role_Name__c !=''">
               <xsdLocal1:ISGSFUserRole>
                  <xsl:value-of select="/ens:retrieveResponse/ens:result/tns:User_Role_Name__c"/>
               </xsdLocal1:ISGSFUserRole>
            </xsl:if>
		      <xsdLocal1:SyncStatus>
                                 <xsl:text disable-output-escaping="no">SYNC_ON</xsl:text>
             </xsdLocal1:SyncStatus>
         </xsdLocal1:Employee>
      </xsdLocal1:ListOfIsgSfEmployeeIo>
   </xsl:template>
   <xsl:template name="ConvertSFDateToSiebel">
      <xsl:param name="Date"/>
      <xsl:if test="string-length($Date) != 0">
         <xsl:variable name="Year" select="substring-before ($Date, '-')"/>
         <xsl:variable name="MonthTmp" select="substring-after($Date, '-')"/>
         <xsl:variable name="Month" select="substring-before ($MonthTmp, '-')"/>
         <xsl:variable name="DayTemp" select="substring-after($MonthTmp, '-')"/>
         <xsl:variable name="Day" select="substring-before ($DayTemp,'T')"/>
         <xsl:variable name="TimeTmp" select="substring-after ($DayTemp,'T')"/>
         <xsl:variable name="hrs" select="substring-before ($TimeTmp,':')"/>
         <xsl:variable name="MtsTmp" select="substring-after ($TimeTmp,':')"/>
         <xsl:variable name="Mins" select="substring-before($MtsTmp,':')"/>
         <xsl:variable name="scTmp" select="substring-after($MtsTmp,':')"/>
         <xsl:variable name="scs" select="substring-before($scTmp,'.')"/>
         <xsl:variable name="ModifiedDate"
                       select="concat ($Month , '/', $Day ,'/',$Year,' ',$hrs,':',$Mins,':',$scs)"/>
         <xsl:value-of select="$ModifiedDate"/>
      </xsl:if>
   </xsl:template>
   <xsl:template name="DVMLookUP">
      <xsl:param name="name"/>
      <xsl:param name="source"/>
      <xsl:param name="input"/>
      <xsl:param name="target"/>
      <xsl:value-of select="dvm:lookupValue($name,$source,$input,$target,'NoCode')"/>
   </xsl:template>
</xsl:stylesheet>