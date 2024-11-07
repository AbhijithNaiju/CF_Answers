<cfcomponent>
    <cffunction  name="valueFunction" returnType="string">
        <cfargument name="inputText" type="any" required="true">
        <cfset local.value=arguments.inputText>
        <cfset local.result = ''>
        <cfloop list="#value#" index="i">
            <cfif #i# % 3 !=0>
                <cfcontinue>
            </cfif>
            <cfset local.result =  listAppend(local.result, #i#,",")>
        </cfloop>
        <cfif Len(local.result) EQ 0>
            <cfset local.result = "No numbers divisible by 3">
        </cfif>
        <cfreturn local.result>
    </cffunction>
</cfcomponent>