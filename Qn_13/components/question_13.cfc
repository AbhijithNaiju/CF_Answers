<cfcomponent>
    <cfset localmyString = "the quick brown fox jumps over the lazy dog">
    <cffunction  name="valueFunction" returnType="any">
        <cfargument  name="inputText1" type="any"> 
        <cfset local.result=  ListValueCount(localmyString,arguments.inputText1," ")>
        <cfreturn local.result>
    </cffunction>
</cfcomponent>