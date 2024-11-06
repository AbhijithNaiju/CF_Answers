<html>
<head>
<title>Qn 11</title>
<link rel="stylesheet" href="../bootstrap-5.3.3-dist/css/bootstrap.min.css">
</head>
<body class = "w-100" >
    <div class = "border-bottom border-dark pb-2" >
        11. Create a cfm page with a function named multiply. It should give results for
        the following function calls.
    </div>
    <cffunction  name="multiply" returnType="any">
        <cfset argLength = arrayLen(arguments)>
        <cfset result=1>
        <cfloop index="i" from="1" to="#argLength#">
            <cfset result=result*arguments[i]>
        </cfloop>
        <cfreturn result>
    </cffunction>
    <cfset res = multiply(1,2)>
    <cfdump var="#res#">
    <cfset res = multiply(1,2,3)>
    <cfdump var="#res#">
    <cfset res = multiply(1,2,3,4)>
    <cfdump var="#res#">

</body>
</html>
