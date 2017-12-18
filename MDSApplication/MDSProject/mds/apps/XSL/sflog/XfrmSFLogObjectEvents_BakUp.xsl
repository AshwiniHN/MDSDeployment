<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:ns2="http://xmlns.oracle.com/pcbpel/adapter/db/sp/getSFLogEvents" xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable" xmlns:ns3="http://insecg-salesforce/sflogeventsobjects" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions" xmlns:ns1="http://SFLogQueryStrings" xmlns:plt="http://schemas.xmlsoap.org/ws/2003/05/partner-link/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:tns="http://xmlns.oracle.com/pcbpel/adapter/db/SalesforceProject/ProcessSFLogEvents/pollSourceObj" xmlns:top="http://xmlns.oracle.com/pcbpel/adapter/db/top/pollSourceObj" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:secure="http://www.oracle.com/XSL/Transform/java/com.Securedata" xmlns:med="http://schemas.oracle.com/mediator/xpath" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:bpmn="http://schemas.oracle.com/bpm/xpath" xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap" exclude-result-prefixes="xsi xsl ns2 ns3 ns1 plt wsdl tns top xsd bpws xp20 bpel bpm ora socket mhdr oraext dvm hwf secure med ids xdk xref bpmn ldap">
   <xsl:template match="/">
      <ns3:SFLogObjectEvents>
         <xsl:for-each select="/ns2:OutputParameters/ns2:P_RECORDSET/ns2:Row">
            <xsl:choose>
               <xsl:when test="ns2:Column[@name='OBJECTTYPE'] = 'Opportunity' and (ns2:Column[@name='OPERATION'] = 'Create')">
                  <ns3:optyInsertEvents>
                     <ns3:SFLOGID>
                        <xsl:value-of select="ns2:Column[@name='SFLOGID']"/>
                     </ns3:SFLOGID>
                     <ns3:SFEVENTID>
                        <xsl:value-of select="ns2:Column[@name='SFEVENTID']"/>
                     </ns3:SFEVENTID>
                     <ns3:OBJECTID>
                        <xsl:value-of select="ns2:Column[@name='OBJECTID']"/>
                     </ns3:OBJECTID>
                     <ns3:OBJECTTYPE>
                        <xsl:value-of select="ns2:Column[@name='OBJECTTYPE']"/>
                     </ns3:OBJECTTYPE>
                     <ns3:OPERATION>
                        <xsl:value-of select="ns2:Column[@name='OPERATION']"/>
                     </ns3:OPERATION>
					 <ns3:PRIORITY>
                        <xsl:value-of select="ns2:Column[@name='PRIORITY']"/>
                     </ns3:PRIORITY>
                  </ns3:optyInsertEvents>               
                  
                  
               </xsl:when>
			    <xsl:when test="ns2:Column[@name='OBJECTTYPE'] = 'Account' and (ns2:Column[@name='OPERATION'] = 'Delete')">
                  <ns3:accountDeleteEvents>
                     <ns3:SFLOGID>
                        <xsl:value-of select="ns2:Column[@name='SFLOGID']"/>
                     </ns3:SFLOGID>
                     <ns3:SFEVENTID>
                        <xsl:value-of select="ns2:Column[@name='SFEVENTID']"/>
                     </ns3:SFEVENTID>
                     <ns3:OBJECTID>
                        <xsl:value-of select="ns2:Column[@name='OBJECTID']"/>
                     </ns3:OBJECTID>
                     <ns3:OBJECTTYPE>
                        <xsl:value-of select="ns2:Column[@name='OBJECTTYPE']"/>
                     </ns3:OBJECTTYPE>
                     <ns3:OPERATION>
                        <xsl:value-of select="ns2:Column[@name='OPERATION']"/>
                     </ns3:OPERATION>
					 <ns3:PRIORITY>
                        <xsl:value-of select="ns2:Column[@name='PRIORITY']"/>
                     </ns3:PRIORITY>
                  </ns3:accountDeleteEvents>               
                  
                  
               </xsl:when>
                <xsl:when test="ns2:Column[@name='OBJECTTYPE'] = 'Opportunity' and (ns2:Column[@name='OPERATION'] = 'Update')">
                  <ns3:optyUpdateEvents>
                     <ns3:SFLOGID>
                        <xsl:value-of select="ns2:Column[@name='SFLOGID']"/>
                     </ns3:SFLOGID>
                     <ns3:SFEVENTID>
                        <xsl:value-of select="ns2:Column[@name='SFEVENTID']"/>
                     </ns3:SFEVENTID>
                     <ns3:OBJECTID>
                        <xsl:value-of select="ns2:Column[@name='OBJECTID']"/>
                     </ns3:OBJECTID>
                     <ns3:OBJECTTYPE>
                        <xsl:value-of select="ns2:Column[@name='OBJECTTYPE']"/>
                     </ns3:OBJECTTYPE>
                     <ns3:OPERATION>
                        <xsl:value-of select="ns2:Column[@name='OPERATION']"/>
                     </ns3:OPERATION>
					 <ns3:PRIORITY>
                        <xsl:value-of select="ns2:Column[@name='PRIORITY']"/>
                     </ns3:PRIORITY>
                  </ns3:optyUpdateEvents>    
               </xsl:when>
               
               
               <xsl:when test="ns2:Column[@name='OBJECTTYPE'] = 'Opportunity' and ns2:Column[@name='OPERATION'] = 'Delete'">
                  <ns3:optyDeleteEvents>
                     <ns3:SFLOGID>
                        <xsl:value-of select="ns2:Column[@name='SFLOGID']"/>
                     </ns3:SFLOGID>
                     <ns3:SFEVENTID>
                        <xsl:value-of select="ns2:Column[@name='SFEVENTID']"/>
                     </ns3:SFEVENTID>
                     <ns3:OBJECTID>
                        <xsl:value-of select="ns2:Column[@name='OBJECTID']"/>
                     </ns3:OBJECTID>
                     <ns3:OBJECTTYPE>
                        <xsl:value-of select="ns2:Column[@name='OBJECTTYPE']"/>
                     </ns3:OBJECTTYPE>
                     <ns3:OPERATION>
                        <xsl:value-of select="ns2:Column[@name='OPERATION']"/>
                     </ns3:OPERATION>
					 <ns3:PRIORITY>
                        <xsl:value-of select="ns2:Column[@name='PRIORITY']"/>
                     </ns3:PRIORITY>
                  </ns3:optyDeleteEvents>
               </xsl:when>
			   
			   
			    <xsl:when test="ns2:Column[@name='OBJECTTYPE'] = 'Opportunity' and ns2:Column[@name='OPERATION'] = 'SyncOn'">
                  <ns3:optySyncOnEvents>
                     <ns3:SFLOGID>
                        <xsl:value-of select="ns2:Column[@name='SFLOGID']"/>
                     </ns3:SFLOGID>
                     <ns3:SFEVENTID>
                        <xsl:value-of select="ns2:Column[@name='SFEVENTID']"/>
                     </ns3:SFEVENTID>
                     <ns3:OBJECTID>
                        <xsl:value-of select="ns2:Column[@name='OBJECTID']"/>
                     </ns3:OBJECTID>
                     <ns3:OBJECTTYPE>
                        <xsl:value-of select="ns2:Column[@name='OBJECTTYPE']"/>
                     </ns3:OBJECTTYPE>
                     <ns3:OPERATION>
                        <xsl:value-of select="ns2:Column[@name='OPERATION']"/>
                     </ns3:OPERATION>
					 <ns3:PRIORITY>
                        <xsl:value-of select="ns2:Column[@name='PRIORITY']"/>
                     </ns3:PRIORITY>
                  </ns3:optySyncOnEvents>
               </xsl:when>
			   
               <xsl:when test="ns2:Column[@name='OBJECTTYPE'] = 'OpportunityLineItem' and (ns2:Column[@name='OPERATION'] = 'Create')">
                  <ns3:optyLineInsertEvents>
                     <ns3:SFLOGID>
                        <xsl:value-of select="ns2:Column[@name='SFLOGID']"/>
                     </ns3:SFLOGID>
                     <ns3:SFEVENTID>
                        <xsl:value-of select="ns2:Column[@name='SFEVENTID']"/>
                     </ns3:SFEVENTID>
                     <ns3:OBJECTID>
                        <xsl:value-of select="ns2:Column[@name='OBJECTID']"/>
                     </ns3:OBJECTID>
                     <ns3:OBJECTTYPE>
                        <xsl:value-of select="ns2:Column[@name='OBJECTTYPE']"/>
                     </ns3:OBJECTTYPE>
                     <ns3:OPERATION>
                        <xsl:value-of select="ns2:Column[@name='OPERATION']"/>
                     </ns3:OPERATION>
					 <ns3:PRIORITY>
                        <xsl:value-of select="ns2:Column[@name='PRIORITY']"/>
                     </ns3:PRIORITY>
                  </ns3:optyLineInsertEvents>
               </xsl:when>
               
               <xsl:when test="ns2:Column[@name='OBJECTTYPE'] = 'OpportunityLineItem' and (ns2:Column[@name='OPERATION'] = 'Update')">
                  <ns3:optyLineUpdateEvents>
                     <ns3:SFLOGID>
                        <xsl:value-of select="ns2:Column[@name='SFLOGID']"/>
                     </ns3:SFLOGID>
                     <ns3:SFEVENTID>
                        <xsl:value-of select="ns2:Column[@name='SFEVENTID']"/>
                     </ns3:SFEVENTID>
                     <ns3:OBJECTID>
                        <xsl:value-of select="ns2:Column[@name='OBJECTID']"/>
                     </ns3:OBJECTID>
                     <ns3:OBJECTTYPE>
                        <xsl:value-of select="ns2:Column[@name='OBJECTTYPE']"/>
                     </ns3:OBJECTTYPE>
                     <ns3:OPERATION>
                        <xsl:value-of select="ns2:Column[@name='OPERATION']"/>
                     </ns3:OPERATION>
					 <ns3:PRIORITY>
                        <xsl:value-of select="ns2:Column[@name='PRIORITY']"/>
                     </ns3:PRIORITY>
                  </ns3:optyLineUpdateEvents>
               </xsl:when>
               
               <xsl:when test="ns2:Column[@name='OBJECTTYPE'] = 'OpportunityLineItem' and ns2:Column[@name='OPERATION'] = 'Delete'">
                  <ns3:optyLineDeleteEvents>
                     <ns3:SFLOGID>
                        <xsl:value-of select="ns2:Column[@name='SFLOGID']"/>
                     </ns3:SFLOGID>
                     <ns3:SFEVENTID>
                        <xsl:value-of select="ns2:Column[@name='SFEVENTID']"/>
                     </ns3:SFEVENTID>
                     <ns3:OBJECTID>
                        <xsl:value-of select="ns2:Column[@name='OBJECTID']"/>
                     </ns3:OBJECTID>
                     <ns3:OBJECTTYPE>
                        <xsl:value-of select="ns2:Column[@name='OBJECTTYPE']"/>
                     </ns3:OBJECTTYPE>
                     <ns3:OPERATION>
                        <xsl:value-of select="ns2:Column[@name='OPERATION']"/>
                     </ns3:OPERATION>
					 <ns3:PRIORITY>
                        <xsl:value-of select="ns2:Column[@name='PRIORITY']"/>
                     </ns3:PRIORITY>
                  </ns3:optyLineDeleteEvents>
               </xsl:when>
               <xsl:when test="ns2:Column[@name='OBJECTTYPE'] = 'Account' and ns2:Column[@name='OPERATION'] = 'Create'">
                  <ns3:accountInsertEvents>
                     <ns3:SFLOGID>
                        <xsl:value-of select="ns2:Column[@name='SFLOGID']"/>
                     </ns3:SFLOGID>
                     <ns3:SFEVENTID>
                        <xsl:value-of select="ns2:Column[@name='SFEVENTID']"/>
                     </ns3:SFEVENTID>
                     <ns3:OBJECTID>
                        <xsl:value-of select="ns2:Column[@name='OBJECTID']"/>
                     </ns3:OBJECTID>
                     <ns3:OBJECTTYPE>
                        <xsl:value-of select="ns2:Column[@name='OBJECTTYPE']"/>
                     </ns3:OBJECTTYPE>
                     <ns3:OPERATION>
                        <xsl:value-of select="ns2:Column[@name='OPERATION']"/>
                     </ns3:OPERATION>
					 <ns3:PRIORITY>
                        <xsl:value-of select="ns2:Column[@name='PRIORITY']"/>
                     </ns3:PRIORITY>
                  </ns3:accountInsertEvents>
               </xsl:when>
               <xsl:when test="ns2:Column[@name='OBJECTTYPE'] = 'Account' and ns2:Column[@name='OPERATION'] = 'Update'">
                  <ns3:accountUpdateEvents>
                     <ns3:SFLOGID>
                        <xsl:value-of select="ns2:Column[@name='SFLOGID']"/>
                     </ns3:SFLOGID>
                     <ns3:SFEVENTID>
                        <xsl:value-of select="ns2:Column[@name='SFEVENTID']"/>
                     </ns3:SFEVENTID>
                     <ns3:OBJECTID>
                        <xsl:value-of select="ns2:Column[@name='OBJECTID']"/>
                     </ns3:OBJECTID>
                     <ns3:OBJECTTYPE>
                        <xsl:value-of select="ns2:Column[@name='OBJECTTYPE']"/>
                     </ns3:OBJECTTYPE>
                     <ns3:OPERATION>
                        <xsl:value-of select="ns2:Column[@name='OPERATION']"/>
                     </ns3:OPERATION>
					 <ns3:PRIORITY>
                        <xsl:value-of select="ns2:Column[@name='PRIORITY']"/>
                     </ns3:PRIORITY>
                  </ns3:accountUpdateEvents>
               </xsl:when>
               <xsl:when test="ns2:Column[@name='OBJECTTYPE'] = 'Contact' and ns2:Column[@name='OPERATION'] = 'Create'">
                  <ns3:contactInsertEvents>
                     <ns3:SFLOGID>
                        <xsl:value-of select="ns2:Column[@name='SFLOGID']"/>
                     </ns3:SFLOGID>
                     <ns3:SFEVENTID>
                        <xsl:value-of select="ns2:Column[@name='SFEVENTID']"/>
                     </ns3:SFEVENTID>
                     <ns3:OBJECTID>
                        <xsl:value-of select="ns2:Column[@name='OBJECTID']"/>
                     </ns3:OBJECTID>
                     <ns3:OBJECTTYPE>
                        <xsl:value-of select="ns2:Column[@name='OBJECTTYPE']"/>
                     </ns3:OBJECTTYPE>
                     <ns3:OPERATION>
                        <xsl:value-of select="ns2:Column[@name='OPERATION']"/>
                     </ns3:OPERATION>
					 <ns3:PRIORITY>
                        <xsl:value-of select="ns2:Column[@name='PRIORITY']"/>
                     </ns3:PRIORITY>
                  </ns3:contactInsertEvents>
               </xsl:when>
               <xsl:when test="ns2:Column[@name='OBJECTTYPE'] = 'Contact' and ns2:Column[@name='OPERATION'] = 'Update'">
                  <ns3:contactUpdateEvents>
                     <ns3:SFLOGID>
                        <xsl:value-of select="ns2:Column[@name='SFLOGID']"/>
                     </ns3:SFLOGID>
                     <ns3:SFEVENTID>
                        <xsl:value-of select="ns2:Column[@name='SFEVENTID']"/>
                     </ns3:SFEVENTID>
                     <ns3:OBJECTID>
                        <xsl:value-of select="ns2:Column[@name='OBJECTID']"/>
                     </ns3:OBJECTID>
                     <ns3:OBJECTTYPE>
                        <xsl:value-of select="ns2:Column[@name='OBJECTTYPE']"/>
                     </ns3:OBJECTTYPE>
                     <ns3:OPERATION>
                        <xsl:value-of select="ns2:Column[@name='OPERATION']"/>
                     </ns3:OPERATION>
					 <ns3:PRIORITY>
                        <xsl:value-of select="ns2:Column[@name='PRIORITY']"/>
                     </ns3:PRIORITY>
                  </ns3:contactUpdateEvents>
               </xsl:when>
               <xsl:when test="ns2:Column[@name='OBJECTTYPE'] = 'User' and ( ns2:Column[@name='OPERATION'] = 'Create' ) ">
                  <ns3:userInsertEvents>
                     <ns3:SFLOGID>
                        <xsl:value-of select="ns2:Column[@name='SFLOGID']"/>
                     </ns3:SFLOGID>
                     <ns3:SFEVENTID>
                        <xsl:value-of select="ns2:Column[@name='SFEVENTID']"/>
                     </ns3:SFEVENTID>
                     <ns3:OBJECTID>
                        <xsl:value-of select="ns2:Column[@name='OBJECTID']"/>
                     </ns3:OBJECTID>
                     <ns3:OBJECTTYPE>
                        <xsl:value-of select="ns2:Column[@name='OBJECTTYPE']"/>
                     </ns3:OBJECTTYPE>
                     <ns3:OPERATION>
                        <xsl:value-of select="ns2:Column[@name='OPERATION']"/>
                     </ns3:OPERATION>
					 <ns3:PRIORITY>
                        <xsl:value-of select="ns2:Column[@name='PRIORITY']"/>
                     </ns3:PRIORITY>
                  </ns3:userInsertEvents>
               </xsl:when>
			   <xsl:when test="ns2:Column[@name='OBJECTTYPE'] = 'User' and  (ns2:Column[@name='OPERATION'] = 'Update') ">
                  <ns3:userUpdateEvents>
                     <ns3:SFLOGID>
                        <xsl:value-of select="ns2:Column[@name='SFLOGID']"/>
                     </ns3:SFLOGID>
                     <ns3:SFEVENTID>
                        <xsl:value-of select="ns2:Column[@name='SFEVENTID']"/>
                     </ns3:SFEVENTID>
                     <ns3:OBJECTID>
                        <xsl:value-of select="ns2:Column[@name='OBJECTID']"/>
                     </ns3:OBJECTID>
                     <ns3:OBJECTTYPE>
                        <xsl:value-of select="ns2:Column[@name='OBJECTTYPE']"/>
                     </ns3:OBJECTTYPE>
                     <ns3:OPERATION>
                        <xsl:value-of select="ns2:Column[@name='OPERATION']"/>
                     </ns3:OPERATION>
					 <ns3:PRIORITY>
                        <xsl:value-of select="ns2:Column[@name='PRIORITY']"/>
                     </ns3:PRIORITY>
                  </ns3:userUpdateEvents>
               </xsl:when>
			   
			   
			   
			   
               <xsl:when test="ns2:Column[@name='OBJECTTYPE'] = 'User' and ns2:Column[@name='OPERATION'] = 'Delete'">
                  <ns3:userDeleteEvents>
                     <ns3:SFLOGID>
                        <xsl:value-of select="ns2:Column[@name='SFLOGID']"/>
                     </ns3:SFLOGID>
                     <ns3:SFEVENTID>
                        <xsl:value-of select="ns2:Column[@name='SFEVENTID']"/>
                     </ns3:SFEVENTID>
                     <ns3:OBJECTID>
                        <xsl:value-of select="ns2:Column[@name='OBJECTID']"/>
                     </ns3:OBJECTID>
                     <ns3:OBJECTTYPE>
                        <xsl:value-of select="ns2:Column[@name='OBJECTTYPE']"/>
                     </ns3:OBJECTTYPE>
                     <ns3:OPERATION>
                        <xsl:value-of select="ns2:Column[@name='OPERATION']"/>
                     </ns3:OPERATION>
					 <ns3:PRIORITY>
                        <xsl:value-of select="ns2:Column[@name='PRIORITY']"/>
                     </ns3:PRIORITY>
                  </ns3:userDeleteEvents>
               </xsl:when>
               <xsl:when test="ns2:Column[@name='OBJECTTYPE'] = 'PriceBookEntry' and (ns2:Column[@name='OPERATION'] = 'Create' or ns2:Column[@name='OPERATION'] = 'Update' or ns2:Column[@name='OPERATION'] = 'Add')">
                  <ns3:productPriceBook>
                     <ns3:SFLOGID>
                        <xsl:value-of select="ns2:Column[@name='SFLOGID']"/>
                     </ns3:SFLOGID>
                     <ns3:SFEVENTID>
                        <xsl:value-of select="ns2:Column[@name='SFEVENTID']"/>
                     </ns3:SFEVENTID>
                     <ns3:OBJECTID>
                        <xsl:value-of select="ns2:Column[@name='OBJECTID']"/>
                     </ns3:OBJECTID>
                     <ns3:OBJECTTYPE>
                        <xsl:value-of select="ns2:Column[@name='OBJECTTYPE']"/>
                     </ns3:OBJECTTYPE>
                     <ns3:OPERATION>
                        <xsl:value-of select="ns2:Column[@name='OPERATION']"/>
                     </ns3:OPERATION>
					 <ns3:PRIORITY>
                        <xsl:value-of select="ns2:Column[@name='PRIORITY']"/>
                     </ns3:PRIORITY>
                  </ns3:productPriceBook>
               </xsl:when>
               <xsl:when test="ns2:Column[@name='OBJECTTYPE'] = 'AccountContactAssoc' and (ns2:Column[@name='OPERATION'] = 'Create' or ns2:Column[@name='OPERATION'] = 'Update')">
                  <ns3:productPriceBook>
                     <ns3:SFLOGID>
                        <xsl:value-of select="ns2:Column[@name='SFLOGID']"/>
                     </ns3:SFLOGID>
                     <ns3:SFEVENTID>
                        <xsl:value-of select="ns2:Column[@name='SFEVENTID']"/>
                     </ns3:SFEVENTID>
                     <ns3:OBJECTID>
                        <xsl:value-of select="ns2:Column[@name='OBJECTID']"/>
                     </ns3:OBJECTID>
                     <ns3:OBJECTTYPE>
                        <xsl:value-of select="ns2:Column[@name='OBJECTTYPE']"/>
                     </ns3:OBJECTTYPE>
                     <ns3:OPERATION>
                        <xsl:value-of select="ns2:Column[@name='OPERATION']"/>
                     </ns3:OPERATION>
					 <ns3:PRIORITY>
                        <xsl:value-of select="ns2:Column[@name='PRIORITY']"/>
                     </ns3:PRIORITY>
                  </ns3:productPriceBook>
               </xsl:when>
               
                <xsl:when test="ns2:Column[@name='OBJECTTYPE'] = 'Opportunity_Partner__c' and (ns2:Column[@name='OPERATION'] = 'Create' or ns2:Column[@name='OPERATION'] = 'Update')">
                  <ns3:OpportunityPartnerUpsert>
                     <ns3:SFLOGID>
                        <xsl:value-of select="ns2:Column[@name='SFLOGID']"/>
                     </ns3:SFLOGID>
                     <ns3:SFEVENTID>
                        <xsl:value-of select="ns2:Column[@name='SFEVENTID']"/>
                     </ns3:SFEVENTID>
                     <ns3:OBJECTID>
                        <xsl:value-of select="ns2:Column[@name='OBJECTID']"/>
                     </ns3:OBJECTID>
                     <ns3:OBJECTTYPE>
                        <xsl:value-of select="ns2:Column[@name='OBJECTTYPE']"/>
                     </ns3:OBJECTTYPE>
                     <ns3:OPERATION>
                        <xsl:value-of select="ns2:Column[@name='OPERATION']"/>
                     </ns3:OPERATION>
					 <ns3:PRIORITY>
                        <xsl:value-of select="ns2:Column[@name='PRIORITY']"/>
                     </ns3:PRIORITY>
                  </ns3:OpportunityPartnerUpsert>
               </xsl:when>
               
                <xsl:when test="ns2:Column[@name='OBJECTTYPE'] = 'Opportunity_Partner__c' and (ns2:Column[@name='OPERATION'] = 'Delete')">
                  <ns3:OpportunityPartnerDelete>
                     <ns3:SFLOGID>
                        <xsl:value-of select="ns2:Column[@name='SFLOGID']"/>
                     </ns3:SFLOGID>
                     <ns3:SFEVENTID>
                        <xsl:value-of select="ns2:Column[@name='SFEVENTID']"/>
                     </ns3:SFEVENTID>
                     <ns3:OBJECTID>
                        <xsl:value-of select="ns2:Column[@name='OBJECTID']"/>
                     </ns3:OBJECTID>
                     <ns3:OBJECTTYPE>
                        <xsl:value-of select="ns2:Column[@name='OBJECTTYPE']"/>
                     </ns3:OBJECTTYPE>
                     <ns3:OPERATION>
                        <xsl:value-of select="ns2:Column[@name='OPERATION']"/>
                     </ns3:OPERATION>
					 <ns3:PRIORITY>
                        <xsl:value-of select="ns2:Column[@name='PRIORITY']"/>
                     </ns3:PRIORITY>
                  </ns3:OpportunityPartnerDelete>
               </xsl:when>
               
               
               <xsl:otherwise>
                  <ns3:unknownobject>
                     <ns3:SFLOGID>
                        <xsl:value-of select="ns2:Column[@name='SFLOGID']"/>
                     </ns3:SFLOGID>
                     <ns3:SFEVENTID>
                        <xsl:value-of select="ns2:Column[@name='SFEVENTID']"/>
                     </ns3:SFEVENTID>
                     <ns3:OBJECTID>
                        <xsl:value-of select="ns2:Column[@name='OBJECTID']"/>
                     </ns3:OBJECTID>
                     <ns3:OBJECTTYPE>
                        <xsl:value-of select="ns2:Column[@name='OBJECTTYPE']"/>
                     </ns3:OBJECTTYPE>
                     <ns3:OPERATION>
                        <xsl:value-of select="ns2:Column[@name='OPERATION']"/>
                     </ns3:OPERATION>
					 <ns3:PRIORITY>
                        <xsl:value-of select="ns2:Column[@name='PRIORITY']"/>
                     </ns3:PRIORITY>
                  </ns3:unknownobject>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:for-each>
      </ns3:SFLogObjectEvents>
   </xsl:template>
</xsl:stylesheet>
