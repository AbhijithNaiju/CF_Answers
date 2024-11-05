<cfcomponent>
    <cffunction  name="printdate" returnType="any">
        <cfloop index="i" from="-1" to="-7" step=-1>
            <cfset previousFriday = dateAdd('d', i, now())>
            <cfif dateFormat( previousFriday,'eeee') eq "friday">
                <cfbreak>
            </cfif>
        </cfloop>
        <cfset printDateResult["Today's date"] = dateFormat(now(),'dd')>
        <cfset printDateResult["Current Month in numeric"] = dateFormat(now(),'mm')>
        <cfset printDateResult["Current month in word"] = dateFormat(now(),'mmmm')>
        <cfset printDateResult["Last friday date"] = dateFormat(previousFriday,'dd')>
        <cfset lastDayOfMonth = now().setDay(daysInMonth(now()))>
        <cfset printDateResult["Last day of month"] = dateFormat(lastDayOfMonth,"dd-mm-yyyy-eeee")>
        <cfreturn printDateResult>
    </cffunction>

    <cffunction  name="lastFive" returnType="any">
        <cfloop index="i" from="-1" to="-5" step=-1>
            <cfset reqDate = dateAdd('d', i, now())>
            <cfset weekCheck = dateFormat(reqDate,"ee")>
            <cfif weekcheck eq "sun">
                <cfset printColor = "red"> 

           <cfelseif weekcheck eq "mon">
                <cfset printColor = "green">

            <cfelseif weekcheck eq "tue">
                <cfset printColor = "orange">

            <cfelseif weekcheck eq "wed">
                <cfset printColor = "yellow">

            <cfelseif weekcheck eq   "thu">
                <cfset printColor = "black">

            <cfelseif weekcheck eq "fri">
                <cfset printColor = "blue">

            <cfelseif weekcheck eq "sat">
                <cfset printColor = "red">
            </cfif>
            <cfset lastFiveDate=dateFormat(reqDate,'dd-mm-yyyy-eeee')>
            <cfset lastFiveResult[printColor] = lastFiveDate>
        </cfloop>
        <cfreturn lastFiveResult>
    </cffunction>
</cfcomponent>