<cfcomponent>
    <cffunction  name = "userSignup" returnType="struct">

        <cfargument  name = "userName" type="string"> 
        <cfargument  name = "password" type="string"> 
        <cfargument  name = "userRole" type="string"> 

        <cfset local.result = structNew()>
        <cfset local.hashedPassword = hash(arguments.password, "SHA-256")> 

        <cfquery name="userNameCheck">
            SELECT count('username') 
            AS userCount 
            FROM userTable 
            WHERE username=<cfqueryparam value='#arguments.userName#' cfsqltype="cf_sql_varchar">;
        </cfquery>

        <cfif userNameCheck.userCount>
            <cfset local.result["error"] = "Username already exists">
        <cfelse>

            <cfquery name="formInput">
                INSERT INTO userTable(userName ,password ,roleId)
                VALUES(<cfqueryparam value='#arguments.userName#' cfsqltype="cf_sql_varchar">,
                <cfqueryparam value='#local.hashedPassword#' cfsqltype="cf_sql_varchar">,
                <cfqueryparam value='#arguments.userRole#' cfsqltype="cf_sql_varchar">);
            </cfquery>

            <cfset local.result["success"] = "Account Created Sucessfully">

        </cfif>

        <cfreturn local.result>
    </cffunction>

    <cffunction  name = "userLogin" returnType="struct">

        <cfargument  name = "userName" type="string"> 
        <cfargument  name = "password" type="string"> 
        <cfargument  name = "userRole" type="string"> 

        <cfset local.result = structNew()>
        <cfset local.hashedPassword = hash(arguments.password, "SHA-256")> 

        <cfquery name="userCheck"  >
            SELECT userId,roleId
            FROM userTable 
            WHERE username=<cfqueryparam value='#arguments.userName#' cfsqltype="cf_sql_varchar"> 
            AND password=<cfqueryparam value='#local.hashedPassword#' cfsqltype="cf_sql_varchar">;
        </cfquery>

        <cfif userCheck.userId EQ ''>
            <cfset local.result["error"] = "Please enter a valid username and password">
        <cfelse>
            <cfset session.userId = userCheck.userId>
            <cfset session.roleId = userCheck.roleId>

            <cfif userCheck.roleId EQ "101" OR userCheck.roleId EQ "102">
                <cflocation url = "./admin.cfm">
            <cfelse>
                <cflocation url = "./user.cfm">
            </cfif>

        </cfif>

        <cfreturn local.result>

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

        <cfquery name="pageList" >
            SELECT pageId,pagename,pageDesc
            FROM pageTable;
        </cfquery>

        <cfreturn pageList>
    </cffunction>

        <cffunction  name="getAdminPages" returntype="query">

        <cfquery name="pageList" >
            SELECT pageId,pagename,pageDesc
            FROM pageTable
            WHERE _createdBy=<cfqueryparam value='#session.userId#' cfsqltype="cf_sql_varchar">;
        </cfquery>

        <cfreturn pageList>
    </cffunction>
    

    <cffunction  name="getPageFromId" returntype="query">
        <cfargument  name="pageId">

        <cfquery name="pageList" >
            SELECT pageId,pagename,pageDesc
            FROM pageTable
            WHERE pageId=<cfqueryparam value='#arguments.pageId#' cfsqltype="cf_sql_varchar">;
        </cfquery>
        
        <cfreturn pageList>
    </cffunction>


    <cffunction  name="deletePage" returntype="boolean" access="remote">

        <cfargument  name="pageId" type="string">
        
        <cfquery name="pageList" >
            DELETE FROM pageTable
            WHERE pageId=<cfqueryparam value='#arguments.pageId#' cfsqltype="cf_sql_varchar">;
        </cfquery>

        <cfreturn true>

    </cffunction>

    <cffunction  name="addPageToTable" returntype="any">

        <cfargument  name="pageName" type="string">
        <cfargument  name="pageDescription" type="string">

        <cfquery name="pageList" >
            SELECT pagename
            FROM pageTable
            WHERE pagename=<cfqueryparam value='#arguments.pageName#' cfsqltype="cf_sql_varchar">;
        </cfquery>

        <cfif pageList.recordcount>
            <cfset local.structResult["error"] = "Pagename '#arguments.pageName#' already exists">
            <cfreturn local.structResult>
        <cfelse>

            <cfset local.date = now()>

            <cfquery name="insertQuery" >
                INSERT INTO pageTable(pagename,pagedesc,_createdBy,_createdOn,_updatedBy,_updatedOn) 
                VALUES( <cfqueryparam value='#arguments.pageName#' cfsqltype="cf_sql_varchar">,
                        <cfqueryparam value='#arguments.pageDescription#' cfsqltype="cf_sql_varchar">,
                        <cfqueryparam value='#session.userId#' cfsqltype="cf_sql_varchar">,
                        <cfqueryparam value='#local.date#' cfsqltype="cf_sql_date">,
                        <cfqueryparam value='#session.userId#' cfsqltype="cf_sql_varchar">,
                        <cfqueryparam value='#local.date#' cfsqltype="cf_sql_date">)
            </cfquery>

            <cflocation url = "./admin.cfm">

        </cfif>
    </cffunction>

    <cffunction  name="editPageFromTable" returntype="struct">
        <cfargument  name="pageID" type="string">
        <cfargument  name="pageName" type="string">
        <cfargument  name="pageDescription" type="string">

        <cfset local.structResult = structNew()>

        <cfquery name="pageList" >
            SELECT pageId,pagename
            FROM pageTable
            WHERE pagename=<cfqueryparam value='#arguments.pageName#' cfsqltype="cf_sql_varchar">;
        </cfquery>

        <cfif pageList.recordcount>

            <cfif pageList.pageId NEQ arguments.pageId>
                <cfset local.structResult["error"] = "Pagename '#arguments.pageName#' already exists">
            </cfif>

        </cfif>

        <cfif not structKeyExists(local.structResult, "error")>

            <cfset local.date = now()>
            <cfquery name="insertQuery" >
                UPDATE pageTable
                SET pagename=<cfqueryparam value='#arguments.pageName#' cfsqltype="cf_sql_varchar">,
                    pagedesc=<cfqueryparam value='#arguments.pageDescription#' cfsqltype="cf_sql_varchar">,
                    _updatedBy=<cfqueryparam value='#session.userId#' cfsqltype="cf_sql_varchar">,
                    _updatedOn=<cfqueryparam value='#local.date#' cfsqltype="cf_sql_date">
                WHERE pageId=<cfqueryparam value='#arguments.pageID#' cfsqltype="cf_sql_varchar">
            </cfquery>

            <cflocation url = "./admin.cfm?error=">

        <cfelse>
            <cfreturn local.structResult>
        </cfif>

    </cffunction>

    <cffunction  name="getRoles" returntype="query">
        <cfquery name="userRoles">
            SELECT roleId,roleName
            FROM roleTable
        </cfquery>
        <cfreturn userRoles>
    </cffunction>
</cfcomponent>