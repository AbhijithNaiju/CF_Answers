<!doctype html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>USER</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
		<link rel="stylesheet" href="style/index.css">
		<link rel="stylesheet" href="style/accordian_style.css">
	</head>
	<body class="d-flex">
		<cfoutput>
			<cfif structKeyExists(session, "userId")>
				<cfset local.newObject = createObject("component", "components.question_28")>
				<cfset local.pageListResult = local.newObject.getpages()>
				<div class="main">
					<div class="heading">
						<a href="" class="logo">
							<img src="./Assets/Images/Gmail-Logo.webp" alt="Image not found">
						</a>
						<a href="./components/question_28.cfc?method=logout" class="btn btn-danger logout">Logout</a>
					</div>
					<div class="main_body">
						<div id="listContainer">
							<cfloop query="#local.pageListResult#">
								<h3 class="page_heading">#local.pageListResult.pagename#</h3>
								<div class = "display_none" >
									<p>
										#local.pageListResult.pagedescs#
									</p>
								</div>
							</cfloop>
						</div>
					</div>
				</div>
			<cfelse>
				<cflocation  url="./login.cfm" addToken = "no">
			</cfif>
            <script src="../Jquery/jquery-3.7.1.js"></script>
            <script src="https://code.jquery.com/ui/1.14.0/jquery-ui.js"></script>
            <script src="js/accordian.js"></script>
        </cfoutput>
    </body>
</html>