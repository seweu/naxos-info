<?xml version="1.0" encoding="ISO-8859-1"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html" version="1.0" indent="yes" encoding="ISO-8859-1" media-type="text/html" 
		doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" 
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>
	
	<xsl:template match="name">
		<xsl:variable name="name" select="./text()"/>
		<xsl:apply-templates select="document($name)"/>
	</xsl:template>	
	

	<xsl:template match="seite">
		<html>
		<xsl:call-template name="html_head"/>
		<body id="naxostor">
			<xsl:call-template name="content"/>
		</body>
		</html>
	</xsl:template>

	<xsl:template match="titel">
		<xsl:if test="$lang=@lang">
		<h1>
			<xsl:attribute name="class"><xsl:value-of select="/seite/@typ"/></xsl:attribute>
			<xsl:copy-of select="."/>
		</h1>
		</xsl:if>
	</xsl:template>


	<xsl:template name="html_head">
		<head>
	        <title>Naxos-Info</title>
	        <meta name="author" content="Sebastian Weuthen"/>
	        <meta name="publisher" content="Daniela Martin"/>
	        <meta name="copyright" content="Sebastian Weuthen"/>
	        <meta name="keywords" content="naxos, kykladen, griechenland, hotel, agean palace, ferienwohnung, immobilien, greece, cyclades"/>
	        <meta name="description" content="Wir buchen Ihren Urlaub auf Naxos, vermitteln Zimmer, planen Unterhaltungsprogramm, verwalten Ihr Ferienhaus"/>
	        <meta name="page-topic" content="Reise Tourismus"/>
	        <meta name="page-type" content="Bild Foto, HTML-Formular"/>
	        <meta name="audience" content="Alle"/>
	        <meta name="robots" content="INDEX,FOLLOW"/>
	        <meta name="date" content="2009-10-15"/>
	        <link rel="stylesheet" type="text/css"> 
	        	<xsl:attribute name="href"><xsl:value-of select="$root"/>style.css</xsl:attribute>
	        </link>		        
	        <script language="JavaScript">
	            if(parent.frames.length == 0) {
	            	window.top.location = "<xsl:value-of select="$root"/>index.htm";
	            }
	        </script>	        
		</head>		
	</xsl:template>
	
</xsl:stylesheet>
