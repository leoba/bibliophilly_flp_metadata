<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:sims="http://schoenberginstitute.org/ns/" exclude-result-prefixes="xs tei" version="2.0">

    <!-- Run this file on the files that have folio numbers in their names -->

    <xsl:template match="/">
        <xsl:variable name="ms-name"
            select="tokenize(replace(document-uri(/),'-clean.xml',''),'/') [position() = last()]"/>
        <xsl:variable name="fol-no-field" select="//tei:p[starts-with(text(),'Shelfmark:')]"/>
        <xsl:variable name="fol-no" select="replace($ms-name,'.*?(\d+[rv]).*','$1')"/>
        <xsl:variable name="image-title" select="//tei:p[starts-with(text(),'Image Title:')]"/>
        <xsl:variable name="ds-image-notes" select="//tei:p[starts-with(text(),'DS Image')]"/>
        <xsl:variable name="ds-image-notes-follow" select="//tei:p[starts-with(text(),'DS Image')]/following-sibling::p[1]"/>
        <xsl:result-document href="../illus/{$ms-name}-small.xml">
            <sims:illustration-record>
                <sims:msID>
                    <xsl:value-of select="$ms-name"/>
                </sims:msID>
                <sims:fol-no>
                    <xsl:value-of select="$fol-no"/>
                </sims:fol-no>
                <sims:image-title>
                    <xsl:value-of select="normalize-space(substring($image-title,13))"/>
                </sims:image-title>
                <sims:ds-image-notes>
                    <xsl:value-of select="normalize-space(substring($ds-image-notes,17))"/>; <xsl:value-of select="normalize-space($ds-image-notes-follow)"/>
                </sims:ds-image-notes>
            </sims:illustration-record>
        </xsl:result-document>
    </xsl:template>

</xsl:stylesheet>
