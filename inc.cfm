<!--- Metadaten für Kopfinclude --->

<cfset Kopfinclude='
	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	<html>
	<head>
	<meta name="author" content="Mathias Peter, Bodo Himmelsbach * BARTH Medienhaus">
	<meta name="generator" content="MRLN_WCMS * by Bodo Himmelsbach">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<META NAME="Language" CONTENT="deutsch">
	<META NAME="Refresh" CONTENT="After 7 days">
	<META NAME="Robots" CONTENT="INDEX,FOLLOW">
	<META NAME="Keywords" CONTENT=" Tanzen, Berlin, Tango, Argentino, tango argentino, Tangoshow, Tangoschule, Tanzlehrer, Tangolehrer, Tangokurs, tango kurse, Tanzpartner, Milonga, Tangoball, Tangosalon, Tangotermine, Practica, tangolesson, Tanguero, workshop, tango workshops, tango Berlin, tango unterricht, tango auftritt, berlin kurse, shows, berlin tango, offener Unterricht, Tänzer, Tänzerin, Tanzpartner, Tangotanzen, Tangotrainer, Training, Tanzschule, Blau-Silber-Berlin, Löwenpalais, Unterricht, Privatstunden, Einzelunterricht, Potsdam, Zehlendorf, Grunewald, Dahlem, Friedenau, Steglitz, Schöneberg, Wannsee, Paartanz, Anfänger, Einsteiger, Vals, Vals cruzado, Suzan & Hans, Suzan Unnewehr, Hans Zeiser, Männertechnik, Frauentechnik, Freizeit, Musik, Tanzstil, Tangostil, Tangomusik, Lernen, Ausbildung zum Tangolehrer, Lehrerausbildung, Weiterbildung ">
	<META NAME="description" CONTENT=" Tango Argentino, Hans und Suzan, Tangounterricht in Berlin ">
	<link href="style_tango.css" rel="stylesheet" type="text/css"  media="screen"/>
	<link rel="SHORTCUT ICON" href="favicon.ico">
	</head>
'>


<!--- Datenbank --->
<cfset DB_NAME01 = 'tango_berlin'>

<cfinclude template="settings.cfm">

<!--- Kontakt Mail Empfänger --->
<cfset kontakt_mail_empfaenger = 'ha.zeiser@arcor.de'>
<cfset kontakt_mail_sender_mail = 'kontakt@hans-suzan-tango.de'>
<cfset kontakt_mail_sender_name = 'Hans und Suzan Tango - Kontaktformular'>

<cffunction name="renderTextElements">
	<cfargument name="sText">
	<cfargument name="sType" default="download">
	
	<cfset var sReturn = "">
	<cfset var sReqEx = "\[\[#arguments.sType#:\d+\]\]">
	<cfset var aTexts = split(' ' & arguments.sText,sReqEx)>
	<cfset var aData = get(' ' & arguments.sText,sReqEx)>
	<cfset var iLength = arrayLen(aTexts)>
	
	<cfif arrayLen(aData) gt arrayLen(aTexts)>
		<cfset iLength = arrayLen(aData)>
	</cfif>
	
	<cfloop from="1" to="#iLength#" index="idx">
		<cfif arrayLen(aTexts) gte idx>
			<cfset sReturn = sReturn & aTexts[idx]>
		</cfif>
		<cfif arrayLen(aData) gte idx>
			<cfset aOption = get(aData[idx],'\d+')>
			<cfloop from="1" to="#arrayLen(aOption)#" index="idxOption">
				<cfswitch expression="#arguments.sType#">
					<cfcase value="download">
						<cf>
						<cfset sReturn = sReturn & renderDownload(aOption[idxOption])>
					</cfcase>
				</cfswitch>
			</cfloop>
		</cfif>
	</cfloop>
	
	<cfreturn sReturn>
	
</cffunction>

<cffunction name="renderDownload" returntype="String" output="false" access="public">
	<cfargument name="ID"    type="numeric"/>
	
	<cfset var download = queryNew('dummy')>
	<cfset var FileInfo = queryNew('dummy')>
	
	<cfquery name="download" datasource="#DB_NAME01#">
		SELECT *
		FROM downloads
		WHERE downloads.download_id = #ID#
	</cfquery>
	
	<cfif download.recordcount>
		<cfdirectory
			action="LIST"
			directory="#ExpandPath('#Pfad_Downloadarea_Downloads#')#"
			name="FileInfo"
			FILTER="#download.downloaddatei#">
		<cfreturn '<a href="../../db_assets/movies/#download.downloaddatei#" target="_blank">#download.bezeichnung#</a> [#Int("0#FileInfo.size#"/1024)# kb]'>
	<cfelse>
		<cfreturn "">
	</cfif>
	
</cffunction>

<cffunction name="split" returntype="Array" output="false" access="public">
	<cfargument name="Text"    type="String"/>
	<cfargument name="Regex"   type="String"/>

	<cfreturn createObject("java","java.util.regex.Pattern")
		.compile( Arguments.Regex , 2 )
		.split(Arguments.Text)
	/>
</cffunction>
	<cffunction name="get" returntype="Array" output="false" access="public">
		<cfargument name="Text"    type="String"/>
		<cfargument name="Regex"   type="String"/>

		<cfset var Pattern = CreateObject("java","java.util.regex.Pattern")
			.compile( Arguments.Regex ,2)/>
		<cfset var Matcher = Pattern.Matcher(Arguments.Text)/>
		<cfset var Matches = ArrayNew(1)/>

		<cfloop condition="Matcher.find()">
			<cfset ArrayAppend(Matches,Matcher.Group())/>
		</cfloop>

		<cfreturn Matches/>
	</cffunction>