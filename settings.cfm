
<!--- Systemdatum und Domain --->
<cfset savedLocale=SetLocale("German (Standard)")>
<cfset systemdatum = CreateODBCDate(now())>

<!--- Bildverzeichnisse --->
<cfset Pfad_News_Bilder="db_assets/news/bilder/">
<cfset Pfad_News_Downloads="db_assets/news/downloads/">
<cfset Pfad_Icons="wcms/images/icons/">
<cfset Pfad_bild_Bilder="db_assets/bilder/">
<cfset Pfad_link_Bilder="db_assets/links/bilder/">
<cfset Pfad_unterricht_Bilder="db_assets/unterricht/">
<cfset Pfad_Downloadarea_Downloads="db_assets/movies/">


