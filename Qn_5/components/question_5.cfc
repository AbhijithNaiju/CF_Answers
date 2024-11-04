<cfcomponent>
    <cffunction  name="valueFunction" returnType="any">
        <cfargument name="dobYour" type="any" required="true">
        <cfargument name="dobMother" type="any" required="true">
        <cfset local.dobYour=arguments.dobYour>
        <cfset local.dobMother=arguments.dobMother>
        <cfset ageYour = DateDiff('yyyy', dobyour, now())>
        <cfset agemother = DateDiff('yyyy', dobmother, now())>
        <cfset nextBirthdayYou = dobYour.setYear(year(now()))>
        <cfset remainingDayYou = dayOfYear(nextBirthdayYou) - dayOfYear(now())>
        <cfif remainingDayYou LT 0>
            <cfset remainingDayYou=(365+remainingDayYou)>    
        </cfif>
        <cfset nextBirthdayMother = dobMother.setYear(year(now()))>
        <cfset remainingDayMother = dayOfYear(nextBirthdayMother) - dayOfYear(now())>
        <cfif remainingDayMother LT 0>
            <cfset remainingDayMother=(365+remainingDayMother)>    
        </cfif>
        <cfset result[1] = ageYour>
        <cfset result[2] = agemother-ageYour>
        <cfset result[3] = remainingDayYou>
        <cfset result[4] = remainingDayMother>
        <cfreturn result>
    </cffunction>
</cfcomponent>