<html>
<head>
<title>Qn 16</title>
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
        <cfset newObject = createObject("component", "components.question_16")>
        <cfset result = newObject.printPattern()> 
        <cfoutput>
           #result# 
        </cfoutput>
    </div>
</body>
</html>
