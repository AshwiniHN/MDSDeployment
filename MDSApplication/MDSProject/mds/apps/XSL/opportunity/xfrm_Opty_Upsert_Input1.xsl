<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:xsdLocal1="http://www.siebel.com/xml/ISG_SF_Opportunity_IO/Data" xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsdLocal2="http://www.siebel.com/xml/ISG_SF_Opportunity_IO/Id" xmlns:tns1="http://siebel.com/webservices" xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions" xmlns:ns0="http://www.siebel.com/xml/OptyEventsToProcessFromBroker" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" xmlns:plnk="http://schemas.xmlsoap.org/ws/2003/05/partner-link/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:ns6="http://SalesforceIntegration/Opty_SFIds" xmlns:ns3="urn:enterprise.soap.sforce.com" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:tns="http://siebel.com/CustomUI" xmlns:xsdLocal3="http://www.siebel.com/xml/ISG_SF_Opportunity_IO/Query" xmlns:client="http:/IsecG/SalesforceProject/OpportunityFromSFtoSiebel/UpsertOptyLineItemSiebelProvABCSImpl" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:ns5="http://docs.oasis-open.org/wsbpel/2.0/plnktype" xmlns:med="http://schemas.oracle.com/mediator/xpath" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:ns1="http://xmlns.oracle.com/SFProject/ProcessOptyEventsFromBroker/ProcessOptyEventsFromBroker" xmlns:ns2="http://schemas.oracle.com/bpel/extension" xmlns:bpmn="http://schemas.oracle.com/bpm/xpath" xmlns:ns4="http://www.siebel.com/xml/OptyEventsToProcessFromBroker" xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap" xmlns:tns2="urn:enterprise.soap.sforce.com" xmlns:ens="urn:sobject.enterprise.soap.sforce.com" exclude-result-prefixes="xsi xsl ns0 plnk ns6 ns3 wsdl client ns5 xsd ns1 ns2 ns4 xsdLocal1 xsdLocal2 tns1 soapenc soap tns xsdLocal3 xp20 bpws bpel bpm ora socket mhdr oraext dvm hwf med ids xdk xref bpmn ldap">
   <xsl:param name="upsertIds"/>
   <xsl:template match="/">
      <xsdLocal1:ListOfIsg_Sf_Opportunity_Io>
         <xsdLocal1:Opportunity>
            <xsdLocal1:Id/>
            <xsl:for-each select="$upsertIds/ns6:OptyLineItem_ids/ns6:Lineitem_ids">
               <xsl:variable name="EventId" select="ns6:EventId"/>
               <xsl:variable name="SblRevenueId" select="ns6:SiebelRevenueId"/>
               <xsl:variable name="SiebelOptyId" select="ns6:SiebelOptyId"/>
               <xsl:variable name="SFOptyId" select="ns6:SFOptyId"/>
               
                     <xsdLocal1:ListOfRevenue>
					 <xsl:for-each select="/ns1:ProcessOptyEventsFromBrokerResponse/ns1:EventsFromEAIBrokerToProcess/ns0:ListOfEvent/ns0:Event">
                  <xsl:if test="ns0:EventId = $EventId">
                        <xsdLocal1:Revenue>
                           <xsl:choose>
                              <xsl:when test="$SblRevenueId = &quot;&quot;">
                                 <xsdLocal1:Id>
                                    <xsl:value-of select="$EventId"/>
                                 </xsdLocal1:Id>
                              </xsl:when>
                              <xsl:otherwise>
                                 <xsdLocal1:Id>
                                    <xsl:value-of select="$SblRevenueId"/>
                                 </xsdLocal1:Id>
                              </xsl:otherwise>
                           </xsl:choose>
                           <xsl:choose>
                              <xsl:when test="$SFOptyId != &quot;&quot;">
                                 <xsdLocal1:ISGSFOptyId>
                                    <xsl:value-of select="$SFOptyId"/>
                                 </xsdLocal1:ISGSFOptyId>
                              </xsl:when>
                           </xsl:choose>
                           <xsl:if test="ns0:Document/tns2:result/ens:Program_Benefit__c != &quot;&quot;">
                              <xsdLocal1:ISGSFProgramBenefitRequest>
                                 <xsl:value-of select="ns0:Document/tns2:result/ens:Program_Benefit__c"/>
                              </xsdLocal1:ISGSFProgramBenefitRequest>
                           </xsl:if>
                           <xsl:if test="ns0:Document/tns2:result/ens:Opportunity_Legacy_Id__c and ns0:Document/tns2:result/ens:Opportunity_Legacy_Id__c != &quot;&quot;">
                              <xsdLocal1:OpportunityId>
                                 <xsl:value-of select="ns0:Document/tns2:result/ens:Opportunity_Legacy_Id__c"/>
                              </xsdLocal1:OpportunityId>
                           </xsl:if>
                           <xsl:if test="ns0:Document/tns2:result/ens:Description != &quot;&quot;">
                              <xsdLocal1:Comments>
                                 <xsl:value-of select="ns0:Document/tns2:result/ens:Description"/>
                              </xsdLocal1:Comments>
                           </xsl:if>
                           <xsl:if test="ns0:Document/tns2:result/ens:CurrencyIsoCode != &quot;&quot;">
                              <xsdLocal1:CurrencyCode3>
                                 <xsl:value-of select="ns0:Document/tns2:result/ens:CurrencyIsoCode"/>
                              </xsdLocal1:CurrencyCode3>
                           </xsl:if>
                           <xsl:if test="ns0:Document/tns2:result/ens:Id != &quot;&quot;">
                              <xsdLocal1:ISGSFId>
                                 <xsl:value-of select="ns0:Document/tns2:result/ens:Id"/>
                              </xsdLocal1:ISGSFId>
                           </xsl:if>
                           <xsl:if test="ns0:Document/tns2:result/ens:ProductCode != &quot;&quot;">
						    <xsl:choose>
							<xsl:when test="starts-with(ns0:Document/tns2:result/ens:ProductCode,&quot;No SKU Selected&quot;)">						   
                              <xsdLocal1:Product/>                                 
							  </xsl:when>
							  <xsl:otherwise>
							  <xsdLocal1:Product>
                                 <xsl:value-of select="ns0:Document/tns2:result/ens:ProductCode"/>
                              </xsdLocal1:Product>
							  </xsl:otherwise>
							  </xsl:choose>
                           </xsl:if>
						   
						   <xsl:if test="ns0:Document/tns2:result/ens:Product_Type__c != &quot;&quot;">
                              <xsdLocal1:NAIProductType>
                                 <xsl:value-of select="ns0:Document/tns2:result/ens:Product_Type__c"/>
                              </xsdLocal1:NAIProductType>
                           </xsl:if>
						  <xsl:if test="ns0:Document/tns2:result/ens:Program_Type__c != &quot;&quot;">
                              <xsdLocal1:MFEOpportunityType>
                                 <xsl:value-of select="ns0:Document/tns2:result/ens:Program_Type__c"/>
                              </xsdLocal1:MFEOpportunityType>
                           </xsl:if> 
						   
                           <xsl:if test="ns0:Document/tns2:result/ens:Quantity != &quot;&quot;">
                              <xsdLocal1:Quantity>
                                 <xsl:value-of select="ns0:Document/tns2:result/ens:Quantity"/>
                              </xsdLocal1:Quantity>
                           </xsl:if>
                           <xsl:if test="ns0:Document/tns2:result/ens:UnitPrice != &quot;&quot;">
                              <xsdLocal1:Price>
                                 <xsl:value-of select="ns0:Document/tns2:result/ens:UnitPrice"/>
                              </xsdLocal1:Price>
                           </xsl:if>
                           <xsl:if test="ns0:Document/tns2:result/ens:TotalPrice != &quot;&quot;">
                              <xsdLocal1:Revenue2>
                                 <xsl:value-of select="ns0:Document/tns2:result/ens:TotalPrice"/>
                              </xsdLocal1:Revenue2>
                           </xsl:if>
						    <xsl:if test="ns0:Document/tns2:result/ens:Grant_Number__c != &quot;&quot;">
                              <xsdLocal1:NAIGrantNumber>
                                 <xsl:value-of select="ns0:Document/tns2:result/ens:Grant_Number__c"/>
                              </xsdLocal1:NAIGrantNumber>
                           </xsl:if>
                        </xsdLocal1:Revenue>
						 </xsl:if>
               </xsl:for-each>
                     </xsdLocal1:ListOfRevenue>
                 
            </xsl:for-each>
         </xsdLocal1:Opportunity>
      </xsdLocal1:ListOfIsg_Sf_Opportunity_Io>
   </xsl:template>
</xsl:stylesheet>
