<cfcomponent>
    <cffunction  name="valueFunction" returnType="any">
        <cfargument name="inputText" type="any" required="true">
        <cfset local.value=arguments.inputText>
        <cfset local.result = ''>
        <cfloop list="#value#" index="i">
            <cfif #i# % 3 !=0>
                <cfcontinue>
            </cfif>
            <cfset result =  listAppend(result, #i#,",")>
        </cfloop>
        <cfreturn #result#>
    </cffunction>
</cfcomponent>