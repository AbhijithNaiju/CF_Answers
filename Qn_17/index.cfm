<html>
    <head>
        <title>Qn 17</title>        
        <link rel="stylesheet" href="./css/style.css">
        <link rel="stylesheet" href="../bootstrap-5.3.3-dist/css/bootstrap.min.css">
    </head>
    <body class = "w-100" >
        <cfoutput>
            <div class = " m-5 p-5 d-flex flex-column align-items-center border border-dark">
                <div class = "border-bottom border-dark pb-2" >
                    17. Create a page with text box & submit button. User can enter numeric value in
                    the text box & click the submit button. If user entered non numeric character,
                    page should validate user input using JS.
                    While clicking on submit button, page should show up 1 to given input number,
                    odd numbers should be in blue, even numbers should be in green.
                </div>

                <form method="POST" class = "w-100 m-4" >
                    <input type="text" name="inputText1" id="inputText1" placeholder="Enter the number" class = "form-control">
                    <input onclick="validateNumber()" type="submit" class="btn btn-primary my-2">
                </form>

                <cfif isDefined("form.inputText1")  && len(form.inputText1)>
                    <cfset local.newObject = createObject("component", "components.question_17")>
                    <cfset local.result = local.newObject.printDigits(form.inputText1)> 
                    <cfloop collection="#local.result#" item="i">
                        <p class="#local.result[i]#">#i#</p>
                    </cfloop>
                <cfelse>
                    Please enter a valid number
                </cfif>

            </div>
        </cfoutput>
        <script src="./JS/script.js"></script>
    </body>
</html>
