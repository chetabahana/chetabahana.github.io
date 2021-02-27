<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
  {
    "channel":       
    {
        <xsl:for-each select="channel">
        "item":
            ["
            <xsl:value-of select="item"/>
                "]
        </xsl:for-each>
    }
  }
  </xsl:template>
</xsl:stylesheet>
