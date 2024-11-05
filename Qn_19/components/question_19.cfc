<cfcomponent>
    <cffunction  name="cookieCounter" returnType="any">
        <cfif not structKeyExists(cookie,"visitsCounter4")>
            <cfcookie  name="visitscounter4" expires=1>
            <cfset cookie.visitsCounter4 = 0>
        </cfif>
        <cfset cookie.visitsCounter4 = cookie.visitsCounter4 + 1>
        <cfreturn #cookie.visitsCounter4#>
    </cffunction>
</cfcomponent>