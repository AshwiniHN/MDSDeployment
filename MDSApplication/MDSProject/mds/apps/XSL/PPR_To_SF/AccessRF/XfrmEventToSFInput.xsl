<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/"
                xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions"
                xmlns:plnk="http://schemas.xmlsoap.org/ws/2003/05/partner-link/"
                xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/"
                xmlns:ns3="urn:enterprise.soap.sforce.com"
                xmlns:ora="http://schemas.oracle.com/xpath/extension"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath"
                xmlns:med="http://schemas.oracle.com/mediator/xpath"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:client="http://xmlns.oracle.com/ProcessEventsFromBroker"
                xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath"
                xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:fns="urn:fault.enterprise.soap.sforce.com"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:ns2="http://schemas.oracle.com/bpel/extension"
                xmlns:ns1="http://www.siebel.com/xml/EventsToProcessFromBroker"
                xmlns:ens="urn:sobject.enterprise.soap.sforce.com"
                xmlns:txn="http://xmlns.oracle.com/EAIBrokerProcessor"
                xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap"
                xmlns:ns8="http://IsecG-SFDCIntegration/PartnerPortalRequestAccess"
                exclude-result-prefixes="xsl plnk ns3 client xsd ns2 ns1 soap fns xp20 bpws bpel bpm ora socket mhdr oraext dvm hwf med ids xdk xref txn ldap ns8">
   <xsl:template match="/">
      <ns3:create>
         <xsl:for-each select="/client:ProcessEventsFromBrokerResponse/client:EventsFromEAIBrokerToProcess/ns1:ListOfEvent/ns1:Event">
            <ns3:sObjects>
               <xsl:attribute name="xsi:type">
                  <xsl:text disable-output-escaping="no">ens:Lead</xsl:text>
               </xsl:attribute>
               <xsl:if test="ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:Salutation">
                  <ens:Salutation>
                     <xsl:value-of select="ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:Salutation"/>
                  </ens:Salutation>
               </xsl:if>
               <xsl:if test="ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:FirstName">
                  <ens:FirstName>
                     <xsl:value-of select="ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:FirstName"/>
                  </ens:FirstName>
               </xsl:if>
               <xsl:if test="ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:LastName">
                  <ens:LastName>
                     <xsl:value-of select="ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:LastName"/>
                  </ens:LastName>
               </xsl:if>
               <xsl:if test="ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:EmailAddress">
                  <ens:Email>
                     <xsl:value-of select="ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:EmailAddress"/>
                  </ens:Email>
               </xsl:if>
               <xsl:if test="ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:SubmitterEmailAddress">
                  <ens:Email_Address_of_Submitter__c>
                     <xsl:value-of select="ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:SubmitterEmailAddress"/>
                  </ens:Email_Address_of_Submitter__c>
               </xsl:if>
               <xsl:if test="ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:JobTitle">
                  <ens:Title>
                     <xsl:value-of select="ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:JobTitle"/>
                  </ens:Title>
               </xsl:if>
               <xsl:if test="ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:PartnerRole">
                  <ens:Partner_Role__c>
                     <xsl:value-of select="ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:PartnerRole"/>
                  </ens:Partner_Role__c>
               </xsl:if>
               <xsl:if test="ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:CompanyName">
                  <ens:Company>
                     <xsl:value-of select="ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:CompanyName"/>
                  </ens:Company>
               </xsl:if>
               <xsl:if test="ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:Phone">
                  <ens:Phone>
                     <xsl:value-of select="ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:Phone"/>
                  </ens:Phone>
               </xsl:if>
               <xsl:if test="ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:MobilePhone">
                  <ens:MobilePhone>
                     <xsl:value-of select="ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:MobilePhone"/>
                  </ens:MobilePhone>
               </xsl:if>
               <xsl:if test="ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:PreferredLanguage">
                  <ens:Preferred_Language__c>
                     <xsl:value-of select="ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:PreferredLanguage"/>
                  </ens:Preferred_Language__c>
               </xsl:if>
               <xsl:if test="ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:Country">
                  <ens:Country>
                     <xsl:value-of select="ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:Country"/>
                  </ens:Country>
               </xsl:if>
               <xsl:if test="ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:City">
                  <ens:City>
                     <xsl:value-of select="ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:City"/>
                  </ens:City>
               </xsl:if>
               <xsl:if test="ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:State">
                  <ens:State>
                     <xsl:value-of select="ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:State"/>
                  </ens:State>
               </xsl:if>
               <xsl:if test="ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:Address1 and ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:Address2 and ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:Address3">
                  <ens:Street>
                     <xsl:value-of select='concat(normalize-space(ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:Address1),"&#x000d;&#x000a;",normalize-space(ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:Address2),"&#x000d;&#x000a;",normalize-space(ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:Address3))'/>
                  </ens:Street>
               </xsl:if>
               <xsl:if test="ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:PostalCode">
                  <ens:PostalCode>
                     <xsl:value-of select="ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:PostalCode"/>
                  </ens:PostalCode>
               </xsl:if>
               <xsl:if test="ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:Comments">
                  <ens:Comments__c>
                     <xsl:value-of select="ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:Comments"/>
                  </ens:Comments__c>
               </xsl:if>
               <xsl:if test="ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:FormerUser">
                  <xsl:if test="ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:FormerUser != ''">
                     <xsl:choose>
                        <xsl:when test="ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:FormerUser = 'Yes'">
                           <ens:Access_via_another_Partner__c>
                              <xsl:value-of select="number(1)"/>
                           </ens:Access_via_another_Partner__c>
                        </xsl:when>
                        <xsl:when test="ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:FormerUser = 'No'">
                           <ens:Access_via_another_Partner__c>
                              <xsl:value-of select="number(0)"/>
                           </ens:Access_via_another_Partner__c>
                        </xsl:when>
                     </xsl:choose>
                  </xsl:if>
               </xsl:if>
               <ens:RecordType>
                  <ens:Name>
                     <xsl:text disable-output-escaping="no">Request Access</xsl:text>
                  </ens:Name>
               </ens:RecordType>
               <xsl:if test="ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:FormerUserCompany">
                  <ens:Name_of_Partner_Company__c>
                     <xsl:value-of select="ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:FormerUserCompany"/>
                  </ens:Name_of_Partner_Company__c>
               </xsl:if>
               <xsl:if test="ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:FormerUserEmail">
                  <ens:Previous_Username_Email__c>
                     <xsl:value-of select="ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:FormerUserEmail"/>
                  </ens:Previous_Username_Email__c>
               </xsl:if>
               <!--    <xsl:if test="ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:TandCAccepted">
                  <xsl:if test="ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:TandCAccepted != ''">
                     <xsl:choose>
                        <xsl:when test="ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:TandCAccepted = 'Yes'">
                           <ens:T_C_Accepted__c>
                              <xsl:value-of select="number(1)"/>
                           </ens:T_C_Accepted__c>
                        </xsl:when>
                        <xsl:when test="ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:TandCAccepted = 'No'">
                           <ens:T_C_Accepted__c>
                              <xsl:value-of select="number(0)"/>
                           </ens:T_C_Accepted__c>
                        </xsl:when>
                     </xsl:choose>
                  </xsl:if>
               </xsl:if>
               <xsl:if test="ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:TandCAcceptanceDatetime">
                  <ens:T_C_Acceptance_Date__c>
                     <xsl:value-of select="ns1:Document/txn:TxnMessage/ns8:RequestAccess/ns8:TandCAcceptanceDatetime"/>
                  </ens:T_C_Acceptance_Date__c>
               </xsl:if> -->
            </ns3:sObjects>
         </xsl:for-each>
      </ns3:create>
   </xsl:template>
   <xsl:template name="replace-string">
      <xsl:param name="text"/>
      <xsl:param name="replace"/>
      <xsl:param name="with"/>
      <xsl:choose>
         <xsl:when test="contains($text,$replace)">
            <xsl:value-of select="substring-before($text,$replace)"/>
            <xsl:value-of select="$with"/>
            <xsl:call-template name="replace-string">
               <xsl:with-param name="text"
                               select="substring-after($text,$replace)"/>
               <xsl:with-param name="replace" select="$replace"/>
               <xsl:with-param name="with" select="$with"/>
            </xsl:call-template>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$text"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
</xsl:stylesheet>