<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="/">
        <xsl:variable name="file-name" select="tokenize(replace(document-uri(/),'.docx.xml','-clean'),'/') [position() = last()]"/>
        <xsl:result-document href="../clean-pages/new-{$file-name}">
            <xsl:apply-templates/>
        </xsl:result-document>
    </xsl:template>
        
        <xsl:template match="@*|node()">
            <xsl:copy>
                <xsl:apply-templates select="@*|node()"/>
            </xsl:copy>
        </xsl:template>
        
        <xsl:template match="@rend"/>
        <xsl:template match="@xml:space"/>
    
        <xsl:template match="//tei:ref"/>
        <xsl:template match="//tei:lb"/>
        <xsl:template match="//tei:seg"/>
        <xsl:template match="//tei:note"/>
        
        <xsl:template match="//tei:hi">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:template>
        
    
</xsl:stylesheet>