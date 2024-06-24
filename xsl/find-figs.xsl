<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

  <xsl:import href="plugin:org.dita.base:xsl/common/dita-utilities.xsl"/>
  <xsl:import href="plugin:org.dita.base:xsl/common/output-message.xsl"/>
  <xsl:variable name="msgprefix" select="''"/>
  <xsl:variable name="newline">&#10;</xsl:variable>

  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="node() | @*">
    <xsl:copy>
      <xsl:apply-templates select="node() | @*"/>
    </xsl:copy>
  </xsl:template>


  <xsl:template match="*[contains(@class, ' map/topicref ')]">
    <xsl:copy>
<!--      <xsl:apply-templates select="@*"/>-->
      <!-- NOTE: If you want to write templates for the external document 
           you pull in, you have to use 
           apply-templates here, 
           not
           value-of or sequence -->
      <xsl:apply-templates select="document(@href)/*[contains(@class, ' topic/topic ')]"/>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="fig">
    <xsl:copy>foo</xsl:copy>
  </xsl:template>

  <!-- 
    /bookmap/chapter[1]/concept[1]/conbody[1]/fig[1]
    
  /bookmap/
            chapter[1]/
                       topicref[1]/
                                   topicref[1]/
                                               concept[1]/conbody[1]/p[3]/fig[1]
   /bookmap/chapter[1]/topicref[1]/topicref[1]/concept[1]/conbody[1]/p[3]/fig[1]
  -->

</xsl:stylesheet>
