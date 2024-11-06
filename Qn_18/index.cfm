<cfapplication name="myApplication" sessionmanagement=true>
<html>
<head>
<title>Qn 17</title>
<link rel="stylesheet" href="../bootstrap-5.3.3-dist/css/bootstrap.min.css">
</head>
<body class = "w-100" >
    <form method="POST" class = " m-5 p-5  d-flex flex-column align-items-center border border-dark">
        <div class = "border-bottom border-dark pb-2" >
            17. Create a page with text box & submit button. User can enter numeric value in
                the text box & click the submit button. If user entered non numeric character,
                page should validate user input using JS.
                While clicking on submit button, page should show up 1 to given input number,
                odd numbers should be in blue, even numbers should be in green.
        </div>
        <div class = "w-100 m-4" >
            <input type="text" name="inputText1" id="inputText1" placeholder="Enter the number" class = "w-50">
            <input onclick="validateNumber()" type="submit">
        </div>
        <cfif isDefined("form.inputText1")  && len(form.inputText1) gt 0 >
            <cfset newObject = createObject("component", "components.question_17")>
            <cfset result = newObject.printDigits(form.inputText1)> 
            <cfoutput>
                <cfloop collection="#result#" item="i">
                    <p style="color:#result[i]#;">#i#</p>
                </cfloop>
            </cfoutput>
        <cfelse>
            <cfoutput> Please enter a valid number
            </cfoutput>
        </cfif>
    </form>
    <script src="./JS/script.js"></script>
</body>
</html>
