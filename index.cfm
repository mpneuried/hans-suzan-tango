<cfinclude template="inc.cfm">

<cfparam name="tango_modul" default="home">

<cfquery name="keywordstitel" datasource="#DB_NAME01#">
	SELECT *
	FROM Navigation
	WHERE Navigation.modul = '#tango_modul#'
</cfquery>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	<html>
	<head>
	<title> --- Tango Argentino Hans und Suzan --- <cfoutput>#keywordstitel.keywords#</cfoutput></title>
	<cfoutput>#Kopfinclude#</cfoutput>
	</head>

<body>
<table border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td class="table_navi"><cfinclude template="html/navi.cfm"></td>
		<td class="table_content"><cfinclude template="html/#tango_modul#.cfm"></td>
		<td class="table_right">&nbsp;</td>
	</tr>
</table>
</body>
</html>