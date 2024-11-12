<cfcomponent>
    <cffunction  name = "userSignup" returnType="string">
        <cfargument  name = "userName" type="string"> 
        <cfargument  name = "password" type="string"> 
        <cfargument  name = "userRole" type="string"> 
        <cfset local.result = "">
        <cfquery name="userNameCheck" datasource="TESTDS">
            select count('username') as userCount from tableUser where username='#arguments.userName#';
        </cfquery>
        <cfif userNameCheck.userCount>
            <cfset local.result = "Username already exists">
        <cfelse>
            <cfquery name="formInput"  datasource="TESTDS">
                        insert into tableUser(userName ,
                                            password ,
                                            role)
                                    values('#arguments.userName#',
                                        '#arguments.password#',
                                        '#arguments.userRole#');
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
        <cfquery name="usercheck"  datasource="TESTDS">
            select userId from tableUser where username='#arguments.userName#' AND 
                                               password='#arguments.password# ' AND
                                               role='#arguments.userRole# ';
        </cfquery>
        <cfif usercheck.userId EQ ''>
            <cfset local.error = "Please enter a valid username and password">
        <cfelse>
            <cfif arguments.userRole EQ "Admin" OR arguments.userRole EQ "Editor">
                <cfset session.adminId = usercheck.userId>
                <cflocation url = "./admin.cfm" addToken = "no">
            <cfelse>
                <cfset session.userId = usercheck.userId>
                <cflocation url = "./user.cfm" addToken = "no">
            </cfif>
        </cfif>
        <cfreturn local.error>
    </cffunction>

    <cffunction  name="userNameExists" returntype="any" access="remote">
        <cfargument  name="userName" type="string">
        <cfquery name="userNameCheck" datasource="TESTDS">
            select count('username') as userCount from tableUser where username='#arguments.userName#';
        </cfquery>
        <cfif userNameCheck.userCount>
            <cfreturn true>
        </cfif>
    </cffunction>

    <cffunction  name="logout" access="remote">
        <cfset sessionInvalidate()>
        <cflocation  url="../login.cfm" addToken = "no">
    </cffunction>

    <cffunction  name="getPages" returntype="query">
        <cfquery name="pagelist" datasource="TESTDS">
            select pageId,pagename,pagedescs from tablepage;
        </cfquery>
        <cfreturn pagelist>
    </cffunction>

    <cffunction  name="getPageFromId" returntype="query">
        <cfargument  name="pageId">
        <cfquery name="pagelist" datasource="TESTDS">
            select pageId,pagename,pagedescs from tablepage where pageId='#arguments.pageId#';
        </cfquery>
        <cfreturn pagelist>
    </cffunction>


    <cffunction  name="deletePage" returntype="String">
        <cfargument  name="pageId" type="string">
        <cfquery name="pagelist" datasource="TESTDS">
            delete from tablepage where pageId='#arguments.pageId#'
        </cfquery>
        <cfset local.result = "Page deleted successfully">
        <cfreturn local.result>
    </cffunction>

    <cffunction  name="addPageToTable">
        <cfargument  name="pageName" type="string">
        <cfargument  name="pageDescription" type="string">
        <cfquery name="insertQuery" datasource="TESTDS">
            insert into tablepage(pagename,pagedescs) values('#arguments.pageName#',
                                                             '#arguments.pageDescription#')
        </cfquery>
        <cflocation url = "./admin.cfm" addToken = "no">
    </cffunction>

        <cffunction  name="editPageFromTable">
        <cfargument  name="pageID" type="string">
        <cfargument  name="pageName" type="string">
        <cfargument  name="pageDescription" type="string">
        <cfquery name="insertQuery" datasource="TESTDS">
            update tablepage set pagename='#arguments.pageName#' , pagedescs='#arguments.pageDescription#' where pageId='#arguments.pageID#'
        </cfquery>
        <cflocation url = "./admin.cfm" addToken = "no">
    </cffunction>
</cfcomponent>