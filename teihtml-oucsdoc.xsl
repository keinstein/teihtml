<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

<xsl:template match="gi">
  <code><xsl:text>&lt;</xsl:text>
  <xsl:apply-templates/>
  <xsl:text>&gt;</xsl:text></code>
</xsl:template>

<xsl:template match="Menu">
  <code>
    <xsl:if test="$cssFile">
      <xsl:attribute name="class">Menu</xsl:attribute>
    </xsl:if>
<xsl:text>[</xsl:text>
  <xsl:apply-templates/>
  <xsl:text>]</xsl:text></code>
</xsl:template>

<xsl:template match="Key">
  <code>
    <xsl:if test="$cssFile">
      <xsl:attribute name="class">Key</xsl:attribute>
    </xsl:if>
&lt;<xsl:apply-templates/>&gt;</code>
</xsl:template>

<xsl:template match="Code">
  <code>
    <xsl:if test="$cssFile">
      <xsl:attribute name="class">Code</xsl:attribute>
    </xsl:if>
  <xsl:apply-templates/>
  </code>
</xsl:template>

<xsl:template match="Input">
  <code>
    <xsl:if test="$cssFile">
      <xsl:attribute name="class">Input</xsl:attribute>
    </xsl:if>
  <xsl:apply-templates/>
  </code>
</xsl:template>

<xsl:template match="Output">
  <code>
    <xsl:if test="$cssFile">
      <xsl:attribute name="class">Output</xsl:attribute>
    </xsl:if>
  <xsl:apply-templates/>
  </code>
</xsl:template>

<xsl:template match="Screen">
  <pre>
    <xsl:if test="$cssFile">
      <xsl:attribute name="class">Screen</xsl:attribute>
    </xsl:if>
  <xsl:apply-templates/>
  </pre>
</xsl:template>

<xsl:template match="Program">
  <pre>
    <xsl:if test="$cssFile">
      <xsl:attribute name="class">Program</xsl:attribute>
    </xsl:if>
  <xsl:apply-templates/>
  </pre>
</xsl:template>

<xsl:template match="Prompt">
  <code>
    <xsl:if test="$cssFile">
      <xsl:attribute name="class">Prompt</xsl:attribute>
    </xsl:if>
  <xsl:apply-templates/>
  </code>
</xsl:template>

<xsl:template match="Field">
  <code>
    <xsl:if test="$cssFile">
      <xsl:attribute name="class">Field</xsl:attribute>
    </xsl:if>
  <xsl:apply-templates/>
  </code>
</xsl:template>

<xsl:template match="Link">
  <code>
    <xsl:if test="$cssFile">
      <xsl:attribute name="class">Link</xsl:attribute>
    </xsl:if>
  <xsl:apply-templates/>
  </code>
</xsl:template>

<xsl:template match="Filespec">
  <code>
    <xsl:if test="$cssFile">
     <xsl:attribute name="class">Filespec</xsl:attribute>
</xsl:if>
  <xsl:apply-templates/>
  </code>
</xsl:template>

<xsl:template match="Button">
  <code>
    <xsl:if test="$cssFile">
      <xsl:attribute name="class">Button</xsl:attribute>
    </xsl:if>
  <xsl:apply-templates/>
  </code>
</xsl:template>

<xsl:template match="Value">
  <code>
    <xsl:if test="$cssFile">
      <xsl:attribute name="class">Value</xsl:attribute>
    </xsl:if>
  <xsl:apply-templates/>
  </code>
</xsl:template>

<xsl:template match="Keyword">
  <code>
    <xsl:if test="$cssFile">
            <xsl:attribute name="class">Keyword</xsl:attribute>
    </xsl:if>
  <xsl:apply-templates/>
  </code>
</xsl:template>


</xsl:stylesheet>
