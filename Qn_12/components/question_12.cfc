<cfcomponent>
    <cffunction  name = "printDigits" returnType="query">
            <cfquery datasource="TESTDB" name="resultquery">
                select * from users;
            </cfquery>        
        <cfreturn resultquery>
    </cffunction>
</cfcomponent>