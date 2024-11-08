<cfcomponent>
    <cffunction  name = "emailFunction" returnType="string">
        <cfargument name = "babyName" type = "string" required = "true">
        <cfargument name = "emailId" type = "string" required = "true">
        <cfargument name = "birthdayWishes" type = "string" required = "true">
        <cfargument name = "greetingImage" type = "any" required = "true">
        <cfset local.result = ''>
        <cfmail
            from = "abhijithnaiju@gmail.com"
            to = "#arguments.emailId#"
            subject = "Birthday wishes #arguments.babyName#"
            type = "text">
            #arguments.birthdayWishes#<br>
            <cfimage action = "writeToBrowser" width = "50%" source = "#arguments.greetingImage#">
        </cfmail>
        <cfset local.result = "Email sent successfully">
        <cfreturn local.result>
    </cffunction>
</cfcomponent>