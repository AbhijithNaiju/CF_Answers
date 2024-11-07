<cfcomponent>
    <cffunction  name="valueFunction" returnType="any">
        <cfargument  name="inputText1" type="any"> 
        <cfargument  name="inputText2" type="any">
        <cfif not StructKeyExists(session,"myStruct") >
            <cfset session.mystruct=structNew()>
        </cfif>
        <cfif StructKeyExists(session.myStruct,arguments.inputText1)>
            <cfreturn "#arguments.inputText1 # already present.">
        <cfelse>
            <cfset session.myStruct[arguments.inputText1]=arguments.inputText2>
        </cfif>
        <cfreturn session.myStruct>
    </cffunction>
</cfcomponent>