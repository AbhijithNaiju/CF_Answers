<cfcomponent>
    <cffunction  name="valueFunction" returnType="struct">
        <cfargument  name="inputText1" type="any"> 
        <cfargument  name="inputText2" type="any">
        <cfif not StructKeyExists(session,"myStruct") >
            <cfset session.mystruct=structNew()>
        </cfif>
        <cfset session.mystruct[arguments.inputText1]=arguments.inputText2>
        <cfreturn session.myStruct>
    </cffunction>
</cfcomponent>