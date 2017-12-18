<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/"
                xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions"
                xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/"
                xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/"
                xmlns:tns="urn:enterprise.soap.sforce.com"
                xmlns:ora="http://schemas.oracle.com/xpath/extension"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                xmlns:ns0="http://siebel.com/CustomUI"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:xsdLocal2="http://www.siebel.com/xml/ISG_SF_Channel_Partner_IO/Id"
                xmlns:xsdLocal3="http://www.siebel.com/xml/ISG_SF_Channel_Partner_IO/Query"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath"
                xmlns:med="http://schemas.oracle.com/mediator/xpath"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath"
                xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:fns="urn:fault.enterprise.soap.sforce.com"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:xsdLocal1="http://www.siebel.com/xml/ISG_SF_Channel_Partner_IO/Data"
                xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap"
                xmlns:ens="urn:sobject.enterprise.soap.sforce.com"
                exclude-result-prefixes="xsi xsl soap tns fns xsd ens soapenc ns0 xsdLocal2 xsdLocal3 xsdLocal1 xp20 bpws bpel bpm ora socket mhdr oraext dvm hwf med ids xdk xref ldap">
  <xsl:param name="opAddressId"/>
  <xsl:template match="/">
    <xsdLocal1:ListOfIsg_Sf_Channel_Partner_Io>
      <xsdLocal1:ChannelPartner Operation="">
        <xsl:for-each select="/tns:retrieveResponse/tns:result/ens:Account_Emails__r">
          <xsdLocal1:ListOfChannelPartner_NAIPartnerEmailAddr>
            <xsl:for-each select="tns:records">
              <xsl:variable name="TempPosition" select="position()"/>
              <xsl:if test="$TempPosition  >= 1">
                <xsdLocal1:ChannelPartner_NAIPartnerEmailAddr>
                  <xsdLocal1:Id>
                    <xsl:value-of select="concat(1,'++',$TempPosition)"/>
                  </xsdLocal1:Id>
                  <xsl:if test="ens:Email_Address__c!=''">
                    <xsdLocal1:NAIPartnerEmailAddr>
                      <xsl:value-of select="ens:Email_Address__c"/>
                    </xsdLocal1:NAIPartnerEmailAddr>
                  </xsl:if>
                  <xsl:if test="ens:Type__c!=''">
                    <xsdLocal1:ISGSFEmailNotifyType>
                      <xsl:value-of select="ens:Type__c"/>
                    </xsdLocal1:ISGSFEmailNotifyType>
                  </xsl:if>
                </xsdLocal1:ChannelPartner_NAIPartnerEmailAddr>
              </xsl:if>
            </xsl:for-each>
          </xsdLocal1:ListOfChannelPartner_NAIPartnerEmailAddr>
        </xsl:for-each>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:NumberOfEmployees!=''">
          <xsdLocal1:Employees>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:NumberOfEmployees"/>
          </xsdLocal1:Employees>
        </xsl:if>
        <!-- commented  out as per the I-218501      
	  <xsl:if test="/tns:retrieveResponse/tns:result/ens:Description!=''">
          <xsdLocal1:BusinessProfile>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Description"/>
          </xsdLocal1:BusinessProfile>
        </xsl:if>   
	-->
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:CurrencyIsoCode!=''">
          <xsdLocal1:CurrencyCode>
            <xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/currencycode.dvm','Salesforce',/tns:retrieveResponse/tns:result/ens:CurrencyIsoCode,'Siebel','No Code Found')"/>
          </xsdLocal1:CurrencyCode>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Geo__c!=''">
          <xsdLocal1:Region>
            <xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/region.dvm','Salesforce',/tns:retrieveResponse/tns:result/ens:Geo__c,'Siebel','')"/>
          </xsdLocal1:Region>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Account_DUNS__c">
          <xsdLocal1:DUNSNumber>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Account_DUNS__c"/>
          </xsdLocal1:DUNSNumber>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Partnership_Status__c">
          <xsl:choose>
            <xsl:when test="/tns:retrieveResponse/tns:result/ens:Partnership_Status__c = 'Registered'">
              <xsdLocal1:NAIProfileStatus>
                <xsl:text disable-output-escaping="no">Active</xsl:text>
              </xsdLocal1:NAIProfileStatus>
            </xsl:when>
            <xsl:otherwise>
              <xsdLocal1:NAIProfileStatus>
                <xsl:text disable-output-escaping="no">Inactive</xsl:text>
              </xsdLocal1:NAIProfileStatus>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:AnnualRevenue!=''">
          <xsdLocal1:AnnualRevenue>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:AnnualRevenue"/>
          </xsdLocal1:AnnualRevenue>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Diversity_Option__c!=''">
          <xsdLocal1:ISGDiversityOption>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Diversity_Option__c"/>
          </xsdLocal1:ISGDiversityOption>
        </xsl:if>
        <xsdLocal1:ISGSFSyncStatus>
          <xsl:text disable-output-escaping="no">SYNC_ON</xsl:text>
        </xsdLocal1:ISGSFSyncStatus>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Tax_ID_Number__c!= ''">
          <xsdLocal1:ISGTaxIDNum>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Tax_ID_Number__c"/>
          </xsdLocal1:ISGTaxIDNum>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Year_Established__c!= ''">
          <xsdLocal1:NAIYearEstablished>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Year_Established__c"/>
          </xsdLocal1:NAIYearEstablished>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Website!= ''">
          <xsdLocal1:HomePage>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Website"/>
          </xsdLocal1:HomePage>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Partner_Type__c!= ''">
          <xsdLocal1:NAIPartnerType>
            <xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/PartnerType_SFToSBL.dvm','SALESFORCE',/tns:retrieveResponse/tns:result/ens:Partner_Type__c,'SBL','NoCodeFound')"/>
          </xsdLocal1:NAIPartnerType>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Id!= ''">
          <xsdLocal1:ISGSFId>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Id"/>
          </xsdLocal1:ISGSFId>
        </xsl:if>
        <xsdLocal1:InternalOrgFlag>
          <xsl:text disable-output-escaping="no">Y</xsl:text>
        </xsdLocal1:InternalOrgFlag>
        <xsdLocal1:MFEMSPSpecialization>
          <xsl:text disable-output-escaping="no">Y</xsl:text>
        </xsdLocal1:MFEMSPSpecialization>
        <xsdLocal1:PartnershipFeesPaidFlag>
          <xsl:text disable-output-escaping="no">Y</xsl:text>
        </xsdLocal1:PartnershipFeesPaidFlag>
        <xsdLocal1:MFESupByPrtnrFlag>
          <xsl:text disable-output-escaping="no">Y</xsl:text>
        </xsdLocal1:MFESupByPrtnrFlag>
        <xsdLocal1:OrganizationFlag>
          <xsl:text disable-output-escaping="no">Y</xsl:text>
        </xsdLocal1:OrganizationFlag>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Fax!= ''">
          <xsdLocal1:MainFaxNumber>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Fax"/>
          </xsdLocal1:MainFaxNumber>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Phone!= ''">
          <xsdLocal1:MainPhoneNumber>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Phone"/>
          </xsdLocal1:MainPhoneNumber>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Alias__c!= ''">
          <xsdLocal1:Alias>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Alias__c"/>
          </xsdLocal1:Alias>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:CreatedDate!=''">
          <xsdLocal1:ISGSFCreated>
            <xsl:value-of select="concat(substring-before(/tns:retrieveResponse/tns:result/ens:CreatedDate,'.'),'z')"/>
          </xsdLocal1:ISGSFCreated>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:CreatedById!=''">
          <xsdLocal1:ISGSFCreatedBy>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:CreatedById"/>
          </xsdLocal1:ISGSFCreatedBy>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:LastModifiedDate!=''">
          <xsdLocal1:ISGSFUpdated>
            <xsl:value-of select="concat(substring-before(/tns:retrieveResponse/tns:result/ens:LastModifiedDate,'.'),'z')"/>
          </xsdLocal1:ISGSFUpdated>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:LastModifiedById!=''">
          <xsdLocal1:ISGSFUpdatedBy>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:LastModifiedById"/>
          </xsdLocal1:ISGSFUpdatedBy>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Account_UCN__c !=''">
          <xsdLocal1:CSN>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Account_UCN__c"/>
          </xsdLocal1:CSN>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Global_UCN__c!=''">
          <xsdLocal1:MFEGlobalUCN>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Global_UCN__c"/>
          </xsdLocal1:MFEGlobalUCN>
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
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Global_Name__c!=''">
          <xsdLocal1:MFEGlobalName>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Global_Name__c"/>
          </xsdLocal1:MFEGlobalName>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Legacy_MDM_ID__c!=''">
          <xsdLocal1:ISGMDMId>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Legacy_MDM_ID__c"/>
          </xsdLocal1:ISGMDMId>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Resell_Level__c!=''">
          <xsdLocal1:ISGSFPartnerResellLevel>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Resell_Level__c"/>
          </xsdLocal1:ISGSFPartnerResellLevel>
        </xsl:if>
        <!-- <xsl:if test="/tns:retrieveResponse/tns:result/ens:Active_Specializations__c!=''">
          <xsdLocal1:ISGSFActiveSpecializations>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Active_Specializations__c"/>
          </xsdLocal1:ISGSFActiveSpecializations>
        </xsl:if>-->
        <xsl:choose>
          <xsl:when test="/tns:retrieveResponse/tns:result/ens:Source_System__c='User Created'">
            <xsdLocal1:NAISiintSourceSystem>
              <xsl:text disable-output-escaping="no">Salesforce</xsl:text>
            </xsdLocal1:NAISiintSourceSystem>
          </xsl:when>
          <xsl:otherwise>
            <xsdLocal1:NAISiintSourceSystem>
              <xsl:value-of select="tns:retrieveResponse/tns:result/ens:Source_System__c"/>
            </xsdLocal1:NAISiintSourceSystem>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Customer_Account_Group__c!=''">
          <xsdLocal1:CustomerAccountGroup>
            <xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/customeraccountgroup.dvm','Salesforce',/tns:retrieveResponse/tns:result/ens:Customer_Account_Group__c ,'Siebel','No Code Found')"/>
          </xsdLocal1:CustomerAccountGroup>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:MSP_Pricing_Band__c!= ''">
          <xsdLocal1:MFEMSPBand>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:MSP_Pricing_Band__c"/>
          </xsdLocal1:MFEMSPBand>
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
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Industry!= ''">
          <xsdLocal1:NAIOtherVerticalMarketFocus>
            <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Industry"/>
          </xsdLocal1:NAIOtherVerticalMarketFocus>
        </xsl:if>
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Name!= ''">
          <xsdLocal1:Name>
            <xsl:value-of select="substring(/tns:retrieveResponse/tns:result/ens:Name,1,100)"/>
          </xsdLocal1:Name>
        </xsl:if>
        <xsdLocal1:OrganizationFlag>
          <xsl:text disable-output-escaping="no">Y</xsl:text>
        </xsdLocal1:OrganizationFlag>
      <!--  Commented for US3238
	  <xsl:if test="/tns:retrieveResponse/tns:result/ens:IsPartner">
          <xsdLocal1:PartnerFlag>
            <xsl:text disable-output-escaping="no">Y</xsl:text>
          </xsdLocal1:PartnerFlag>
        </xsl:if> -->
        <xsdLocal1:PartnershipFeesPaidFlag>
          <xsl:text disable-output-escaping="no">Y</xsl:text>
        </xsdLocal1:PartnershipFeesPaidFlag>
        <xsdLocal1:PublishFlag>
          <xsl:text disable-output-escaping="no">Y</xsl:text>
        </xsdLocal1:PublishFlag>
        <xsl:choose>
          <xsl:when test="/tns:retrieveResponse/tns:result/ens:Publicly_Traded_Company__c='Yes'">
            <xsdLocal1:ISGPublicTraded>
              <xsl:text disable-output-escaping="no">Y</xsl:text>
            </xsdLocal1:ISGPublicTraded>
          </xsl:when>
          <xsl:otherwise>
            <xsdLocal1:ISGPublicTraded>
              <xsl:text disable-output-escaping="no">N</xsl:text>
            </xsdLocal1:ISGPublicTraded>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:choose>
          <xsl:when test="/tns:retrieveResponse/tns:result/ens:HQ_Flag__c='true'">
            <xsdLocal1:ISGHeadquartersFlag>
              <xsl:text disable-output-escaping="no">Y</xsl:text>
            </xsdLocal1:ISGHeadquartersFlag>
          </xsl:when>
          <xsl:otherwise>
            <xsdLocal1:ISGHeadquartersFlag>
              <xsl:text disable-output-escaping="no">N</xsl:text>
            </xsdLocal1:ISGHeadquartersFlag>
          </xsl:otherwise>
        </xsl:choose>
        <xsdLocal1:ListOfChannelPartner_BusinessAddress>
          <xsdLocal1:ChannelPartner_BusinessAddress IsPrimaryMVG="Y">
            <xsl:choose>
              <xsl:when test="$opAddressId!=''">
                <xsdLocal1:Id>
                  <xsl:value-of select="$opAddressId"/>
                </xsdLocal1:Id>
              </xsl:when>
              <xsl:otherwise>
                <xsdLocal1:Id>
                  <xsl:text disable-output-escaping="no">1++1</xsl:text>
                </xsdLocal1:Id>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="/tns:retrieveResponse/tns:result/ens:BillingCity!= ''">
              <xsdLocal1:City>
                <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:BillingCity"/>
              </xsdLocal1:City>
            </xsl:if>
            <xsl:if test="/tns:retrieveResponse/tns:result/ens:BillingCountryCode!= ''">
              <xsdLocal1:Country>
                <xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/Country_SFToSBL.dvm','SALESFORCE',/tns:retrieveResponse/tns:result/ens:BillingCountryCode,'SBL','USA')"/>
              </xsdLocal1:Country>
            </xsl:if>
            <xsl:if test="/tns:retrieveResponse/tns:result/ens:BillingState!= ''">
			<xsl:choose>
			<xsl:when test="string-length(dvm:lookupValue('oramds:/apps/dvm/State_SFToSBL.dvm','SALESFORCE',concat(/tns:retrieveResponse/tns:result/ens:BillingState,'-'/tns:retrieveResponse/tns:result/ens:BillingCountryCode),'SBL','NoCode')) &lt;= 10">
              <xsdLocal1:State>
                <xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/State_SFToSBL.dvm','SALESFORCE',concat(/tns:retrieveResponse/tns:result/ens:BillingState,'-'/tns:retrieveResponse/tns:result/ens:BillingCountryCode),'SBL','NoCode')"/>
              </xsdLocal1:State>
			  </xsl:when>
			  <xsl:otherwise>
			  </xsl:otherwise>
			  
			  </xsl:choose>
            </xsl:if>
            <xsl:if test="/tns:retrieveResponse/tns:result/ens:BillingAddress/tns:county!= ''">
              <xsdLocal1:County>
                <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:BillingAddress/tns:county"/>
              </xsdLocal1:County>
            </xsl:if>
            <xsl:if test="/tns:retrieveResponse/tns:result/ens:BillingAddress/tns:postalCode!= ''">
              <xsdLocal1:PostalCode>
                <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:BillingAddress/tns:postalCode"/>
              </xsdLocal1:PostalCode>
            </xsl:if>
            <xsdLocal1:NAIAddressName>
              <xsl:text disable-output-escaping="no">Street Address</xsl:text>
            </xsdLocal1:NAIAddressName>
            <xsdLocal1:NAIAddressType>
              <xsl:text disable-output-escaping="no">Corporate Office</xsl:text>
            </xsdLocal1:NAIAddressType>
            <!--xsl:if test="/tns:retrieveResponse/tns:result/ens:BillingAddress/tns:street!=''">
              <xsdLocal1:StreetAddress>
                <xsl:value-of select="substring(tns:retrieveResponse/tns:result/ens:BillingAddress/tns:street,1,40)"/>
              </xsdLocal1:StreetAddress>
            </xsl:if>
            <xsl:if test="/tns:retrieveResponse/tns:result/ens:BillingAddress/tns:street!=''">
              <xsdLocal1:StreetAddress2>
                <xsl:value-of select="substring(/tns:retrieveResponse/tns:result/ens:BillingAddress/tns:street,41,40)"/>
              </xsdLocal1:StreetAddress2>
            </xsl:if>
            <xsl:if test="/tns:retrieveResponse/tns:result/ens:BillingAddress/tns:street!=''">
              <xsdLocal1:StreetAddress3>
                <xsl:value-of select="substring(/tns:retrieveResponse/tns:result/ens:BillingAddress/tns:street,81,40)"/>
              </xsdLocal1:StreetAddress3>
            </xsl:if-->
			
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
			
          </xsdLocal1:ChannelPartner_BusinessAddress>
        </xsdLocal1:ListOfChannelPartner_BusinessAddress>
        <!-- Added the below 1 new element as per the mapping req-->
        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Vertical_Market_Focus__c!= ''">
          <xsl:choose>
            <xsl:when test="contains(/tns:retrieveResponse/tns:result/ens:Vertical_Market_Focus__c,';')">
              <xsdLocal1:ListOfChannelPartner_TargetMarketSegment>
                <xsl:call-template name="SubStringByDelimeter">
                  <xsl:with-param name="text"
                                  select="/tns:retrieveResponse/tns:result/ens:Vertical_Market_Focus__c"/>
                  <xsl:with-param name="delimiter" select="';'"/>
                  <xsl:with-param name="index" select="1"/>
                </xsl:call-template>
              </xsdLocal1:ListOfChannelPartner_TargetMarketSegment>
            </xsl:when>
            <xsl:otherwise>
              <xsdLocal1:ListOfChannelPartner_TargetMarketSegment>
                <xsdLocal1:ChannelPartner_TargetMarketSegment>
                  <xsdLocal1:Id>
                    <xsl:value-of select='dvm:lookupValue("oramds:/apps/dvm/SFToSBLPartnerIndustry.dvm","Salesforce",/tns:retrieveResponse/tns:result/ens:Vertical_Market_Focus__c,"Siebel","1-11OT8F")'/>
                  </xsdLocal1:Id>
                  <!--  <xsdLocal1:TargetMarketSegment>
                    <xsl:value-of select='dvm:lookupValue("oramds:/apps/dvm/SFToSBLPartnerIndustry.dvm","Salesforce",/tns:retrieveResponse/tns:result/ens:Vertical_Market_Focus__c,"Siebel","Other")'/>
                  </xsdLocal1:TargetMarketSegment> -->
                </xsdLocal1:ChannelPartner_TargetMarketSegment>
              </xsdLocal1:ListOfChannelPartner_TargetMarketSegment>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:if>
      </xsdLocal1:ChannelPartner>
    </xsdLocal1:ListOfIsg_Sf_Channel_Partner_Io>
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
  <xsl:template name="SubStringByDelimeter">
    <xsl:param name="text"/>
    <xsl:param name="delimiter" select="';'"/>
    <xsl:param name="index"/>
    <xsl:choose>
      <xsl:when test="contains($text,$delimiter)">
        <xsdLocal1:ChannelPartner_TargetMarketSegment>
          <xsdLocal1:Id>
            <xsl:value-of select='dvm:lookupValue("oramds:/apps/dvm/SFToSBLPartnerIndustry.dvm","Salesforce",substring-before($text,$delimiter),"Siebel","1-11OT8F")'/>
          </xsdLocal1:Id>
          <!-- <xsdLocal1:TargetMarketSegment>
            <xsl:value-of select='dvm:lookupValue("oramds:/apps/dvm/SFToSBLPartnerIndustry.dvm","Salesforce",substring-before($text,$delimiter),"Siebel","Other")'/>
          </xsdLocal1:TargetMarketSegment> -->
        </xsdLocal1:ChannelPartner_TargetMarketSegment>
        <xsl:call-template name="SubStringByDelimeter">
          <xsl:with-param name="text"
                          select="substring-after($text,$delimiter)"/>
          <xsl:with-param name="delimiter" select="$delimiter"/>
          <xsl:with-param name="index" select="$index+1"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsdLocal1:ChannelPartner_TargetMarketSegment>
          <xsdLocal1:Id>
            <xsl:value-of select='dvm:lookupValue("oramds:/apps/dvm/SFToSBLPartnerIndustry.dvm","Salesforce",$text,"Siebel","1-11OT8F")'/>
          </xsdLocal1:Id>
          <!--  <xsdLocal1:TargetMarketSegment>
            <xsl:value-of select='dvm:lookupValue("oramds:/apps/dvm/SFToSBLPartnerIndustry.dvm","Salesforce",$text,"Siebel","Other")'/>
          </xsdLocal1:TargetMarketSegment> -->
        </xsdLocal1:ChannelPartner_TargetMarketSegment>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>