<cfcomponent>
    <cfset result = "">
    <cffunction  name="printPattern" returnType="any">
        <cfloop index="i" from="1" to="3">
            <cfset k = 0>
            <cfloop index="j" from="1" to="3">
                <cfset result = result & (i+(3*k)) & " ">
                <cfset k++>
            </cfloop>
            <cfset result = result & "<br>">
        </cfloop>
        <cfreturn result>
    </cffunction>
</cfcomponent>