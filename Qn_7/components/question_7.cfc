<cfcomponent>
    <cffunction  name="valueFunction" returnType="struct">
        <cfargument  name="inputText1">
        <cfargument  name="inputText2">
        <cfif not StructKeyExists(session,"structName") >
            <cfset session.structName=structNew()>
        </cfif>
        <cfset session.structName[arguments.inputText1]=arguments.inputText2>
        <cfreturn session.structName>
    </cffunction>
</cfcomponent>