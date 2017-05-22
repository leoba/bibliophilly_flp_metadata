<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:sims="http://schoenberginstitute.org/ns/"
    exclude-result-prefixes="xs"
    version="2.0">
    
    
    <xsl:output method="text" omit-xml-declaration="yes"/>
    
    <xsl:template match="/">
        <xsl:result-document href="flp-mss-metadata.csv">shelfmark,title,date,origin,dericci,author,material,script,decoration,flyleaves-and-leaves,size,layout,binding,provenance<xsl:for-each select="collection(iri-to-uri('../FLP/final/?select=*.xml;recurse=yes'))">
    <xsl:variable name="shelfmark" select="substring(//tei:p[contains(text(),'Shelfmark:')]/text(),12)"/>
    <xsl:variable name="title" select="substring(//tei:p[contains(text(),'Title:')][1]/text(),8)"/>
    <xsl:variable name="text" select="substring(//tei:p[contains(text(),'Text:')][1]/text(),7)"/>
    <xsl:variable name="msName" select="concat($title,' | ',$text)"/>
    <xsl:variable name="dericci" select="substring(//tei:p[contains(text(),'De Ricci #:')]/text(),13)"/>
    <xsl:variable name="author">
        <xsl:for-each select="//tei:p[contains(text(),'Author:')]"><xsl:value-of select="substring(./text(),9)"/> </xsl:for-each>
    </xsl:variable><xsl:variable name="language">
        <xsl:for-each select="//tei:p[contains(text(),'Language:')]"><xsl:value-of select="substring(./text(),11)"/> </xsl:for-each>
    </xsl:variable>
    <!--<xsl:variable name="language" select="substring(//tei:p[contains(text(),'Language:')]/text(),11)"/>-->
    <xsl:variable name="material" select="substring(//tei:p[contains(text(),'Material')]/text(),12)"/>
    <xsl:variable name="support">
        <xsl:for-each select="//tei:p[contains(text(),'Support:')]"><xsl:value-of select="substring(./text(),10)"/> </xsl:for-each>
    </xsl:variable>
    <xsl:variable name="location">
        <xsl:for-each select="//tei:p[contains(text(),'Localization:')]"><xsl:value-of select="substring(./text(),15)"/> </xsl:for-each>
    </xsl:variable>
    <xsl:variable name="date">
        <xsl:for-each select="//tei:p[contains(text(),'Date:')]"><xsl:value-of select="substring(./text(),7)"/> </xsl:for-each>
    </xsl:variable>
    <xsl:variable name="script">
        <xsl:for-each select="//tei:p[contains(text(),'Script:')]"><xsl:value-of select="substring(./text(),9)"/> </xsl:for-each>
    </xsl:variable><xsl:variable name="decoration" select="substring(//tei:p[starts-with(text(),'Decoration:')]/text(),16)"/>
    <xsl:variable name="illustrations" select="substring(//tei:p[contains(text(),'Illustrations:')]/text(),16)"/>
    <xsl:variable name="physdesc">
        <xsl:for-each select="//tei:p[contains(text(),'Physical Description:')]"><xsl:value-of select="substring(./text(),22)"/> </xsl:for-each>
    </xsl:variable>
    <xsl:variable name="flyleaves-and-leaves" select="tokenize($physdesc,';') [position() = 1]"/>
    <xsl:variable name="size" select="tokenize($physdesc,';') [position() = 2]"/>
    
    <xsl:variable name="binding" select="substring(//tei:p[contains(text(),'Binding Description:')]/text(),21)"/>
    <xsl:variable name="provenance" select="substring(//tei:p[starts-with(text(),'Provenance:')]/text(),13)"/>
            "<xsl:value-of select="normalize-space($shelfmark)"/>","<xsl:value-of select="normalize-space($msName)"/>","","","<xsl:value-of select="normalize-space($dericci)"/>","<xsl:value-of select="normalize-space($author)"/>","<xsl:value-of select="normalize-space($material)"/><xsl:value-of select="normalize-space($support)"/>","<xsl:value-of select="normalize-space($script)"/>","<xsl:value-of select="normalize-space($decoration)"/><xsl:value-of select="normalize-space($illustrations)"></xsl:value-of>","<xsl:value-of select="normalize-space($flyleaves-and-leaves)"/>","<xsl:value-of select="normalize-space($size)"/>","<xsl:value-of select="normalize-space($physdesc)"/>","<xsl:value-of select="normalize-space($binding)"/>","<xsl:value-of select="normalize-space($provenance)"/>","<xsl:value-of select="normalize-space($language)"/>"</xsl:for-each>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>