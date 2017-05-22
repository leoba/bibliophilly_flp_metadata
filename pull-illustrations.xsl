<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:sims="http://schoenberginstitute.org/ns/"
    exclude-result-prefixes="xs sims tei"
    version="2.0">
    
    <!-- Copy everything unless matched by another template -->
    <xsl:template match="@*|node()|comment() " priority="-1">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()|comment()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="/">
        <xsl:variable name="file-name" select="tokenize(replace(document-uri(/),'-clean.xml','-final'),'/') [position() = last()]"/>
        <xsl:result-document href="../final/{$file-name}.xml">
            <xsl:apply-templates/>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="tei:body">
        <body xmlns="http://www.tei-c.org/ns/1.0">
            <div><xsl:apply-templates/>
            </div>
        <xsl:variable name="msID" select="tokenize(replace(document-uri(/),'-clean.xml',''),'/') [position() = last()]"/>
        <xsl:for-each select="collection(iri-to-uri('illus/?select=*.xml;recurse=yes'))">
            <xsl:variable name="sims-msID" select="//sims:msID"/>
            <xsl:variable name="sims-fol-no" select="//sims:fol-no"/>
            <xsl:variable name="sims-image-title" select="//sims:image-title"/>
            <xsl:variable name="sims-ds-image-notes" select="//sims:ds-image-notes"/>
            <xsl:variable name="pageID" select="tokenize(replace(document-uri(/),'-small.xml',''),'/') [position() = last()]"/>
            <xsl:if test="starts-with($pageID,$msID)">
                <div type="illustration-record">
                    <div type="msID"><p><xsl:value-of select="$sims-msID"/></p></div>
                    <div type="fol-no"><p><xsl:value-of select="$sims-fol-no"/></p></div>
                    <div type="image-title"><p><xsl:value-of select="$sims-image-title"/></p></div>
                    <div type="image-notes"><p><xsl:value-of select="$sims-ds-image-notes"/></p></div>
                </div>
            </xsl:if>
        </xsl:for-each>
        </body>
    </xsl:template>
    
</xsl:stylesheet>