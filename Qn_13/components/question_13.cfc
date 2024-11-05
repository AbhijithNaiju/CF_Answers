<cfcomponent>
    <cfset myString = "the quick brown fox jumps over the lazy dog">
    <cffunction  name="valueFunction" returnType="any">
        <cfargument  name="inputText1" type="any"> 
        <cfset result=  ListValueCount(myString,arguments.inputText1," ")>
        <cfreturn result>
    </cffunction>
</cfcomponent>