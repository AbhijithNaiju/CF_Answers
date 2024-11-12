<cfcomponent>
    <cffunction  name="printdate" returnType="struct">
        <cfset local.printDateResult = structNew()>
        <cfloop index="i" from = "-1" to = "-7" step = -1>
            <cfset local.previousFriday = dateAdd('d', i, now())>
            <cfif dateFormat( local.previousFriday,'eeee') EQ "friday">
                <cfbreak>
            </cfif>
        </cfloop>

        <cfset local.printDateResult["Today's date"] = dateFormat(now(),'dd')>
        <cfset local.printDateResult["Current Month in numeric"] = dateFormat(now(),'mm')>
        <cfset local.printDateResult["Current month in word"] = dateFormat(now(),'mmmm')>
        <cfset local.printDateResult["Last friday date"] = dateFormat(local.previousFriday,'dd')>
        <cfset local.lastDayOfMonth = now().setDay(daysInMonth(now()))>
        <cfset local.printDateResult["Last day of month"] = dateFormat(local.lastDayOfMonth,"dd-mm-yyyy-eeee")>

        <cfreturn local.printDateResult>
    </cffunction>

    <cffunction  name="lastFive" returnType="struct">
        <cfset local.lastFiveResult = []>
        <cfset local.weekStyle = {"sun"="red",
                                  "mon" ="green",
                                  "tue" ="orange",
                                  "wed" ="yellow",
                                  "thu" ="bold black",
                                  "fri" ="blue",
                                  "sat" ="bold red"}>
        <cfset local.lastFiveResult = structNew("ordered")>
        <cfloop index="i" from="-1" to="-5" step=-1>
            <cfset local.reqDate = now()+i>
            <cfset local.lastFiveDate=dateFormat(local.reqDate,'dd-mm-yyyy-eeee')>
            <cfset local.weekabbrevation = dateFormat(local.reqDate,'ee')>
            <cfset local.lastFiveResult[local.lastFiveDate] = weekstyle[local.weekabbrevation]>
        </cfloop>
        <cfreturn local.lastFiveResult>
    </cffunction>
</cfcomponent>