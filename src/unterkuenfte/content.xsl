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
			<xsl:apply-templates select="verweise"/>
			<xsl:apply-templates select="/seite/verweis"/>
		</xsl:variable>
		<div id="top"/>
		<div id="content">
		<xsl:copy-of select="$text"/>
		</div>
		<div id="bottom"/>
	</xsl:template>


	<xsl:template match="beschreibung">
		<xsl:if test="$lang=@lang or count(@lang)=0">
		<p>
			<xsl:attribute name="class"><xsl:value-of select="/seite/@typ"/></xsl:attribute>
			<xsl:copy-of select="."/>
			<xsl:apply-templates select="verweis"/>
		</p>
		</xsl:if>
	</xsl:template>		
	
	<xsl:template match="verweise">
		<div style="margin-bottom:65px;">
			<xsl:apply-templates select="verweis"/>
		</div>
	</xsl:template>		


	<xsl:template match="verweis[@typ='bottom']">
		<xsl:if test="$lang=@lang or count(@lang)=0">
		<div style="position:absolute;bottom:0px;width:100%">
		<p>
			<xsl:attribute name="class"><xsl:value-of select="/seite/@typ"/></xsl:attribute>
			<span style="text-align:center">
				<xsl:call-template name="link">
					<xsl:with-param name="verweis" select="."/>
				</xsl:call-template>
			</span>
	 	</p>
	 	</div>
	 	</xsl:if>
	</xsl:template>	

	<xsl:template match="verweis[(@typ!='bottom' or count(@typ)=0)]">
	<!-- Opera und IE schnallen nicht, dass die Variable lang global ist und erlauben
			das Pattern nicht im match vom Template -->
		<xsl:if test="$lang=@lang or count(@lang)=0">
		<xsl:call-template name="link">
			<xsl:with-param name="verweis" select="."/>
		</xsl:call-template>
 		<br/>
 		</xsl:if>
	</xsl:template>		
	
	<xsl:template name="link">
		<xsl:param name="verweis"/>
		<xsl:variable name="ziel">
			<xsl:value-of select="$verweis/@ziel"/>
			<xsl:if test="@typ='subfolder'">
				<xsl:text>/</xsl:text>
				<xsl:value-of select="$lang"/>
				<xsl:text>/_index.xml</xsl:text>
			</xsl:if>
		</xsl:variable>
		<a>
		 	<xsl:attribute name="href">
		 		<xsl:value-of select="$ziel"/>
		 	</xsl:attribute>
		 	<xsl:value-of select="$verweis/@titel"/>
	 	</a>
	 	<xsl:text>&#x20;</xsl:text><xsl:value-of select="$verweis/@beschreibung"/>			
	</xsl:template>
	
	
</xsl:stylesheet>
