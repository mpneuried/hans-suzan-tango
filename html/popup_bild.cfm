<cfinclude template="../inc.cfm">

<cfset bild_loc = "#ExpandPath('../#pfad#')#/#datei#">
<cfset bild_br_pfad = "../#pfad#/#datei#">

<cfimage action="info" source="#bild_loc#" structname="image">



<cfquery name="bildtext" datasource="#DB_NAME01#">
SELECT *
FROM #modus#
WHERE #modus#_id = #obj_id#
</cfquery>

<cfoutput>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Image Viewer</title>
<link href="../style_tango.css" rel="stylesheet" type="text/css"  media="screen"/>

<style type="text/css">
body{
	font-size: 11px;
	background-image: url();
	margin: 0px;
	padding: 0px;
	background-repeat: repeat-x;
	background-color: ##000000;
	font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;
	font-size:11px;
	color:##ffffff;
}
</style>

</head>
<body onLoad="window.resizeTo(#image.width#, #image.height#);<cfif bildtext.bild1_text is not ''>window.resizeBy(0, 120);</cfif>">


<img src="#bild_br_pfad#" border="0" /><br />
<div align="right"><a href="##" onClick="window.close();" style="font-size:9px;font-weight:bold;color:##CC0B0C;text-decoration:none;padding:3px;padding-right:8px;">#chr(187)#&nbsp;Fenster schlie&szlig;en</a></div>
<div style="padding:8px;">
#bildtext.bild1_text#
</div>
</body>
</html>
</cfoutput>