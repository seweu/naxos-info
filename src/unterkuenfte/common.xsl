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
<div style="position:absolute;top:100px;left:180px;">
<xsl:text>lang:</xsl:text><xsl:value-of select="$lang"/>
</div>
			<xsl:call-template name="flag"/>
			<xsl:call-template name="logo"/>
			<xsl:call-template name="menu"/>
			<xsl:call-template name="content"/>
		</body>
		</html>
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
		</head>		
	</xsl:template>	


 	<xsl:template name="flag">
		<xsl:variable name="css_flag_background">
			<xsl:text>background-image:url('</xsl:text>
			<xsl:value-of select="$root"/>
			<xsl:text>images/menue/fr_lo_bg.gif'); width:150px; height:70px;</xsl:text>
			<xsl:text>position:fixed; left:0px; top:0px;</xsl:text>
		</xsl:variable>	 	
		<xsl:variable name="toggle_country">
	 		<xsl:choose>
			  <xsl:when test="$lang = 'de'">en_</xsl:when>
			  <xsl:otherwise></xsl:otherwise>
			</xsl:choose> 
		</xsl:variable>
		<xsl:variable name="toggle_country_img">
	 		<xsl:choose>
			  <xsl:when test="$lang = 'de'">en</xsl:when>
			  <xsl:otherwise>de</xsl:otherwise>
			</xsl:choose> 
		</xsl:variable>			
				
		<div>
			<xsl:attribute name="style"><xsl:value-of select="$css_flag_background"/></xsl:attribute>
			<a target="_parent">
			 	<xsl:attribute name="href">
			 		<xsl:value-of select="$root"/>
					<xsl:value-of select="$toggle_country"/>
			 		<xsl:text>index.htm</xsl:text>
			 	</xsl:attribute>				
				<img class="menue" border="0">
					<xsl:attribute name="src">
						<xsl:value-of select="$root"/>
						<xsl:text>images/menue/</xsl:text>
						<xsl:value-of select="$toggle_country_img"/>
						<xsl:text>_flagge.gif</xsl:text>
					</xsl:attribute>
				</img>	 					
			</a>
		</div> 	
 	</xsl:template> 		
	
	<xsl:template name="menu">
		<xsl:variable name="css_menu_background">
			<xsl:text>background-image:url('</xsl:text>
			<xsl:value-of select="$root"/>
			<xsl:text>images/menue/fr_l_bg.gif'); width:150px;</xsl:text>
			<xsl:text>position:fixed; left:0px; top:70px;</xsl:text>
		</xsl:variable>
		<div>
			<xsl:attribute name="style">
				<xsl:value-of select="$css_menu_background"/>
			</xsl:attribute>
			<a target="body">
			 	<xsl:attribute name="href">
			 		<xsl:value-of select="$root"/>
			 		<xsl:value-of select="$lang"/>
			 		<xsl:text>/unterkuenfte.xml</xsl:text>
			 	</xsl:attribute>
				 	
				<xsl:call-template name="menu_img">
					<xsl:with-param name="img">_m_unterkuenfte.png</xsl:with-param>
				</xsl:call-template>
			</a>		
			<a target="body">
			 	<xsl:attribute name="href">
			 		<xsl:value-of select="$root"/>
			 		<xsl:value-of select="$lang"/>
			 		<xsl:text>/service.xml</xsl:text>
			 	</xsl:attribute>
				 	
				<xsl:call-template name="menu_img">
					<xsl:with-param name="img">_m_service.png</xsl:with-param>
				</xsl:call-template>
			</a>
			<a target="body">
			 	<xsl:attribute name="href">
			 		<xsl:value-of select="$root"/>
			 		<xsl:value-of select="$lang"/>
			 		<xsl:text>/hausverwaltung.xml</xsl:text>
			 	</xsl:attribute>
				 	
				<xsl:call-template name="menu_img">
					<xsl:with-param name="img">_m_hausverwaltung.png</xsl:with-param>
				</xsl:call-template>
			</a>				
			<a target="body">
			 	<xsl:attribute name="href">
			 		<xsl:value-of select="$root"/>
			 		<xsl:text>hausverkauf/a_hausverkauf.htm</xsl:text>
			 	</xsl:attribute>
				 	
				<xsl:call-template name="menu_img">
					<xsl:with-param name="img">_m_hausverkauf.png</xsl:with-param>
				</xsl:call-template>
			</a>	
			<a target="body">
			 	<xsl:attribute name="href">
			 		<xsl:value-of select="$root"/>
			 		<xsl:value-of select="$lang"/>
			 		<xsl:text>/kontakt.xml</xsl:text>
			 	</xsl:attribute>
				 	
				<xsl:call-template name="menu_img">
					<xsl:with-param name="img">_m_kontakt.png</xsl:with-param>
				</xsl:call-template>
			</a>	
			<a target="body">
			 	<xsl:attribute name="href">
			 		<xsl:value-of select="$root"/>
			 		<xsl:text>/a_impressionen.htm</xsl:text>
			 	</xsl:attribute>
				 	
				<xsl:call-template name="menu_img">
					<xsl:with-param name="img">_m_impressionen.png</xsl:with-param>
				</xsl:call-template>
			</a>
			<a target="body" onMouseOver="Bildwechsel(8,bild_4);" onMouseOut="Bildwechsel(8,bild_3)">
			 	<xsl:attribute name="href">
			 		<xsl:value-of select="$root"/>
			 		<xsl:text>/a_links.htm</xsl:text>
			 	</xsl:attribute>
				 	
				<xsl:call-template name="menu_img">
					<xsl:with-param name="img">_m_links.png</xsl:with-param>
				</xsl:call-template>
			</a>
			<a href="http://www.naxos-info.de/forum/" target="body" onMouseOver="Bildwechsel(8,bild_1);" onMouseOut="Bildwechsel(8,bild_3)">
				 	
				<xsl:call-template name="menu_img">
					<xsl:with-param name="img">_m_forum.png</xsl:with-param>
				</xsl:call-template>
			</a>			
			<img class="menue" border="0">
				<xsl:attribute name="src">
					<xsl:value-of select="$root"/>
					<xsl:text>images/menue/l_sonne.gif</xsl:text>
				</xsl:attribute>
			</img>	 

		</div>	
	
	</xsl:template>


	<xsl:template name="logo">
		<xsl:variable name="css_menu_oben">
			<xsl:text>background-image:url('</xsl:text>
			<xsl:value-of select="$root"/>
			<xsl:text>images/menue/fr_o_bg.gif'); width:1024px; height:70px;</xsl:text>
			<xsl:text>position:fixed; left:150px; top:0px;</xsl:text>
		</xsl:variable>	 	
	
		<div>
			<xsl:attribute name="style"><xsl:value-of select="$css_menu_oben"/></xsl:attribute>
			<a target="body">
			 	<xsl:attribute name="href">
			 		<xsl:value-of select="$root"/>
			 		<xsl:value-of select="$lang"/>
			 		<xsl:text>/einleitung.xml</xsl:text>
			 	</xsl:attribute>
				<img class="menue" border="0">
					<xsl:attribute name="src">
						<xsl:value-of select="$root"/>
						<xsl:text>images/menue/</xsl:text>
						<xsl:text>logo.png</xsl:text>
					</xsl:attribute>
				</img>	 
			</a>		
		</div>	
	</xsl:template>

 	<xsl:template name="menu_img">
 		<xsl:param name="img"/>
			<img class="menue" border="0">
				<xsl:attribute name="src">
					<xsl:value-of select="$root"/>
					<xsl:text>images/menue/</xsl:text>
					<xsl:value-of select="$lang"/>
					<xsl:value-of select="$img"/>
				</xsl:attribute>
			</img>	 	
 	</xsl:template>	


	<xsl:template match="titel">
		<xsl:if test="$lang=@lang">
		<h1>
			<xsl:attribute name="class"><xsl:value-of select="/seite/@typ"/></xsl:attribute>
			<xsl:copy-of select="."/>
		</h1>
		</xsl:if>
	</xsl:template>

	
</xsl:stylesheet>
