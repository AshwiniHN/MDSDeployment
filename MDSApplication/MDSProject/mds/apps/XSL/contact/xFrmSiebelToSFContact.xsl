<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0"
                xmlns:aia="http://www.oracle.com/XSL/Transform/java/oracle.apps.aia.core.xpath.AIAFunctions"
                xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:ns5="http://SalesforceIntegration/contact_SFIds"
                xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions"
                xmlns:od="urn:/crmondemand/xml/account"
                xmlns:plnk="http://schemas.xmlsoap.org/ws/2003/05/partner-link/"
                xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/"
                xmlns:tns="urn:enterprise.soap.sforce.com"
                xmlns:ora="http://schemas.oracle.com/xpath/extension"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                xmlns:ns3="http://SalesforceIntegration/account_SFIds"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath"
                xmlns:ns2="http://www.siebel.com/xml/ISGSFContactIO"
                xmlns:med="http://schemas.oracle.com/mediator/xpath"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath"
                xmlns:client="http://xmlns.oracle.com/InsertContactSFProvABCSImpl"
                xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:fns="urn:fault.enterprise.soap.sforce.com"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:ns4="http://schemas.oracle.com/bpel/extension"
                xmlns:ns1="http://xmlns.oracle.com/OP_SF_Contact/InsertContactSFProvABCSImpl/InsertContactSFProvABCSImpl"
                xmlns:ens="urn:sobject.enterprise.soap.sforce.com"
                xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap"
                xmlns:ns6="http://SalesforceProject/SFEndpointProcess"
                exclude-result-prefixes="xsl ns5 od plnk ns3 ns2 client xsd ns4 ns6 ns1 soap tns fns aia bpws xp20 bpel bpm ora socket mhdr oraext dvm hwf med ids xdk xref ldap">
  <xsl:param name="VarXrefIds"/>
  <xsl:template match="/">
    <tns:create>
      <tns:sObjects>
        <xsl:for-each select="/ns2:SiebelMessage/ns2:ListOfIsgsfcontactio/ns2:Contact">
          <xsl:variable name="varCountry"
                        select="dvm:lookupValue('oramds:/apps/dvm/Country_SFToSBL.dvm','SBL',ns2:ListOfPersonalAddress/ns2:PersonalAddress/ns2:Country,'SALESFORCE','No Code Found')"/>
          <xsl:variable name="MailingCountryCode"
                        select="dvm:lookupValue('oramds:/apps/dvm/Country_SFToSBL.dvm','SBL',ns2:ListOfContact_BusinessAddress/ns2:Contact_BusinessAddress/ns2:Country,'SALESFORCE','No Code Found')"/>
          <xsl:attribute name="xsi:type">
            <xsl:text disable-output-escaping="no">ens:Contact</xsl:text>
          </xsl:attribute>
          <xsl:if test="$VarXrefIds/ns5:ids/ns5:SFAccountId !=''">
            <ens:AccountId>
              <xsl:value-of select="$VarXrefIds/ns5:ids/ns5:SFAccountId"/>
            </ens:AccountId>
          </xsl:if>
          <xsl:if test="$VarXrefIds/ns5:ids/ns5:SFContactId !=''">
            <ens:Id>
              <xsl:value-of select="$VarXrefIds/ns5:ids/ns5:SFContactId"/>
            </ens:Id>
          </xsl:if>
          <xsl:if test="ns2:FaxPhone">
            <xsl:choose>
              <xsl:when test="ns2:FaxPhone !=''">
                <ens:Fax>
                  <xsl:value-of select="ns2:FaxPhone"/>
                </ens:Fax>
              </xsl:when>
              <xsl:otherwise>
                <ens:fieldsToNull>Fax</ens:fieldsToNull>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:if>
          <xsl:if test="ns2:NAISiintSourceSystem">
            <xsl:choose>
              <xsl:when test="ns2:NAISiintSourceSystem !=''">
                <ens:Source_System__c>
                  <xsl:value-of select="ns2:NAISiintSourceSystem"/>
                </ens:Source_System__c>
              </xsl:when>
              <xsl:otherwise>
                <ens:fieldsToNull>Source_System__c</ens:fieldsToNull>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:if>
          <xsl:if test="ns2:PartnershipContactFlag !=''">
            <ens:RecordTypeId>
              <xsl:value-of select='dvm:lookupValue("oramds:/apps/dvm/ContactTypeSBLToSF.dvm","SBLFlag",ns2:PartnershipContactFlag,"SFValue",ns2:PartnershipContactFlag)'/>
            </ens:RecordTypeId>
          </xsl:if>
          <xsl:if test="ns2:WorkPhone">
            <xsl:choose>
              <xsl:when test="ns2:WorkPhone !=''">
                <ens:Phone>
                  <xsl:value-of select="ns2:WorkPhone"/>
                </ens:Phone>
              </xsl:when>
              <xsl:otherwise>
                <ens:fieldsToNull>Phone</ens:fieldsToNull>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:if>
          <xsl:if test="ns2:Comment">
            <xsl:choose>
              <xsl:when test="ns2:Comment != ''">
                <ens:Description>
                  <xsl:value-of select="ns2:Comment"/>
                </ens:Description>
              </xsl:when>
              <xsl:otherwise>
                <ens:fieldsToNull>Description</ens:fieldsToNull>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:if>
          <xsl:if test="ns2:IntegrationId !=''">
            <ens:Contact_SAP_Id__c>
              <xsl:value-of select="ns2:IntegrationId"/>
            </ens:Contact_SAP_Id__c>
          </xsl:if>
          <xsl:if test="ns2:ISGSFCreatedBy !=''">
            <ens:CreatedById>
              <xsl:value-of select="ns2:ISGSFCreatedBy"/>
            </ens:CreatedById>
          </xsl:if>
          <xsl:if test="ns2:ISGSFCreated !=''">
            <ens:CreatedDate>
              <xsl:value-of select="ns2:ISGSFCreated"/>
            </ens:CreatedDate>
          </xsl:if>
          <xsl:if test="ns2:EmailAddress !=''">
            <ens:Email>
              <xsl:value-of select="ns2:EmailAddress"/>
            </ens:Email>
          </xsl:if>
          <xsl:if test="ns2:FirstName !=''">
            <ens:FirstName>
              <xsl:value-of select="ns2:FirstName"/>
            </ens:FirstName>
          </xsl:if>
          <xsl:if test="ns2:MF !=''">
            <ens:Gender__c>
              <xsl:value-of select="ns2:MF"/>
            </ens:Gender__c>
          </xsl:if>
          <xsl:if test="ns2:JobTitle">
            <xsl:choose>
              <xsl:when test="ns2:JobTitle !=''">
                <ens:Title>
                  <xsl:value-of select="ns2:JobTitle"/>
                </ens:Title>
              </xsl:when>
              <xsl:otherwise>
                <ens:fieldsToNull>Title</ens:fieldsToNull>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:if>
          <xsl:if test="ns2:ISGSFUpdated !=''">
            <ens:LastModifiedDate>
              <xsl:call-template name="ConvertSiebelDateToSalesforce">
                <xsl:with-param name="Date" select="ns2:ISGSFUpdated"/>
              </xsl:call-template>
            </ens:LastModifiedDate>
          </xsl:if>
          <xsl:if test="ns2:LastName !=''">
            <ens:LastName>
              <xsl:value-of select="ns2:LastName"/>
            </ens:LastName>
          </xsl:if>
          <xsl:if test="ns2:Created !=''">
            <ens:Legacy_Created__c>
              <xsl:call-template name="ConvertSiebelDateToSalesforce">
                <xsl:with-param name="DateTime" select="ns2:Created"/>
              </xsl:call-template>
            </ens:Legacy_Created__c>
          </xsl:if>
          <xsl:if test="ns2:Id !=''">
            <ens:Legacy_Id__c>
              <xsl:value-of select="ns2:Id"/>
            </ens:Legacy_Id__c>
          </xsl:if>
          <xsl:if test="ns2:PrimaryEmployeeId !=''">
            <ens:Legacy_OwnerId__c>
              <xsl:value-of select="ns2:PrimaryEmployeeId"/>
            </ens:Legacy_OwnerId__c>
          </xsl:if>
          <xsl:if test="ns2:CellularPhone">
            <xsl:choose>
              <xsl:when test="ns2:CellularPhone !=''">
                <ens:MobilePhone>
                  <xsl:value-of select="ns2:CellularPhone"/>
                </ens:MobilePhone>
              </xsl:when>
              <xsl:otherwise>
                <ens:fieldsToNull>MobilePhone</ens:fieldsToNull>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:if>
          <xsl:if test="ns2:PreferredCommunications">
            <xsl:choose>
              <xsl:when test="ns2:PreferredCommunications !=''">
                <ens:Preferred_Contact_Method__c>
                  <xsl:value-of select="ns2:PreferredCommunications"/>
                </ens:Preferred_Contact_Method__c>
              </xsl:when>
              <xsl:otherwise>
                <ens:fieldsToNull>Preferred_Contact_Method__c</ens:fieldsToNull>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:if>
          <xsl:if test="ns2:PreferredLanguageCode !=''">
            <xsl:choose>
              <xsl:when test="ns2:PartnershipContactFlag !='' and ns2:PartnershipContactFlag='N'">
                <ens:Preferred_Language__c>
                  <xsl:value-of select='dvm:lookupValue("oramds:/apps/dvm/PreferredLangCodeEndCustomerContact_SBL_To_SF.dvm","Siebel",ns2:PreferredLanguageCode,"Salesforce","English - American")'/>
                </ens:Preferred_Language__c>
              </xsl:when>
              <xsl:otherwise>
                <ens:Preferred_Language__c>
                  <xsl:value-of select='dvm:lookupValue("oramds:/apps/dvm/PreferredLangCodeEndCustomerContact_SBL_To_SF.dvm","Siebel",ns2:PreferredLanguageCode,"Salesforce","English")'/>
                </ens:Preferred_Language__c>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:if>
          <xsl:if test="ns2:Role">
            <xsl:choose>
              <xsl:when test="ns2:Role !=''">
                <ens:Sales_Role__c>
                  <xsl:value-of select="ns2:Role"/>
                </ens:Sales_Role__c>
              </xsl:when>
              <xsl:otherwise>
                <ens:fieldsToNull>Sales_Role__c</ens:fieldsToNull>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:if>
          <!--xsl:if test="ns2:MM !=''">
            <ens:Salutation>
              <xsl:value-of select="ns2:MM"/>
            </ens:Salutation>
          </xsl:if-->
          <xsl:if test="ns2:MFEEloquaContactId !=''">
            <ens:Eloqua_Contact_Id__c>
              <xsl:value-of select="ns2:MFEEloquaContactId"/>
            </ens:Eloqua_Contact_Id__c>
          </xsl:if>
          <xsl:if test="ns2:ISGSFId !=''">
            <ens:Id>
              <xsl:value-of select="ns2:ISGSFId"/>
            </ens:Id>
          </xsl:if>
          <xsl:if test="ns2:ISGSFUpdatedBy !=''">
            <ens:LastModifiedById>
              <xsl:value-of select="ns2:ISGSFUpdatedBy"/>
            </ens:LastModifiedById>
          </xsl:if>
          <xsl:if test="ns2:ISGSFSyncStatus !=''">
            <ens:Sync_Status__c>
              <xsl:value-of select="ns2:ISGSFSyncStatus"/>
            </ens:Sync_Status__c>
          </xsl:if>
          <xsl:choose>
            <xsl:when test="ns2:PartnershipContactFlag !='Y'">
              <xsl:choose>
                <xsl:when test="ns2:ListOfPersonalAddress/ns2:PersonalAddress/ns2:Country ='--' or ns2:ListOfPersonalAddress/ns2:PersonalAddress/ns2:State ='--'">
                  <ens:fieldsToNull>OtherCity</ens:fieldsToNull>
                  <ens:fieldsToNull>OtherCountryCode</ens:fieldsToNull>
                  <ens:fieldsToNull>OtherState</ens:fieldsToNull>
                  <ens:fieldsToNull>OtherStreet</ens:fieldsToNull>
                  <ens:fieldsToNull>OtherPostalCode</ens:fieldsToNull>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:if test="ns2:ListOfPersonalAddress/ns2:PersonalAddress/ns2:City !=''">
                    <ens:OtherCity>
                      <xsl:value-of select="ns2:ListOfPersonalAddress/ns2:PersonalAddress/ns2:City"/>
                    </ens:OtherCity>
                  </xsl:if>
                  <xsl:if test="ns2:ListOfPersonalAddress/ns2:PersonalAddress/ns2:Country !=''">
                    <ens:OtherCountryCode>
                      <xsl:value-of select='dvm:lookupValue("oramds:/apps/dvm/Country_SFToSBL.dvm","SBL",ns2:ListOfPersonalAddress/ns2:PersonalAddress/ns2:Country,"SALESFORCE","No Value")'/>
                    </ens:OtherCountryCode>
                  </xsl:if>
                  <xsl:if test="ns2:ListOfPersonalAddress/ns2:PersonalAddress/ns2:State !=''">
                    <ens:OtherState>
                      <!--xsl:call-template name="splitstate">
                          <xsl:with-param name="state"
                                   select="dvm:lookupValue('oramds:/apps/dvm/State_SBLToSF.dvm','SBL',ns2:ListOfCutAddress/ns2:CutAddress/ns2:State,'SALESFORCE','No Code Found','Country',dvm:lookupValue('oramds:/apps/dvm/Country_SFToSBL.dvm','SBL',ns2:ListOfCutAddress/ns2:CutAddress/ns2:Country,'SALESFORCE','No Code Found'))"/>
                </xsl:call-template-->
                      <xsl:value-of select="
substring-before(dvm:lookupValue('oramds:/apps/dvm/State_SBLToSF.dvm','SBL',ns2:ListOfPersonalAddress/ns2:PersonalAddress/ns2:State,'SALESFORCE','No Code Found','Country',$varCountry),concat('-',$varCountry))"/>
                    </ens:OtherState>
                  </xsl:if>
                  <xsl:if test="ns2:ListOfPersonalAddress/ns2:PersonalAddress/ns2:StreetAddress !=''">
                     <ens:OtherStreet>
                    <xsl:value-of select='concat(ns2:ListOfPersonalAddress/ns2:PersonalAddress/ns2:StreetAddress,"&#x000d;&#x000a;",ns2:ListOfPersonalAddress/ns2:PersonalAddress/ns2:StreetAddress2,"&#x000d;&#x000a;",ns2:ListOfPersonalAddress/ns2:PersonalAddress/ns2:StreetAddress3)'/>
            </ens:OtherStreet>
                  </xsl:if>
                  <xsl:if test="ns2:ListOfPersonalAddress/ns2:PersonalAddress/ns2:PostalCode !=''">
                    <ens:OtherPostalCode>
                      <xsl:value-of select="ns2:ListOfPersonalAddress/ns2:PersonalAddress/ns2:PostalCode"/>
                    </ens:OtherPostalCode>
                  </xsl:if>
                </xsl:otherwise>
              </xsl:choose>
             <xsl:choose>
            <xsl:when test="ns2:ListOfContact_BusinessAddress/ns2:Contact_BusinessAddress/ns2:Country ='--' or ns2:ListOfContact_BusinessAddress/ns2:Contact_BusinessAddress/ns2:State ='--'">
            <ens:fieldsToNull>MailingCity</ens:fieldsToNull>
                  <ens:fieldsToNull>MailingCountryCode</ens:fieldsToNull>
                  <ens:fieldsToNull>MailingState</ens:fieldsToNull>
                  <ens:fieldsToNull>MailingStreet</ens:fieldsToNull>
                  <ens:fieldsToNull>MailingPostalCode</ens:fieldsToNull>
            </xsl:when>
            <xsl:otherwise>            
              <xsl:if test="ns2:ListOfContact_BusinessAddress/ns2:Contact_BusinessAddress/ns2:City !=''">
                <ens:MailingCity>
                  <xsl:value-of select="ns2:ListOfContact_BusinessAddress/ns2:Contact_BusinessAddress/ns2:City"/>
                </ens:MailingCity>
              </xsl:if>
              <xsl:if test="ns2:ListOfContact_BusinessAddress/ns2:Contact_BusinessAddress/ns2:Country !=''">
                <ens:MailingCountryCode>
                  <xsl:value-of select='dvm:lookupValue("oramds:/apps/dvm/Country_SFToSBL.dvm","SBL",ns2:ListOfContact_BusinessAddress/ns2:Contact_BusinessAddress/ns2:Country,"SALESFORCE","No Value")'/>
                </ens:MailingCountryCode>
              </xsl:if>
              <xsl:if test="ns2:ListOfContact_BusinessAddress/ns2:Contact_BusinessAddress/ns2:State !=''">
                <ens:MailingState>
                  
                  <xsl:value-of select="
substring-before(dvm:lookupValue('oramds:/apps/dvm/State_SBLToSF.dvm','SBL',ns2:ListOfContact_BusinessAddress/ns2:Contact_BusinessAddress/ns2:State,'SALESFORCE','No Code Found','Country',$MailingCountryCode),concat('-',$MailingCountryCode))"/>
                </ens:MailingState>
              </xsl:if>
             
              <xsl:if test="ns2:ListOfContact_BusinessAddress/ns2:Contact_BusinessAddress/ns2:PostalCode !=''">
                <ens:MailingPostalCode>
                  <xsl:value-of select="ns2:ListOfContact_BusinessAddress/ns2:Contact_BusinessAddress/ns2:PostalCode"/>
                </ens:MailingPostalCode>
              </xsl:if>
           
				<xsl:if test="ns2:ListOfContact_BusinessAddress/ns2:Contact_BusinessAddress/ns2:StreetAddress !=''">
                     <ens:MailingStreet>
                    <xsl:value-of select='concat(ns2:ListOfContact_BusinessAddress/ns2:Contact_BusinessAddress/ns2:StreetAddress,"&#x000d;&#x000a;",ns2:ListOfContact_BusinessAddress/ns2:Contact_BusinessAddress/ns2:StreetAddress2,"&#x000d;&#x000a;",ns2:ListOfContact_BusinessAddress/ns2:Contact_BusinessAddress/ns2:StreetAddress3)'/>
            </ens:MailingStreet>
                  </xsl:if>
		   </xsl:otherwise>
            </xsl:choose>
			</xsl:when>
            <xsl:otherwise>
            <xsl:choose>
            <xsl:when test="ns2:ListOfPersonalAddress/ns2:PersonalAddress/ns2:Country ='--' or ns2:ListOfPersonalAddress/ns2:PersonalAddress/ns2:State ='--'">
            <ens:fieldsToNull>MailingCity</ens:fieldsToNull>
                  <ens:fieldsToNull>MailingCountryCode</ens:fieldsToNull>
                  <ens:fieldsToNull>MailingState</ens:fieldsToNull>
                  <ens:fieldsToNull>MailingStreet</ens:fieldsToNull>
                  <ens:fieldsToNull>MailingPostalCode</ens:fieldsToNull>
            </xsl:when>
            <xsl:otherwise>            
              <xsl:if test="ns2:ListOfPersonalAddress/ns2:PersonalAddress/ns2:City !=''">
                <ens:MailingCity>
                  <xsl:value-of select="ns2:ListOfPersonalAddress/ns2:PersonalAddress/ns2:City"/>
                </ens:MailingCity>
              </xsl:if>
              <xsl:if test="ns2:ListOfPersonalAddress/ns2:PersonalAddress/ns2:Country !=''">
                <ens:MailingCountryCode>
                  <xsl:value-of select='dvm:lookupValue("oramds:/apps/dvm/Country_SFToSBL.dvm","SBL",ns2:ListOfPersonalAddress/ns2:PersonalAddress/ns2:Country,"SALESFORCE","No Value")'/>
                </ens:MailingCountryCode>
              </xsl:if>
              <xsl:if test="ns2:ListOfPersonalAddress/ns2:PersonalAddress/ns2:State !=''">
                <ens:MailingState>
                  <!--xsl:call-template name="splitstate">
                    <xsl:with-param name="state"
                                   select="dvm:lookupValue('oramds:/apps/dvm/State_SBLToSF.dvm','SBL',ns2:ListOfCutAddress/ns2:CutAddress/ns2:State,'SALESFORCE','No Code Found','Country',dvm:lookupValue('oramds:/apps/dvm/Country_SFToSBL.dvm','SBL',ns2:ListOfCutAddress/ns2:CutAddress/ns2:Country,'SALESFORCE','No Code Found'))"/>
              </xsl:call-template-->
                  <xsl:value-of select="
substring-before(dvm:lookupValue('oramds:/apps/dvm/State_SBLToSF.dvm','SBL',ns2:ListOfPersonalAddress/ns2:PersonalAddress/ns2:State,'SALESFORCE','No Code Found','Country',$varCountry),concat('-',$varCountry))"/>
                </ens:MailingState>
              </xsl:if>
              <!--
<xsl:if test="ns2:ListOfCutAddress/ns2:CutAddress/ns2:StreetAddress !=''">
<ens:MailingStreet>
<xsl:value-of select="concat(ns2:ListOfCutAddress/ns2:CutAddress/ns2:StreetAddress,ns2:ListOfCutAddress/ns2:CutAddress/ns2:StreetAddress2,ns2:ListOfCutAddress/ns2:CutAddress/ns2:StreetAddress3)"/>
</ens:MailingStreet>
</xsl:if>-->
              <xsl:if test="ns2:ListOfPersonalAddress/ns2:PersonalAddress/ns2:PostalCode !=''">
                <ens:MailingPostalCode>
                  <xsl:value-of select="ns2:ListOfPersonalAddress/ns2:PersonalAddress/ns2:PostalCode"/>
                </ens:MailingPostalCode>
              </xsl:if>
            </xsl:otherwise>
            </xsl:choose>
            </xsl:otherwise>
          </xsl:choose>
        
<!--

		<xsl:if test="ns2:ListOfContact_BusinessAddress/ns2:Contact_BusinessAddress/ns2:City !=''">
            <ens:MailingCity>
              <xsl:value-of select="ns2:ListOfContact_BusinessAddress/ns2:Contact_BusinessAddress/ns2:City"/>
            </ens:MailingCity>
          </xsl:if>
          <xsl:if test="ns2:ListOfContact_BusinessAddress/ns2:Contact_BusinessAddress/ns2:Country !=''">
            <ens:MailingCountryCode>
              <xsl:value-of select='dvm:lookupValue("oramds:/apps/dvm/Country_SFToSBL.dvm","SBL",ns2:ListOfContact_BusinessAddress/ns2:Contact_BusinessAddress/ns2:Country,"SALESFORCE","No Value")'/>
            </ens:MailingCountryCode>
          </xsl:if>
          <xsl:if test="ns2:ListOfContact_BusinessAddress/ns2:Contact_BusinessAddress/ns2:State !=''">
            <ens:MailingState>  -->
              <!--xsl:call-template name="splitstate">
                <xsl:with-param name="state"
                                select="dvm:lookupValue('oramds:/apps/dvm/State_SBLToSF.dvm','SBL',ns2:ListOfContact_BusinessAddress/ns2:Contact_BusinessAddress/ns2:State,'SALESFORCE','No Code Found','Country',dvm:lookupValue('oramds:/apps/dvm/Country_SFToSBL.dvm','SBL',ns2:ListOfContact_BusinessAddress/ns2:Contact_BusinessAddress/ns2:Country,'SALESFORCE','No Code Found'))"/>
              </xsl:call-template-->
			  
			  
			  <!--
              <xsl:value-of select="
substring-before(dvm:lookupValue('oramds:/apps/dvm/State_SBLToSF.dvm','SBL',ns2:ListOfContact_BusinessAddress/ns2:Contact_BusinessAddress/ns2:State,'SALESFORCE','No Code Found','Country',$MailingCountryCode),concat('-',$MailingCountryCode))"/>
            </ens:MailingState>
          </xsl:if>
          <xsl:if test="ns2:ListOfContact_BusinessAddress/ns2:Contact_BusinessAddress/ns2:StreetAddress !=''">
            <ens:MailingStreet>
                     <xsl:value-of select='concat(ns2:ListOfContact_BusinessAddress/ns2:Contact_BusinessAddress/ns2:StreetAddress,"&#x000d;&#x000a;",ns2:ListOfContact_BusinessAddress/ns2:Contact_BusinessAddress/ns2:StreetAddress2,"&#x000d;&#x000a;",ns2:ListOfContact_BusinessAddress/ns2:Contact_BusinessAddress/ns2:StreetAddress3)'/>
            </ens:MailingStreet>
          </xsl:if>
          <xsl:if test="ns2:ListOfContact_BusinessAddress/ns2:Contact_BusinessAddress/ns2:PostalCode !=''">
            <ens:MailingPostalCode>
              <xsl:value-of select="ns2:ListOfContact_BusinessAddress/ns2:Contact_BusinessAddress/ns2:PostalCode"/>
            </ens:MailingPostalCode>
          </xsl:if>  -->
        </xsl:for-each>
      </tns:sObjects>
    </tns:create>
  </xsl:template>
  <xsl:template name="ConvertSiebelDateToSalesforce">
    <xsl:param name="Date"/>
    <xsl:param name="DateTime"/>
    <xsl:if test="string-length($Date)!=0">
      <xsl:variable name="Month" select="substring-before($Date,'/')"/>
      <xsl:variable name="DateTmp" select="substring-after($Date,'/')"/>
      <xsl:variable name="Date" select="substring-before($DateTmp,'/')"/>
      <xsl:variable name="Year" select="substring-after($DateTmp,'/')"/>
      <xsl:variable name="ModifiedDate"
                    select="concat($Year,'-',$Month,'-',$Date)"/>
      <xsl:value-of select="$ModifiedDate"/>
    </xsl:if>
    <xsl:if test="string-length($DateTime)!=0">
      <xsl:variable name="Month" select="substring-before($DateTime,'/')"/>
      <xsl:variable name="DateTmp" select="substring-after($DateTime,'/')"/>
      <xsl:variable name="Date" select="substring-before($DateTmp,'/')"/>
      <xsl:variable name="Year" select="substring($DateTmp,4,4)"/>
      <xsl:variable name="Time" select="substring($DateTmp,9,9)"/>
      <xsl:variable name="ModifiedDateTime"
                    select="concat($Year,'-',$Month,'-',$Date,'T',$Time)"/>
      <xsl:value-of select="$ModifiedDateTime"/>
    </xsl:if>
  </xsl:template>
  <xsl:template name="splitstate">
    <xsl:param name="state"/>
    <xsl:if test="string-length($state)!=0">
      <xsl:variable name="before" select="substring-before($state,'-')"/>
      <xsl:variable name="after" select="substring-after($state,'-')"/>
      <xsl:variable name="secondsubstring"
                    select="substring-before($after,'-')"/>
      <xsl:variable name="modifiedstate"
                    select="concat($before,'-',$secondsubstring)"/>
      <xsl:choose>
        <xsl:when test="contains($after,'-')">
          <xsl:value-of select="$modifiedstate"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$before"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>