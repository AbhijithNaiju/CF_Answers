<!doctype html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>USER</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
		<link rel="stylesheet" href="style/page_edit.css">
	</head>
    <body class="d-flex">
        <cfoutput>

            <cfset local.newObject = createObject("component", "components.question_28")>
            <cfif structKeyExists(url, "pageId")>
                <cfset local.pageListResult = local.newObject.getPageFromId(url.pageId)>
            </cfif>
            
            <div class="main">

                <div class="heading">
                    <a href="" class="logo">
                        <img src="./Assets/Images/Gmail-Logo.webp" alt="Image not found">
                    </a>
                </div>

                <form method="post" class="main_body">
                    <cfif structKeyExists(url, "pageId")>
                        <input type="text" name="pageName"
                               class="form-control my-2"
                               placeholder="Page name" 
                               value="#local.pageListResult.pageName#">
                        <input type="text"
                               name="pageDescription"
                               class="form-control"
                               placeholder="Page Description" value="#local.pageListResult.pageDesc#">
                    <cfelse>
                        <input type="text" 
                               name="pageName"
                               class="form-control my-2"
                               placeholder="Page name">
                        <input type="text"
                               name="pageDescription"
                               class="form-control"
                               placeholder="Page Description">
                    </cfif>
                    <div class = "text-center text-danger fw-bold error_message"></div>
                    <input type="submit" name="editPage" value="Submit" class="btn btn-secondary w-100 my-2" >
                    <cfif structKeyExists(form, "editPage") AND len(form.pageName) AND len(form.pageDescription)>

                        <cfif structKeyExists(url, "pageId")>
                            <cfset local.result = local.newObject.editPageFromTable(url.pageId,form.pageName,form.pageDescription)>
                        <cfelse>
                            <cfset local.result = local.newObject.addPageToTable(form.pageName,form.pageDescription)>
                        </cfif>

                        <cfif structKeyExists(local.result, "error")>
                            <div class = "text-center text-danger fw-bold" >#local.result["error"]#</div>
                        </cfif>
                    <cfelseif structKeyExists(form, "editPage")>
                        <div class = "text-center  fw-bold" >Please fill the input fields</div>
                    </cfif>
                </form>

            </div>
            <script src="../Jquery/jquery-3.7.1.js"></script>
            <script src="https://code.jquery.com/ui/1.14.0/jquery-ui.js"></script>
            <script src="js/accordian.js"></script>
        </cfoutput>
    </body>
</html>