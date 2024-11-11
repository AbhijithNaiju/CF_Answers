<cfcomponent>
    <cffunction  name="printPattern" returnType="any">
        <cfset local.arrayResult = ArrayNew(2)>
        <cfset local.end = 3>
        <cfloop index="i" from="1" to="#local.end#">
            <cfset k = 0>
            <cfloop index="j" from="1" to="#local.end#">
                <cfset local.arrayResult[i][j] = (i+(3*k))>
                <cfset k++>
            </cfloop>
        </cfloop>
        <cfreturn local.arrayResult>
    </cffunction>
</cfcomponent>