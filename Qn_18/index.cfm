<html>
    <head>
        <title>Qn 18</title>
        <link rel="stylesheet" href="../bootstrap-5.3.3-dist/css/bootstrap.min.css">
    </head>
    <body class = "w-100" >
        <cfoutput>
        <div class = " m-5 p-5  d-flex flex-column align-items-center border border-dark">
            <div class = "border-bottom border-dark pb-2" >
                18. Need to create a query data type variable manually with out using cfquery tag.
                    Need to use neccesary query functions.
                    Query will have 3 columns
                    ID - Number
                    Name - String
                    email - String
                    This Query variable should have 3 rows of data.
            </div>

            <form method="POST" class = "w-100 m-4" >
                <input name="submit" type="submit">
            </form>

            <cfif isDefined("form.submit")>
                <cfset local.newObject = createObject("component", "components.question_18")>
                <cfset local.result = local.newObject.printDigits()> 
                <cfdump  var="#local.result#">
            <cfelse>
                 Please enter a valid number
            </cfif>
        </div>
        </cfoutput>
    </body>
</html>
