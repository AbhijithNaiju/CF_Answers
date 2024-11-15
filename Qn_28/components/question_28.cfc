<cfcomponent>
    <cffunction  name = "userSignup" returnType="string">

        <cfargument  name = "userName" type="string"> 
        <cfargument  name = "password" type="string"> 
        <cfargument  name = "userRole" type="string"> 

        <cfset local.result = "">
        <cfset local.hashedPassword = hash(arguments.password, "SHA-256")> 

        <cfquery name="userNameCheck">
            SELECT count('username') 
            AS userCount 
            FROM userTable 
            WHERE username=<cfqueryparam value='#arguments.userName#' cfsqltype="cf_sql_varchar">;
        </cfquery>

        <cfif userNameCheck.userCount>
            <cfset local.result = "Username already exists">
        <cfelse>

            <cfquery name="formInput">
                INSERT INTO userTable(userName ,password ,roleId)
                VALUES(<cfqueryparam value='#arguments.userName#' cfsqltype="cf_sql_varchar">,
                <cfqueryparam value='#local.hashedPassword#' cfsqltype="cf_sql_varchar">,
                <cfqueryparam value='#arguments.userRole#' cfsqltype="cf_sql_varchar">);
            </cfquery>

            <cfset local.result = "Account Created Sucessfully">

        </cfif>

        <cfreturn local.result>
    </cffunction>

    <cffunction  name = "userLogin" returnType="string">

        <cfargument  name = "userName" type="string"> 
        <cfargument  name = "password" type="string"> 
        <cfargument  name = "userRole" type="string"> 

        <cfset local.result = "">
        <cfset local.hashedPassword = hash(arguments.password, "SHA-256")> 

        <cfquery name="usercheck"  >
            SELECT userId 
            FROM userTable 
            WHERE username=<cfqueryparam value='#arguments.userName#' cfsqltype="cf_sql_varchar"> 
            AND password=<cfqueryparam value='#local.hashedPassword#' cfsqltype="cf_sql_varchar"> 
            AND roleId=<cfqueryparam value='#arguments.userRole#' cfsqltype="cf_sql_varchar">;
        </cfquery>

        <cfif usercheck.userId EQ ''>
            <cfset local.error = "Please enter a valid username and password">
        <cfelse>
        <cfset session.userId = usercheck.userId>

        <cfif arguments.userRole EQ "Admin" OR arguments.userRole EQ "Editor">
            <cflocation url = "./admin.cfm">
        <cfelse>
            <cflocation url = "./user.cfm">
        </cfif>

        </cfif>

        <cfreturn local.error>

    </cffunction>

    <cffunction  name="userNameExists" returntype="any" access="remote">

        <cfargument  name="userName" type="string">

        <cfquery name="userNameCheck" >
            SELECT count('username') 
            AS userCount 
            FROM userTable 
            WHERE username=<cfqueryparam value='#arguments.userName#' cfsqltype="cf_sql_varchar">;
        </cfquery>

        <cfif userNameCheck.userCount>
            <cfreturn true>
        </cfif>

    </cffunction>

    <cffunction  name="logout" access="remote" retuntype="boolean">

        <cfset structClear(session)>
        <cfreturn true>

    </cffunction>

    <cffunction  name="getPages" returntype="query">

        <cfquery name="pagelist" >
            SELECT pageId,pagename,pagedescs 
            FROM tablepage;
        </cfquery>

        <cfreturn pagelist>
    </cffunction>
    

    <cffunction  name="getPageFromId" returntype="query">
        <cfargument  name="pageId">

        <cfquery name="pagelist" >
            SELECT pageId,pagename,pagedescs 
            FROM tablepage 
            WHERE pageId=<cfqueryparam value='#arguments.pageId#' cfsqltype="cf_sql_varchar">;
        </cfquery>
        
        <cfreturn pagelist>
    </cffunction>


    <cffunction  name="deletePage" returntype="boolean" access="remote">

        <cfargument  name="pageId" type="string">
        
        <cfquery name="pagelist" >
            DELETE FROM tablepage 
            WHERE pageId=<cfqueryparam value='#arguments.pageId#' cfsqltype="cf_sql_varchar">;
        </cfquery>

        <cfreturn true>

    </cffunction>

    <cffunction  name="addPageToTable">

        <cfargument  name="pageName" type="string">
        <cfargument  name="pageDescription" type="string">

        <cfquery name="insertQuery" >
            INSERT INTO tablepage(pagename,pagedescs) 
            VALUES( <cfqueryparam value='#arguments.pageName#' cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value='#arguments.pageDescription#' cfsqltype="cf_sql_varchar">)
        </cfquery>

        <cflocation url = "./admin.cfm">

    </cffunction>

        <cffunction  name="editPageFromTable">
        <cfargument  name="pageID" type="string">
        <cfargument  name="pageName" type="string">
        <cfargument  name="pageDescription" type="string">

        <cfquery name="insertQuery" >
            UPDATE tablepage 
            SET pagename=<cfqueryparam value='#arguments.pageName#' cfsqltype="cf_sql_varchar">,
                pagedescs=<cfqueryparam value='#arguments.pageDescription#' cfsqltype="cf_sql_varchar"> 
            WHERE pageId=<cfqueryparam value='#arguments.pageID#' cfsqltype="cf_sql_varchar">
        </cfquery>

        <cflocation url = "./admin.cfm">
    </cffunction>
</cfcomponent>