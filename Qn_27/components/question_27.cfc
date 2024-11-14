<cfcomponent>
    <cffunction  name = "userLogin" returnType="struct">

        <cfargument  name = "userName" type="string"> 
        <cfargument  name = "password" type="string">

        <cfset local.structResult = structNew()>
<!---         <cfset local.hashedPassword = hash(arguments.password, "SHA-256")> --->
<!---         <cfdump  var="#local.hashedPassword#"> --->

        <cfquery name="usercheck">
            SELECT count('userName') 
            AS userCount 
            FROM userlogin 
            WHERE username=<cfqueryparam value='#arguments.userName#' cfsqltype="cf_sql_varchar">
            AND password=<cfqueryparam value='#arguments.password#' cfsqltype="cf_sql_varchar">
        </cfquery>

        <cfif usercheck.userCount>
            <cfset session.userName = arguments.userName>
            <cflocation url = "./welcome.cfm" addToken = "no">
            <cfset local.structResult["error"] = "">

        <cfelse>
            <cfset local.structResult["error"] = "Please enter valid username and password">
        </cfif> 

        <cfreturn local.structResult>   

    </cffunction>

    <cffunction  name="logout" access="remote">
        <cfset sessionInvalidate()>
    </cffunction>

</cfcomponent>