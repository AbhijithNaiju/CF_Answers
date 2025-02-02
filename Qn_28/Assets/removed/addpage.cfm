<!doctype html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Add page </title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
		<link rel="stylesheet" href="style/page_edit.css">
	</head>
    <body class="d-flex">
        <cfoutput>

            <div class="main">

                <div class="heading">
                    <a href="" class="logo">
                        <img src="./Assets/Images/Gmail-Logo.webp" alt="Image not found">
                    </a>
                </div>

                <form method="post" class="main_body">
                    <input type="text" name="pageName" required class="form-control my-2" placeholder="Page name">
                    <input type="text" name="pageDescription" required class="form-control" placeholder="Page Description">
                    <input type="submit" name="addPage" value="Add Page" class="btn btn-secondary w-100 my-2">

                    <cfif structKeyExists(form, "addPage")>
                        <cfset local.newObject = createObject("component", "components.question_28")>
                        <cfset local.result = local.newObject.addPageToTable(form.pageName,form.pageDescription)>
                        <cfif structKeyExists(local.result, "error")>
                            <div class = "text-center text-danger fw-bold" >#local.result["error"]#</div>
                        </cfif>
                    </cfif>

                </form>


            </div>

            <script src="../Jquery/jquery-3.7.1.js"></script>
            <script src="https://code.jquery.com/ui/1.14.0/jquery-ui.js"></script>
            <script src="js/accordian.js"></script>
            
        </cfoutput>
    </body>
</html>