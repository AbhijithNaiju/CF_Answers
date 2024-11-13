<cfcomponent>
    <cfset this.sessionManagement = true>
    <cffunction name="onRequest" >

        <cfargument  name="requestedpage">

        <cfset local.excludedFiles=["/CF_Answers/Qn_27/index.cfm"]>

        <cfif arrayFind(local.excludedFiles,arguments.requestedpage)>
            <cfinclude  template="#arguments.requestedpage#">
         <cfelse>
            <cfif structKeyExists(session, "userName")>
                <cfinclude  template="#arguments.requestedpage#">
            <cfelse>
                <cflocation  url="index.cfm" addtoken="no">
            </cfif>
         </cfif>
    </cffunction>
</cfcomponent>