<cfcomponent>
    <cffunction  name="multiply" returnType="any">
        <cfset argLength = arrayLen(arguments)>
        <cfset result=1>
        <cfloop index="i" from="1" to="#argLength#">
            <cfset result=result*arguments[i]>
        </cfloop>
        <cfreturn result>
    </cffunction>
</cfcomponent>