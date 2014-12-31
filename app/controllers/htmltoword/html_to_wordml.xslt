<xsl:stylesheet exclude-result-prefixes="java msxsl ext w o v WX aml w10" version="1.0" xmlns:WX="http://schemas.microsoft.com/office/word/2003/auxHint" xmlns:aml="http://schemas.microsoft.com/aml/2001/core" xmlns:ext="http://www.xmllab.net/wordml2html/ext" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:java="http://xml.apache.org/xalan/java" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:pkg="http://schemas.microsoft.com/office/2006/xmlPackage" xmlns:str="http://exslt.org/common" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" xmlns:w10="urn:schemas-microsoft-com:office:word" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output encoding="utf-8" indent="yes" method="xml" omit-xml-declaration="no"/>
    <w:fonts>
    <w:defaultFonts w:ascii="Helvetica" w:fareast="Helvetica"
                    w:h-ansi="Helvetica" w:cs="Helvetica"/>
  </w:fonts>
  <xsl:template match="/">
    <w:document mc:Ignorable="w14 wp14" xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" xmlns:mo="http://schemas.microsoft.com/office/mac/office/2008/main" xmlns:mv="urn:schemas-microsoft-com:mac:vml" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" xmlns:w10="urn:schemas-microsoft-com:office:word" xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml" xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml" xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing" xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas" xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup" xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk" xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape">
      <xsl:apply-templates/>
    </w:document>
  </xsl:template>
  <xsl:template match="head"/>
  <xsl:template match="body">
    <xsl:comment>KNOWN BUGS:
      div
        h2
        div
          textnode (WONT BE WRAPPED IN A W:P)
          div
            table
            span
              text
    </xsl:comment>
    <w:body>
      <xsl:apply-templates/>
      <w:sectPr>
        <w:pgSz w:h="16838" w:w="11906"/>
        <w:pgMar w:bottom="1440" w:footer="708" w:gutter="0" w:header="708" w:left="1440" w:right="1440" w:top="1440"/>
        <w:cols w:space="708"/>
        <w:docGrid w:linePitch="360"/>
      </w:sectPr>
    </w:body>
  </xsl:template>
  <xsl:template match="body/*[not(*)]">
    <w:p>
      <xsl:call-template name="text-alignment"/>
      <w:r>
        <w:rPr>
          <w:rFonts w:ascii="Helvetica" w:h-ansi="Helvetica" w:cs="Helvetica"/>
        </w:rPr>
        <w:t xml:space="preserve">
          <xsl:value-of select="."/>
        </w:t>
      </w:r>
    </w:p>
  </xsl:template>
  <xsl:template match="div[not(ancestor::td) and not(ancestor::th) and not(ancestor::p) and not(descendant::div) and not(descendant::p) and not(descendant::h1) and not(descendant::h2) and not(descendant::h3) and not(descendant::h4) and not(descendant::h5) and not(descendant::h6) and not(descendant::table) and not(descendant::li)]">
    <xsl:comment>Divs should create a p if nothing above them has and nothing below them will</xsl:comment>
    <w:p>
      <xsl:call-template name="text-alignment"/>
      <xsl:apply-templates/>
    </w:p>
  </xsl:template>
  <xsl:template match="div">
    <xsl:apply-templates/>
  </xsl:template>
  <!-- TODO: make this prettier. Headings shouldn't enter in template from L51 -->
  <xsl:template match="body/h1|h1">
    <w:p>
      <w:r>
        <w:rPr>
          <w:rFonts w:ascii="Helvetica" w:h-ansi="Helvetica" w:cs="Helvetica"/>
          <w:sz w:val="56"/>   <!-- 28-point font size -->
        </w:rPr>
        <w:pPr>

        </w:pPr>
        <w:t><xsl:value-of select="."/></w:t>
      </w:r>
    </w:p>
  </xsl:template>
  <xsl:template match="body/h3|h3">
    <w:p>
      <w:r>
        <w:rPr>
          <w:rFonts w:ascii="Helvetica" w:h-ansi="Helvetica" w:cs="Helvetica"/>
          <w:sz w:val="30"/>   <!-- 28-point font size -->
        </w:rPr>
        <w:pPr>

        </w:pPr>
        <w:t><xsl:value-of select="."/></w:t>
      </w:r>
    </w:p>
  </xsl:template>
  <xsl:template match="body/h5|h5">
    <w:p>
      <w:r>
        <w:rPr>
          <w:rFonts w:ascii="Helvetica" w:h-ansi="Helvetica" w:cs="Helvetica"/>
          <w:sz w:val="25"/>   <!-- 28-point font size -->
        </w:rPr>
        <w:pPr>

        </w:pPr>
        <w:t><xsl:value-of select="."/></w:t>
      </w:r>
    </w:p>
  </xsl:template>
  <xsl:template match="body/hr|hr">
    <w:p>
      <w:r>
        <w:rPr>
          <w:rFonts w:ascii="Helvetica" w:h-ansi="Helvetica" w:cs="Helvetica"/>
       </w:rPr>
        <w:pPr>

        </w:pPr>
        <w:pict>
          <v:line id="Line 2" o:spid="_x0000_s4097" style="position:absolute;z-index:251657728;visibility:visible" from="-3.75pt,.2pt" to="484.35pt,.2pt" o:gfxdata="UEsDBBQA...BQAAAAA=&#xA;" strokecolor="gray"/>
        </w:pict>
      </w:r>
    </w:p>
  </xsl:template>
  <xsl:template match="body/h2|body/h4|body/h5|body/h6|h2|h4|h5|h6">
    <xsl:variable name="length" select="string-length(name(.))"/>
    <w:p>
      <w:r>
        <w:rPr>
          <w:rFonts w:ascii="Helvetica" w:h-ansi="Helvetica" w:cs="Helvetica"/>
       </w:rPr>
        <w:pPr>
          <w:pStyle w:val="Heading{substring(name(.),$length)}"/>
        </w:pPr>
        <w:t xml:space="preserve">
          <xsl:value-of select="."/>
        </w:t>
      </w:r>
    </w:p>
  </xsl:template>
  <xsl:template match="p">
    <w:p>
      <w:r>
        <w:rPr>
          <w:rFonts w:ascii="Helvetica" w:h-ansi="Helvetica" w:cs="Helvetica"/>
       </w:rPr>
        <w:pPr>

        </w:pPr>
        <w:pict>
          <v:line id="Line 2" o:spid="_x0000_s4097" style="position:absolute;z-index:251657728;visibility:visible" from="-3.75pt,.2pt" to="484.35pt,.2pt" o:gfxdata="UEsDBBQA...BQAAAAA=&#xA;" strokecolor="gray"/>
        </w:pict>
      </w:r>
      <xsl:apply-templates/>
    </w:p>
  </xsl:template>
  <xsl:template match="li">
    <w:p>
      <w:r>
        <w:rPr>
          <w:rFonts w:ascii="Helvetica" w:h-ansi="Helvetica" w:cs="Helvetica"/>
        </w:rPr>
        <w:t xml:space="preserve">
          <xsl:value-of select="."/>
        </w:t>
      </w:r>
    </w:p>
  </xsl:template>
  <xsl:template match="span[not(ancestor::td) and (preceding-sibling::h1 or preceding-sibling::h2 or preceding-sibling::h3 or preceding-sibling::h4 or preceding-sibling::h5 or preceding-sibling::h6 or preceding-sibling::table or preceding-sibling::p or preceding-sibling::ol or preceding-sibling::ul or preceding-sibling::div or following-sibling::h1 or following-sibling::h2 or following-sibling::h3 or following-sibling::h4 or following-sibling::h5 or following-sibling::h6 or following-sibling::table or following-sibling::p or following-sibling::ol or following-sibling::ul or following-sibling::div)]     |a[not(ancestor::td) and (preceding-sibling::h1 or preceding-sibling::h2 or preceding-sibling::h3 or preceding-sibling::h4 or preceding-sibling::h5 or preceding-sibling::h6 or preceding-sibling::table or preceding-sibling::p or preceding-sibling::ol or preceding-sibling::ul or preceding-sibling::div or following-sibling::h1 or following-sibling::h2 or following-sibling::h3 or following-sibling::h4 or following-sibling::h5 or following-sibling::h6 or following-sibling::table or following-sibling::p or following-sibling::ol or following-sibling::ul or following-sibling::div)]     |small[not(ancestor::td) and (preceding-sibling::h1 or preceding-sibling::h2 or preceding-sibling::h3 or preceding-sibling::h4 or preceding-sibling::h5 or preceding-sibling::h6 or preceding-sibling::table or preceding-sibling::p or preceding-sibling::ol or preceding-sibling::ul or preceding-sibling::div or following-sibling::h1 or following-sibling::h2 or following-sibling::h3 or following-sibling::h4 or following-sibling::h5 or following-sibling::h6 or following-sibling::table or following-sibling::p or following-sibling::ol or following-sibling::ul or following-sibling::div)]     |strong[not(ancestor::td) and (preceding-sibling::h1 or preceding-sibling::h2 or preceding-sibling::h3 or preceding-sibling::h4 or preceding-sibling::h5 or preceding-sibling::h6 or preceding-sibling::table or preceding-sibling::p or preceding-sibling::ol or preceding-sibling::ul or preceding-sibling::div or following-sibling::h1 or following-sibling::h2 or following-sibling::h3 or following-sibling::h4 or following-sibling::h5 or following-sibling::h6 or following-sibling::table or following-sibling::p or following-sibling::ol or following-sibling::ul or following-sibling::div)]     |em[not(ancestor::td) and (preceding-sibling::h1 or preceding-sibling::h2 or preceding-sibling::h3 or preceding-sibling::h4 or preceding-sibling::h5 or preceding-sibling::h6 or preceding-sibling::table or preceding-sibling::p or preceding-sibling::ol or preceding-sibling::ul or preceding-sibling::div or following-sibling::h1 or following-sibling::h2 or following-sibling::h3 or following-sibling::h4 or following-sibling::h5 or following-sibling::h6 or following-sibling::table or following-sibling::p or following-sibling::ol or following-sibling::ul or following-sibling::div)]     |i[not(ancestor::td) and (preceding-sibling::h1 or preceding-sibling::h2 or preceding-sibling::h3 or preceding-sibling::h4 or preceding-sibling::h5 or preceding-sibling::h6 or preceding-sibling::table or preceding-sibling::p or preceding-sibling::ol or preceding-sibling::ul or preceding-sibling::div or following-sibling::h1 or following-sibling::h2 or following-sibling::h3 or following-sibling::h4 or following-sibling::h5 or following-sibling::h6 or following-sibling::table or following-sibling::p or following-sibling::ol or following-sibling::ul or following-sibling::div)]     |b[not(ancestor::td) and (preceding-sibling::h1 or preceding-sibling::h2 or preceding-sibling::h3 or preceding-sibling::h4 or preceding-sibling::h5 or preceding-sibling::h6 or preceding-sibling::table or preceding-sibling::p or preceding-sibling::ol or preceding-sibling::ul or preceding-sibling::div or following-sibling::h1 or following-sibling::h2 or following-sibling::h3 or following-sibling::h4 or following-sibling::h5 or following-sibling::h6 or following-sibling::table or following-sibling::p or following-sibling::ol or following-sibling::ul or following-sibling::div)]     |u[not(ancestor::td) and (preceding-sibling::h1 or preceding-sibling::h2 or preceding-sibling::h3 or preceding-sibling::h4 or preceding-sibling::h5 or preceding-sibling::h6 or preceding-sibling::table or preceding-sibling::p or preceding-sibling::ol or preceding-sibling::ul or preceding-sibling::div or following-sibling::h1 or following-sibling::h2 or following-sibling::h3 or following-sibling::h4 or following-sibling::h5 or following-sibling::h6 or following-sibling::table or following-sibling::p or following-sibling::ol or following-sibling::ul or following-sibling::div)]">
    <xsl:comment>In the following situation:

        div
          h2
          span
            textnode
            span
              textnode
          p

        The div template will not create a w:p because the div contains a h2. Therefore we need to wrap the inline elements span|a|small in a p here.
      </xsl:comment>
    <w:p>
      <xsl:apply-templates/>
    </w:p>
  </xsl:template>
  <xsl:template match="text()[not(parent::td) and (preceding-sibling::h1 or preceding-sibling::h2 or preceding-sibling::h3 or preceding-sibling::h4 or preceding-sibling::h5 or preceding-sibling::h6 or preceding-sibling::table or preceding-sibling::p or preceding-sibling::ol or preceding-sibling::ul or preceding-sibling::div or following-sibling::h1 or following-sibling::h2 or following-sibling::h3 or following-sibling::h4 or following-sibling::h5 or following-sibling::h6 or following-sibling::table or following-sibling::p or following-sibling::ol or following-sibling::ul or following-sibling::div)]">
    <xsl:comment>In the following situation:

        div
          h2
          textnode
          p

        The div template will not create a w:p because the div contains a h2. Therefore we need to wrap the textnode in a p here.
      </xsl:comment>
    <w:p>
      <w:r>
        <w:rPr>
          <w:rFonts w:ascii="Helvetica" w:h-ansi="Helvetica" w:cs="Helvetica"/>
        </w:rPr>
        <w:t xml:space="preserve">
          <xsl:value-of select="."/>
        </w:t>
      </w:r>
    </w:p>
  </xsl:template>
  <xsl:template match="span[contains(concat(' ', @class, ' '), ' h ')]">
    <xsl:comment>This template adds MS Word highlighting ability.
      </xsl:comment>
    <xsl:variable name="color">
      <xsl:choose>
        <xsl:when test="./@data-style='pink'">magenta</xsl:when>
        <xsl:when test="./@data-style='blue'">cyan</xsl:when>
        <xsl:when test="./@data-style='orange'">darkYellow</xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="./@data-style"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="preceding-sibling::h1 or preceding-sibling::h2 or preceding-sibling::h3 or preceding-sibling::h4 or preceding-sibling::h5 or preceding-sibling::h6 or preceding-sibling::table or preceding-sibling::p or preceding-sibling::ol or preceding-sibling::ul or preceding-sibling::div or following-sibling::h1 or following-sibling::h2 or following-sibling::h3 or following-sibling::h4 or following-sibling::h5 or following-sibling::h6 or following-sibling::table or following-sibling::p or following-sibling::ol or following-sibling::ul or following-sibling::div">
        <w:p>
          <w:r>
            <w:rPr>
              <w:rFonts w:ascii="Helvetica" w:h-ansi="Helvetica" w:cs="Helvetica"
              <w:highlight w:val="{$color}"/>
            </w:rPr>
            <w:t xml:space="preserve">
              <xsl:value-of select="."/>
            </w:t>
          </w:r>
        </w:p>
      </xsl:when>
      <xsl:otherwise>
        <w:r>
          <w:rPr>
            <w:highlight w:val="{$color}"/>
          </w:rPr>
          <w:t xml:space="preserve">
            <xsl:value-of select="."/>
          </w:t>
        </w:r>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="div[contains(concat(' ', @class, ' '), ' -page-break ')]">
    <w:p>
      <w:r>
        <w:rPr>
          <w:rFonts w:ascii="Helvetica" w:h-ansi="Helvetica" w:cs="Helvetica"/>
        </w:rPr>
        <w:br w:type="page"/>
      </w:r>
    </w:p>
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="details"/>
  <xsl:template name="tableborders">
    <xsl:variable name="border">
      <xsl:choose>
        <xsl:when test="contains(concat(' ', @class, ' '), ' table-bordered ')">6</xsl:when>
        <xsl:when test="not(@border)">0</xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="./@border * 6"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="bordertype">
      <xsl:choose>
        <xsl:when test="$border=0">none</xsl:when>
        <xsl:otherwise>single</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <w:tblBorders>
      <w:top w:color="auto" w:space="0" w:sz="{$border}" w:val="{$bordertype}"/>
      <w:left w:color="auto" w:space="0" w:sz="{$border}" w:val="{$bordertype}"/>
      <w:bottom w:color="auto" w:space="0" w:sz="{$border}" w:val="{$bordertype}"/>
      <w:right w:color="auto" w:space="0" w:sz="{$border}" w:val="{$bordertype}"/>
      <w:insideH w:color="auto" w:space="0" w:sz="{$border}" w:val="{$bordertype}"/>
      <w:insideV w:color="auto" w:space="0" w:sz="{$border}" w:val="{$bordertype}"/>
    </w:tblBorders>
  </xsl:template>
  <xsl:template match="table">
    <w:tbl>
      <w:tblPr>
        <w:tblStyle w:val="TableGrid"/>
        <w:tblW w:type="auto" w:w="0"/>
        <xsl:call-template name="tableborders"/>
        <w:tblLook w:firstColumn="0" w:firstRow="0" w:lastColumn="0" w:lastRow="0" w:noHBand="1" w:noVBand="1" w:val="0600"/>
      </w:tblPr>
      <w:tblGrid>
        <w:gridCol w:w="2310"/>
        <w:gridCol w:w="2310"/>
      </w:tblGrid>
      <xsl:apply-templates/>
    </w:tbl>
  </xsl:template>
  <xsl:template match="tbody">
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="thead">
    <xsl:choose>
      <xsl:when test="count(./tr) = 0">
        <w:tr>
          <xsl:apply-templates/>
        </w:tr>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="tr">
    <xsl:if test="string-length(.) &gt;0">
      <w:tr>
        <xsl:apply-templates/>
      </w:tr>
    </xsl:if>
  </xsl:template>
  <xsl:template match="th">
    <w:tc>
      <w:p>
        <w:r>
          <w:rPr>
            <w:rFonts w:ascii="Helvetica" w:h-ansi="Helvetica" w:cs="Helvetica"/>
            <w:b/>
          </w:rPr>
          <w:t xml:space="preserve">
            <xsl:value-of select="."/>
          </w:t>
        </w:r>
      </w:p>
    </w:tc>
  </xsl:template>
  <xsl:template match="td">
    <w:tc>
      <xsl:call-template name="block">
        <xsl:with-param name="current" select="."/>
        <xsl:with-param name="class" select="@class"/>
        <xsl:with-param name="style" select="@style"/>
      </xsl:call-template>
    </w:tc>
  </xsl:template>
  <xsl:template name="block">
    <xsl:param name="current"/>
    <xsl:param name="class"/>
    <xsl:param name="style"/>
    <xsl:if test="count($current/*|$current/text()) = 0">
      <w:p/>
    </xsl:if>
    <xsl:for-each select="$current/*|$current/text()">
      <xsl:choose>
        <xsl:when test="name(.) = 'table'">
          <xsl:apply-templates select="."/>
          <w:p/>
        </xsl:when>
        <xsl:when test="contains('|p|h1|h2|h3|h4|h5|h6|ul|ol|', concat('|', name(.), '|'))">
          <xsl:apply-templates select="."/>
        </xsl:when>
        <xsl:when test="descendant::table|descendant::p|descendant::h1|descendant::h2|descendant::h3|descendant::h4|descendant::h5|descendant::h6|descendant::li">
          <xsl:call-template name="block">
            <xsl:with-param name="current" select="."/>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <w:p>
            <xsl:call-template name="text-alignment">
              <xsl:with-param name="class" select="$class"/>
              <xsl:with-param name="style" select="$style"/>
            </xsl:call-template>
            <xsl:apply-templates select="."/>
          </w:p>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="text()">
    <xsl:if test="string-length(.) &gt;0">
      <w:r>
        <xsl:if test="ancestor::i or ancestor::em">
          <w:rPr>
            <w:rFonts w:ascii="Helvetica" w:h-ansi="Helvetica" w:cs="Helvetica"/>
            <w:i/>
          </w:rPr>
        </xsl:if>
        <xsl:if test="ancestor::b or ancestor::strong">
          <w:rPr>
            <w:rFonts w:ascii="Helvetica" w:h-ansi="Helvetica" w:cs="Helvetica"/>
            <w:b/>
          </w:rPr>
        </xsl:if>
        <xsl:if test="ancestor::u">
          <w:rPr>
            <w:rFonts w:ascii="Helvetica" w:h-ansi="Helvetica" w:cs="Helvetica"/>
            <w:u w:val="single"/>
          </w:rPr>
        </xsl:if>
        <w:t xml:space="preserve">
          <xsl:value-of select="."/>
        </w:t>
      </w:r>
    </xsl:if>
  </xsl:template>
  <xsl:template match="*">
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template name="text-alignment">
    <xsl:param name="class" select="@class"/>
    <xsl:param name="style" select="@style"/>
    <xsl:variable name="alignment">
      <xsl:choose>
        <xsl:when test="contains(concat(' ', $class, ' '), ' center ') or contains(translate(normalize-space($style),' ',''), 'text-align:center')">center</xsl:when>
        <xsl:when test="contains(concat(' ', $class, ' '), ' right ') or contains(translate(normalize-space($style),' ',''), 'text-align:right')">right</xsl:when>
        <xsl:when test="contains(concat(' ', $class, ' '), ' left ') or contains(translate(normalize-space($style),' ',''), 'text-align:left')">left</xsl:when>
        <xsl:when test="contains(concat(' ', $class, ' '), ' justify ') or contains(translate(normalize-space($style),' ',''), 'text-align:justify')">both</xsl:when>
        <xsl:otherwise/>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="string-length(normalize-space($alignment)) &gt;0">
      <w:pPr>
        <w:jc w:val="{$alignment}"/>
      </w:pPr>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>