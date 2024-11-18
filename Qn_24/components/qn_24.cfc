<cfcomponent>
    <cffunction  name="insertValues" returntype="string">
        <cfargument  name="firstName" type="string">
        <cfargument  name="email" type="string">
        
        <cfquery name="formInput"  datasource="TESTDS">
            INSERT INTO loginEmail( name ,email )
            VALUES( <cfqueryparam value='#arguments.firstName#' cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value='#arguments.email#' cfsqltype="cf_sql_varchar">);
        </cfquery>
        
        <cfreturn "Form submitted  successfully">
    </cffunction>

    <cffunction  name="emailExists" returntype="any" access="remote">

        <cfargument  name="email" type="string">

        <cfquery name="emailcheck" datasource="TESTDS">
            SELECT count('email') 
            AS emailcount 
            FROM loginEmail 
            WHERE Email=<cfqueryparam value='#arguments.email#' cfsqltype="cf_sql_varchar">;
        </cfquery>

        <cfif emailcheck.emailcount>
            <cfreturn true>
        </cfif>

    </cffunction>
</cfcomponent>