<cfcomponent>
    <cffunction  name="multiply" returnType="any">
        <cfset argLength = arrayLen(arguments)>
        <cfset local.result=1>
        <cfloop index="i" from="1" to="#argLength#">
            <cfset local.result=local.result*arguments[i]>
        </cfloop>
        <cfreturn local.result>
    </cffunction>
</cfcomponent>