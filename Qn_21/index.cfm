<html>
    <head>
        <title>Qn 3</title>
        <link rel="stylesheet" href="../bootstrap-5.3.3-dist/css/bootstrap.min.css">
    </head>
    <body class = "w-100" >
        <cfoutput>
            <div class = " m-5 p-5  d-flex flex-column align-items-center border border-dark">
                <div class = "border-bottom border-dark pb-2" >
                    Create a page with text box & submit button. Input for the text box is
                    "3,8,9,11,12"
                    While click on submit, result page should show numbers divided by 3. So the
                    result must be 3,9,12. Should use cfcontinue in the appropriate place
                </div>

                <form method="POST" class = "w-100 m-4" >
                    <div  class="form-group">
                        <input type="text" name="inputText" placeholder="Enter the text" class = "form-control" >
                        <input type="submit" class = "btn btn-primary my-2" >
                    </div>
                </form>

                <cfif isDefined("form.inputText") AND len(form.inputText)>
<!---                         <cfset newObject = createObject("component", "components.question_3")> 
                        <cfset result = newObject.valueFunction(form.inputText)>
                        #result# --->
                        <cfmail
                            from="abhijithnaiju@gmail.com"
                            to="abhijithnaiju8@gmail.com"
                            subject="Sample e-mail from ColdFusion"
                            type="text">
                            
                            This is a sample e-mail message to show basic e-mail capability.

                        </cfmail>
                <cfelse>
                    <span>Please enter a valid number</span>
                </cfif>
            </div>
        </cfoutput>
    </body>
</html>
