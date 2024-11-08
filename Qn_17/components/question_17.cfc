<cfcomponent>
    <cffunction  name="printDigits" returnType="struct">
        <cfargument  name="inputText1" type="any"> 
        <cfset mystruct3 = structNew()>
        <cfloop index="i" from="1" to="#arguments.inputText1#">
            <cfif(i%2==0)>
                <cfset myStruct3[i]="green">
            <cfelse>
                <cfset myStruct3[i]="blue">
            </cfif>
        </cfloop>
        <cfreturn myStruct3>
    </cffunction>
</cfcomponent>