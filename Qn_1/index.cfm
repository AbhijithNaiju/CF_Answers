<html>
    <head>
        <title>Qn 1</title>
        <link rel = "stylesheet" href="../bootstrap-5.3.3-dist/css/bootstrap.min.css">
    </head>
    <body class = "w-100" >
        <cfoutput>
            <div  class = " m-5 p-5  d-flex flex-column align-items-center border border-dark">
                <div class = "border-bottom border-dark pb-2" >
                Create a page with text box & submit button. Input for the text box is any
                    number between 1 to 5. Based upon the user input, you should show the
                    corresponding string. 5 is Very good. 4 is good. 3 is fair. 1 & 2 is Ok. Use cfcase
                    to do this functionality.
                </div>

                <form method="POST" class = "w-100 m-4" >
                    <div  class="form-group">
                        <input type = "text" name = "inputNumber" placeholder = "Enter the text" class = "form-control" >
                        <input type = "submit" class = "btn btn-primary my-2" >
                    </div>
                </form>

                <cfif isDefined("form.inputNumber")>
                    <cfset local.number = form.inputNumber>
                    <cfset local.newObject = createObject("component", "components.question_1")>
                    <cfset local.result = local.newObject.valueFunction(local.number)>
                    #local.result# 
                <cfelse>
                    <span>Please enter a valid number</span>
                </cfif>
            </div>
        </cfoutput>
    </body>
</html>
