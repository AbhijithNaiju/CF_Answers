<html>
    <head>
        <title>Qn 8</title>        
        <link rel="stylesheet" href="./css/style.css">
        <link rel="stylesheet" href="../bootstrap-5.3.3-dist/css/bootstrap.min.css">
    </head>
    <body class = "w-100" >
        <cfoutput>
            <div method="POST" class = " m-5 p-5  d-flex flex-column align-items-center border border-dark">
                <div class = "border-bottom border-dark pb-2" >
                    Create a web page that will have two text boxes and a submit button. When
                    submitted, the page will post to self.
                    Create a structure in ColdFusion with the values from the text box. The text
                    entered in text box one is the key, and the text entered in text box 2 is the
                    value. Each time you submit the form, the values entered previously should
                    also maintained in the structure.
                    It means, if I submit a form with 'ColdFusion', 'super', then structure should
                    have key as 'ColdFusion' & value as 'Super'.
                    Now, If I enter 'php', 'good', then structure should have both ColdFusion, php
                    along with their values.
                    If I enter ColdFusion again, with different value, then the new value should
                    replace the old value.
                    CFDUMP the structure.
                </div>
                
                <form method="POST" class = "w-100 m-4" >
                    <input type="text" name="inputText1" placeholder="Enter the text 1" class = "form-control" >
                    <input type="text" name="inputText2" placeholder="Enter the text 2" class = "form-control" >
                    <input type="submit" class = "btn btn-primary my-2">
                </form>

                <cfif isDefined("form.inputText1")  && len(form.inputText1) gt 0 && len(form.inputText2) gt 0>
                    <cfset newObject = createObject("component", "components.question_8")>
                    <cfset result = newObject.valueFunction(form.inputText1,form.inputText2)> 
                    <cfdump  var="#result#">
                <cfelse>
                    Please enter 2 valid strings
                </cfif>
            </div>
        </cfoutput>
    </body>
</html>
