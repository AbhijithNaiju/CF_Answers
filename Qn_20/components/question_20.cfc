<cfcomponent>
    <cffunction  name="printDigits" returnType="any">
        <cfargument  name="captcha" type="any"> 
        <cfargument  name="captchaInput" type="any"> 
        <cfargument  name="email" type="any"> 
        <cfset inputemail = arguments.email>
        <cfif not Compare( arguments.captcha, arguments.captchainput )>
            <cfset result["captchaResult"]=1>
        <cfelse>
            <cfset result["captchaResult"]=0>
        </cfif>
        <cfset result["emailResult"] = refind("^[0-9A-Za-z.'+_-]+@([0-9A-Za-z-]+\.)+[A-Za-z]+$", trim(arguments.email))>
        <cfreturn result>
    </cffunction>
</cfcomponent>