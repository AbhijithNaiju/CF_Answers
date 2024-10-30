<cfcomponent>
    <cffunction  name="valueFunction" returnType="any">
    <cfargument name="number" type="numeric" required="true">
        <cfset local.value=arguments.number>
            <cfif local.value EQ 5>
                <cfset result="Very Good">
            <cfelseif value EQ 4>
                <cfset result="Good">
            <cfelseif local.value EQ 3>
                <cfset result="Fair">
            <cfelseif local.value EQ 2  OR local.value EQ 1>
                <cfset result="OK">
            <cfelse>
                <cfset result="Invalid number, Please select valid number(1 - 5)">
            </cfif>
        <cfreturn result>
    </cffunction>
</cfcomponent>



<cfcomponent>
    <cffunction  name="fn_result" returnType="any">
    <cfargument name="number" type="numeric" required="true">
    <cfset local.value=arguments.number>
        <cfif local.value EQ 5>
            <cfset result="Very Good">
        <cfelseif value EQ 4>
            <cfset result="Good">
        <cfelseif local.value EQ 3>
            <cfset result="Fair">
        <cfelseif local.value EQ 2  OR local.value EQ 1>
            <cfset result="OK">
        <cfelse>
            <cfset result="Invalid number, Please select valid number(1 - 5)">
        </cfif>
    <cfreturn result>
    </cffunction>
</cfcomponent>






