<html>
<head>
<title>Qn 16</title>        
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="../bootstrap-5.3.3-dist/css/bootstrap.min.css">
</head>
<body class = "w-100" >
    <div method="POST" class = " m-5 p-5  d-flex flex-column align-items-center border border-dark">
    
        <div class = "border-bottom border-dark pb-2" >
            16. Write a CF program to print data by 3 rows and 3 columns like the example
            below.
            1 4 7
            2 5 8
            3 6 9
        </div>

        <cfset local.newObject = createObject("component", "components.question_16")>
        <cfset local.result = local.newObject.printPattern()> 

        <cfoutput>
            <cfloop array="#local.result#" index="i">
                <cfloop array="#i#" index="j">
                    <cfdump  var="#j#">
                </cfloop>
                <br>
            </cfloop>
        </cfoutput>
    </div>
</body>
</html>
