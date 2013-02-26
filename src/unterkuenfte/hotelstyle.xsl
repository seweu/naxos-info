<?xml version="1.0" encoding="ISO-8859-1"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html" version="1.0" indent="yes" encoding="ISO-8859-1" media-type="text/html" 
		doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" 
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>
	
	<xsl:include href="common.xsl"/>

	<xsl:template name="content">
		<xsl:variable name="text">
			<xsl:apply-templates select="titel"/>
			<xsl:apply-templates select="beschreibung"/>
			<xsl:apply-templates select="preis"/>
			<xsl:apply-templates select="verweise"/>
			<xsl:apply-templates select="verweis"/>
			<xsl:call-template name="zurueck"/>
		</xsl:variable>
		<div>
		<!--  Keine Lust den Zeilenumbruch zu codieren. -->
		<xsl:copy-of select="$text"/>
		</div>

	</xsl:template>


	<xsl:template match="titel">
		<xsl:if test="$lang=@lang">
		<h1>
			<xsl:attribute name="class">
				<xsl:value-of select="/seite/@typ"/>
			</xsl:attribute>
			<xsl:copy-of select="."/>
		</h1>
		</xsl:if>
	</xsl:template>
	
	
	<xsl:template match="beschreibung[@typ = 'bild']">
		<img class="hotel">
			<xsl:attribute name="src">
			<xsl:text>../</xsl:text>
			<xsl:value-of select="./@src"/>
			</xsl:attribute>
		</img>
	</xsl:template>	
	
	<xsl:template match="beschreibung[@typ = 'text']">
		<xsl:if test="$lang=@lang">
		<p>
			<xsl:attribute name="class"><xsl:value-of select="/seite/@typ"/></xsl:attribute>
			<xsl:value-of select="."/>
		</p>
		</xsl:if>
	</xsl:template>	
	
	
	<xsl:template match="preis">
		<xsl:if test="$lang=./@lang">
		<p>
			<xsl:value-of select="."/><br/>
		</p>
		</xsl:if>
	</xsl:template>
	
	
	<xsl:template match="verweise">
		<ul>
			<xsl:apply-templates select="verweis"/>
		</ul>
	</xsl:template>
	
	
	<xsl:template match="verweis">
	 	<li>
			<xsl:call-template name="link">
				<xsl:with-param name="verweis" select="."/>
			</xsl:call-template>
	 	</li>
	</xsl:template>	
	
	<xsl:template name="link">
		<xsl:param name="verweis"/>
		<xsl:variable name="ziel">
			<xsl:value-of select="$verweis/@ziel"/>
		</xsl:variable>
		<a>
		 	<xsl:attribute name="href">
		 		<xsl:value-of select="$ziel"/>
		 	</xsl:attribute>
		 	<xsl:value-of select="$verweis/@titel"/>
	 	</a>
	 	<xsl:text>&#x20;</xsl:text><xsl:value-of select="$verweis/@beschreibung"/>			
	</xsl:template>
	
	<xsl:template name="zurueck">
		<xsl:variable name="zurueck">
			<xsl:choose>
				<xsl:when test="$lang = 'en'"><xsl:text>back</xsl:text></xsl:when>
				<xsl:otherwise><xsl:text>zurück</xsl:text></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<p/>
		<xsl:choose>
			<xsl:when test="/seite/@typ = 'gegend'">
				<a>
					<xsl:attribute name="href">
						<xsl:value-of select="$root"/>
						<xsl:value-of select="$lang"/>
						<xsl:text>/unterkuenfte.xml</xsl:text>
					</xsl:attribute>
				 	<xsl:value-of select="$zurueck"/>				
				</a>
			</xsl:when>
			<xsl:when test="/seite/@typ = 'unterkunft'">
				<a href="_index.xml" target="body"><xsl:value-of select="$zurueck"/></a>
			</xsl:when>
		</xsl:choose>	
	</xsl:template>
	
</xsl:stylesheet>
