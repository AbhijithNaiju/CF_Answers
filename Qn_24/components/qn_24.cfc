<cfcomponent>
    <cffunction  name="insertValues" returntype="string">
        <cfargument  name="firstName" type="string">
        <cfargument  name="email" type="string">
        
        <cfquery name="formInput"  datasource="TESTDS">
                    insert into loginEmail(name ,
                                            email )
                                    values('#arguments.firstName#',
                                            '#arguments.email#');
        </cfquery>
        <cfreturn "Form submitted  successfully">
    </cffunction>

    <cffunction  name="emailExists" returntype="any" access="remote">
        <cfargument  name="email" type="string">
        <cfquery name="emailcheck" datasource="TESTDS">
            select count('name') as emailcount from loginEmail where Email='#arguments.email#'
        </cfquery>
        <cfif emailcheck.emailcount>
            <cfreturn true>
        </cfif>
    </cffunction>
</cfcomponent>