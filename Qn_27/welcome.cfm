<html>
    <head>
        <title>Qn 27</title>
        <link rel="stylesheet" href="../bootstrap-5.3.3-dist/css/bootstrap.min.css">
    </head>
    <body class = "w-100" >
        <cfif not structKeyExists(session, "userName")>
            <cflocation  url="./index.cfm" addToken = "no">
        </cfif>
        <cfoutput>
<!---        <form method="post" action="./components/question_27.cfc?method=logout" class="w-100 d-flex">
                <input type="submit" class="btn btn-primary ms-auto me-3 my-3" value="Logout">
            </form> --->
            <div class="w-100 d-flex">
                <a href="./components/question_27.cfc?method=logout" class="btn btn-primary ms-auto me-3 my-3">Logout</a>
            </div>
            <div class = " mx-5 p-5  d-flex  align-items-center border border-dark">
                <div class = "border-bottom border-dark pb-2 d-flex" >
                    <h1>Welcome #session.userName#</h1>
                </div>
            </div>
        </cfoutput>
    </body>
</html>
