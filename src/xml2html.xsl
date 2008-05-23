<?xml version="1.0" encoding="UTF-8"?>

<!-- Format query results for display -->

<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">
    
  <xsl:template match="dictionary">
   <html>
    <head>
     <meta content="text/html; charset=UTF-8" http-equiv="content-type" />
     <title>Cleasby-Vigfusson: Old Norse - English dictionary</title>
    </head>
    <body>
     <xsl:apply-templates/>
    </body>
   </html>
  </xsl:template>

<xsl:template match="INTRODUCTION">
  <h1>
    <xsl:value-of select="quote"/>
  </h1>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="entries">
  <h2>List of entries</h2>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="HEADER"/>
  <!--h2>
    <xsl:apply-templates />
  </h2>
</xsl:template-->

<xsl:template match="e">
  <p>
    <xsl:apply-templates />
  </p>
</xsl:template>

<xsl:template match="PAGE"/>

 <xsl:template match="@*|node()" priority="-1">
	<xsl:copy><xsl:apply-templates select="@*|node()"/></xsl:copy>
 </xsl:template>

</xsl:stylesheet>
