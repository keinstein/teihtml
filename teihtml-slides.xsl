<!-- 
TEI XSLT stylesheet family version 1.3
RCS: $Date: 2002/12/04 $, $Revision: #24 $, $Author: rahtz $

XSL stylesheet to format TEI XML documents to HTML or XSL FO

 Copyright 1999-2002 Sebastian Rahtz/Oxford University  <sebastian.rahtz@oucs.ox.ac.uk>

 Permission is hereby granted, free of charge, to any person obtaining
 a copy of this software and any associated documentation files (the
 ``Software''), to deal in the Software without restriction, including
 without limitation the rights to use, copy, modify, merge, publish,
 distribute, sublicense, and/or sell copies of the Software, and to
 permit persons to whom the Software is furnished to do so, subject to
 the following conditions:
 
 The above copyright notice and this permission notice shall be included
 in all copies or substantial portions of the Software.
--> 

<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  version="1.0"  >

<xsl:import href="teihtml.xsl"/>

<xsl:param name="cssFile">http://www.oucs.ox.ac.uk/stylesheets/teislides.css</xsl:param>
<xsl:param name="numberHeadings"></xsl:param>
<xsl:param name="splitLevel">0</xsl:param>
<xsl:param name="subTocDepth">-1</xsl:param>
<xsl:param name="topNavigationPanel"></xsl:param>
<xsl:param name="bottomNavigationPanel">true</xsl:param>
<xsl:param name="linkPanel"></xsl:param>
<xsl:template name="copyrightStatement"/>
<xsl:param name="makingSlides">true</xsl:param>
 <xsl:param name="inputFileName">
  <xsl:choose>
 <xsl:when test="not($inputName ='')"><xsl:value-of select="$inputName"/></xsl:when>
 <xsl:when test="contains($processor,'SAXON')">
   <xsl:call-template name="get-basename">
     <xsl:with-param name="file">
    <xsl:value-of 
       xmlns:saxon="http://icl.com/saxon"  select="substring-after(saxon:system-id(),'file:')"/>
  </xsl:with-param>
</xsl:call-template>
 </xsl:when>
   <xsl:otherwise><xsl:value-of select="$inputName"/></xsl:otherwise>
  </xsl:choose>
</xsl:param>

<xsl:param name="masterFile">
  <xsl:choose>
   <xsl:when test="$inputFileName =''">index-slides</xsl:when>
   <xsl:when test="contains($inputFileName,'.xml')"><xsl:value-of select="substring-before($inputFileName,'.xml')"/>-slides</xsl:when>
   <xsl:otherwise><xsl:value-of select="$inputFileName"/>-slides</xsl:otherwise>
  </xsl:choose>
</xsl:param>

<xsl:template match="div" mode="genid">
  <xsl:value-of select="$masterFile"/><xsl:number/>
</xsl:template>

<xsl:template match="docAuthor">
       <div class="docAuthor"><xsl:apply-templates/></div>
</xsl:template>

<xsl:template match="docDate">
       <div class="docDate"><xsl:apply-templates/></div>
</xsl:template>

<xsl:template match="p">
 <p><xsl:apply-templates/></p>
</xsl:template>

<xsl:template match="/">
  <xsl:apply-templates select="TEI.2"/>
</xsl:template>

<xsl:template match="/TEI.2">
<xsl:param name="slidenum">
  <xsl:value-of select="$masterFile"/>0</xsl:param>
  <xsl:call-template name="outputChunk">
   <xsl:with-param name="ident">
    <xsl:value-of select="$slidenum"/>
   </xsl:with-param>
   <xsl:with-param name="content">
    <xsl:call-template name="mainslide"/>
   </xsl:with-param>
  </xsl:call-template>
  <xsl:apply-templates select="text/body/div"/>
</xsl:template>

<!-- xref to previous and last slides -->
<xsl:template name="xrefpanel">
    <table class="slide" width="95%">
      <tr class="bottombar">
        <td align="left">
<b><xsl:number/></b><xsl:text> </xsl:text>
<xsl:if test="following-sibling::div">
 <xsl:variable name="next">
  <xsl:apply-templates select="following-sibling::div[1]" mode="genid"/>
 </xsl:variable>
  <a class="bottombar" href="{concat($next,'.html')}">Next | </a>
</xsl:if>
 <xsl:variable name="first"><xsl:value-of select="$masterFile"/>0</xsl:variable>
  <a class="bottombar" href="{concat($first,'.html')}">First</a>
<xsl:if test="preceding-sibling::div">
 <xsl:variable name="prev">
  <xsl:apply-templates select="preceding-sibling::div[1]" mode="genid"/>
 </xsl:variable>
  <a class="bottombar" href="{concat($prev,'.html')}">| Previous</a>
</xsl:if>
</td>
<td align="right">
 <i>
       <xsl:call-template name="generateTitle"/>
 </i>
</td></tr>
</table>
</xsl:template>

<xsl:template name="mainslide">
<html><xsl:call-template name="addLangAtt"/> 
<head>
<title> 
       <xsl:call-template name="generateTitle"/>
</title>
<xsl:call-template name="includeCSS"/>
</head>
 <body>
   <div  class="slide">
   <h1 class="maintitle">
       <xsl:call-template name="generateTitle"/>
   </h1>
         <table cellspacing="0" border="0">
         <colgroup><col width="1%"/><col width="99%"/></colgroup>
         <tr valign="top">
         <td><img src="down.gif" width="1" height = "250"/></td>
<!--* was height=360 (LB) *-->
       <td>
	<xsl:apply-templates select="text/front//docAuthor"/>
	<xsl:apply-templates select="text/front//docDate"/>
<ul>
<xsl:for-each select="text/body/div">
<xsl:variable name="n"><xsl:value-of select="$masterFile"/><xsl:number/></xsl:variable>
<li> <a href="{$n}.html"><xsl:value-of select="head"/></a></li>
</xsl:for-each>
</ul>
</td></tr>
         </table>
         <hr class="bottombar"/>
         <table class="slide" width="95%">
         <tr>
         <td align="left">
         <xsl:variable name="next"><xsl:value-of select="$masterFile"/>1</xsl:variable>
         <a href="{concat($next,'.html')}">Start</a>
         </td>
         <td align="right">
             <xsl:call-template name="generateTitle"/>
         </td></tr>
         </table>
        </div>
	</body>
	</html>
</xsl:template>

<xsl:template match="body/div">
<xsl:variable name="slidenum"><xsl:value-of select="$masterFile"/>
   <xsl:number/></xsl:variable>
 <xsl:call-template name="outputChunk">
  <xsl:with-param name="ident">
    <xsl:value-of select="$slidenum"/>
  </xsl:with-param>
  <xsl:with-param name="content">
    <xsl:call-template name="slideout"/>
  </xsl:with-param>
 </xsl:call-template>

</xsl:template>

<xsl:template name="slideout">
	 <html><xsl:call-template name="addLangAtt"/> 
	 <head>
         <title><xsl:value-of select="head"/></title>
         <xsl:call-template name="includeCSS"/>
	 </head>
	 <body>
         <div  class="teidiv">
	 <h1 class="slidetitle"><xsl:call-template name="header"/></h1>
         <hr class="topbar"/>
         <table cellspacing="0" border="0">
         <colgroup><col width="1%"/><col width="99%"/></colgroup>
         <tr valign="top">
            <td><img src="{$downPicture}" width="1" height = "250"/></td>
<!-- was 360 -->
            <td><xsl:apply-templates/></td>
         </tr>
         </table>
         <hr class="bottombar"/>
         <xsl:call-template name="xrefpanel"/>
        </div>
	</body>
	</html>
</xsl:template>

</xsl:stylesheet>
