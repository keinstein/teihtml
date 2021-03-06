<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" >
 
 <xsl:output method="xml" indent="yes"/>
 
 <xsl:template match="/">
  <!-- <fo:root>--> 
    <html>
     
     <head>  
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
      <title>
       <xsl:apply-templates select="TEI.2/teiHeader/fileDesc/titleStmt/title" />
       <xsl:apply-templates select="teiCorpus.2/teiHeader/fileDesc/titleStmt/title" />      
       
      </title>
      <link rel="stylesheet" type="text/css" href="/CSS/RL.css" />
     </head>
     <body bgcolor="#CCCCCC" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
      <h2>
       <xsl:choose>
        <xsl:when test="TEI.2/text/bodyhead">
         <xsl:apply-templates select="TEI.2//body/head"/>
        </xsl:when>
        <xsl:otherwise>
         <xsl:apply-templates select="TEI.2/teiHeader/fileDesc/titleStmt/title"/> 
         <xsl:apply-templates select="teiCorpus.2/teiHeader/fileDesc/titleStmt/title"/><br/>
        </xsl:otherwise>
       </xsl:choose>

      </h2>
      <br/>
      <h4>
       
       <xsl:for-each select="TEI.2/teiHeader/fileDesc/titleStmt/author">
       <xsl:value-of select="."/> <xsl:text> </xsl:text>
       </xsl:for-each> 
       <xsl:for-each select="teiCorpus.2/teiHeader/fileDesc/titleStmt/author">
        <xsl:value-of select="."/> <xsl:text> </xsl:text>
       </xsl:for-each> 
       <br/>
       <!--<xsl:apply-templates select="TEI.2/teiHeader/fileDesc/titleStmt/principal"/> 
       <xsl:apply-templates select="teiCorpus.2/teiHeader/fileDesc/titleStmt/principal"/> <br/>-->
       <xsl:apply-templates select="TEI.2/teiHeader/fileDesc/publicationStmt/date"/> 
       <xsl:apply-templates select="teiCorpus.2/teiHeader/fileDesc/publicationStmt/date"/><br/>
       <xsl:apply-templates select="TEI.2/teiHeader/fileDesc/sourceDesc/bibl/edition"/> 
       <xsl:apply-templates select="teiCorpus.2/teiHeader/fileDesc/sourceDesc/bibl/edition"/><br/>
      </h4>
      <hr/>
  
      <xsl:apply-templates/>
     </body>
    </html>
   
  <!--</fo:root>-->
 </xsl:template>
 
 <xsl:template match="teiHeader">
 </xsl:template>
 
 
 <xsl:template match="text">
  <!--<ol> <xsl:for-each select="descendant::div1"><br/>
   <li>
    <xsl:choose>
     <xsl:when test="head">
      <a><xsl:attribute name="href">
       <xsl:text>#</xsl:text><xsl:value-of select="@id"/>
      </xsl:attribute>
       <xsl:value-of select="head"/></a>
     </xsl:when>
     <xsl:otherwise>
      <b><xsl:value-of select="@type"/></b>
     </xsl:otherwise>
    </xsl:choose>
   </li>
   <ol>
    <xsl:for-each select="descendant::table">
     <li>
      <xsl:choose>
       <xsl:when test="head">
        <a><xsl:attribute name="href">
         <xsl:text>#</xsl:text><xsl:value-of select="@id"/>
        </xsl:attribute></a>
        <xsl:value-of select="head"/>
       </xsl:when>
       <xsl:otherwise>
        <b>
         <a><xsl:attribute name="href">
          <xsl:text>#</xsl:text><xsl:value-of select="@id"/>
         </xsl:attribute></a><xsl:value-of select="row[position()=1]/cell[position()=2]"/></b>
       </xsl:otherwise>
      </xsl:choose>
     </li>
      <ol>
     
     <xsl:for-each select="descendant::div3">
     <li>
     <xsl:choose>
     <xsl:when test="head">
     <xsl:value-of select="head"/>
     </xsl:when>
     <xsl:otherwise>
     <b><xsl:value-of select="@type"/></b>
     </xsl:otherwise>
     </xsl:choose>
     </li>
     <ol>
     <xsl:for-each select="descendant::div4">
     <li>
     <xsl:choose>
     <xsl:when test="head">
     <xsl:value-of select="head"/>
     </xsl:when>
     <xsl:otherwise>
     <b><xsl:value-of select="@type"/></b>
     </xsl:otherwise>
     </xsl:choose>
     </li></xsl:for-each>
     
     </ol></xsl:for-each>
      </ol>
    </xsl:for-each>
   </ol></xsl:for-each>
  </ol>-->
  <xsl:apply-templates/>
  
 </xsl:template>
 
 
 <xsl:template match="body">
  <hr/>
  <xsl:choose>
   <xsl:when test="head">
   <h3><xsl:value-of select="head"/></h3>
   </xsl:when>
   <xsl:when test="ancestor-or-self::teiCorpus.2">
    <h3>
     <xsl:value-of select="ancestor::TEI.2/teiHeader/fileDesc/titleStmt/title"/>
     
    </h3>
   </xsl:when>
  </xsl:choose>
  
  <xsl:apply-templates />
 </xsl:template>

 <xsl:template match="div1">
  <div>
   <a><xsl:attribute name="name">
    <xsl:apply-templates select="@id"/></xsl:attribute>
   </a>
   <xsl:apply-templates/>
  </div>
  </xsl:template>

 <xsl:template match="div2">
  <div>
   <a><xsl:attribute name="name">
    <xsl:apply-templates select="@id"/></xsl:attribute>
   </a> 
   <xsl:apply-templates/>
  </div>
 </xsl:template>
 
 <xsl:template match="div3">
  <div>
   <a><xsl:attribute name="name">
    <xsl:apply-templates select="@id"/></xsl:attribute>
   </a>
  
   <xsl:apply-templates/>
  </div>
 </xsl:template>
 
 <xsl:template match="div4">
  <div>
   <a><xsl:attribute name="name">
    <xsl:apply-templates select="@id"/></xsl:attribute>
   </a>
  
   <xsl:apply-templates />
  </div>
 </xsl:template>
 
 <xsl:template match="head">
 <xsl:choose>
  <xsl:when test="parent::div1">
   <h2><xsl:apply-templates/></h2>
  </xsl:when>
  <xsl:when test="parent::div2">
   <h3><xsl:apply-templates /></h3>
  </xsl:when>
  <xsl:when test="parent::div3">
   <h4><xsl:apply-templates /></h4>
  </xsl:when>
<xsl:when test="parent::div4">
 <h5><xsl:apply-templates /></h5>
</xsl:when>
<xsl:when test="parent::lg">
 <xsl:apply-templates /><br/>
</xsl:when>
 </xsl:choose>
  
 </xsl:template>
 
 <xsl:template match="lg">
  <br /><xsl:apply-templates /><br />
 </xsl:template>
 
 <xsl:template match="l">
  <xsl:element name="div">
   <xsl:attribute name="style">margin: 0 0 0 0;</xsl:attribute>
   <span style="width:3em">
   <xsl:if test="position() mod 5 = 0">
    <font size="1">
    <xsl:value-of select="position()"/>
     </font>
   </xsl:if>
   <xsl:text> </xsl:text>
    </span>
   <xsl:apply-templates/>
  </xsl:element>
  </xsl:template>
  
 <!--<xsl:template match="l">
<xsl:variable name="linenum">
<xsl:number level="any" from="//div1" count="l[not(@part)] | l[@part='I']" format="1" />
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
 &#x20;
<xsl:apply-templates/>
</xsl:element>
</xsl:template>-->

 <!--<xsl:template match="l">
 <xsl:apply-templates/><br/>
 </xsl:template>-->
 
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
	<xsl:when test="@n"><br />[p. <xsl:apply-templates select="@n" />]<br />
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


<xsl:template match="LM">
<font title="lemma:{@lemma} categoria:{@catg}" >
<xsl:apply-templates /></font>
</xsl:template>

<xsl:template match="LM1/LM[position()= 1]">
<font title="lemma:{@lemma} categoria:{@catg}" >
<xsl:apply-templates />
</font>
</xsl:template>

<xsl:template match="LM1/LM[position()=2]">
<img src="/Immagini/frecciadx.gif" title="lemma:{@lemma} categoria:{@catg}" />
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
        <xsl:otherwise>
         <a name="{generate-id()}"/>
        </xsl:otherwise>
      </xsl:choose>
      
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
 <xsl:choose>
  <xsl:when test="@type">
  
   <font color="blue"><xsl:apply-templates /></font>
   <sub><xsl:apply-templates select="@type" /> </sub>
  
  </xsl:when>
 <xsl:otherwise>
  <i><xsl:apply-templates /></i>
 </xsl:otherwise>
 </xsl:choose>
 
</xsl:template>

<xsl:template match='foreign'>
<i><xsl:apply-templates /></i>
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
 <xsl:apply-templates 
  select="ancestor-or-self::TEI.2/text/front//docDate" mode="date"/>
 <xsl:choose>
  <xsl:when test="ancestor-or-self::TEI.2/teiHeader/fileDesc/editionStmt/descendant::date">
  <xsl:apply-templates select="ancestor-or-self::TEI.2/teiHeader/fileDesc/editionStmt/descendant::date[1]"/>
    </xsl:when>
  </xsl:choose>
</xsl:variable>

<xsl:variable name="revdate">
<xsl:apply-templates 
 select="ancestor-or-self::TEI.2/teiHeader/revisionDesc/descendant::date[1]"/>
</xsl:variable>

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


<xsl:template match="persNameGr/persName[position()= 1]">
<img src="img/frecciasx.gif">
<xsl:attribute name="title">
<xsl:apply-templates select="@reg"/>
</xsl:attribute>
</img>
<xsl:apply-templates />
</xsl:template>

<xsl:template match="persNameGr/persName[position()=2]">
<img src="img/frecciadx.gif">
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

 <xsl:template match="emph">
  <xsl:choose>
   <xsl:when test="@type">
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
</b></xsl:when>
  <xsl:otherwise>
  <i><xsl:apply-templates/></i>
  </xsl:otherwise>
  </xsl:choose>
 </xsl:template>
 


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

<xsl:template match="quote">
&#x201C; <xsl:apply-templates /> &#x201D;
</xsl:template>



<xsl:template match="w[@type='passe-partout']">
<i><xsl:apply-templates/></i>
</xsl:template>

<xsl:template match="w[@type='malapropismo']">
<u><xsl:apply-templates/></u>
</xsl:template>


</xsl:stylesheet>
