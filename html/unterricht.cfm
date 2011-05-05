<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<tD class="ueberschrift1">Unterricht</tD>
	</tr>
	<tr>
		<td style="border-bottom:1px solid #CC0B0C; "><div style="height:1px; width:1px; "></div></td>
	</tr>
	<tR>
		<td class="content">
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				
				<cfquery name="unterricht" datasource="#DB_NAME01#">
					SELECT *
					FROM unterricht
					WHERE freigabe <> 0
					ORDER BY sortierung ASC
				</cfquery>
				
				<cfloop query="unterricht">
					<cfoutput>
						
						<tr>
							<td class="fliessetext_F" colspan="2" style="padding-bottom:5px;<cfif check_rahmen is 1>border-bottom: 1px solid ##CC0B0C; </cfif>"><cfif check_ueberschrift is 1>#unterricht.ueberschrift#<cfelse>&nbsp;</cfif></td>
						</tr>
						
						<tr>
						<cfif unterricht.bild is not ''>
							<td valign="top" style="padding:7px; <cfif check_rahmen is 1>background-color:##eeeeee;</cfif>" class="fliessetext_9" width="135"><img src="db_assets/unterricht/#unterricht.bild#" width="135" style="border: 1px solid ##CC0B0C; "><br><div style="width: 135px;">#unterricht.bild_text#</div></td>
						</cfif>
							<td <cfif unterricht.bild is ''>colspan="2"</cfif> valign="top" <cfif check_rahmen is 1>style="background-color:##eeeeee;"</cfif>>
								<table width="100%" border="0" cellpadding="4" cellspacing="0">
									<tr>
										<td class="fliessetext1" valign="top">#unterricht.freitext#</td>
									</tR>
								</table>
							</td>
						</tr>
						<tR>
							<td style="padding-top:5px;<cfif check_rahmen is 1>border-top: 1px solid ##CC0B0C;</cfif> " colspan="2">&nbsp;</td>
						</tR>
					</cfoutput>
				</cfloop>
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