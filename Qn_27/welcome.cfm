<html>
    <head>
        <title>Qn 27</title>        
        <link rel="stylesheet" href="./css/style.css">
        <link rel="stylesheet" href="../bootstrap-5.3.3-dist/css/bootstrap.min.css">
    </head>
    <body class = "w-100" >
        <cfoutput>

            <div class="w-100 d-flex">
                <button onclick="logout()" class="btn btn-primary ms-auto me-3 my-3">Logout</a>
            </div>

            <div class = " mx-5 p-5  d-flex  align-items-center border border-dark">
                <div class = "border-bottom border-dark pb-2 d-flex" >
                    <h1>Welcome #session.userName#</h1>
                </div>
            </div>

        </cfoutput>
        <script src="../Jquery/jquery-3.7.1.js"></script>
        <script src="./script/index.js"></script>
    </body>
</html>
