<cfcomponent>
    <cffunction  name="valueFunction" returnType="any">
        <cfargument name="inputText" type="any" required="true">
        <cfset local.text1=arguments.inputText1>
        <cfset local.text2=arguments.inputText2>
        <cf set structName=StructNew()>
        <cfreturn #result#>
    </cffunction>
</cfcomponent>