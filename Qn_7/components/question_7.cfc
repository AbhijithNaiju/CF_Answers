<cfcomponent>
    <cfset this.sessionmanagement = true>
    <cffunction  name="valueFunction" returnType="any">
        <cfset structName=StructNew()>
        <cfset session.structName[form.inputText1]=form.inputText2>
        <cfreturn session.structName>
    </cffunction>
</cfcomponent>