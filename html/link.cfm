<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<tD class="ueberschrift1">Links</tD>
	</tr>
	<tr>
		<td><img src="assets/content_linie.gif" width="400" height="1"></td>
	</tr>
	<tR>
		<td class="content">
			<cfquery name="link" datasource="#DB_NAME01#">
				SELECT *
				FROM link
				WHERE freigabe <> 0
			</cfquery>
			<cfif link.recordcount is not 0>
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<cfloop query="link">
					<cfoutput>
						<tr>
							<td height="16"><img src="assets/pkt.gif" width="9" height="9" /><cfif link.bild1 is not ''>&nbsp;<a  href="##" class="link_anker" onclick='window.open("html/popup_bild.cfm?pfad=db_assets/links/bilder&datei=#link.bild1#&obj_id=#link.link_id#&modus=link", "Bilder-View", "width=310,height=400,left=50,top=50,menubar=no,resizable=no,scrollbars=no");'><img src="assets/icon_foto.gif" width="16" height="16" border="0" align="absmiddle"></a></cfif>&nbsp;<a class="link_anker" href="#link.interneturl1#" target="#link.interneturlzielfenster1#"><cfif link.interneturlbezeichnung1 is not ''>#link.interneturlbezeichnung1#<cfelse>#link.interneturl1#</cfif></a></td>
						</tr>
						<cfif link.beschreibung is not ''>
							<tr>
								<td class="fliessetext_9" style="padding-left:15px; padding-bottom:10px; padding-top:4px; ">#link.beschreibung#</td>
							</tr>
						</cfif>
					</cfoutput>
				</cfloop>
				</table>
			<cfelse>
				Zur Zeit sind keine Links vorhanden!
			</cfif>
		</td>
	</tR>
	<tr>
		<td><img src="assets/content_linie.gif" width="400" height="1"></td>
	</tr>
	<tr>
		<td class="content_fuss">Tango Argentino - Hans und Suzan - Berlin</td>
	</tr>
</table>