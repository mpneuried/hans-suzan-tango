<cfparam name="uebersicht" default="1">

<cfif uebersicht is 1>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<tD class="ueberschrift1">Galerie</tD>
	</tr>
	<tr>
		<td style="border-bottom:1px solid #CC0B0C; "><div style="height:1px; width:1px; "></div></td>
	</tr>
	<tR>
		<td class="content">
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				
				<cfquery name="galerie" datasource="#DB_NAME01#">
					SELECT *
					FROM galerie_kat
					WHERE freigabe <> 0
				</cfquery>
				
				<cfloop query="galerie">
					<cfoutput>
						<tr>
							<td>
								<table width="100%" border="0" cellpadding="5" cellspacing="0" style=" margin-bottom:5px;">
									<tr>
										<td width="9"><img src="assets/icon_foto.gif" width="16" height="16"></td>
										<td class="fliessetext1" valign="top"><a href="index.cfm?tango_modul=gallerie&uebersicht=0&galerie_kat_id=#galerie.galerie_kat_id#" class="link_anker">#galerie.titel#</a></td>
									</tR>
								</table>
							</td>
						</tr>
					</cfoutput>
				</cfloop>
				
				<cfquery name="movies_kat" datasource="#DB_NAME01#">
					SELECT *
					FROM downloads
					WHERE freigabe <> 0
				</cfquery>
				<cfif movies_kat.recordcount GT 0>
					<cfoutput>
						<tr>
							<td>
								<table width="100%" border="0" cellpadding="5" cellspacing="0" style=" margin-bottom:5px;">
									<tr>
										<td width="9"><img src="assets/icon_movie.gif" width="16" height="19" align="absmiddle"></td>
										<td class="fliessetext1" valign="middle"><a href="index.cfm?tango_modul=movies" class="link_anker">Film-Downloads</a></td>
									</tR>
								</table>
							</td>
						</tr>
					</cfoutput>
				</cfif>
			</table>
		</td>
	</tR>
	<tr>
		<td style="border-bottom:1px solid #CC0B0C; "><div style="height:1px; width:1px; "></div></td>
	</tr>
	<tr>
		<td class="content_fuss">Tango Argentino - Hans und Suzan - Berlin</td>
	</tr>
</table>

<cfelse>
<cfquery name="galerie_det" datasource="#DB_NAME01#">
	SELECT *
	FROM galerie_kat
	WHERE freigabe <> 0
	AND galerie_kat_id = #galerie_kat_id#
</cfquery>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<tD class="ueberschrift1">Galerie - <cfoutput>#galerie_det.titel#</cfoutput></tD>
	</tr>
	<tr>
		<td style="border-bottom:1px solid #CC0B0C; "><div style="height:1px; width:1px; "></div></td>
	</tr>
	<tR>
		<td class="content" style="padding-left:1px; padding-right:1px; ">
			<table border="0" cellpadding="0" cellspacing="0">
				
				<cfquery name="bild" datasource="#DB_NAME01#">
					SELECT *
					FROM bild
					WHERE freigabe <> 0
					AND galerie_kat_id = #galerie_kat_id#
				</cfquery>
				<tr>
				<cfloop query="bild">
					<cfoutput>
						
							<td>
								<table border="0" cellpadding="3" cellspacing="0">
									<tr>
										<td class="fliessetext1" valign="top"><div style="cursor:pointer; " onclick='window.open("html/popup_bild.cfm?pfad=db_assets/bilder/#galerie_kat_id#&datei=#bild.datei#&obj_id=#bild.bild_id#&modus=bild", "Bilder", "width=310,height=400,left=50,top=50,menubar=no,resizable=no,scrollbars=no");'><img src="db_assets/bilder/#galerie_kat_id#/tmb_#bild.datei#" title="#bild.bild1_text#" border="0" width="75" style="border:1px solid ##222222; "></div></td>
									</tR>
								</table>
							</td>
						<cfif bild.currentrow mod 6 is 0>
							</tr>
							<tr>
						</tr></cfif>
						
					</cfoutput>
				</cfloop>
				
			</table>
		</td>
	</tR>
	<tr>
		<td style="border-bottom:1px solid #CC0B0C; "><div style="height:1px; width:1px; "></div></td>
	</tr>
	<tr>
		
    <td class="content_fuss" style="padding-bottom:15px; ">Tango Argentino - Hans 
      und Suzan - Berlin</td>
	</tr>
</table>

</cfif>