<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="/xsl/teihtml.xsl" />
<xsl:template match="div|div0|div1|div2|div3|div4|div5|div6" mode="xrefheader">
  <xsl:variable name="ident">
   <xsl:apply-templates select="." mode="ident"/>
  </xsl:variable>
  <xsl:variable name="depth">
   <xsl:apply-templates select="." mode="depth"/>
  </xsl:variable>
  <xsl:variable name="Hash">
   <xsl:if test="$makeFrames='true' and not($STDOUT='true')">
    <xsl:value-of select="$masterFile"/>
    <xsl:call-template name="addCorpusID"/>
    <xsl:text>.html</xsl:text>
   </xsl:if>
   <xsl:text>#</xsl:text>
  </xsl:variable>
  <xsl:choose>
   <xsl:when test="$rawIE='true' and $depth &lt;= $splitLevel">
       <xsl:text>JavaScript:void(gotoSection('','</xsl:text>
       <xsl:value-of select="$ident"/>
       <xsl:text>'));</xsl:text>
   </xsl:when>
   <xsl:when test="$STDOUT='true' and $depth &lt;= $splitLevel">
     <xsl:value-of select="$masterFile"/>
     <xsl:value-of select="$urlChunkPrefix"/>
     <xsl:value-of select="$ident"/>
   </xsl:when>
   <xsl:when test="ancestor::back and not($splitBackmatter)">
       <xsl:value-of select="concat($Hash,$ident)"/>
   </xsl:when>
   <xsl:when test="ancestor::front and not($splitFrontmatter)">
       <xsl:value-of select="concat($Hash,$ident)"/>
   </xsl:when>
   <xsl:when test="$splitLevel= -1 and ancestor::teiCorpus.2">
    <xsl:value-of select="$masterFile"/>
    <xsl:call-template name="addCorpusID"/>
     <xsl:value-of select="$standardSuffix"/>
     <xsl:value-of select="concat($Hash,$ident)"/>
   </xsl:when>
   <xsl:when test="$splitLevel= -1">
    <xsl:value-of select="concat($Hash,$ident)"/>
   </xsl:when>
   <xsl:when test="$depth &lt;= $splitLevel">
     <xsl:value-of select="concat($ident,$standardSuffix)"/>
   </xsl:when>
   <xsl:otherwise>
   <xsl:variable name="parent">
      <xsl:call-template name="locateParentdiv"/>
   </xsl:variable>
   <xsl:choose>
     <xsl:when test="$rawIE='true'">
       <xsl:text>JavaScript:void(gotoSection("</xsl:text>
       <xsl:value-of select="$ident"/>
       <xsl:text>","</xsl:text>
       <xsl:value-of select="$parent"/>
     <xsl:text>"));</xsl:text>
     </xsl:when>
     <xsl:when test="$STDOUT='true'">
       <xsl:value-of select="$masterFile"/>
       <xsl:text>.ID=</xsl:text>
       <xsl:value-of select="$parent"/>
       <xsl:value-of select="concat($standardSuffix,'#')"/>
       <xsl:value-of select="$ident"/>
     </xsl:when>
     <xsl:otherwise>
       <xsl:value-of select="$parent"/>
      <xsl:value-of select="concat($standardSuffix,'#')"/>
      <xsl:value-of select="$ident"/>
     </xsl:otherwise>
   </xsl:choose>
   </xsl:otherwise>
  </xsl:choose>
</xsl:template>


<xsl:template name="logoPicture"><a target="_top" href="http://lettere.humnet.unpi.it/informaticaumanistica/ricerca/"><img border="0" width="90" height="75"
    src="../html/img/bit-cibit.gif"
    alt="Cibit"/></a></xsl:template>
   <xsl:param name="feedbackURL"/>
   <xsl:template name="feedbackWords"/>
   <xsl:param name="homeLabel">Biblioteca Italiana Telematica</xsl:param>
   <xsl:param name="homeURL">http://www.unife.it/dipartimento/dipartimento-300026.htm</xsl:param>
   <xsl:param name="homeWords"/>
   <xsl:param name="institution">Biblioteca Italiana Telematica</xsl:param>
   <xsl:param name="department"></xsl:param>
   <xsl:variable name="parentURL"></xsl:variable>
   <xsl:variable name="parentWords"></xsl:variable>
   <xsl:param name="searchURL"/>
   <xsl:template name="copyrightStatement"></xsl:template>
   <xsl:param name="sectionUpLink"/>
   <xsl:template name="topLink"><p>[<a href="#TOP">Torna indietro</a>]</p></xsl:template>
   <xsl:param name="appendixWords">Appendice</xsl:param>
   <xsl:param name="tocWords">Indice</xsl:param>
   <xsl:param name="upWord">Indietro</xsl:param>
   <xsl:param name="nextWord">Prossimo</xsl:param>
   <xsl:param name="previousWord">Precedente</xsl:param>
   <xsl:template name="contentsWord">Indice</xsl:template>
   <xsl:param name="dateWord"/>
   <xsl:param name="authorWord"/>
   <xsl:param name="cssFile">/CSS/RL.css</xsl:param> 



<xsl:template match="l">
<xsl:variable name="linenum">
<xsl:number level="any" from="body|div1|div2" count="l[not(@part)] | l[@part='I']" format="1" />
</xsl:variable>
<xsl:element name="div">
<xsl:attribute name="style">margin: 0 0 0 0;</xsl:attribute>
<span style="width:3em">
<xsl:choose>
<xsl:when test="($linenum mod 5) = 0">
<font size="1">
<xsl:value-of select="$linenum"/>
</font>
</xsl:when>
</xsl:choose>
</span>
<span style="width:3em"></span>
<xsl:apply-templates/>
</xsl:element>
</xsl:template>

<xsl:template match="l[@part='M']">
<span style="width:10em"></span>
<xsl:apply-templates/>
</xsl:template>

<xsl:template match="l[@part='F']">
<span style="width:18em"></span>
<xsl:apply-templates/>
</xsl:template>

<xsl:template match="pb">
<xsl:choose>
	<xsl:when test="pb[@n]"><br />[p. <xsl:apply-templates select="@n" />]<br />
</xsl:when>
<xsl:otherwise>
<hr width="10%" noshade="noshade" />
<xsl:apply-templates />
</xsl:otherwise>
</xsl:choose>
</xsl:template>


<xsl:template match="del">
<s><xsl:apply-templates />
</s>
</xsl:template>

<xsl:template match="gap">
[...]<xsl:apply-templates />
</xsl:template>

<xsl:template match="add">
&lt;<xsl:apply-templates />&gt;
</xsl:template>

<xsl:template match="corr">
[<xsl:apply-templates />]
</xsl:template>


<xsl:template match="castList/head">
<dl>
<dd>
<p align="center"><STRONG><font size="4"><xsl:apply-templates/>
 </font></STRONG></p></dd>
</dl>
</xsl:template>

<xsl:template match="lb">
<br/><xsl:apply-templates />
</xsl:template>

<xsl:template match="lg">
<br /><xsl:apply-templates /><br />
</xsl:template>

<xsl:template match="LM">
<font title="lemma:{@lemma} categoria:{@catg}" >
<xsl:apply-templates /></font>
<xsl:text> </xsl:text>
</xsl:template>

<xsl:template match="LM1/LM[position()= 1]">
<font title="lemma:{@lemma} categoria:{@catg}" >
<xsl:apply-templates />
</font>
</xsl:template>

<xsl:template match="LM1/LM[position()=2]">
<img src="/Immagini/frecciadx.gif" title="lemma:{@lemma} categoria:{@catg}" />
<xsl:text> </xsl:text>
</xsl:template>

<xsl:template match="p">
  <xsl:choose>
    <xsl:when test="list">
      <xsl:apply-templates select="list[1]" mode="inpara"/> 
    </xsl:when> 
    <xsl:otherwise>
     <p>
    <xsl:choose>
        <xsl:when test="@rend and starts-with(@rend,'class:')">
    <xsl:attribute name="class">
      <xsl:value-of select="substring-after(@rend,'class:')"/>
    </xsl:attribute>
      </xsl:when>
    <xsl:when test="@rend">
       <xsl:attribute name="class"><xsl:value-of select="@rend"/></xsl:attribute>
      </xsl:when>
    </xsl:choose>
      <xsl:choose>
        <xsl:when test="@id">
          <a name="{@id}"/>
        </xsl:when>
        <xsl:when test="$generateParagraphIDs='true'">
         <a name="{generate-id()}"/>
        </xsl:when>
      </xsl:choose>
      <xsl:if test="$numberParagraphs='true'">
        <xsl:number/><xsl:text> </xsl:text>
      </xsl:if>
      <xsl:if test="@n">
      [<xsl:apply-templates select='@n' />]&#x00A0;
	</xsl:if>
      <xsl:apply-templates/>
     </p>
    </xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match='argument'>
<b><xsl:apply-templates /></b>
</xsl:template>

<xsl:template match='distinct'>
<i><xsl:apply-templates /></i>
</xsl:template>

<xsl:template match='foreign'>
<i><xsl:apply-templates /></i>
</xsl:template>

<xsl:template match='quote'>
<xsl:apply-templates />
</xsl:template>


<xsl:template match="a">
<xsl:text> </xsl:text>
<a name="{@name}"><xsl:apply-templates /></a>
</xsl:template>


<xsl:template match="b">
<b><xsl:apply-templates /></b>
</xsl:template>

<xsl:template match="font">
<font color="{@color}"><xsl:apply-templates /></font>
</xsl:template>

<xsl:template match="body">
<html>
	<head>
	   <link rel="stylesheet" type="text/css" href="/CSS/RL.css" />
	</head>
  <body bgcolor="#CCCCCC" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
  <xsl:apply-templates />
  </body>
  </html>
</xsl:template>

<xsl:template match="hi[@rend='underlined']">
<xsl:text> </xsl:text>
<u><xsl:apply-templates/></u>
</xsl:template>

<xsl:template match="hi[@rend='line']">
<hr align="center" width="50%" noshade="noshade"><xsl:apply-templates/></hr>
</xsl:template>

<xsl:template match="divGen[@type='destinatario']">
<p align="center">
<i>Destinatario:</i>
<xsl:for-each select="ancestor::TEI.2/teiHeader/profileDesc/particDesc/person/p">
<xsl:apply-templates/>
</xsl:for-each>
</p>
</xsl:template>


<xsl:template match="divGen[@type='creazione']">
<p align="center">
<xsl:for-each select="ancestor::TEI.2/teiHeader/profileDesc/creation">
<xsl:apply-templates/>
</xsl:for-each>
</p>
</xsl:template>

<xsl:template match="divGen[@type='fonte']">
<p align="left">
<xsl:for-each
select="ancestor::TEI.2/teiHeader/fileDesc/sourceDesc/p">
<xsl:apply-templates/>
</xsl:for-each>
</p>
</xsl:template>

<xsl:template match="divGen[@type='note']">
<p align="left">
<xsl:for-each
select="ancestor::TEI.2/teiHeader/fileDesc/notesStmt/note">
<xsl:apply-templates/>
</xsl:for-each>
</p>
</xsl:template>


<xsl:template match="title[@rend='underlined']">
<u><xsl:apply-templates /></u>
</xsl:template>

<xsl:template match="p[@rend='right']|hi[@rend='right']">
<p align="right"><xsl:apply-templates /></p>
</xsl:template>

<xsl:template match="p[@rend='center']|hi[@rend='center']">
<p align="center"><xsl:apply-templates /></p>
</xsl:template>

<xsl:template match="hi[@rend='apice']">
<sup><xsl:apply-templates /></sup>
</xsl:template>

<xsl:template match="hi[@rend='underl_sup']">
<u><sup><xsl:apply-templates /></sup> </u>
</xsl:template>

<xsl:template match="rs[@rend='italic']">
<i><xsl:apply-templates /></i>
</xsl:template>

<xsl:template match="add[@place='marginright']">
[a margine destro:] <strong><xsl:apply-templates /></strong>
</xsl:template>

<xsl:template match="add[@place='marginleft']">
[a margine sinistro:] <span class="SICB"><xsl:apply-templates /></span>
</xsl:template>


<xsl:template match="add[@place='margintop']">
<i>a margine superiore del foglio: </i> [<xsl:apply-templates />]
</xsl:template>

<xsl:template match="add[@place='marginbot']">
<i>a margine inferiore del foglio: </i> [<xsl:apply-templates />]
</xsl:template>

<xsl:template match="add[@place='supralinear']">
<!--<i>sopra la linea: </i>--> <sup><xsl:apply-templates /></sup>
</xsl:template>

<xsl:template match="add[@place='underlinear']">
<!--[sotto la linea:]--> <sub><xsl:apply-templates /></sub>
</xsl:template>



<xsl:template match="handShift[@new='h2']">
<font color="green"><xsl:apply-templates /></font>
</xsl:template>

<xsl:template match="handShift[@new='h3']">
<font color="blue"><xsl:apply-templates /></font>
</xsl:template>


<xsl:template name="generateDate">
  <xsl:param name="showRev">true</xsl:param>
<xsl:variable name="realdate">
 <xsl:choose>
   <xsl:when test="$useHeaderFrontMatter='true' and ancestor-or-self::TEI.2/text/front//docDate">
  <xsl:apply-templates 
    select="ancestor-or-self::TEI.2/text/front//docDate" 
    mode="date"/>
  </xsl:when>
  <xsl:when test="ancestor-or-self::TEI.2/teiHeader/fileDesc/editionStmt/descendant::date">
  <xsl:apply-templates select="ancestor-or-self::TEI.2/teiHeader/fileDesc/editionStmt/descendant::date[1]"/>
    </xsl:when>
  </xsl:choose>
</xsl:variable>

<xsl:variable name="revdate">
<xsl:apply-templates 
 select="ancestor-or-self::TEI.2/teiHeader/revisionDesc/descendant::date[1]"/>
</xsl:variable>
<xsl:value-of select="$dateWord"/><xsl:text> </xsl:text>
<xsl:if test="not($realdate = '')">
  <xsl:value-of select="$realdate"/>
</xsl:if>


<xsl:if test="$showRev='true' and not($revdate = '') and not ($revdate='&#36;Date$')">
  <xsl:choose>
  <xsl:when test="starts-with($revdate,'$Date:')"> <!-- it's RCS -->
    <xsl:value-of select="substring($revdate,16,2)"/>
    <xsl:text>/</xsl:text>
    <xsl:value-of select="substring($revdate,13,2)"/>
    <xsl:text>/</xsl:text>
    <xsl:value-of select="substring($revdate,8,4)"/> 
  </xsl:when>
  <xsl:otherwise>
   <xsl:value-of select="$revdate"/>    
  </xsl:otherwise>
 </xsl:choose>
 <xsl:text>. </xsl:text></xsl:if>

</xsl:template>

<xsl:template match="persName">
<xsl:text> </xsl:text>
<xsl:apply-templates />
<xsl:text> </xsl:text>
</xsl:template>


<xsl:template match="placeName">
<font color="blue" title="{@key}, {@reg}"><xsl:apply-templates /></font>
</xsl:template>

<xsl:template match="time">
<font color="#DE1F03" title=" {@value}"><xsl:apply-templates /></font>
</xsl:template>

<xsl:template match="timeRange">
<font color="#DE1F03" title="durata: {@to}"><xsl:apply-templates /></font>
</xsl:template>

<xsl:template match="persName">
<xsl:choose>
	<xsl:when test="@reg">
	<font color="#33CC33" title="nome: {@reg}, funzione: {@type}"><xsl:apply-templates /></font>
</xsl:when>
<xsl:otherwise>
<font color="#33CC33" title="funzione: {@type}"><xsl:apply-templates /></font>
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="persName[not(@*)]">
<xsl:apply-templates />
</xsl:template>


<xsl:template match="persNameGr/persName[position()= 1]">
<img src="/Immagini/frecciasx.gif">
<xsl:attribute name="title">
<xsl:apply-templates select="@reg"/>
</xsl:attribute>
</img>
<xsl:apply-templates />
</xsl:template>

<xsl:template match="persNameGr/persName[position()=2]">
<img src="/Immagini/frecciadx.gif">
<xsl:attribute name="title">
<xsl:apply-templates select="@reg"/>
</xsl:attribute>
</img>
</xsl:template>

<xsl:template match="u">
<dl>
 <dt>
 <xsl:apply-templates select="@who" />
 </dt>
<dd><xsl:apply-templates />
</dd>
</dl>
</xsl:template>

<xsl:template match="u[@start]">
<dl>
 <dt>
<xsl:apply-templates select="@who" />
 </dt>
<dd> <font color="#C63904"><xsl:apply-templates /></font>
</dd>
</dl>
</xsl:template>

<xsl:template match="u[@to]">
<dl>
 <dt>
 <xsl:apply-templates select="@who" /> &#x2013;&gt; <xsl:apply-templates select="@to" /> 
 </dt>
<dd><xsl:apply-templates />
</dd>
</dl>
</xsl:template>


<xsl:template match="anchor">
<font size="4"><strong>*<xsl:apply-templates /></strong></font>
</xsl:template>

<xsl:template match="seg[@type='connettivo']">

<xsl:choose>
	<xsl:when test="@function='iti' ">
	<u title="presa di turno"><xsl:apply-templates /></u>
	</xsl:when>
	<xsl:when test="@function='imt' ">
	<u title="mantenimento di turno"><xsl:apply-templates /></u>
	</xsl:when>
		<xsl:when test="@function='itf' ">
	<u title="chiusura di turno"><xsl:apply-templates /></u>
	</xsl:when>
	<xsl:when test="@function='irie' ">
	<u title="riempitivo"><xsl:apply-templates /></u>
	</xsl:when>
	<xsl:when test="@function='ifat' ">
	<u title="fatismo"><xsl:apply-templates /></u>
	</xsl:when>
	<xsl:when test="@function='imod' ">
	<u title="modulazione portata discorso"><xsl:apply-templates /></u>
	</xsl:when>
	<xsl:when test="@function='mdem' ">
	<u title="demarcativo"><xsl:apply-templates /></u>
	</xsl:when>
	<xsl:when test="@function='mfoc' ">
	<u title="focalizzatore logico"><xsl:apply-templates /></u>
	</xsl:when>
	<xsl:when test="@function='mrif' ">
	<u title="riformulazione"><xsl:apply-templates /></u>
	</xsl:when>
</xsl:choose>
</xsl:template>

<xsl:template match="seg[not(@type='connettivo')][not(@id)][not(@type='ordine marcato')]">
<font color="#666666" title="{@type}"><xsl:apply-templates /></font>
</xsl:template>

<xsl:template match="seg[not(@type='connettivo')][not(@id)][@type='ordine marcato']">
<font color="#666666" title="{@subtype}"><xsl:apply-templates /></font>
</xsl:template>

<xsl:template match="seg[@id]">
 + <xsl:apply-templates />
</xsl:template>

<xsl:template match="unclear">
<span class="unclear"><xsl:apply-templates /></span>
</xsl:template>
<xsl:template match="gap[@extent]">
<strong> xx <xsl:apply-templates /></strong>
</xsl:template>

<xsl:template match="gap">
<strong> xxx <xsl:apply-templates /></strong>
</xsl:template>

<xsl:template match="vocal[@type='semi-lexical']">
<xsl:apply-templates />^
</xsl:template>

<xsl:template match="vocal[@type='non-lexical']">
[=! <xsl:apply-templates />]
</xsl:template>

<xsl:template match="vocal[@type='fragment']">
 <xsl:apply-templates select="@desc" />^^
</xsl:template>

<xsl:template match="long[@type='support']">
::: <xsl:apply-templates />
</xsl:template>

<xsl:template match="long[@type='suspension']">
&#x2026;<xsl:apply-templates />
</xsl:template>

<xsl:template match="pause">
<font size="4">  #</font>
<xsl:choose>
	<xsl:when test="@type='sint'">
<sup>sint</sup> 
	</xsl:when>
	<xsl:when test="@type='emph'">
<sup>enf</sup> 
	</xsl:when>
		<xsl:when test="@type='rie'">
<sup>pian</sup> 
	</xsl:when>
</xsl:choose>
<xsl:text>
 </xsl:text>
<xsl:apply-templates />
</xsl:template>

<xsl:template match="event">
<sub><font color="gray">%act: <xsl:apply-templates select="@desc" /></font></sub><br />
</xsl:template>

<xsl:template match="retracing[@type='nocorr']">
<i> [/] <xsl:apply-templates /></i>
</xsl:template>

<xsl:template match="retracing[@type='corr']">
<i> [//] <xsl:apply-templates /></i>
</xsl:template>

<xsl:template match="retracing[@type='reform']">
<i> [///] <xsl:apply-templates /></i>
</xsl:template>

<xsl:template match="retracing[@type='fstart']">
<i> [/-] <xsl:apply-templates /></i>
</xsl:template>

<!--<xsl:template match="emph">
<b><xsl:attribute name="title">
<xsl:choose>
	<xsl:when test="@type='int'">tipo: intonazione</xsl:when>
     <xsl:when test="@type='rit'">tipo: ritmo</xsl:when>
     <xsl:when test="@type='les'">tipo: lessico</xsl:when>
          <xsl:when test="@type='vol'">tipo: volume</xsl:when>

</xsl:choose>
<xsl:text>; </xsl:text>
<xsl:choose>
	<xsl:when test="@function='iro'">funzione: ironico</xsl:when>
	<xsl:when test="@function='sot'">funzione: sottolineatura</xsl:when>
</xsl:choose>

</xsl:attribute>
<xsl:apply-templates />[!]
</b>
</xsl:template>-->


<xsl:template match="kinesic">
<font color="#339933"><xsl:choose>
	<xsl:when test="@function='bat' ">
	<b title="batonico"> 0.</b>
	</xsl:when>
	<xsl:when test="@function='sim' ">
	<b title="simbolico">0.</b>
	</xsl:when>
	<xsl:when test="@function='esp' ">
	<b title="espressivo">0.</b>
	</xsl:when>
		<xsl:when test="@function='mim' ">
	<b title="mimetico">0.</b>
	</xsl:when>
	<xsl:when test="@function='dei' ">
	<b title="deittico">0.</b>
	</xsl:when>
</xsl:choose>
<xsl:apply-templates /> <sup><xsl:apply-templates select="@desc" /></sup></font>
</xsl:template>

<xsl:template match="supplied">
(<xsl:apply-templates />)
</xsl:template>

<xsl:template match="interruption[@type='self']">
+...<xsl:apply-templates />
</xsl:template>

<xsl:template match="interruption[@type='others']">
+/.<xsl:apply-templates />
</xsl:template>

<xsl:template match="q">
&#x2014; <xsl:apply-templates /> &#x2014;
</xsl:template>

<xsl:template match="distinct">
<font color="blue"><xsl:apply-templates /></font>
<sub><xsl:apply-templates select="@type" /> </sub>
</xsl:template>

<xsl:template match="w[@type='passe-partout']">
<i><xsl:apply-templates/></i>
</xsl:template>

<xsl:template match="w[@type='malapropismo']">
<u><xsl:apply-templates/></u>
</xsl:template>

<xsl:template match="ptr">
 <br />
<u><xsl:apply-templates select='@type' /></u>:&#x00A0;
<a class="ptr">
 <xsl:attribute name="href">#<xsl:apply-templates select="@target"/>
 </xsl:attribute>
<xsl:variable name="xx">
  <xsl:apply-templates mode="header" select="key('IDS',@target)">
    <xsl:with-param name="minimal" select="$minimalCrossRef"/>
 </xsl:apply-templates>
 </xsl:variable>
 <xsl:value-of select="normalize-space($xx)"/>
 </a>
 <xsl:if test="@gradRef='it_co'">
<font size="2">&#x00A0;&#x00A0;&#x00A0;  [italiano colloquiale]<!--<xsl:apply-templates select="@gradRef" />--></font> 
 </xsl:if>
 <xsl:if test="@gradRef='dial'"> <font size="2">&#x00A0;&#x00A0;&#x00A0;  [strato dialettale]</font> 
 </xsl:if>
 <xsl:if test="@gradRef='gerg_trad'"><font size="2">&#x00A0;&#x00A0;&#x00A0;  [gergo tradizionale]
 </font> </xsl:if>
 <xsl:if test="@gradRef='gerg_inn'"><font size="2">&#x00A0;&#x00A0;&#x00A0;  [gergo innovante]
 </font> </xsl:if>
<xsl:if test="@gradRef='mass'"><font size="2">&#x00A0;&#x00A0;&#x00A0;  [pubblicità e mass media]
 </font> </xsl:if>
 <xsl:if test="@gradRef='for'"><font size="2">&#x00A0;&#x00A0;&#x00A0;  [forestierismi]
 </font> </xsl:if>
 <xsl:if test="@gradRef='ps_for'"><font size="2">&#x00A0;&#x00A0;&#x00A0;  [pseudo-forestierismi]
 </font> </xsl:if>

</xsl:template>

<xsl:template match="term">
<xsl:choose>
	<xsl:when test="@id">
<a name="{@id}">
<strong><xsl:apply-templates select="@type" /></strong>&#x00A0;
<font title="{@grammRef}"><xsl:apply-templates /></font></a>
</xsl:when>
<xsl:otherwise>
<strong><xsl:apply-templates select="@type" /></strong>&#x00A0;
<font title="{@grammRef}"><xsl:apply-templates /></font>
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="distinct[@id]">
<a name="{@id}">
<xsl:apply-templates /></a>
</xsl:template>

<xsl:template match="descrip[@type='sesso']|descrip[@type='nascita']|descrip[@type='residenza']|descrip[@type='provincia']|descrip[@type='descrizione']">
<br/><i><xsl:apply-templates select="@type" /></i>: &#x00A0;
<xsl:apply-templates />
</xsl:template>

<xsl:template match="descrip[@type='internet']">
<br/><i>uso di internet</i>: &#x00A0;
<xsl:apply-templates />
</xsl:template>

<xsl:template match="descrip[@type='consVern']">
<br/><i>Uso di forme dialettali</i>: &#x00A0;
<xsl:apply-templates />
</xsl:template>

<xsl:template match="descrip[@type='consLing']">
<br/><i>Uso di linguaggio giovanile</i>: &#x00A0;
<xsl:apply-templates />
</xsl:template>

<xsl:template match="termEntry">
<xsl:choose>
<xsl:when test="@id">
<a name="{@id}"><xsl:apply-templates /></a>
</xsl:when>
<xsl:otherwise>
<xsl:apply-templates/>
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="lg[@type='strofa']/l[not(@rend)]">
<!--<xsl:variable name="linenum1">
<xsl:number level="any" from="body|div1" count="l[@part='N'] | l[@part='I']" format="1" />
</xsl:variable>-->
<xsl:element name="div">
<xsl:attribute name="style">margin: 0 0 0 0;</xsl:attribute>
<span style="width:3em">
<!--<xsl:choose>
<xsl:when test="($linenum1 mod 5) = 0">
<font size="1">
<xsl:value-of select="$linenum1"/>
</font>
</xsl:when>
</xsl:choose>-->
</span>
<span style="width:8em"></span>
<xsl:apply-templates/>
</xsl:element>
</xsl:template>


<xsl:template match="lg[@type='strofa']/l[@part='M']">
<span style="width:15em"></span>
<xsl:apply-templates/>
</xsl:template>

<xsl:template match="lg[@type='strofa']/l[@part='F']">
<span style="width:23em"></span>
<xsl:apply-templates/>
</xsl:template>



<xsl:template match="l[@rend='indent']">
<span style='margin-left:13em'></span>
<xsl:apply-templates/><br />
</xsl:template>

<xsl:template match="t">
<xsl:apply-templates /><xsl:text> </xsl:text>	
</xsl:template>

<xsl:template match="w">
<xsl:apply-templates /><xsl:text> </xsl:text>
</xsl:template>

</xsl:stylesheet>
