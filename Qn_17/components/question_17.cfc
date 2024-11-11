<cfcomponent>
    <cffunction  name="printDigits" returnType="struct">
        <cfargument  name="inputText1" type="any"> 
        <cfset local.mystruct3 = structNew()>
        <cfloop index="i" from="1" to="#arguments.inputText1#">
            <cfif(i%2==0)>
                <cfset local.myStruct3[i]="green">
            <cfelse>
                <cfset local.myStruct3[i]="blue">
            </cfif>
        </cfloop>
        <cfreturn local.myStruct3>
    </cffunction>
</cfcomponent>