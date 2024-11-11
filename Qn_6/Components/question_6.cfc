<cfcomponent>
    <cffunction  name="valueFunction" returnType="struct">
        <cfset local.structName=StructNew()>
        <cfset local.structName[form.inputText1]=form.inputText2>
        <cfreturn local.structName>
    </cffunction>
</cfcomponent>