<cfcomponent>
    <cfset this.datasource = "cmsDataSource">
    <cfset this.sessionManagement = true>
    <cffunction name="onRequest" >

        <cfargument  name="requestedpage">

        <cfset local.excludedFiles=["/CF_Answers/Qn_28/login.cfm","/CF_Answers/Qn_28/signUp.cfm"]>

        <cfif arrayFind(local.excludedFiles,arguments.requestedpage)>
            <cfinclude  template="#arguments.requestedpage#">
        <cfelse>

            <cfif structKeyExists(session, "userId")>
                <cfinclude  template="#arguments.requestedpage#">
            <cfelse>
                <cflocation  url="login.cfm">
            </cfif>

        </cfif>

    </cffunction>
</cfcomponent>