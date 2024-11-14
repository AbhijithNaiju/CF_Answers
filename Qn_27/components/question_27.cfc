<cfcomponent>
    <cffunction  name = "userLogin" returnType="struct">

        <cfargument  name = "userName" type="string"> 
        <cfargument  name = "password" type="string">

        <cfset local.structResult = structNew()>
        <cfset local.hashedPassword = hash(arguments.password, "SHA-256")> 

        <cfquery name="usercheck">
            SELECT userName
            FROM userlogin 
            WHERE username=<cfqueryparam value='#arguments.userName#' cfsqltype="cf_sql_varchar">
            AND password=<cfqueryparam value='#local.hashedPassword#' cfsqltype="cf_sql_varchar">
        </cfquery>

        <cfif usercheck.recordcount>

            <cfset session.userName = arguments.userName>
            <cflocation url = "./welcome.cfm" addToken = "no">
            <cfset local.structResult["error"] = "">

        <cfelse>
            <cfset local.structResult["error"] = "Please enter valid username and password">
        </cfif> 

        <cfreturn local.structResult>

    </cffunction>

    <cffunction  name="logout" access="remote" retuntype="boolean">
        <cfset  structClear(session)>
        <cfreturn true>
    </cffunction>

</cfcomponent>