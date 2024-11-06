<cfcomponent>
    <cffunction  name="valueFunction" returnType="string">
    <cfargument name="number" type="any" required="true">
    <cfset local.result = ''>
        <cfset local.value=arguments.number>
        <cfif local.value EQ 5>
            <cfset local.result="Very Good">
        <cfelseif local.value EQ 4>
            <cfset local.result="Good">
        <cfelseif local.value EQ 3>
            <cfset local.result="Fair">
        <cfelseif local.value EQ 2  OR local.value EQ 1>
            <cfset local.result="OK">
        <cfelse>
            <cfset local.result="Invalid number, Please select valid number(1 - 5)">
        </cfif>
        <cfreturn local.result>
    </cffunction>
</cfcomponent>