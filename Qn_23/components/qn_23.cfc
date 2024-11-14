<cfcomponent>
    <cffunction  name="insertValues" returntype="struct">

        <cfargument  name="arrayFormElements" type="struct">
        <cfargument  name="fileLink" type="string">
         
        <cfset local.structResult = structNew()>
        <cfset local.resumeImage = arguments.fileLink>
        <cfset local.salary = 0>
        <cfset local.phoneNumber = arguments.arrayFormElements["phone1"]&arguments.arrayFormElements["phone2"]&arguments.arrayFormElements["phone3"]>

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
                        <cfqueryparam value='#local.resumeImage#' cfsqltype="cf_sql_varchar">,
                        <cfqueryparam value='#local.salary#' cfsqltype="cf_sql_varchar">)
            </cfquery>

        <cfcatch>
            <cfset local.structResult["error"] = "Error while submitting the form please check the values and resubmit">
            <cfreturn local.structResult>
        </cfcatch>

        </cftry>

         <cflocation  url="success.cfm" addtoken="no"> 
         
    </cffunction>
</cfcomponent>