<cfcontent type="text/html; charset=UTF-8">
<!---
<CFSET application.IsoCharSet = "False">
<CFIF IsDefined("Server.ColdFusion.ProductVersion")>
<CFSET TempCFVersionChar1 = left(Server.ColdFusion.ProductVersion,1)>
<CFIF TempCFVersionChar1 LTE 5>
<CFSET application.IsoCharSet = "False">
<CFELSEIF TempCFVersionChar1 GTE 6>
<CFSET application.IsoCharSet = "True">
<cfcontent type="text/html; charset=UTF8"> 
<cfset setencoding("form", "UTF8")>
<cfset setencoding("url", "UTF8")>
</CFIF>
</CFIF>  --->