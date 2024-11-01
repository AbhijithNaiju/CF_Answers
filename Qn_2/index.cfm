<html>
<head>
<title>Qn 2</title>
<link rel="stylesheet" href="../bootstrap-5.3.3-dist/css/bootstrap.min.css">
</head>
<body class = "w-100" >
    <form method="POST" class = " m-5 p-5  d-flex flex-column align-items-center border border-dark">
        <div class = "border-bottom border-dark pb-2" >
            Create a page with text box & submit button. Input for the text box is any
            number between 1 to 5. Based upon the user input, you should show the
            corresponding string. 5 is Very good. 4 is good. 3 is fair. 1 & 2 is Ok. Use cfif,
            cfelseif,cfelse to do this functionality.
        </div>
        <div class = "w-100 m-4" >
            <input type="text" name="inputNumber" placeholder="Input any number between 1 and 5" class = "w-50" >
            <input type="submit">
        </div>
            <cfif isDefined("form.inputNumber")>
        <cfoutput> 
            <cfset number=form.inputNumber>
            <cfset newObject = createObject("component", "components.question_2")>
            <cfset result = newObject.valueFunction(number)>
            #result# 
        </cfoutput>
    </cfif>
    </form>
</body>
</html>
