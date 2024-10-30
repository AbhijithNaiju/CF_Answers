<html>
<head>
<title>Qn 1</title>
</head>
<body>
    <form method="POST">
        <label>Input any number between 1 and 5</label>
        <input type="text" name="inputNumber">
        <input type="submit">
    </form>
    <cfif isDefined("form.inputNumber")>
        <cfoutput> 
            <cfset number=form.inputNumber>
            <cfset newObject = createObject("component", "components.qn_1.cfc")>
            <cfset result = valueFunction(number)>
            #result# 
        </cfoutput>
    </cfif>
</body>
</html>