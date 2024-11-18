<cfcomponent>
    <cffunction  name = "printDigits" returnType="struct">
    
        <cfargument  name = "captcha" type="string"> 
        <cfargument  name = "captchaInput" type="string"> 
        <cfargument  name = "email" type="string"> 

        <cfif not Compare( arguments.captcha, arguments.captchainput )>
            <cfset local.result["captchaResult"] = 1>
        <cfelse>
            <cfset local.result["captchaResult"] = 0>
        </cfif>

        <cfset local.result["emailResult"] = refind("^[0-9A-Za-z.'+_-]+@([0-9A-Za-z-]+\.)+[A-Za-z]+$", trim(arguments.email))>

        <cfreturn local.result>
    </cffunction>
</cfcomponent>