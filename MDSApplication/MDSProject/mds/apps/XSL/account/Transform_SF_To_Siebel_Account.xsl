<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/"
                xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:xsdLocal3="http://www.siebel.com/xml/ISGSFAccountIO/Query"
                xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions"
                xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/"
                xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/"
                xmlns:tns="urn:enterprise.soap.sforce.com"
                xmlns:ora="http://schemas.oracle.com/xpath/extension"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                xmlns:ns0="http://siebel.com/CustomUI"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:xsdLocal2="http://www.siebel.com/xml/ISGSFAccountIO/Id"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath"
                xmlns:med="http://schemas.oracle.com/mediator/xpath"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath"
                xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:fns="urn:fault.enterprise.soap.sforce.com"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:xsdLocal1="http://www.siebel.com/xml/ISGSFAccountIO/Data"
                xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap"
                xmlns:ens="urn:sobject.enterprise.soap.sforce.com"
                exclude-result-prefixes="xsi xsl soap tns fns xsd ens xsdLocal3 soapenc ns0 xsdLocal2 xsdLocal1 xp20 bpws bpel bpm ora socket mhdr oraext dvm hwf med ids xdk xref ldap">
  <xsl:param name="VarSourceSystem"/>
  <xsl:param name="ParentId"/>
  <xsl:variable name="address"/>
  <xsl:variable  name="varCountry" select="dvm:lookupValue('oramds:/apps/dvm/Country_SFToSBL.dvm','SALESFORCE',/tns:retrieveResponse/tns:result/ens:BillingCountryCode,'SBL','No Code Found')"/>
  <xsl:template match="/">
    <xsdLocal1:ListOfIsgsfaccountio>
      <xsdLocal1:Account Operation="">
        <xsdLocal1:ISGSFSyncStatus>
          <xsl:text disable-output-escaping="no">SYNC_ON</xsl:text>
        </xsdLocal1:ISGSFSyncStatus>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Account_UCN__c !=''">
          <xsdLocal1:CSN>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Account_UCN__c"/>
          </xsdLocal1:CSN>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Customer_Status__c!=''">
          <xsdLocal1:AccountStatus>
            <xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/accountstatus.dvm','Salesforce',/tns:retrieveResponse/tns:result/ens:Customer_Status__c ,'Siebel','No Code Found')"/>
          </xsdLocal1:AccountStatus>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:CurrencyIsoCode!=''">
          <xsdLocal1:CurrencyCode>
            <xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/currencycode.dvm','Salesforce',/tns:retrieveResponse/tns:result/ens:CurrencyIsoCode,'Siebel','No Code Found')"/>
          </xsdLocal1:CurrencyCode>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Customer_Account_Group__c!=''">
          <xsdLocal1:CustomerAccountGroup>
            <xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/customeraccountgroup.dvm','Salesforce',/tns:retrieveResponse/tns:result/ens:Customer_Account_Group__c ,'Siebel','No Code Found')"/>
          </xsdLocal1:CustomerAccountGroup>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Account_DUNS__c!=''">
          <xsdLocal1:DUNSNumber>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Account_DUNS__c"/>
          </xsdLocal1:DUNSNumber>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Domestic_Ultimate_DUNS__c!=''">
          <xsdLocal1:DomesticUltimateDUNS>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Domestic_Ultimate_DUNS__c"/>
          </xsdLocal1:DomesticUltimateDUNS>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Global_Ultimate_DUNS__c!=''">
          <xsdLocal1:GlobalUltimateDUNS>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Global_Ultimate_DUNS__c"/>
          </xsdLocal1:GlobalUltimateDUNS>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Website!=''">
          <xsdLocal1:HomePage>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Website"/>
          </xsdLocal1:HomePage>
        </xsl:if>
		 <xsl:if test="/tns:retrieveResponse/tns:result/ens:Account_Segment__c!=''">
          <xsdLocal1:MFEAccountSegment-FinalValue>
            <xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/AccountSegment_SFToSiebel.dvm','Salesforce',/tns:retrieveResponse/tns:result/ens:Account_Segment__c,'Siebel','No Code Found')"/>
          </xsdLocal1:MFEAccountSegment-FinalValue>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:CreatedDate!=''">
          <xsdLocal1:ISGSFCreated>
            <xsl:call-template name="ConvertSFDateToSiebel">
              <xsl:with-param name="Date"
                              select="/tns:retrieveResponse/tns:result/ens:CreatedDate"/>
            </xsl:call-template>
          </xsdLocal1:ISGSFCreated>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:CreatedById!=''">
          <xsdLocal1:ISGSFCreatedBy>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:CreatedById"/>
          </xsdLocal1:ISGSFCreatedBy>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Id!=''">
          <xsdLocal1:ISGSFId>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Id"/>
          </xsdLocal1:ISGSFId>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:LastModifiedDate!=''">
          <xsdLocal1:ISGSFUpdated>
            <xsl:call-template name="ConvertSFDateToSiebel">
              <xsl:with-param name="Date"
                              select="/tns:retrieveResponse/tns:result/ens:LastModifiedDate"/>
            </xsl:call-template>
          </xsdLocal1:ISGSFUpdated>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:LastModifiedById!=''">
          <xsdLocal1:ISGSFUpdatedBy>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:LastModifiedById"/>
          </xsdLocal1:ISGSFUpdatedBy>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:SAP_Customer_Number__c!=''">
          <xsdLocal1:IntegrationId>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:SAP_Customer_Number__c"/>
          </xsdLocal1:IntegrationId>
        </xsl:if>
		<xsl:if test="/tns:retrieveResponse/tns:result/ens:MSP_Flag__c!=''">
          <xsdLocal1:MFEAccountMSPFlag>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:MSP_Flag__c"/>
          </xsdLocal1:MFEAccountMSPFlag>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Language__c!=''">
          <xsdLocal1:LanguageCode>
            <xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/LanguageCodes_SFToSBL.dvm','Salesforce',/tns:retrieveResponse/tns:result/ens:Language__c,'Siebel','No Code Found')"/>
          </xsdLocal1:LanguageCode>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:NumberOfEmployees!=''">
          <xsdLocal1:MFEDNBEmployeesTotal>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:NumberOfEmployees"/>
          </xsdLocal1:MFEDNBEmployeesTotal>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Global_UCN__c!=''">
          <xsdLocal1:MFEGlobalUCN>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Global_UCN__c"/>
          </xsdLocal1:MFEGlobalUCN>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Legacy_MDM_ID__c!=''">
          <xsdLocal1:MFEMDMId>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Legacy_MDM_ID__c"/>
          </xsdLocal1:MFEMDMId>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Parent_Name__c!=''">
          <xsdLocal1:MFEParentName>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Parent_Name__c"/>
          </xsdLocal1:MFEParentName>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Parent_Partner_UCN__c!=''">
          <xsdLocal1:MFEParentPartnerUCN>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Parent_Partner_UCN__c"/>
          </xsdLocal1:MFEParentPartnerUCN>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Parent_UCN__c!=''">
          <xsdLocal1:MFEParentUCN>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Parent_UCN__c"/>
          </xsdLocal1:MFEParentUCN>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Fax!=''">
          <xsdLocal1:MainFaxNumber>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Fax"/>
          </xsdLocal1:MainFaxNumber>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Phone!=''">
          <xsdLocal1:MainPhoneNumber>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Phone"/>
          </xsdLocal1:MainPhoneNumber>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Total_AV_Account_Nodes__c!=''">
          <xsdLocal1:NAINodeQuantity>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Total_AV_Account_Nodes__c"/>
          </xsdLocal1:NAINodeQuantity>
        </xsl:if>
        <!--Dan'ss-->
       <!-- <xsl:choose>
          <xsl:when test="/tns:retrieveResponse/tns:result/ens:NameLocal!=''">
            <xsdLocal1:Name>
              <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:NameLocal"/>
            </xsdLocal1:Name>
            <xsdLocal1:NAISAPName1>
              <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Name"/>
            </xsdLocal1:NAISAPName1>
          </xsl:when>
          <xsl:otherwise>
            <xsdLocal1:Name>
              <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Name"/>
            </xsdLocal1:Name>
            <xsdLocal1:NAISAPName1>
              <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Name"/>
            </xsdLocal1:NAISAPName1>
          </xsl:otherwise>
        </xsl:choose>-->
		
	<!--
		
		<xsl:choose>
          <xsl:when test="/tns:retrieveResponse/tns:result/ens:NameLocal!=''">
            <xsdLocal1:Name>
              <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:NameLocal"/>
            </xsdLocal1:Name>
			      <xsl:choose>
				     <xsl:when test="$varCountry !='Japan'">
					       <xsl:if test="substring(/tns:retrieveResponse/tns:result/ens:NameLocal,1,40)!=''">
                            <xsdLocal1:NAISAPName1>
                                 <xsl:value-of select="substring(/tns:retrieveResponse/tns:result/ens:NameLocal,1,40)"/>
							 </xsdLocal1:NAISAPName1>
							 </xsl:if> 
							  <xsl:if test="substring(/tns:retrieveResponse/tns:result/ens:NameLocal,41,40)!=''">
                              <xsdLocal1:NAISAPName2>
                                 <xsl:value-of select="substring(/tns:retrieveResponse/tns:result/ens:NameLocal,41,40)"/>
							 </xsdLocal1:NAISAPName2>
							  </xsl:if> 
			          </xsl:when>
                   <xsl:otherwise>
				             <xsl:if test="substring(/tns:retrieveResponse/tns:result/ens:NameLocal,1,40)!=''">                              
                             <xsdLocal1:NAISAPName2>
                                 <xsl:value-of select="substring(/tns:retrieveResponse/tns:result/ens:NameLocal,1,40)"/>
							 </xsdLocal1:NAISAPName2>
							  </xsl:if> 
							   <xsl:if test="substring(/tns:retrieveResponse/tns:result/ens:NameLocal,41,40)!=''">                              
                            <xsdLocal1:MFESAPName4>
                                 <xsl:value-of select="substring(/tns:retrieveResponse/tns:result/ens:NameLocal,41,40)"/>
							 </xsdLocal1:MFESAPName4>
							 </xsl:if> 
					     </xsl:otherwise>
					    </xsl:choose>
         </xsl:when>
          <xsl:otherwise>
		     <xsdLocal1:Name>
              <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Name"/>
            </xsdLocal1:Name>
		       <xsl:choose>
				     <xsl:when test="$varCountry !='Japan'">
					       <xsl:if test="substring(/tns:retrieveResponse/tns:result/ens:Name,1,40)!=''">
                            <xsdLocal1:NAISAPName1>
                                 <xsl:value-of select="substring(/tns:retrieveResponse/tns:result/ens:Name,1,40)"/>
							 </xsdLocal1:NAISAPName1>
							 </xsl:if> 
							  <xsl:if test="substring(/tns:retrieveResponse/tns:result/ens:Name,41,40)!=''">
                              <xsdLocal1:NAISAPName2>
                                 <xsl:value-of select="substring(/tns:retrieveResponse/tns:result/ens:Name,41,40)"/>
							 </xsdLocal1:NAISAPName2>
							  </xsl:if> 
			          </xsl:when>
                   <xsl:otherwise>
				             <xsl:if test="substring(/tns:retrieveResponse/tns:result/ens:Name,1,40)!=''">                              
                             <xsdLocal1:NAISAPName2>
                                 <xsl:value-of select="substring(/tns:retrieveResponse/tns:result/ens:Name,1,40)"/>
							 </xsdLocal1:NAISAPName2>
							  </xsl:if> 
							   <xsl:if test="substring(/tns:retrieveResponse/tns:result/ens:Name,41,40)!=''">                              
                            <xsdLocal1:MFESAPName4>
                                 <xsl:value-of select="substring(/tns:retrieveResponse/tns:result/ens:Name,41,40)"/>
							 </xsdLocal1:MFESAPName4>
							 </xsl:if> 
					     </xsl:otherwise>
					    </xsl:choose>
				
        </xsl:otherwise>
    </xsl:choose>
	
	
	-->
	<xsl:if test="/tns:retrieveResponse/tns:result/ens:NameLocal!=''">
            <xsdLocal1:ISGSFAccountNameLocal>
              <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:NameLocal"/>
            </xsdLocal1:ISGSFAccountNameLocal>
			</xsl:if>
    <xsl:if test="/tns:retrieveResponse/tns:result/ens:Name!=''">
	          <xsdLocal1:Name>
              <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Name"/>
            </xsdLocal1:Name>
	</xsl:if>
	

        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Parent_DUNS__c!=''">
          <xsdLocal1:ParentHQDUNS>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Parent_DUNS__c"/>
          </xsdLocal1:ParentHQDUNS>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Alias__c!=''">
          <xsdLocal1:Alias>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Alias__c"/>
          </xsdLocal1:Alias>
        </xsl:if>
        <xsl:choose>
          <xsl:when test="/tns:retrieveResponse/tns:result/ens:Legacy_Id__c != ''">
            <xsdLocal1:Id>
              <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Legacy_Id__c"/>
            </xsdLocal1:Id>
          </xsl:when>
          <xsl:otherwise>
            <xsdLocal1:Id/>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Geo__c !=''">
          <xsdLocal1:Region>
            <xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/region.dvm','Salesforce',/tns:retrieveResponse/tns:result/ens:Geo__c,'Siebel','')"/>
          </xsdLocal1:Region>
        </xsl:if>
        <xsl:choose>
          <xsl:when test="dvm:lookupValue('oramds:/apps/dvm/AccountType_SFToSBL.dvm','SALESFORCE',/tns:retrieveResponse/tns:result/ens:RecordTypeId,'SBL','NoCode') = 'DRAFT'">
            <xsdLocal1:ISGSFDraftFlag>
              <xsl:text disable-output-escaping="no">Y</xsl:text>
            </xsdLocal1:ISGSFDraftFlag>
          </xsl:when>
          <xsl:otherwise>
            <xsdLocal1:ISGSFDraftFlag>
              <xsl:text disable-output-escaping="no">N</xsl:text>
            </xsdLocal1:ISGSFDraftFlag>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Total_Site_Employee__c!=''">
          <xsdLocal1:Employees>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Total_Site_Employee__c"/>
          </xsdLocal1:Employees>
        </xsl:if>
		<xsl:choose>
		<xsl:when test="/tns:retrieveResponse/tns:result/ens:Site_Designation__c and /tns:retrieveResponse/tns:result/ens:Site_Designation__c!=''">
          <xsdLocal1:MFESiteDesignation>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Site_Designation__c"/>
          </xsdLocal1:MFESiteDesignation>
        </xsl:when>
		<xsl:otherwise>
		<xsdLocal1:MFESiteDesignation>
            <xsl:text disable-output-escaping="no"></xsl:text>
          </xsdLocal1:MFESiteDesignation>
		</xsl:otherwise>
		</xsl:choose>
        <xsl:if test="$ParentId!=''">
          <xsdLocal1:ParentAccountId>
            <xsl:value-of select="$ParentId"/>
          </xsdLocal1:ParentAccountId>
        </xsl:if>
        <!--
<xsl:if test="$VarSourceSystem !=''">
<xsdLocal1:NAISiintSourceSystem>
<xsl:value-of select="$VarSourceSystem"/>
</xsdLocal1:NAISiintSourceSystem>
</xsl:if>
-->
    <!-- Commented for US3238   
	<xsl:choose>
          <xsl:when test="/tns:retrieveResponse/tns:result/ens:IsPartner='true' ">
            <xsdLocal1:InternalOrgFlag>
              <xsl:text disable-output-escaping="no">Y</xsl:text>
            </xsdLocal1:InternalOrgFlag>
          </xsl:when>
          <xsl:otherwise>
            <xsdLocal1:InternalOrgFlag>
              <xsl:text disable-output-escaping="no">N</xsl:text>
            </xsdLocal1:InternalOrgFlag>
          </xsl:otherwise>
        </xsl:choose> --> 
        <!--xsl:if test="/tns:retrieveResponse/tns:result/ens:Sub_Region__c!= ''">
<xsdLocal1:MFESubRegion>
<xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/subregion.dvm','Salesforce',/tns:retrieveResponse/tns:result/ens:Sub_Region__c,'Siebel','No Code Found')"/>
</xsdLocal1:MFESubRegion>
</xsl:if>
<xsl:if test="/tns:retrieveResponse/tns:result/ens:Region__c!= ''">
<xsdLocal1:Region>
<xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/region.dvm','Salesforce',/tns:retrieveResponse/tns:result/ens:Region__c,'Siebel','No Code Found')"/>
</xsdLocal1:Region>
</xsl:if>
<xsl:if test="/tns:retrieveResponse/tns:result/ens:Source_System__c != ''">
<xsdLocal1:NAISiintSourceSystem>
<xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/sourcesystem.dvm','Salesforce',/tns:retrieveResponse/tns:result/ens:Source_System__c ,'Siebel','No Code Found')"/>
</xsdLocal1:NAISiintSourceSystem>
</xsl:if>
-->
        <xsl:choose>
          <xsl:when test="(/tns:retrieveResponse/tns:result/ens:Source_System__c ='Siebel'  or /tns:retrieveResponse/tns:result/ens:Source_System__c ='Eloqua' or /tns:retrieveResponse/tns:result/ens:Source_System__c ='User Created' or /tns:retrieveResponse/tns:result/ens:Source_System__c ='')">
            <xsdLocal1:NAISiintSourceSystem>
              <xsl:text disable-output-escaping="no">Salesforce</xsl:text>
            </xsdLocal1:NAISiintSourceSystem>
          </xsl:when>
          <xsl:otherwise>
            <xsdLocal1:NAISiintSourceSystem>
              <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Source_System__c"/>
            </xsdLocal1:NAISiintSourceSystem>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Sync_Description__c != ''">
          <xsdLocal1:ISGSFSyncDescription>
            <xsl:value-of select="substring(/tns:retrieveResponse/tns:result/ens:Sync_Description__c,1,40)"/>
          </xsdLocal1:ISGSFSyncDescription>
        </xsl:if>
		<!--As per task T-503658-->
		    <xsl:if test="/tns:retrieveResponse/tns:result/ens:Type != ''">
              <xsdLocal1:Type>
                     <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Type"/>
              </xsdLocal1:Type>
            </xsl:if>
        <xsdLocal1:ListOfAccount_BusinessAddress>
          <xsdLocal1:Account_BusinessAddress IsPrimaryMVG="Y">
            <xsl:if test="/tns:retrieveResponse/tns:result/ens:BillingCity!=''">
              <xsdLocal1:City>
                <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:BillingCity"/>
              </xsdLocal1:City>
            </xsl:if>
            <xsdLocal1:Id/>
            <xsl:if test="/tns:retrieveResponse/tns:result/ens:BillingCountryCode!=''">
              <xsdLocal1:Country>
                <xsl:value-of select="$varCountry"/>
              </xsdLocal1:Country>
            </xsl:if>
            <xsl:if test="/tns:retrieveResponse/tns:result/ens:BillingState!=''">
			<xsl:choose>
			<xsl:when test="string-length(dvm:lookupValue('oramds:/apps/dvm/State_SFToSBL.dvm','SALESFORCE', concat(/tns:retrieveResponse/tns:result/ens:BillingState,'-'/tns:retrieveResponse/tns:result/ens:BillingCountryCode),'SBL','No Code Found')) &lt;= 10">
              <xsdLocal1:State>
                <xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/State_SFToSBL.dvm','SALESFORCE', concat(/tns:retrieveResponse/tns:result/ens:BillingState,'-'/tns:retrieveResponse/tns:result/ens:BillingCountryCode),'SBL','No Code Found')"/>
              </xsdLocal1:State>
			  </xsl:when>
			  <xsl:otherwise>
			  </xsl:otherwise>
			  </xsl:choose>
            </xsl:if>
            <xsl:if test="/tns:retrieveResponse/tns:result/ens:BillingPostalCode!=''">
              <xsdLocal1:PostalCode>
                <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:BillingPostalCode"/>
              </xsdLocal1:PostalCode>
            </xsl:if>
            <!--
<xsl:if test="/tns:retrieveResponse/tns:result/ens:BillingStreet!=''">
<xsdLocal1:StreetAddress>
<xsl:value-of select="substring(/tns:retrieveResponse/tns:result/ens:BillingStreet,1,40)"/>
</xsdLocal1:StreetAddress>
</xsl:if>
<xsl:if test="/tns:retrieveResponse/tns:result/ens:BillingStreet!=''">
<xsdLocal1:StreetAddress2>
<xsl:value-of select="substring(/tns:retrieveResponse/tns:result/ens:BillingStreet,41,40)"/>
</xsdLocal1:StreetAddress2>
</xsl:if>
<xsl:if test="/tns:retrieveResponse/tns:result/ens:BillingStreet!=''">
<xsdLocal1:StreetAddress3>
<xsl:value-of select="substring(/tns:retrieveResponse/tns:result/ens:BillingStreet,81,40)"/>
</xsdLocal1:StreetAddress3>
</xsl:if>-->
            <xsl:if test="/tns:retrieveResponse/tns:result/ens:Billing_Address_Street1__c!=''">
              <xsdLocal1:StreetAddress>
                <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Billing_Address_Street1__c"/>
              </xsdLocal1:StreetAddress>
            </xsl:if>
            <xsl:if test="/tns:retrieveResponse/tns:result/ens:Billing_Address_Street2__c !=''">
              <xsdLocal1:StreetAddress2>
                <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Billing_Address_Street2__c"/>
              </xsdLocal1:StreetAddress2>
            </xsl:if>
            <xsl:if test="/tns:retrieveResponse/tns:result/ens:Billing_Address_Street3__c  !=''">
              <xsdLocal1:StreetAddress3>
                <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Billing_Address_Street3__c"/>
              </xsdLocal1:StreetAddress3>
            </xsl:if>
          </xsdLocal1:Account_BusinessAddress>
        </xsdLocal1:ListOfAccount_BusinessAddress>
      </xsdLocal1:Account>
    </xsdLocal1:ListOfIsgsfaccountio>
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
  <xsl:template name="ConvertAddressToSiebel">
    <xsl:param name="Address"/>
    <xsl:if test="string-length($Address) != 0">
      <xsl:variable name="AddrLine1" select="substring($Address,1,40)"/>
      <xsl:variable name="AddrLine2" select="substring($Address,40,80)"/>
      <xsl:variable name="AddrLine3" select="substring($Address,80,120)"/>
      <xsl:variable name="ModifiedAddress" select="concat"/>
      <xsl:value-of select="$ModifiedDate"/>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
