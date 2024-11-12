<html>
    <head>
        <title>Qn 27</title>        
        <link rel="stylesheet" href="./css/style.css">
        <link rel="stylesheet" href="../bootstrap-5.3.3-dist/css/bootstrap.min.css">
    </head>
    <body class = "w-100" >
        <cfoutput>
            <div class = " m-5 p-5  d-flex flex-column align-items-center border border-dark">
                <div class = "border-bottom border-dark pb-2" >
                    27. Login page with user name & password. Once a user enters the correct details,
                        it should redirect to welcome.cfm, if not, it will show an error message in the
                        login page. If any one of the users, directly access the welcome.cfm without
                        login, Application should redirect the user in to log in page.In welcome page,
                        there must be a logout link, which will log out the user from the application &
                        redirect to log in page.
                </div>

                <form method="POST" class = "w-100 m-4" >
                    <input type="text" name="userName" placeholder="Enter User Name" class ="form-control">
                    <input type="password" name="password" placeholder="Enter Your Password" class ="form-control">
                    <input name="submit" class = "btn btn-primary   " type="submit">
                </form>

                <cfif isDefined("form.submit")  && len(form.userName)  && len(form.password)>
                    <cfset local.newObject = createObject("component", "components.question_27")>
                    <cfset local.result = local.newObject.printDigits(form.userName,form.password)> 

                    <cfif structKeyExists(local, "result")>
                        <span class = "text-danger">#local.result#</span>
                    </cfif>

                <cfelse>
                    Please enter your user name and password
                </cfif>
            </div>
        </cfoutput>
    </body>
</html>
