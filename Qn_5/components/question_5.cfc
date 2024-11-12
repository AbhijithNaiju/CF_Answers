<cfcomponent>
    <cffunction  name="valueFunction" returnType="array">
        <cfargument name="dobYour" type="any" required="true">
        <cfargument name="dobMother" type="any" required="true">

        <cfset local.result = []>
        
        <cfset local.dobYour=arguments.dobYour>
        <cfset local.ageYour = DateDiff('yyyy', dobyour, now())>
        <cfset local.nextBirthdayYou = dobYour.setYear(year(now()))>
        <cfset local.remainingDayYou = dayOfYear(local.nextBirthdayYou) - dayOfYear(now())>

        <cfset local.dobMother=arguments.dobMother>
        <cfset local.agemother = DateDiff('yyyy', dobmother, now())>
        <cfset local.nextBirthdayMother = dobMother.setYear(year(now()))>
        <cfset local.remainingDayMother = dayOfYear(local.nextBirthdayMother) - dayOfYear(now())>

        <cfif local.remainingDayYou LT 0>
            <cfset local.remainingDayYou=(365+local.remainingDayYou)>    
        </cfif>

        <cfif local.remainingDayMother LT 0>
            <cfset local.remainingDayMother=(365+local.remainingDayMother)>    
        </cfif>

        <cfset arrayAppend(local.result , local.ageYour)>
        <cfset arrayAppend(local.result , local.agemother-local.ageYour)>
        <cfset arrayAppend(local.result , local.remainingDayYou)>
        <cfset arrayAppend(local.result , local.remainingDayMother)>

        <cfreturn local.result>
    </cffunction>
</cfcomponent>