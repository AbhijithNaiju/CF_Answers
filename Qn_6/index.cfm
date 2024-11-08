<html>
<head>
<title>Qn 6</title>
<link rel="stylesheet" href="../bootstrap-5.3.3-dist/css/bootstrap.min.css">
</head>
    <body class = "w-100" >
        <cfoutput>
            <form method="POST" class = " m-5 p-5  d-flex flex-column align-items-center border border-dark">
                <div class = "border-bottom border-dark pb-2" >
                    Create a web page that will have two text boxes and a submit button. When
                    submitted, the page will post to self
                    Create a structure in ColdFusion with the values from the text box. The text
                    entered in text box one is the key, and the text entered in text box 2 is the
                    value. CFDUMP the structure.
                </div>
                <div class = "w-100 m-4" >
                    <input type="text" name="inputText1" placeholder="Enter the text 1" class = "w-50" >
                    <input type="text" name="inputText2" placeholder="Enter the text 2" class = "w-50" >
                    <input type="submit" name="submit">
                </div>
                <cfif isDefined("form.submit") && len(form.inputText1) && len(form.inputText2)>
                    <cfset newObject = createObject("component", "components.question_6")>
                    <cfset local.result = newObject.valueFunction(form.inputText1,form.inputText2)> 
                    <cfdump  var="#local.result#">
                <cfelse>
                    <span>Please Enter the strings</span>
                </cfif>
            </form>
        </cfoutput>
    </body>
</html>
