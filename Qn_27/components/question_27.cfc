<cfcomponent>
    <cffunction  name = "printDigits" returnType="string">
        <cfargument  name = "userName" type="string"> 
        <cfargument  name = "password" type="string"> 
        <cfset local.error = "">
        <cfquery name="usercheck" datasource="TESTDS">
            select count('userName') as userCount from userlogin where username='#arguments.userName#' AND password='#arguments.password#'
        </cfquery>
        <cfif usercheck.userCount>
            <cfset session.userName = arguments.userName>
            <cflocation url = "./welcome.cfm" addToken = "no">
        <cfelse>
            <cfset local.error = "Please enter valid username and password">
        </cfif>  
        <cfreturn local.error>          
    </cffunction>

    <cffunction  name="logout" access="remote">
<!---         structDelete(session, " --->
        <cfset sessionInvalidate()>
        <cflocation  url="../index.cfm" addToken = "no">
    </cffunction>
</cfcomponent>