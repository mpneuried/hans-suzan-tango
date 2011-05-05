<cfquery name="texte" datasource="#DB_NAME01#">
	SELECT *
	FROM faq
	WHERE faq_id = 10
</cfquery>


<!--- Form init --->

<!--- Strucktur:
1: Titel
2: name
3: Typ (text, plz_ort, textarea,anrede)
4: Pflicht (ja/nein -> 1/0)
5: JS-Prüfung (email,text)
6: Sonderformate durch ';' getrennt:

	anrede				textarea		PLZ/ORT		
	1: titel			1: breite		1: Titel-plz
	2: name				2: hoehe		2: name-plz
	3: titel							3: Titel-Ort
	4: name								4: name-ort
	.
	.
	.

 --->

<cfset form_array = ArrayNew(1)>

<cfset form_array[1] = 'Vorname|vorname|text|1|text| '>
<cfset form_array[2] = 'Nachname|nachname|text|1|text| '>
<cfset form_array[3] = 'Straße|strasse|text|0|text| '>
<cfset form_array[4] = 'PLZ/ Ort|plz_ort|plz_ort|0|text|PLZ;plz;Ort;ort'>
<cfset form_array[5] = 'Telefon|telefon|text|1|text| '>
<cfset form_array[6] = 'E-Mail|email|text|1|email| '>
<cfset form_array[7] = 'Mitteilung|mitteilung|textarea|1|text|40;50'>
<cfif not isDefined('form.gesendet')>



	
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td class="ueberschrift1">Kontakt</td>
		</tr>
		<tr>
			<td>
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tR>
						<td style="border-bottom:1px solid #A40020;border-top:1px solid #A40020;">
							<table width="100%" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<table border="0" cellpadding="4" cellspacing="0" width="100%">
										<tr>
											<td colspan="2" class="ueberschrift2">&nbsp;</td>
										</tr>
										<cfoutput>
											<form action="index.cfm?tango_modul=kontakt" method="post" name="Kontaktformular" target="_self" onSubmit="return Check();">
												<cfloop index="array_pos" from="1" to="#ArrayLen(form_array)#">
													<cfif ListGetAt(form_array[array_pos],3,'|') is 'text'>
														<tr>
															<td width=90 align="right" class="ueberschrift2"><cfif ListGetAt(form_array[array_pos],4,'|') is 1><span style="color:##B22222;">*</span></cfif><label for="lbl_id_#ListGetAt(form_array[array_pos],2,'|')#">#ListGetAt(form_array[array_pos],1,'|')#:&nbsp;</label></td>
															<td class="ueberschrift2"><input id="lbl_id_#ListGetAt(form_array[array_pos],2,'|')#" name="#ListGetAt(form_array[array_pos],2,'|')#" class="input_kontakt" type="#ListGetAt(form_array[array_pos],3,'|')#" maxlength="50"></td>
														</tr>
													<cfelseif ListGetAt(form_array[array_pos],3,'|') is 'plz_ort'>
														<tr>
															<td width=90 align="right" class="ueberschrift2"><cfif ListGetAt(form_array[array_pos],4,'|') is 1><span style="color:##B22222;">*</span></cfif><label for="lbl_id_#ListGetAt(form_array[array_pos],2,'|')#"><label for="plz_id_#ListGetAt(form_array[array_pos],2,'|')#">#ListGetAt(ListGetAt(form_array[array_pos],6,'|'),1,';')#</label>/<label for="ort_id_#ListGetAt(form_array[array_pos],2,'|')#">#ListGetAt(ListGetAt(form_array[array_pos],6,'|'),3,';')#:&nbsp;</label></label></td>
															<td class="fliesstext_11"><input name="#ListGetAt(ListGetAt(form_array[array_pos],6,'|'),2,';')#" id="plz_id_#ListGetAt(form_array[array_pos],2,'|')#" class="input_kontakt_plz" type="text" maxlength="50">&nbsp;<input id="ort_id_#ListGetAt(form_array[array_pos],2,'|')#" name="#ListGetAt(ListGetAt(form_array[array_pos],6,'|'),4,';')#" class="input_kontakt_ort" type="text" maxlength="50"></td>
														</tr>
													<cfelseif ListGetAt(form_array[array_pos],3,'|') is 'anrede'>
														<tr>
															<td width=90 align="right" class="ueberschrift2">#ListGetAt(form_array[array_pos],1,'|')#:&nbsp;</td>
															<td class="ueberschrift2">
																<cfloop index="anrede_loop_pos" from="1" to="#ListLen(ListGetAt(form_array[array_pos],6,'|'),';')#" step="2">
																	<input  name="#ListGetAt(form_array[array_pos],2,'|')#" type="radio" value="#ListGetAt(ListGetAt(form_array[array_pos],6,'|'),anrede_loop_pos+1,';')#" id="id_anrede_#ListGetAt(ListGetAt(form_array[array_pos],6,'|'),anrede_loop_pos+1,';')#" <cfif anrede_loop_pos is 1>checked</cfif>><label for="id_anrede_#ListGetAt(ListGetAt(form_array[array_pos],6,'|'),anrede_loop_pos+1,';')#">#ListGetAt(ListGetAt(form_array[array_pos],6,'|'),anrede_loop_pos,';')#:&nbsp;</label>&nbsp;
																</cfloop>
															</td>
														</tr>
													<cfelseif ListGetAt(form_array[array_pos],3,'|') is 'textarea'>
														<tr>
															<td colspan="2" class="ueberschrift2">&nbsp;</td>
														</tr>
														<tr>
															<td width=90 align="right" valign="top" class="ueberschrift2"><cfif ListGetAt(form_array[array_pos],4,'|') is 1><span style="color:##B22222;">*</span></cfif><label for="lbl_id_#ListGetAt(form_array[array_pos],2,'|')#">#ListGetAt(form_array[array_pos],1,'|')#:&nbsp;</label></td>
															<td><textarea id="lbl_id_#ListGetAt(form_array[array_pos],2,'|')#" name="#ListGetAt(form_array[array_pos],2,'|')#" cols="#ListGetAt(ListGetAt(form_array[array_pos],6,'|'),1,';')#" rows="#ListGetAt(ListGetAt(form_array[array_pos],6,'|'),2,';')#" class="input_kontakt_mitteilung"></textarea></td>
														</tr>
														<tr>
															<td colspan="2" class="ueberschrift2">&nbsp;</td>
														</tr>
													</cfif>
												</cfloop>
												<tr>
													<td width=90 class="ueberschrift2">&nbsp;</td>
													<td><input name="senden" type="submit" class="input_kontakt_button" value="senden"></td>
												</tr>
												<input name="gesendet" type="hidden" value="1">
											</form>
										</cfoutput>
										<tr>
											<td colspan="2" class="ueberschrift2">&nbsp;</td>
										</tr>
										</table>
										
									</td>
									<td valign="top" style="padding-left:10px; padding-top:28px; ">
										<table width="100%" border="0" cellpadding="0" cellspacing="0">
											<tr>
												<td class="fliessetext_9">
<cfoutput>#renderTextElements(texte.txt)#</cfoutput>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tR>
				
				</table>
			</td>
		<tr>
			<td class="content_fuss">Tango Argentino - Hans und Suzan - Berlin</td>
		</tr>
		</tr>
	</table>
<cfoutput>
<script language="JavaScript">

	function RTrim(s)
	{
		var i;

		for (i=s.value.length-1; s.value.charCodeAt(i)==32; i--) {}
		s.value=s.value.substring(0,i+1);

		return s.value;
	}

	function Check()
	{
		var text1="";
		
		with (document.forms[0])
		{
			
			<cfloop index="array_pos_inc" from="1" to="#ArrayLen(form_array)#">
				<cfif ListGetAt(form_array[array_pos_inc],4,'|') is 1>
					#ListGetAt(form_array[array_pos_inc],2,'|')#.style.borderColor='##5C5C5C';
				</cfif>
			</cfloop>
			
			<cfloop index="array_pos" from="1" to="#ArrayLen(form_array)#">
				<cfif ListGetAt(form_array[array_pos],4,'|') is 1>
				
			
					<cfif ListGetAt(form_array[array_pos],5,'|') is 'text'>
						if (RTrim(#ListGetAt(form_array[array_pos],2,'|')#) == "")
						{
							#ListGetAt(form_array[array_pos],2,'|')#.style.borderColor='##CA0C0C';
							text1+="- #ListGetAt(form_array[array_pos],1,'|')#\n";
						}
					<cfelseif ListGetAt(form_array[array_pos],5,'|') is 'email'>
						if (RTrim(#ListGetAt(form_array[array_pos],2,'|')#) == "")
						{
							#ListGetAt(form_array[array_pos],2,'|')#.style.borderColor='##CA0C0C';
							text1+="- #ListGetAt(form_array[array_pos],1,'|')#\n";
						}
						else
						{
							var s = #ListGetAt(form_array[array_pos],2,'|')#.value;
							if (s != '')
							{
								res = (s.search('@') >= 1 &&
								s.lastIndexOf('.') > s.search('@') &&
								s.lastIndexOf('.') >= s.length-5)
							
								if (res == false)
								{
									text1+='- gültige E-Mail-Adresse\n';
									#ListGetAt(form_array[array_pos],2,'|')#.style.backgroundImage='url(assets/img_kontakt_input_fehler.jpg)';
								}
							}
						}
					</cfif>
				</cfif>
			</cfloop>
		}
		
		if (text1 != "")
		{
			alert('Folgende Informationen benötigen wir noch:\n'+text1);
			return false;
		}
	}

</script>
</cfoutput>

<cfelse>
<cfset leer_zeichen = #chr(46)#>
<cfset anz_zeichen_titel = 15>
<cfmail to="#kontakt_mail_empfaenger#" from="#kontakt_mail_sender_mail#" subject="Kontakt über Webseite" charset="windows-1252" type="html">
<cfmailparam name = "From" value = "#kontakt_mail_sender_name# <#kontakt_mail_sender_mail#>">
<span style="font-family:'Courier New', Courier, mono; font-size:12px;">
	Es erfolgte eine Kontaktaufnahme über die Webseite<br />
	--------------------------------------------------<br />
	Datum: #DateFormat(now(),'dd.mm.yyyy')# #TimeFormat(now(),'HH:mm')# Uhr<br />
	<cfloop index="array_pos" from="1" to="#ArrayLen(form_array)#"><cfif ListGetAt(form_array[array_pos],3,'|') is not 'textarea'><cfif ListGetAt(form_array[array_pos],3,'|') is 'plz_ort'>#ListGetAt(ListGetAt(form_array[array_pos],6,'|'),1,';')#/#ListGetAt(ListGetAt(form_array[array_pos],6,'|'),3,';')#<cfloop index="leer_loop" from="1" to="#anz_zeichen_titel-1-Len(ListGetAt(ListGetAt(form_array[array_pos],6,'|'),3,';'))-Len(ListGetAt(ListGetAt(form_array[array_pos],6,'|'),3,';'))#">#leer_zeichen#</cfloop>: #Evaluate('form.#ListGetAt(ListGetAt(form_array[array_pos],6,"|"),2,';')#')# #Evaluate('form.#ListGetAt(ListGetAt(form_array[array_pos],6,"|"),4,';')#')#<cfelse>#ListGetAt(form_array[array_pos],1,'|')#<cfloop index="leer_loop" from="1" to="#anz_zeichen_titel-Len(ListGetAt(form_array[array_pos],1,'|'))#">#leer_zeichen#</cfloop>: #Evaluate('form.#ListGetAt(form_array[array_pos],2,"|")#')#</cfif></cfif><br />
	</cfloop>
	<cfloop index="array_pos2" from="1" to="#ArrayLen(form_array)#"><cfif ListGetAt(form_array[array_pos2],3,'|') is 'textarea'>#ListGetAt(form_array[array_pos2],1,'|')#:<br />
			----------------------------------------------------------------<br />
			#Replace(Evaluate('form.#ListGetAt(form_array[array_pos2],2,"|")#'),chr(13),'<br />','all')#<br />
			----------------------------------------------------------------<br />
	</cfif></cfloop>
</span>
</cfmail>

	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td class="ueberschrift1">Kontakt - <span style="color:#A40020">Erfolgreich gesendet!</span></td>
		</tr>
		<tr>
			<td>
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tR>
						<td style="border-bottom:1px solid #A40020;border-top:1px solid #A40020;">
							<table width="100%" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<table border="0" cellpadding="2" cellspacing="0" width="100%">
										<tr><td>&nbsp;</td></tr>
										<tr>
											<td class="fliessetext_F">Vielen Dank für Ihre Kontaktaufnahme.</td>
										</tr>
										<tr>
											<td class="fliessetext1">Ihre Mitteilung haben wir erhalten und werden gegebenenfalls mit Ihnen in Kontakt treten.</td>
										</tr>
										<tr><td>&nbsp;</td></tr>
										</table>
										
									</td>
								</tr>
							</table>
						</td>
					</tR>
				
				</table>
			</td>
		</tr>
		<tr>
			<td class="content_fuss">Tango Argentino - Hans und Suzan - Berlin</td>
		</tr>
	</table>

</cfif>