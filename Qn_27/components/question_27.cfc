<cfcomponent>
    <cffunction  name = "printDigits" returnType="string">
        <cfargument  name = "userName" type="string"> 
        <cfargument  name = "password" type="string"> 
        
        <cfif compare(arguments.userName, "Me") OR compare(arguments.password,"me")>
            <cfreturn "Invalid username or password">
        </cfif>
            <cflocation url = "./welcome.cfm">
    </cffunction>
</cfcomponent>