<cfcomponent>
    <cffunction  name="insertValues" returntype="string">
        <cfargument  name="arrayFormElements" type="struct">
        <cfargument  name="fileLink" type="string">
         
        <cfset local.resumeImage = arguments.fileLink>
        <cfset local.salary = 0>
        <cfif len(arguments.arrayFormElements["salaryDollars"]) OR len(arguments.arrayFormElements["salaryCents"])>
            <cfset local.salary = arguments.arrayFormElements["salaryDollars"]&"."&arguments.arrayFormElements["salaryCents"]>
        </cfif>

        <cfquery name="formInput"  datasource="TESTDB">
                    insert into employment(firstName ,
                                            lastName ,
                                            email ,
                                            phone ,
                                            positionApplying ,
                                            relocate ,
                                            startDate ,
                                            portfolioLink ,
                                            resumeImage ,
                                            salary)
                                    values(
                                            '#arguments.arrayFormElements["firstName"]#',
                                            '#arguments.arrayFormElements["lastName"]#',
                                            '#arguments.arrayFormElements["email"]#',
                                            '#arguments.arrayFormElements["phone"]#',
                                            '#arguments.arrayFormElements["positionApplying"]#',
                                            '#arguments.arrayFormElements["relocate"]#',
                                            '#arguments.arrayFormElements["startDate"]#',
                                            '#arguments.arrayFormElements["portfolioLink"]#',
                                            '#local.resumeImage#',
                                            #local.salary#);
                </cfquery>
    <cfreturn "Form submitted submitted successfully">
    </cffunction>
</cfcomponent>