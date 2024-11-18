<cfcomponent>
    <cfset this.datasource = "cmsDataSource">
    <cfset this.sessionManagement = true>
    <cffunction name="onRequest" >

        <cfargument  name="requestedpage">

        <cfset local.excludedPages=["/CF_Answers/Qn_28/login.cfm","/CF_Answers/Qn_28/signUp.cfm"]>
        <cfset local.userPages = ["/CF_Answers/Qn_28/user.cfm"]>

        <cfif arrayFind(local.excludedPages,arguments.requestedpage)>
            <cfinclude  template="#arguments.requestedpage#">
        <cfelse>

            <cfif structKeyExists(session, "userId")>

                <cfif structKeyExists(session, "roleId") AND session.roleId EQ 103 AND not arrayFind(local.userPages,arguments.requestedpage)>
                    <cflocation  url="user.cfm" addtoken="no">
                <cfelse>
                    <cfinclude  template="#arguments.requestedpage#" >
                </cfif>

            <cfelse>
                <cflocation  url="login.cfm" addtoken="no">
            </cfif>

        </cfif>

    </cffunction>
</cfcomponent>