<cfcomponent>
    <cffunction  name="printDigits" returnType="any">

        <cfset local.jsonData = '[{"Name":"saravanan","Age":27,"LOCATION":"dubai"},{"Name":"Ram","Age":26,"LOCATION":"Kovilpatti"}]'>
        <cfset local.mystruct = deserializeJSON(local.jsonData)>

        <cfreturn local.myStruct>
        
    </cffunction>
</cfcomponent>