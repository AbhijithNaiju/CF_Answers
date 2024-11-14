<!doctype html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Admin</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
		<link rel="stylesheet" href="style/index.css">
        
		<link rel="stylesheet" href="style/accordian_style.css">
	</head>
	<body class="d-flex">
		<cfoutput>

			<cfset local.newObject = createObject("component", "components.question_28")>
			<cfset local.pageListResult = local.newObject.getpages()>

			<div class="main">

				<div class="heading">
					<a href="" class="logo">
						<div>CMS</div>
					</a>
					<button onclick="logout()" class="btn btn-danger logout">Logout</button>
				</div>

				<div class="main_body">
					<div class="accordian_header">
						<span>Page List</span>
						<a href="./addpage.cfm" class = "btn btn-success accordian_header_button" >
							<img src="./Assets/Images/add.png">Add</a>
					</div>

					<form method="post" id="listContainer">
						<cfloop query="#local.pageListResult#">
							<div class="page_heading ">
								<span>#local.pageListResult.pagename#</span>
								<div>
									<input type="hidden" name="pageId" value="#pageId#">
									<a href="./editpage.cfm?pageId=#local.pageListResult.pageId#" class = "btn btn-secondary" name="editButton">Edit</a>
									<button onclick="deletePage(this)" type="button" value="#local.pageListResult.pageId#" class = "btn btn-danger" name="deleteButton">Delete</button>
								</div>
							</div>
							<div class="display_none">
								<p>
									#local.pageListResult.pagedescs#
								</p>
							</div>
						</cfloop>
					</form>

					<cfif structKeyExists(form, "editButton")>
						<cfset local.pageEdit = local.newObject.editPage(form.pageId)>
					</cfif>

				</div>
			</div>

            <script src="../Jquery/jquery-3.7.1.js"></script>
            <script src="https://code.jquery.com/ui/1.14.0/jquery-ui.js"></script>
            <script src="js/index.js"></script>
			
        </cfoutput>
    </body>
</html>