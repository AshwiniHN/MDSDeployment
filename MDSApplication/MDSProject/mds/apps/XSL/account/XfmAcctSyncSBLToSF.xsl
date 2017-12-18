<xsl:stylesheet version="1.0"
                exclude-result-prefixes="xsi xsl client od plnk ns3 xsd ns2 ns1 soap tns fns ens xp20 bpws bpel bpm ora socket mhdr oraext dvm hwf med ids xdk xref bpmn ldap"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/"
                xmlns:client="http://xmlns.oracle.com/InsertAccountSFProvABCSImpl"
                xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
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
                xmlns:med="http://schemas.oracle.com/mediator/xpath"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath"
                xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:fns="urn:fault.enterprise.soap.sforce.com"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:ns1="http://www.siebel.com/xml/ISGSFAccountIO"
                xmlns:bpmn="http://schemas.oracle.com/bpm/xpath"
                xmlns:ns2="http://xmlns.oracle.com/OP_SF_Account/InsertAccountSFProvABCSImpl/InsertAccountSFProvABCSImpl"
                xmlns:ens="urn:sobject.enterprise.soap.sforce.com"
                xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap">
   <xsl:param name="var_sfIds"/>
     <xsl:variable  name="varCountry" select="dvm:lookupValue('oramds:/apps/dvm/Country_SFToSBL.dvm','SBL',/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:ListOfAccount_BusinessAddress/ns1:Account_BusinessAddress/ns1:Country,'SALESFORCE','No Code Found')"/>
    <xsl:template match="/">
      <tns:create>
         <tns:sObjects>
            <xsl:attribute name="xsi:type">
               <xsl:text disable-output-escaping="no">Account</xsl:text>
            </xsl:attribute>
            <xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:MFEAccountSegment-FinalValue != ''">
               <ens:Account_Segment__c>
                  <xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/accountsegment.dvm','Siebel',/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:MFEAccountSegment-FinalValue,'Salesforce','No Code Found')"/>
               </ens:Account_Segment__c>
            </xsl:if>
            <xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:CSN != '' ">
               <ens:Account_UCN__c>
                  <xsl:value-of select="substring(/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:CSN,1,15)"/>
               </ens:Account_UCN__c>
            </xsl:if>
			<!--  <xsl:if test="$var_sfIds/ns3:ids/ns3:SFAccountId = ''"> commented as per DE902-->
            <xsl:choose>
               <xsl:when test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:ISGSFDraftFlag = 'Y'">
                  <ens:RecordTypeId>
                     <xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/AccountType_SFToSBL.dvm','SBL','DRAFT','SALESFORCE','NoCode')"/>
                  </ens:RecordTypeId>
               </xsl:when>
               <xsl:otherwise>
                  <ens:RecordTypeId>
                     <xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/AccountType_SFToSBL.dvm','SBL','END CUSTOMER','SALESFORCE','NoCode')"/>
                  </ens:RecordTypeId>
               </xsl:otherwise>
            </xsl:choose>
			 <!--  </xsl:if> -->
            <xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:Alias != ''">
               <ens:Alias__c>
                  <xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:Alias"/>
               </ens:Alias__c>
            </xsl:if>
            <!--xsl:if test="$var_sfIds/ns3:ids/ns3:SFOwnerId and $var_sfIds/ns3:ids/ns3:SFOwnerId != ''">
               <ens:OwnerId>
                  <xsl:value-of select="$var_sfIds/ns3:ids/ns3:SFOwnerId"/>
               </ens:OwnerId>
            </xsl:if-->
            <xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:DomesticUltimateDUNS != ''">
               <ens:Domestic_Ultimate_DUNS__c>
                  <xsl:value-of select="substring(/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:DomesticUltimateDUNS,1,15)"/>
               </ens:Domestic_Ultimate_DUNS__c>
            </xsl:if>
            <xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:GlobalUltimateNodeQuantity != ''">
               <ens:Global_Total_AV_Account_Nodes__c>
                  <xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:GlobalUltimateNodeQuantity"/>
               </ens:Global_Total_AV_Account_Nodes__c>
            </xsl:if>
            <xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:GlobalUltimateDUNS != ''">
               <ens:Global_Ultimate_DUNS__c>
                  <xsl:value-of select="substring(/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:GlobalUltimateDUNS,1,15)"/>
               </ens:Global_Ultimate_DUNS__c>
            </xsl:if>
            <xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:ParentHQDUNS != ''">
               <ens:Parent_DUNS__c>
                  <xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:ParentHQDUNS"/>
               </ens:Parent_DUNS__c>
            </xsl:if>
            <!--xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:MFEParentPartnerUCN != ''">
               <ens:Parent_Partner_UCN__c>
                  <xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:MFEParentPartnerUCN"/>
               </ens:Parent_Partner_UCN__c>
            </xsl:if-->
            <xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:MFEHighestPricingAgreementBand != ''">
               <ens:Price_Band_Agreement__c>
                  <xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:MFEHighestPricingAgreementBand"/>
               </ens:Price_Band_Agreement__c>
            </xsl:if>
            <xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:CustomerAccountGroup != ''">
               <ens:Customer_Account_Group__c>
                  <xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/customeraccountgroup.dvm','Siebel',/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:CustomerAccountGroup ,'Salesforce','No Code Found')"/>
               </ens:Customer_Account_Group__c>
            </xsl:if>
            <xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:MFEGlobalName != ''">
               <ens:Global_Name__c>
                  <xsl:value-of select="substring(/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:MFEGlobalName,1,100)"/>
               </ens:Global_Name__c>
            </xsl:if>
			<!-- Commented as part of INSALES-4157
			<xsl:choose>
			<xsl:when test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:MFESiteDesignation != ''">
               <ens:Site_Designation__c>
                  <xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:MFESiteDesignation"/>
               </ens:Site_Designation__c>
            </xsl:when>
			<xsl:otherwise>
			<ens:fieldsToNull>Site_Designation__c</ens:fieldsToNull>
			</xsl:otherwise>
			</xsl:choose> -->
            <xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:MFEDNBEmployeesTotal != ''">
               <ens:NumberOfEmployees>
                  <xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:MFEDNBEmployeesTotal"/>
               </ens:NumberOfEmployees>
            </xsl:if>
            <xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:MainFaxNumber != ''">
               <ens:Fax>
                  <xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:MainFaxNumber"/>
               </ens:Fax>
            </xsl:if>
            <xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:MFEGlobalUltimateNodeQty != ''">
               <ens:Global_Total_AV_Account_Nodes__c>
                  <xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:MFEGlobalUltimateNodeQty"/>
               </ens:Global_Total_AV_Account_Nodes__c>
            </xsl:if>
            <xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:MFEGlobalUCN != ''">
               <ens:Global_UCN__c>
                  <xsl:value-of select="substring(/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:MFEGlobalUCN,1,15)"/>
               </ens:Global_UCN__c>
            </xsl:if>
            <xsl:if test="$var_sfIds/ns3:ids/ns3:SFAccountId != ''">
               <ens:Id>
                  <xsl:value-of select="$var_sfIds/ns3:ids/ns3:SFAccountId"/>
               </ens:Id>
            </xsl:if>
            <xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:Id != ''">
               <ens:Legacy_Id__c>
                  <xsl:value-of select="substring(/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:Id,1,15)"/>
               </ens:Legacy_Id__c>
            </xsl:if>
           <!--           
		   <xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:Name != ''">
               <ens:Name>
                  <xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:Name"/>
               </ens:Name>
            </xsl:if>
			-->
            <xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:MFEGlobalUltimateDUNSEmployees != ''">
               <ens:Total_Global_Employee__c>
                  <xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:MFEGlobalUltimateDUNSEmployees"/>
               </ens:Total_Global_Employee__c>
            </xsl:if>
            <xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:MFEParentUCN != ''">
               <ens:Parent_UCN__c>
                  <xsl:value-of select="substring(/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:MFEParentUCN,1,15)"/>
               </ens:Parent_UCN__c>
            </xsl:if>
            <xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:MainPhoneNumber != ''">
               <ens:Phone>
                  <xsl:value-of select="substring(/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:MainPhoneNumber,1,40)"/>
               </ens:Phone>
            </xsl:if>
            <xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:IntegrationId != ''">
               <ens:SAP_Customer_Number__c>
                  <xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:IntegrationId"/>
               </ens:SAP_Customer_Number__c>
            </xsl:if>
            <!--<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:MFESICOverride != ''">
               <ens:SIC_Override__c>
                  <xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:MFESICOverride"/>
               </ens:SIC_Override__c>
            </xsl:if>-->
            <xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:NAISiintSourceSystem != ''">
               <ens:Source_System__c>
                  <xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:NAISiintSourceSystem"/>
               </ens:Source_System__c>
            </xsl:if>
            <xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:NAINodeQuantity != ''">
               <ens:Total_AV_Account_Nodes__c>
                  <xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:NAINodeQuantity"/>
               </ens:Total_AV_Account_Nodes__c>
            </xsl:if>
            <xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:Employees != ''">
               <ens:Total_Site_Employee__c>
                  <xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:Employees"/>
               </ens:Total_Site_Employee__c>
            </xsl:if>
            <xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:HomePage != ''">
               <ens:Website>
                  <xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:HomePage"/>
               </ens:Website>
            </xsl:if>
            <xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:ISGYearEstablish != ''">
               <ens:Year_Established__c>
                  <xsl:value-of select="substring(/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:ISGYearEstablish,1,4)"/>
               </ens:Year_Established__c>
            </xsl:if>
            <xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:ListOfAccount_BusinessAddress/ns1:Account_BusinessAddress/ns1:City != ''">
               <ens:BillingCity>
                  <xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:ListOfAccount_BusinessAddress/ns1:Account_BusinessAddress/ns1:City"/>
               </ens:BillingCity>
            </xsl:if>
            <xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:ListOfAccount_BusinessAddress/ns1:Account_BusinessAddress/ns1:PostalCode != ''">
               <ens:BillingPostalCode>
                  <xsl:value-of select="substring(/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:ListOfAccount_BusinessAddress/ns1:Account_BusinessAddress/ns1:PostalCode,1,20)"/>
               </ens:BillingPostalCode>
            </xsl:if>
			 <xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:ListOfAccount_BusinessAddress/ns1:Account_BusinessAddress/ns1:StreetAddress != ''">
               <ens:BillingStreet>
                  <xsl:value-of select='substring(concat(/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:ListOfAccount_BusinessAddress/ns1:Account_BusinessAddress/ns1:StreetAddress ,"&#x000d;&#x000a;",/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:ListOfAccount_BusinessAddress/ns1:Account_BusinessAddress/ns1:StreetAddress2 ,"&#x000d;&#x000a;",/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:ListOfAccount_BusinessAddress/ns1:Account_BusinessAddress/ns1:StreetAddress3),1,255)'/>
               </ens:BillingStreet>
			 </xsl:if>  
            <xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:LanguageCode != ''">
               <ens:Language__c>
                  <xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/languagecode.dvm','Siebel',/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:LanguageCode,'Salesforce','No Code Found')"/>
               </ens:Language__c>
            </xsl:if>
            <!--<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:MFESubRegion!= ''">
               <ens:Sub_Region__c>
                  <xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/subregion.dvm','Siebel',/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:MFESubRegion,'Salesforce','No Code Found')"/>
               </ens:Sub_Region__c>
            </xsl:if>-->
            <!--<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:Region!= ''">
               <ens:Region__c>
                  <xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/region.dvm','Siebel',/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:Region,'Salesforce','No Code Found')"/>
               </ens:Region__c>
            </xsl:if>-->
			<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:Region!= ''">
               <ens:Geo__c>
                  <xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/region.dvm','Siebel',/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:Region,'Salesforce','')"/>
               </ens:Geo__c>
            </xsl:if>
            <xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:CurrencyCode!='' ">
               <ens:CurrencyIsoCode>
                  <xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/currencycode.dvm','Siebel',/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:CurrencyCode,'Salesforce','No Code')"/>
               </ens:CurrencyIsoCode>
            </xsl:if>
            <xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:ListOfAccount_BusinessAddress/ns1:Account_BusinessAddress/ns1:State != ''">
               <ens:BillingState>
                   <xsl:value-of select="substring-before(dvm:lookupValue('oramds:/apps/dvm/State_SBLToSF.dvm','SBL',/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:ListOfAccount_BusinessAddress/ns1:Account_BusinessAddress/ns1:State,'SALESFORCE','No Code Found','Country',$varCountry),concat('-',$varCountry))"/>
               </ens:BillingState>
            </xsl:if>
            <xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:ListOfAccount_BusinessAddress/ns1:Account_BusinessAddress/ns1:Country!= ''">
               <ens:BillingCountryCode>
                  <xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/Country_SFToSBL.dvm','SBL',/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:ListOfAccount_BusinessAddress/ns1:Account_BusinessAddress/ns1:Country                   ,'SALESFORCE','No Code Found')"/>
               </ens:BillingCountryCode>
            </xsl:if>
            <xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:MFEMDMId != ''">
               <ens:Legacy_MDM_ID__c>
                  <xsl:value-of select="substring(/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:MFEMDMId,1,50)"/>
               </ens:Legacy_MDM_ID__c>
            </xsl:if>
            <xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:AccountStatus != ''">
               <ens:Customer_Status__c>
                  <xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/accountstatus.dvm','Siebel',/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:AccountStatus ,'Salesforce','No Code Found')"/>
               </ens:Customer_Status__c>
            </xsl:if>
            <xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:MFEParentName != ''">
               <ens:Parent_Name__c>
                  <xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:MFEParentName"/>
               </ens:Parent_Name__c>
            </xsl:if>
            <xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:Confidential != ''">
               <ens:Confidential__c>
                  <xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:Confidential"/>
               </ens:Confidential__c>
            </xsl:if>
            <xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:DUNSNumber != ''">
               <ens:Account_DUNS__c>
                  <xsl:value-of select="substring(/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:DUNSNumber,1,15)"/>
               </ens:Account_DUNS__c>
            </xsl:if>
            <!--Adding below 3 Extra Elements for Mapping-->
            <xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:MFESICOverride != ''">
               <ens:Sic>
                  <xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:MFESICOverride"/>
               </ens:Sic>
            </xsl:if>
            <xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:ISGIndustryOverride != ''">
               <ens:SicDesc>
                  <xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:ISGIndustryOverride"/>
               </ens:SicDesc>
            </xsl:if>
            <xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:ISGVerticalOverride != ''">
               <ens:Vertical_Industry__c>
                  <xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:ISGVerticalOverride"/>
               </ens:Vertical_Industry__c>
            </xsl:if>
            <!--Adding below 2 Extra Elements for Mapping-->
            <xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:MFEGlobalUCNSFID" >
			<xsl:choose>
			<xsl:when test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:MFEGlobalUCNSFID ='' or $var_sfIds/ns3:ids/ns3:SFAccountId = /ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:MFEGlobalUCNSFID">
			<ens:fieldsToNull>
                   <xsl:text disable-output-escaping="no">Global_Parent__c</xsl:text>
               </ens:fieldsToNull>
			</xsl:when>
			<xsl:otherwise>
			 <ens:Global_Parent__c>
                  <xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:MFEGlobalUCNSFID"/>
               </ens:Global_Parent__c>
			</xsl:otherwise>
			</xsl:choose>
            </xsl:if>
            <xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:MFEParentUCNSFID ">
			
			<xsl:choose>
			<xsl:when test="  /ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:MFEParentUCNSFID ='' or $var_sfIds/ns3:ids/ns3:SFAccountId =/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:MFEParentUCNSFID">
			<ens:fieldsToNull>
                   <xsl:text disable-output-escaping="no">ParentId</xsl:text>
               </ens:fieldsToNull>
			   </xsl:when>
<xsl:otherwise>
			
               <ens:ParentId>
                  <xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:MFEParentUCNSFID"/>
               </ens:ParentId>
			</xsl:otherwise>
			</xsl:choose>
            </xsl:if>
			<!--As per Dan's Mapping-->
			<!--<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:Name != ''">
               <ens:NameLocal>
                  <xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:Name"/>
               </ens:NameLocal>
            </xsl:if>
			<xsl:choose>
			<xsl:when test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:NAISAPName1 != ''">
               <ens:Name>
                  <xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:NAISAPName1"/>
               </ens:Name>
            </xsl:when>
			<xsl:otherwise>
			   <ens:Name>
                  <xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:Name"/>
               </ens:Name>
            </xsl:otherwise>
			</xsl:choose>-->
				<!--As per task T-503658-->
			 <xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:Type != ''">
               <ens:Type>
                  <xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:Type"/>
               </ens:Type>
            </xsl:if>
			<!--New Mapping Name And NameLocal element-->
		<!--	<xsl:choose>
			<xsl:when test="$var_sfIds/ns3:ids/ns3:SFAccountId != ''">
               <ens:NameLocal>
                  <xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:Name"/>
               </ens:NameLocal>
            </xsl:when>
			<xsl:otherwise>
			   <ens:Name>
                  <xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:Name"/>
               </ens:Name>
            </xsl:otherwise>
			</xsl:choose> -->
<!--New Mapping Name And NameLocal element 08/18/2016-->
<!--Mapping Commented on August 23 
            <xsl:choose>
               <xsl:when test="$var_sfIds/ns3:ids/ns3:SFAccountId != ''">
			            <ens:NameLocal>
                           <xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:Name"/>
                        </ens:NameLocal>
                     <xsl:if test="$varCountry !='JP'">
                        <ens:Name>
                           <xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:Name"/>
                        </ens:Name>
                     </xsl:if>
               </xsl:when>
               <xsl:otherwise>
			      <ens:Name>
                           <xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:Name"/>
                   </ens:Name>
                    <xsl:if test="$varCountry !='JP'">
                        <ens:NameLocal>
                           <xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:Name"/>
                        </ens:NameLocal>
                    </xsl:if>
              </xsl:otherwise>
            </xsl:choose>			
			-->
			<xsl:if test="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:Name!=''">
			<ens:Name>
                           <xsl:value-of select="/ns1:SiebelMessage/ns1:ListOfIsgsfaccountio/ns1:Account/ns1:Name"/>
                        </ens:Name>
						</xsl:if>
         </tns:sObjects>
      </tns:create>
   </xsl:template>
   <xsl:template name="ConvertSiebelDateToSalesforce">
      <xsl:param name="Date"/>
      <xsl:if test="string-length($Date)!=0">
         <xsl:variable name="Month" select="substring-before($Date,'/')"/>
         <xsl:variable name="DateTmp" select="substring-after($Date,'/')"/>
         <xsl:variable name="Date" select="substring-before($DateTmp,'/')"/>
         <xsl:variable name="Year" select="substring-after($DateTmp,'/')"/>
         <xsl:variable name="ModifiedDate"
                       select="concat($Year,'-',$Month,'-',$Date)"/>
         <xsl:value-of select="$ModifiedDate"/>
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