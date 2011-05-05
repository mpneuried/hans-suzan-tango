<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<tD class="ueberschrift1">Film-Downloads</tD>
	</tr>
	<tr>
		<td><img src="assets/content_linie.gif" width="400" height="1"></td>
	</tr>
	<cfset mov_path = ExpandPath('db_assets/movies/')>
	<tR>
		<td class="content">
			<cfquery name="movies" datasource="#DB_NAME01#">
				SELECT *
				FROM downloads
				WHERE freigabe <> 0
			</cfquery>
			<cfif movies.recordcount is not 0>
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<cfloop query="movies">
				<cfdirectory directory="#mov_path#" action="list" name="fileinfo" filter="#movies.downloaddatei#">
					<cfoutput>
						<tr>
							<td height="25"><img src="assets/icon_movie.gif" width="16" height="19" align="absmiddle" />&nbsp;<a class="link_anker" href="db_assets/movies/#movies.downloaddatei#" target="_blank"><cfif movies.bezeichnung is not ''>#movies.bezeichnung#<cfelse>#movies.downloaddatei#</cfif></a> <span style="font-size:9px;font-weight:normal;">[#left(fileinfo.size/1024/1024,2+find('.','#fileinfo.size/1024/1024#'))#Mb]</span></td>
						</tr>
						<cfif movies.beschreibung is not ''>
							<tr>
								<td class="fliessetext_9" style="padding-left:23px; padding-bottom:10px; padding-top:4px; ">#movies.beschreibung#</td>
							</tr>
						</cfif>
					</cfoutput>
				</cfloop>
				</table>
			<cfelse>
				Zur Zeit sind keine Film-Downloads vorhanden!
			</cfif>
		</td>
	</tR>
	<tr>
		<td><img src="assets/content_linie.gif" width="400" height="1"></td>
	</tr>
	<tr>
		<td>
			<table border="0" cellpadding="3" cellspacing="2">
				<tr>
					<td><img src="assets/warning.gif" width="18" height="18" border="0"></td>
					<td  class="fliessetext_9" >
						Um die Videoas anschauen zu können benötigen Sie den DivX-codec.<br>
						Sie können den Codec unter diesem Link <a href="http://download.divx.com/divx/DivXInstaller.exe" class="link_anker" target="_blank">herunterladen.</a>
					</td>		
					<td><a href="http://download.divx.com/divx/DivXInstaller.exe" class="link_anker" target="_blank"><img src="assets/divx.gif" width="40" height="27" border="0"></a></td>
				</tr>
			</table>
		</td>
		
	</tr>
	<tr>
		<td><img src="assets/content_linie.gif" width="400" height="1"></td>
	</tr>
	<tr>
		<td class="content_fuss">Tango Argentino - Hans und Suzan - Berlin</td>
	</tr>
</table>