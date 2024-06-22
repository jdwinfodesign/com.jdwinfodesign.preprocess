<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

  <xsl:import href="plugin:org.dita.base:xsl/common/dita-utilities.xsl"/>
  <xsl:import href="plugin:org.dita.base:xsl/common/output-message.xsl"/>
  <xsl:variable name="msgprefix" select="''"/>

  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="node() | @*">
    <xsl:copy>
      <xsl:apply-templates select="node() | @*"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="*[contains(@class, ' bookmap/chapter ') or contains(@class, ' bookmap/appendix ')]">
<!--    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:sequence select="document(@href)/*[contains(@class, ' topic/topic ')]"/>
      <xsl:apply-templates/>
    </xsl:copy>-->
    
    <xsl:variable name="number">
      <xsl:value-of select="count(preceding::fig) + 1"/>
    </xsl:variable>
    
    <ol>
      <xsl:for-each select="descendant-or-self::*[contains(@class, ' map/topicref ')]">
        <xsl:for-each select="document(@href)//fig">
          <li><xsl:value-of select="count(preceding::fig)[1] + 1"/></li>
        </xsl:for-each>
      </xsl:for-each>
    </ol>
    
  </xsl:template>

<!-- This worked perfectly to produce copies of topics as descendants of chapters above  
    
    <xsl:template match="
      *[contains(@class, ' map/topicref ')][not(contains(@class, ' bookmap/appendix-reference '))]
      [@href]
      [ancestor-or-self::*[contains(@class, ' bookmap/chapter ') or contains(@class, ' bookmap/appendix ')]]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:sequence select="document(@href)/*[contains(@class, ' topic/topic ')]"/>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>-->
  
  

  <!-- 
  /bookmap/
            chapter[1]/
                       topicref[1]/
                                   topicref[1]/
                                               concept[1]/conbody[1]/p[3]/fig[1]
   /bookmap/chapter[1]/topicref[1]/topicref[1]/concept[1]/conbody[1]/p[3]/fig[1]
  -->

</xsl:stylesheet>
