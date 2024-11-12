<html>
    <head>
        <title>Qn 6</title>        
        <link rel="stylesheet" href="./css/style.css">
        <link rel="stylesheet" href="../bootstrap-5.3.3-dist/css/bootstrap.min.css">
    </head>
    <body class = "w-100" >
        <cfoutput>
            <div class = " m-5 p-5  d-flex flex-column align-items-center border border-dark">
                <div class = "border-bottom border-dark pb-2" >
                    Create a web page that will have two text boxes and a submit button. When
                    submitted, the page will post to self
                    Create a structure in ColdFusion with the values from the text box. The text
                    entered in text box one is the key, and the text entered in text box 2 is the
                    value. CFDUMP the structure.
                </div>

                <form method="POST" class = "w-100 m-4" >
                    <input type="text" name="inputText1" placeholder="Enter the text 1" class = "form-control" >
                    <input type="text" name="inputText2" placeholder="Enter the text 2" class = "form-control" >
                    <input type="submit" name="submit" class="btn btn-primary my-2">
                </form>

                <cfif isDefined("form.submit") && len(form.inputText1) && len(form.inputText2)>
                    <cfset local.newObject = createObject("component", "components.question_6")>
                    <cfset local.result = local.newObject.valueFunction(form.inputText1,form.inputText2)> 
                    <cfdump  var="#local.result#">
                <cfelse>
                    <span>Please Enter the strings</span>
                </cfif>

            </div>
        </cfoutput>
    </body>
</html>
