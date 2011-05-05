<cfquery name="texte" datasource="#DB_NAME01#">
	SELECT *
	FROM faq
	WHERE faq_id = 8
</cfquery>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<tD class="ueberschrift1"><cfoutput>#texte.txt_ueberschrift#</cfoutput></tD>
	</tr>
	<tr>
		<td><img src="assets/content_linie.gif" width="400" height="1"></td>
	</tr>
	<tR>
		<td class="content"><img src="assets/img_con_ueber_1.jpg" width="153" height="100" align="left" style="display:block; margin-right:8px; margin-top:1px; border:1px solid #000000; "><cfoutput>#renderTextElements(texte.txt)#</cfoutput></td>
	</tR>
	<tr>
		<td><img src="assets/content_linie.gif" width="400" height="1"></td>
	</tr>
	<tr>
		<td class="content_fuss">Tango Argentino - Hans und Suzan - Berlin</td>
	</tr>
</table>