<html>
    <head>
        <title>Qn 11</title>        
        <link rel="stylesheet" href="./css/style.css">
        <link rel="stylesheet" href="../bootstrap-5.3.3-dist/css/bootstrap.min.css">
    </head>
    <body class = "w-100" >
        <div class = " m-5 p-5  d-flex flex-column align-items-center border border-dark">
            <div class = "border-bottom border-dark pb-2" >
                11. Create a cfm page with a function named multiply. It should give results for
                the following function calls.
            </div>

            <cfset local.newObject = createObject("component", "components.multiply")>

            <cfset res = local.newObject.multiply(1,2)>
            <cfdump var="#res#">

            <cfset res = local.newObject.multiply(1,2,3)>
            <cfdump var="#res#">
            
            <cfset res = local.newObject.multiply(1,2,3,4)>
            <cfdump var="#res#">
            
        </div>
    </body>
</html>
