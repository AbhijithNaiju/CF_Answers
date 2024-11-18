<cfcomponent>
    <cffunction  name = "printDigits" returnType="query">

        <cfquery datasource="TESTDs" name="resultquery">
            select * from users;
        </cfquery>       

        <cfreturn resultquery>
        
    </cffunction>
</cfcomponent>