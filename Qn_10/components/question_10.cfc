<cfcomponent>
    <cffunction  name="valueFunction" returnType="struct">
        <cfargument  name="inputText1" type="any"> 
        <cfargument  name="inputText2" type="any">

        <cfif not StructKeyExists(session,"myStruct3") >
            <cfset session.mystruct3=structNew()>
        </cfif>

        <cfset session.myStruct3[arguments.inputText1]=arguments.inputText2>
        <cfset session.myStruct3=StructToSorted(session.myStruct3,"text","asc",false)>
        <cfreturn session.myStruct3>
    </cffunction>
</cfcomponent>