<html>
<head>
<title>Qn 13</title>
<link rel="stylesheet" href="../bootstrap-5.3.3-dist/css/bootstrap.min.css">
</head>
<body class = "w-100" >
    <form method="POST" class = " m-5 p-5  d-flex flex-column align-items-center border border-dark">
        <div class = "border-bottom border-dark pb-2" >
            13. Highlight search keyword:
                You have variable with content “the quick brown fox jumps over the lazy dog”
                Create a page with text box & submit submit button. If you user gave “the” as
                input, then you need to show the result as,Found the key word in 2 times - the
                quick brown fox jumps over the lazy dog. if input is dog then result should
                be,Found the key word in 1 time - the quick brown fox jumps over the lazy dog
        </div>
        <div class = "w-100 m-4" >
            <input type="text" name="inputText1" placeholder="Enter the text" class = "w-50" >
            <input type="submit">
        </div>
        <cfif isDefined("form.inputText1")  && len(form.inputText1) gt 0 >
            <cfset newObject = createObject("component", "components.question_13")>
            <cfset result = newObject.valueFunction(form.inputText1)> 
            <cfoutput>
                <p>Found the key word #result# times</p> 
                <div class = "d-flex" >
                    <cfset mystring = "the quick brown fox jumps over the lazy dog"> 
                    <cfloop list="#myString#" item="i" delimiters = " ">
                        <cfif not CompareNoCase(i,form.inputText1)>
                            <b class = "mx-1" > #i# </b>
                        <cfelse>
                          <span class = "mx-1" > #i# </span>
                        </cfif>
                    </cfloop>
                </div>
            </cfoutput>
        <cfelse>
            <cfoutput> Please enter a valid string
            </cfoutput>
        </cfif>
    </form>
</body>
</html>
