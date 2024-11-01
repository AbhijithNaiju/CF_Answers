<html>
<head>
<title>Qn 2</title>
<link rel="stylesheet" href="../bootstrap-5.3.3-dist/css/bootstrap.min.css">
</head>
<body class = "w-100" >
    <form method="POST" class = " m-5 p-5  d-flex flex-column align-items-center border border-dark">
        <div class = "border-bottom border-dark pb-2" >
            Create a page with text box & submit button. Input for the text box is
            "3,8,9,11,12"
            While click on submit, result page should show numbers divided by 3. So the
            result must be 3,9,12. Should use cfcontinue in the appropriate place
        </div>
        <div class = "w-100 m-4" >
            <input type="text" name="inputText" placeholder="Enter the text" class = "w-50" >
            <input type="submit">
        </div>
        <cfif isDefined("form.inputText")>
            <cfoutput>
                <cfset newObject = createObject("component", "components.calculation")>
                <cfset result = newObject.valueFunction(form.inputText)>
                #result# 
            </cfoutput>
        </cfif>
    </form>
</body>
</html>
