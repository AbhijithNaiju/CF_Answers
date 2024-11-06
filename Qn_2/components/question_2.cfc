<cfcomponent>
    <cffunction  name="valueFunction" returnType = "string">
        <cfargument name="number" type="any" required = "true">
        <cfset local.result = ''>
        <cfswitch expression=#arguments.number#>
            <cfcase value = 5>
                <cfset local.strResult = "Very Good">
            </cfcase>
            <cfcase value = 4>
                <cfset local.strResult = "Good">
            </cfcase>
            <cfcase value = 3>
                <cfset local.strResult = "Fair">
            </cfcase>
            <cfcase value = 2>
                <cfset local.strResult = "OK">
            </cfcase>
            <cfcase value = 1>
                <cfset local.strResult = "OK">
            </cfcase>
            <cfdefaultcase>
                <cfset local.strResult = "Invalid number, Please select valid number(1 - 5)">
            </cfdefaultcase>
        </cfswitch>
        <cfreturn local.strResult>
    </cffunction>
</cfcomponent>