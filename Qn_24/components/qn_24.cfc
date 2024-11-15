<cfcomponent>
    <cffunction  name="insertValues" returntype="string">
        <cfargument  name="firstName" type="string">
        <cfargument  name="email" type="string">
        
        <cfquery name="formInput"  datasource="TESTDS">
            INSERT INTO loginEmail( name ,email )
            VALUES( '#arguments.firstName#','#arguments.email#');
        </cfquery>
        
        <cfreturn "Form submitted  successfully">
    </cffunction>

    <cffunction  name="emailExists" returntype="any" access="remote">

        <cfargument  name="email" type="string">

        <cfquery name="emailcheck" datasource="TESTDS">
            SELECT count('name') 
            AS emailcount 
            FROM loginEmail 
            WHERE Email='#arguments.email#'
        </cfquery>

        <cfif emailcheck.emailcount>
            <cfreturn true>
        </cfif>

    </cffunction>
</cfcomponent>