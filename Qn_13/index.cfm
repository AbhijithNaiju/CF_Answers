<html>
    <head>
        <title>Qn 13</title>        
        <link rel="stylesheet" href="./css/style.css">
        <link rel="stylesheet" href="../bootstrap-5.3.3-dist/css/bootstrap.min.css">
    </head>
    <body class = "w-100" >
        <cfoutput>
            <div class = " m-5 p-5  d-flex flex-column align-items-center border border-dark">
                <div class = "border-bottom border-dark pb-2" >
                    13. Highlight search keyword:
                        You have variable with content “the quick brown fox jumps over the lazy dog”
                        Create a page with text box & submit submit button. If you user gave “the” as
                        input, then you need to show the result as,Found the key word in 2 times - the
                        quick brown fox jumps over the lazy dog. if input is dog then result should
                        be,Found the key word in 1 time - the quick brown fox jumps over the lazy dog
                </div>
                
                <form method="POST" class = "w-100 m-4" >
                    <input type="text" name="inputText1" placeholder="Enter the text" class = "form-control" >
                    <input type="submit" class="btn btn-primary my-2">
                </form>

                <cfif isDefined("form.inputText1")  && len(form.inputText1) gt 0 >
                    <cfset local.newObject = createObject("component", "components.question_13")>
                    <cfset local.result = local.newObject.valueFunction(form.inputText1)> 
                    <p>Found the key word #local.result# times</p> 
                    <div class = "d-flex" >
                        <cfset local.mystring = "the quick brown fox jumps over the lazy dog"> 
                        <cfloop list="#local.myString#" item="i" delimiters = " ">
                            <cfif not CompareNoCase(i,form.inputText1)>
                                <b class = "mx-1" > #i# </b>
                            <cfelse>
                                <span class = "mx-1" > #i# </span>
                            </cfif>
                        </cfloop>
                    </div>
                <cfelse>
                    Please enter a valid string
                </cfif>
            </div>
        </cfoutput>
    </body>
</html>
