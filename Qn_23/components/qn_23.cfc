<cfcomponent>
    <cffunction  name="insertValues" returntype="struct">

        <cfargument  name="arrayFormElements" type="struct">
        <cfargument  name="fileLink" type="string">
         
        <cfset local.structResult = structNew()>
        <cfset local.salary = 0>
        <cfset local.phoneNumber = arguments.arrayFormElements["phone1"] AND arguments.arrayFormElements["phone2"] AND arguments.arrayFormElements["phone3"]>

        <cfif arguments.fileLink EQ "">
            local.fileExtension
        <cfelse>
            <cfset local.fileInformation = getFileInfo(arguments.fileLink)>
            <cfset local.fileExtension = listLast( local.fileInformation.path, ".")>
        </cfif>
        

        <cfif arguments.fileLink EQ "" OR local.fileExtension EQ "pdf" OR local.fileExtension EQ "docx" OR local.fileExtension EQ "doc">

            <cfif len(arguments.arrayFormElements["salaryDollars"]) OR len(arguments.arrayFormElements["salaryCents"])>
                <cfset local.salary = arguments.arrayFormElements["salaryDollars"]&"."&arguments.arrayFormElements["salaryCents"]>
            </cfif>
            
            <cftry>

                <cfquery name="formInput">
                    INSERT INTO employment( firstName ,
                                            lastName ,
                                            email ,
                                            phone ,
                                            positionApplying ,
                                            relocate ,
                                            startDate ,
                                            portfolioLink ,
                                            resumeImage ,
                                            salary)
                    VALUES( <cfqueryparam value='#arguments.arrayFormElements["firstName"]#' cfsqltype="cf_sql_varchar">,
                            <cfqueryparam value='#arguments.arrayFormElements["lastName"]#' cfsqltype="cf_sql_varchar">,
                            <cfqueryparam value='#arguments.arrayFormElements["email"]#' cfsqltype="cf_sql_varchar">,
                            <cfqueryparam value='#local.phoneNumber#' cfsqltype="cf_sql_varchar">,
                            <cfqueryparam value='#arguments.arrayFormElements["positionApplying"]#' cfsqltype="cf_sql_varchar">,
                            <cfqueryparam value='#arguments.arrayFormElements["relocate"]#' cfsqltype="cf_sql_varchar">,
                            <cfqueryparam value='#arguments.arrayFormElements["startDate"]#' cfsqltype="cf_sql_varchar">,
                            <cfqueryparam value='#arguments.arrayFormElements["portfolioLink"]#' cfsqltype="cf_sql_varchar">,
                            <cfqueryparam value='#arguments.fileLink#' cfsqltype="cf_sql_varchar">,
                            <cfqueryparam value='#local.salary#' cfsqltype="cf_sql_varchar">)
                </cfquery>

                <cflocation  url="success.cfm" addtoken="no">  

            <cfcatch>
                <cfset local.structResult["error"] = "Error while submitting the form please check the values and resubmit">
            </cfcatch>

            </cftry>

            <cfelse>
                <cfset local.structResult["error"] = "Only pdf and word files allowed">
        </cfif>
         
            <cfreturn local.structResult>
    </cffunction>
</cfcomponent>