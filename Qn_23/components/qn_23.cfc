<cfcomponent>
    <cffunction  name="insertValues" returntype="string">
        <cfargument  name="arrayFormElements" type="struct">
        <cfargument  name="fileLink" type="string">
         
        <cfset local.resumeImage = arguments.fileLink>
        <cfset local.salary = 0>
        <cfif len(arguments.arrayFormElements["salaryDollars"]) OR len(arguments.arrayFormElements["salaryCents"])>
            <cfset local.salary = arguments.arrayFormElements["salaryDollars"]&"."&arguments.arrayFormElements["salaryCents"]>
        </cfif>
        <cfset local.phoneNumber = arguments.arrayFormElements["phone1"]&arguments.arrayFormElements["phone2"]&arguments.arrayFormElements["phone3"]>

        <cfquery name="formInput"  datasource="TESTDS">
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
                                    values('#arguments.arrayFormElements["firstName"]#',
                                            '#arguments.arrayFormElements["lastName"]#',
                                            '#arguments.arrayFormElements["email"]#',
                                            '#local.phoneNumber#',
                                            '#arguments.arrayFormElements["positionApplying"]#',
                                            '#arguments.arrayFormElements["relocate"]#',
                                            '#arguments.arrayFormElements["startDate"]#',
                                            '#arguments.arrayFormElements["portfolioLink"]#',
                                            '#local.resumeImage#',
                                            #local.salary#);
        </cfquery>
        <cflocation  url="success.cfm" addtoken="no">
    </cffunction>
</cfcomponent>