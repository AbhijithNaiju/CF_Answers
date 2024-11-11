<html>
    <head>
        <title>Qn 15</title>        
        <link rel="stylesheet" href="./css/style.css">
        <link rel="stylesheet" href="../bootstrap-5.3.3-dist/css/bootstrap.min.css">
    </head>
    <body class = "w-100" >
        <div method="POST" class = " m-5 p-5  d-flex flex-column align-items-center border border-dark">
            <div class = "border-bottom border-dark pb-2" >
                15. Create a component with function multiply. Create a cfm page which need to
                call that function with different arguments using cfinvoke
                tag, cfobject tag and createobject function. It should give results for the
                following function calls with different number of arguments
            </div>

            <cfset local.newObject = createObject("component", "components.question_15")>
            <cfset local.result1 = local.newObject.multiply(1,2)>

            <cfobject name="multiplyObj" type="component" component="components.question_15">
            <cfset local.result2 = multiplyObj.multiply(1,2,3)>
            
            <cfinvoke component="components.question_15"  method="multiply" returnVariable = "result3">  
                <cfinvokeargument 
                    name="value1" 
                    value="1">
                <cfinvokeargument 
                    name="value2" 
                    value="2">
                <cfinvokeargument 
                    name="value3" 
                    value="3">
                <cfinvokeargument 
                    name="value4" 
                    value="4">
            </cfinvoke>

            <cfoutput>
                <cfdump  var="#local.result1#">
                <cfdump  var="#local.result2#">
                <cfdump  var="#result3#">
            </cfoutput>

        </div>
    </body>
</html>
