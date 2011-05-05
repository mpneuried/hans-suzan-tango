
<cfquery name="Navi_q" datasource="#DB_NAME01#">
	SELECT *
	FROM Navigation
	WHERE Navigation.freigabe <> 0
	ORDER BY Navigation.sortierung
</cfquery>


<cfloop query="Navi_q">
	<cfoutput>
		<a class="a_navi<cfif Navi_q.modul is #tango_modul#>_aktiv</cfif>" href="index.cfm?tango_modul=#Navi_q.modul#" target="_self">#Navi_q.bezeichnung#</a>
	</cfoutput>
</cfloop>