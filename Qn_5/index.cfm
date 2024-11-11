<html>
    <head>
        <title>Qn 5</title>        
        <link rel="stylesheet" href="./css/style.css">
        <link rel="stylesheet" href="../bootstrap-5.3.3-dist/css/bootstrap.min.css">
    </head>
    <body class = "w-100" >
        <cfoutput>
            <div class = " m-5 p-5  d-flex flex-column align-items-center border border-dark">
                <div class = "border-bottom border-dark pb-2" >
                    Get user & his mother date of birth. show users age & At what age his mother
                    delivered him. Tell him how many days are remaining for his & his mother's
                    birthday.
                </div>

                <form method="POST" class = "w-100 m-4" >
                    <label>Enter your date of birth</label>
                    <input type="date" name="dobYou" class = "form-control">
                    <br>
                    <label>Enter your mothers date of birth</label>
                    <input type="date" name="dobMother" class = "form-control">
                    <br>
                    <input type="submit" name = "submit" class = "btn btn-primary my-2">
                </form>

                <cfif isDefined("form.submit") && len(form.dobYou) && len(form.dobMother)>
                        <cfset local.newObject = createObject("component", "components.question_5")>
                        <cfset local.result = local.newObject.valueFunction(form.dobYou,form.dobMother)>
                        <div>
                            <span>Your Age </span><span> #local.result[1]#</span>
                        </div>
                        <div>
                            <span>Mothers age during delivery </span><span> #local.result[2]#</span>
                        </div>
                        <div>
                            <span>Remaining days for your birthday</span><span> #local.result[3]#</span>
                        </div>
                        <div>
                            <span>Remaining days for mothers birthday</span><span> #local.result[4]#</span>
                        </div>
                <cfelse>
                    <span>Please enter the dates</span>
                </cfif>
            </div>
        </cfoutput>
    </body>
</html>
