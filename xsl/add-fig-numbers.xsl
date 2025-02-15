<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

  <xsl:output method="xml" indent="yes"/>
  <xsl:strip-space elements="*"/>

  <xsl:import href="plugin:org.dita.base:xsl/common/dita-utilities.xsl"/>
  <xsl:import href="plugin:org.dita.base:xsl/common/output-message.xsl"/>
  <xsl:variable name="msgprefix" select="''"/>
  <xsl:variable name="newline">&#10;</xsl:variable>
  
  

  <xsl:param name="dita.temp.dir"/>
  <xsl:param name="fig.num.file"/>

  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="*[contains(@class, ' topic/fig ')]">
    
    <xsl:variable name="topic-enum-id" select="@id"/>
    
    <xsl:message>@id = <xsl:value-of select="@id"/></xsl:message>
    <xsl:message>$topic-enum-id = <xsl:value-of select="$topic-enum-id"/></xsl:message>
    <xsl:message>map/fig/@id = <xsl:value-of select="document($fig.num.file)//fig[@id=$topic-enum-id]/@chapNum"/></xsl:message>
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:attribute name="chapNum">
        <xsl:value-of select="document($fig.num.file)//fig[@id=$topic-enum-id]/@chapNum"/>
      </xsl:attribute>
      <xsl:attribute name="figNum">
        <xsl:value-of select="document($fig.num.file)//fig[@id=$topic-enum-id]/@figNum"/>
      </xsl:attribute>
      <xsl:apply-templates select="node()"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
