<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ns2="http://SalesforceIntegration/contact_SFIds" xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions" xmlns:ns4="http://schemas.xmlsoap.org/ws/2003/05/partner-link/" xmlns:ns1="urn:enterprise.soap.sforce.com" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:client="http://xmlns.oracle.com/ContactDev/SFToSiebel_Contact/UpsertContactSiebelProvABCSImpl" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype" xmlns:med="http://schemas.oracle.com/mediator/xpath" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:ns5="http://xmlns.oracle.com/LatestCode/XREFInterface/XREFMultiLookUp" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:ns3="http://schemas.oracle.com/bpel/extension" xmlns:ns0="http://xmlns.oracle.com/XREFInterface" xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap" exclude-result-prefixes="xsi xsl ns2 ns4 ns1 wsdl client plnk ns5 xsd ns3 ns0 xp20 bpws bpel bpm ora socket mhdr oraext dvm hwf med ids xdk xref ldap">
<xsl:param name="InvokeXREFInterfaceMulti_process_OutputVariable.XREFOutput"/>
<xsl:template match="/">
<ns2:ids>
<ns2:SFAccountId>
<xsl:value-of select="/ns2:ids/ns2:SFAccountId"/>
</ns2:SFAccountId>
<ns2:SFContactId>
<xsl:value-of select="/ns2:ids/ns2:SFContactId"/>
</ns2:SFContactId>
<ns2:SFOwnerId>
<xsl:value-of select="/ns2:ids/ns2:SFOwnerId"/>
</ns2:SFOwnerId>
<ns2:SFPartnerId>
<xsl:value-of select="/ns2:ids/ns2:SFPartnerId"/>
</ns2:SFPartnerId>
<ns2:SFCutAddressId>
<xsl:value-of select="/ns2:ids/ns2:SFCutAddressId"/>
</ns2:SFCutAddressId>
<xsl:choose>
<xsl:when test="($InvokeXREFInterfaceMulti_process_OutputVariable.XREFOutput/ns0:xrefinput/ns0:operation[ns0:recType = &quot;ACCOUNT&quot;]/ns0:hostRowId != &quot;&quot;) and ($InvokeXREFInterfaceMulti_process_OutputVariable.XREFOutput/ns0:xrefinput/ns0:operation[ns0:recType = &quot;ACCOUNT&quot;]/ns0:hostRowId != &quot;no&quot;)">
<ns2:OPAccountId>
<xsl:value-of select="$InvokeXREFInterfaceMulti_process_OutputVariable.XREFOutput/ns0:xrefinput/ns0:operation[ns0:recType = &quot;ACCOUNT&quot;]/ns0:hostRowId"/>
</ns2:OPAccountId>
</xsl:when>
<xsl:otherwise>
<ns2:OPAccountId>
<xsl:text disable-output-escaping="no"/>
</ns2:OPAccountId>
</xsl:otherwise>
</xsl:choose>
<xsl:choose>
<xsl:when test="($InvokeXREFInterfaceMulti_process_OutputVariable.XREFOutput/ns0:xrefinput/ns0:operation[ns0:recType = &quot;CONTACT&quot;]/ns0:hostRowId != &quot;&quot;) and ($InvokeXREFInterfaceMulti_process_OutputVariable.XREFOutput/ns0:xrefinput/ns0:operation[ns0:recType = &quot;CONTACT&quot;]/ns0:hostRowId != &quot;no&quot;)">
<ns2:OPContactId>
<xsl:value-of select="$InvokeXREFInterfaceMulti_process_OutputVariable.XREFOutput/ns0:xrefinput/ns0:operation[ns0:recType = &quot;CONTACT&quot;]/ns0:hostRowId"/>
</ns2:OPContactId>
</xsl:when>
<xsl:otherwise>
<ns2:OPContactId>
<xsl:text disable-output-escaping="no"/>
</ns2:OPContactId>
</xsl:otherwise>
</xsl:choose>
<xsl:choose>
<xsl:when test="($InvokeXREFInterfaceMulti_process_OutputVariable.XREFOutput/ns0:xrefinput/ns0:operation[ns0:recType = &quot;OWNER&quot;]/ns0:hostRowId != &quot;&quot;) and ($InvokeXREFInterfaceMulti_process_OutputVariable.XREFOutput/ns0:xrefinput/ns0:operation[ns0:recType = &quot;OWNER&quot;]/ns0:hostRowId != &quot;no&quot;)">
<ns2:OPOwnerId>
<xsl:value-of select="$InvokeXREFInterfaceMulti_process_OutputVariable.XREFOutput/ns0:xrefinput/ns0:operation[ns0:recType = &quot;OWNER&quot;]/ns0:hostRowId"/>
</ns2:OPOwnerId>
</xsl:when>
<xsl:otherwise>
<ns2:OPOwnerId>
<xsl:text disable-output-escaping="no"/>
</ns2:OPOwnerId>
</xsl:otherwise>
</xsl:choose>
<xsl:choose>
<xsl:when test="($InvokeXREFInterfaceMulti_process_OutputVariable.XREFOutput/ns0:xrefinput/ns0:operation[ns0:recType = &quot;PARTNER&quot;]/ns0:hostRowId != &quot;&quot;) and ($InvokeXREFInterfaceMulti_process_OutputVariable.XREFOutput/ns0:xrefinput/ns0:operation[ns0:recType = &quot;PARTNER&quot;]/ns0:hostRowId != &quot;no&quot;)">
<ns2:OPPartnerId>
<xsl:value-of select="$InvokeXREFInterfaceMulti_process_OutputVariable.XREFOutput/ns0:xrefinput/ns0:operation[ns0:recType = &quot;PARTNER&quot;]/ns0:hostRowId"/>
</ns2:OPPartnerId>
</xsl:when>
<xsl:otherwise>
<ns2:OPPartnerId>
<xsl:text disable-output-escaping="no"/>
</ns2:OPPartnerId>
</xsl:otherwise>
</xsl:choose>
<xsl:choose>
<xsl:when test="($InvokeXREFInterfaceMulti_process_OutputVariable.XREFOutput/ns0:xrefinput/ns0:operation[ns0:recType = &quot;CONTACTADDRESS&quot;]/ns0:hostRowId != &quot;&quot;) and ($InvokeXREFInterfaceMulti_process_OutputVariable.XREFOutput/ns0:xrefinput/ns0:operation[ns0:recType = &quot;CONTACTADDRESS&quot;]/ns0:hostRowId != &quot;no&quot;)">
<ns2:OPCutAddressId>
<xsl:value-of select="$InvokeXREFInterfaceMulti_process_OutputVariable.XREFOutput/ns0:xrefinput/ns0:operation[ns0:recType = &quot;CONTACTADDRESS&quot;]/ns0:hostRowId"/>
</ns2:OPCutAddressId>
</xsl:when>
<xsl:otherwise>
<ns2:OPCutAddressId>
<xsl:text disable-output-escaping="no"/>
</ns2:OPCutAddressId>
</xsl:otherwise>
</xsl:choose>
<xsl:choose>
<xsl:when test="($InvokeXREFInterfaceMulti_process_OutputVariable.XREFOutput/ns0:xrefinput/ns0:operation[ns0:recType = &quot;CONTACT&quot;]/ns0:hostRowId != &quot;&quot;) and ($InvokeXREFInterfaceMulti_process_OutputVariable.XREFOutput/ns0:xrefinput/ns0:operation[ns0:recType = &quot;CONTACT&quot;]/ns0:hostRowId != &quot;no&quot;)">
<ns2:OPIdInXREF>
<xsl:value-of select="$InvokeXREFInterfaceMulti_process_OutputVariable.XREFOutput/ns0:xrefinput/ns0:operation[ns0:recType = &quot;CONTACT&quot;]/ns0:hostRowId"/>
</ns2:OPIdInXREF>
</xsl:when>
<xsl:otherwise>
<ns2:OPIdInXREF>
<xsl:text disable-output-escaping="no"/>
</ns2:OPIdInXREF>
</xsl:otherwise>
</xsl:choose>
<ns2:OPIdInSFPayload>
<xsl:value-of select="/ns2:ids/ns2:OPIdInSFPayload"/>
</ns2:OPIdInSFPayload>
<ns2:CutAddressIdInSF>
<xsl:value-of select="/ns2:ids/ns2:OPIdInSFPayload"/>
</ns2:CutAddressIdInSF>
<xsl:choose>
<xsl:when test="($InvokeXREFInterfaceMulti_process_OutputVariable.XREFOutput/ns0:xrefinput/ns0:operation[ns0:recType = &quot;CONTACTADDRESS&quot;]/ns0:hostRowId != &quot;&quot;) and ($InvokeXREFInterfaceMulti_process_OutputVariable.XREFOutput/ns0:xrefinput/ns0:operation[ns0:recType = &quot;CONTACTADDRESS&quot;]/ns0:hostRowId != &quot;no&quot;)">
<ns2:CutAddressIdInXREF>
<xsl:value-of select="$InvokeXREFInterfaceMulti_process_OutputVariable.XREFOutput/ns0:xrefinput/ns0:operation[ns0:recType = &quot;CONTACTADDRESS&quot;]/ns0:hostRowId"/>
</ns2:CutAddressIdInXREF>
</xsl:when>
<xsl:otherwise>
<ns2:CutAddressIdInXREF>
<xsl:text disable-output-escaping="no"/>
</ns2:CutAddressIdInXREF>
</xsl:otherwise>
</xsl:choose>
</ns2:ids>
</xsl:template>
</xsl:stylesheet>
