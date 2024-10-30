<cfcomponent>
    <cffunction  name="valueFunction" returnType="any">
    <cfargument name="number" type="any" required="true">
        <cfswitch expression=#arguments.number#>
            <cfcase value=5>
                <cfreturn "Very Good">
            </cfcase>
           <cfcase value=4>
                <cfreturn "Good">
            </cfcase>
            <cfcase value=3>
                <cfreturn "Fair">
            </cfcase>
            <cfcase value=2>
                <cfreturn "OK">
            </cfcase>
            <cfcase value=1>
                <cfreturn "OK">
            </cfcase>
            <cfdefaultcase>
                <cfreturn "Invalid number, Please select valid number(1 - 5)">
            </cfdefaultcase>
        </cfswitch>  
    </cffunction>
</cfcomponent>