<cfcomponent>
    <cffunction  name = "printDigits" returnType="string">
        <cfargument  name = "userName" type="string"> 
        <cfargument  name = "password" type="string"> 
        
        <cfif compare(arguments.userName, "Me") OR compare(arguments.password,"me")>
            <cfreturn "Invalid username or password">
        </cfif>
            <cfset session.userName = arguments.userName>
            <cflocation url = "./welcome.cfm" addToken = "no">
    </cffunction>

    <cffunction  name="logout" access="remote">
<!---         structDelete(session, " --->
        <cfset sessionInvalidate()>
        <cflocation  url="../index.cfm" addToken = "no">
    </cffunction>
</cfcomponent>