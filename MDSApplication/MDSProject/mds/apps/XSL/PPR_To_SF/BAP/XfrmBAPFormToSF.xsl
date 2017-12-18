<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0"
                xmlns:aia="http://www.oracle.com/XSL/Transform/java/oracle.apps.aia.core.xpath.AIAFunctions"
                xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions"
                xmlns:plnk="http://schemas.xmlsoap.org/ws/2003/05/partner-link/"
                xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/"
                xmlns:tns="urn:enterprise.soap.sforce.com"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:ora="http://schemas.oracle.com/xpath/extension"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                xmlns:ns1="http://xmlns.oracle.com/InsertContactSFProvABCSImpl/PPR_BAP_SFDCIntegration/UpsertBAPSFDCProvider"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:ns2="http://IsecG-SFDCIntegration/BAPForm"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath"
                xmlns:med="http://schemas.oracle.com/mediator/xpath"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath"
                xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:fns="urn:fault.enterprise.soap.sforce.com"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:ens="urn:sobject.enterprise.soap.sforce.com"
                xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap"
                exclude-result-prefixes="xsi xsl plnk wsdl ns1 ns2 xsd soap tns fns ens aia bpws xp20 bpel bpm ora socket mhdr oraext dvm hwf med ids xdk xref ldap">
   <xsl:template match="/">
      <tns:create>
         <tns:sObjects>
            <xsl:attribute name="xsi:type">
               <xsl:text disable-output-escaping="no">ens:Lead</xsl:text>
            </xsl:attribute>
            <xsl:if test="/ns2:BAPForm/ns2:ListBAPFormData/ns2:CompanyName !=''">
               <ens:Company>
                  <xsl:value-of select="/ns2:BAPForm/ns2:ListBAPFormData/ns2:CompanyName"/>
               </ens:Company>
            </xsl:if>
            <xsl:if test="/ns2:BAPForm/ns2:ListBAPFormData/ns2:Country !=''">
               <ens:Country>
                  <xsl:value-of select="/ns2:BAPForm/ns2:ListBAPFormData/ns2:Country"/>
               </ens:Country>
            </xsl:if>
            <xsl:if test="/ns2:BAPForm/ns2:ListBAPFormData/ns2:Address1 !='' and /ns2:BAPForm/ns2:ListBAPFormData/ns2:Address2 and /ns2:BAPForm/ns2:ListBAPFormData/ns2:Address3">
               <ens:Street>
                 <xsl:value-of select='concat(normalize-space(/ns2:BAPForm/ns2:ListBAPFormData/ns2:Address1),"&#x000d;&#x000a;",normalize-space(/ns2:BAPForm/ns2:ListBAPFormData/ns2:Address2),"&#x000d;&#x000a;",normalize-space(/ns2:BAPForm/ns2:ListBAPFormData/ns2:Address3))'/>
             </ens:Street>
            </xsl:if>
            <xsl:if test="/ns2:BAPForm/ns2:ListBAPFormData/ns2:City !=''">
               <ens:City>
                  <xsl:value-of select="/ns2:BAPForm/ns2:ListBAPFormData/ns2:City"/>
               </ens:City>
            </xsl:if>
            <xsl:if test="/ns2:BAPForm/ns2:ListBAPFormData/ns2:State !=''">
               <ens:State>
                  <xsl:value-of select="/ns2:BAPForm/ns2:ListBAPFormData/ns2:State"/>
               </ens:State>
            </xsl:if>
            <xsl:if test="/ns2:BAPForm/ns2:ListBAPFormData/ns2:PostalCode !=''">
               <ens:PostalCode>
                  <xsl:value-of select="/ns2:BAPForm/ns2:ListBAPFormData/ns2:PostalCode"/>
               </ens:PostalCode>
            </xsl:if>
            <xsl:if test="/ns2:BAPForm/ns2:ListBAPFormData/ns2:MainFaxNumber !=''">
               <ens:Fax>
                  <xsl:value-of select="/ns2:BAPForm/ns2:ListBAPFormData/ns2:MainFaxNumber"/>
               </ens:Fax>
            </xsl:if>
            <xsl:if test="/ns2:BAPForm/ns2:ListBAPFormData/ns2:WebsiteURL !=''">
               <ens:Website>
                  <xsl:value-of select="/ns2:BAPForm/ns2:ListBAPFormData/ns2:WebsiteURL"/>
               </ens:Website>
            </xsl:if>
            <xsl:if test="/ns2:BAPForm/ns2:ListBAPFormData/ns2:YearFounded !=''">
               <ens:Year_Founded__c>
                  <xsl:value-of select="/ns2:BAPForm/ns2:ListBAPFormData/ns2:YearFounded"/>
               </ens:Year_Founded__c>
            </xsl:if>
            <xsl:if test="/ns2:BAPForm/ns2:ListBAPFormData/ns2:AnnualTopLineRevenue !=''">
               <ens:AnnualRevenue>
                  <xsl:value-of select="/ns2:BAPForm/ns2:ListBAPFormData/ns2:AnnualTopLineRevenue"/>
               </ens:AnnualRevenue>
            </xsl:if>
            <xsl:if test="/ns2:BAPForm/ns2:ListBAPFormData/ns2:NumOfEmployees !=''">
               <ens:NumberOfEmployees>
                  <xsl:value-of select="/ns2:BAPForm/ns2:ListBAPFormData/ns2:NumOfEmployees"/>
               </ens:NumberOfEmployees>
            </xsl:if>
            <xsl:if test="/ns2:BAPForm/ns2:ListBAPFormData/ns2:SellProductToGovtEntity !=''">
               <xsl:choose>
                  <xsl:when test="/ns2:BAPForm/ns2:ListBAPFormData/ns2:SellProductToGovtEntity ='N'">
                     <ens:Business_w_Government_Entity__c>
                        <xsl:text disable-output-escaping="no">0</xsl:text>
                     </ens:Business_w_Government_Entity__c>
                  </xsl:when>
                  <xsl:otherwise>
                     <ens:Business_w_Government_Entity__c>
                        <xsl:text disable-output-escaping="no">1</xsl:text>
                     </ens:Business_w_Government_Entity__c>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:if>
            <xsl:if test="/ns2:BAPForm/ns2:ListBAPFormData/ns2:FirstName !=''">
               <ens:FirstName>
                  <xsl:value-of select="/ns2:BAPForm/ns2:ListBAPFormData/ns2:FirstName"/>
               </ens:FirstName>
            </xsl:if>
            <xsl:if test="/ns2:BAPForm/ns2:ListBAPFormData/ns2:LastName !=''">
               <ens:LastName>
                  <xsl:value-of select="/ns2:BAPForm/ns2:ListBAPFormData/ns2:LastName"/>
               </ens:LastName>
            </xsl:if>
            <xsl:if test="/ns2:BAPForm/ns2:ListBAPFormData/ns2:JobTitle !=''">
               <ens:Title>
                  <xsl:value-of select="/ns2:BAPForm/ns2:ListBAPFormData/ns2:JobTitle"/>
               </ens:Title>
            </xsl:if>
            <xsl:if test="/ns2:BAPForm/ns2:ListBAPFormData/ns2:EmailAddress !=''">
               <ens:Email>
                  <xsl:value-of select="/ns2:BAPForm/ns2:ListBAPFormData/ns2:EmailAddress"/>
               </ens:Email>
            </xsl:if>
            <xsl:if test="/ns2:BAPForm/ns2:ListBAPFormData/ns2:MainPhoneNumber !=''">
               <ens:Phone>
                  <xsl:value-of select="/ns2:BAPForm/ns2:ListBAPFormData/ns2:MainPhoneNumber"/>
               </ens:Phone>
            </xsl:if>
            <xsl:if test="/ns2:BAPForm/ns2:ListBAPFormData/ns2:MobilePhone !=''">
               <ens:MobilePhone>
                  <xsl:value-of select="/ns2:BAPForm/ns2:ListBAPFormData/ns2:MobilePhone"/>
               </ens:MobilePhone>
            </xsl:if>
            <xsl:if test="/ns2:BAPForm/ns2:ListBAPFormData/ns2:PreferredLang !=''">
               <ens:Preferred_Language__c>
                  <xsl:value-of select="/ns2:BAPForm/ns2:ListBAPFormData/ns2:PreferredLang"/>
               </ens:Preferred_Language__c>
            </xsl:if>
            <xsl:if test="/ns2:BAPForm/ns2:ListBAPFormData/ns2:PriContactMethod !=''">
               <ens:Preferred_Contact_Method__c>
                  <xsl:value-of select="/ns2:BAPForm/ns2:ListBAPFormData/ns2:PriContactMethod"/>
               </ens:Preferred_Contact_Method__c>
            </xsl:if>
            <xsl:if test="/ns2:BAPForm/ns2:ListBAPFormData/ns2:VenodorName !=''">
               <ens:Existing_Relationship_Info__c>
                  <xsl:value-of select="/ns2:BAPForm/ns2:ListBAPFormData/ns2:VenodorName"/>
               </ens:Existing_Relationship_Info__c>
            </xsl:if>
            <!-- Added Mapping -->
            <ens:Partner_Type__c>
               <xsl:text disable-output-escaping="no">Reseller</xsl:text>
            </ens:Partner_Type__c>
            <ens:RecordType>
               <ens:Name>
                  <xsl:text disable-output-escaping="no">Become a Partner</xsl:text>
               </ens:Name>
            </ens:RecordType>
            <!-- Added below 2 elements as per the new Mapping Req-->
            <xsl:if test="/ns2:BAPForm/ns2:ListBAPFormData/ns2:WorkPhone !=''">
               <ens:Contact_Work_Phone__c>
                  <xsl:value-of select="/ns2:BAPForm/ns2:ListBAPFormData/ns2:WorkPhone"/>
               </ens:Contact_Work_Phone__c>
            </xsl:if>
            <xsl:if test="/ns2:BAPForm/ns2:ListBAPFormData/ns2:WorkPhoneExtension !=''">
               <ens:Work_Phone_Extension__c>
                  <xsl:value-of select="/ns2:BAPForm/ns2:ListBAPFormData/ns2:WorkPhoneExtension"/>
               </ens:Work_Phone_Extension__c>
            </xsl:if>
            <xsl:if test="/ns2:BAPForm/ns2:ListBAPFormData/ns2:PartnerRole !=''">
               <ens:Partner_Role__c>
                  <xsl:value-of select="/ns2:BAPForm/ns2:ListBAPFormData/ns2:PartnerRole"/>
               </ens:Partner_Role__c>
            </xsl:if>
            <xsl:if test="/ns2:BAPForm/ns2:ListBAPFormData/ns2:TradeRegulatedCountries !=''">
               <xsl:choose>
                  <xsl:when test="contains(/ns2:BAPForm/ns2:ListBAPFormData/ns2:TradeRegulatedCountries,',')">
                     <ens:Business_w_Countries__c>
                        <xsl:call-template name="string-replace">
                           <xsl:with-param name="string"
                                           select="/ns2:BAPForm/ns2:ListBAPFormData/ns2:TradeRegulatedCountries"/>
                           <xsl:with-param name="replace" select="','"/>
                           <xsl:with-param name="with" select="';'"/>
                        </xsl:call-template>
                     </ens:Business_w_Countries__c>
                  </xsl:when>
                  <xsl:otherwise>
                     <ens:Business_w_Countries__c>
                        <xsl:value-of select="/ns2:BAPForm/ns2:ListBAPFormData/ns2:TradeRegulatedCountries"/>
                     </ens:Business_w_Countries__c>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:if>
            <xsl:if test="/ns2:BAPForm/ns2:ListBAPFormData/ns2:MSPSpecialization !=''">
               <xsl:choose>
                  <xsl:when test="/ns2:BAPForm/ns2:ListBAPFormData/ns2:MSPSpecialization='Y'">
                     <ens:MSP_Interest__c>
                        <xsl:text disable-output-escaping="no">true</xsl:text>
                     </ens:MSP_Interest__c>
                  </xsl:when>
                  <xsl:otherwise>
                     <ens:MSP_Interest__c>
                        <xsl:text disable-output-escaping="no">false</xsl:text>
                     </ens:MSP_Interest__c>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:if>
         </tns:sObjects>
      </tns:create>
   </xsl:template>
   <xsl:template name="string-replace">
      <xsl:param name="string"/>
      <xsl:param name="replace"/>
      <xsl:param name="with"/>
      <xsl:choose>
         <xsl:when test="contains($string, $replace)">
            <xsl:value-of select="substring-before($string, $replace)"/>
            <xsl:value-of select="$with"/>
            <xsl:call-template name="string-replace">
               <xsl:with-param name="string"
                               select="substring-after($string,$replace)"/>
               <xsl:with-param name="replace" select="$replace"/>
               <xsl:with-param name="with" select="$with"/>
            </xsl:call-template>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$string"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
</xsl:stylesheet>