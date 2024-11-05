<cfcomponent>
    <cffunction  name="printDigits" returnType="any">
        <cfargument  name="captcha" type="any"> 
        <cfargument  name="captchaInput" type="any"> 
        <cfargument  name="email" type="any"> 
        <cfif arguments.captcha eq arguments.captchainput>
            <cfreturn "">
        </cfif>
        <cfset reg_expression = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/>
        <cfif REMatchNoCase(reg_expression, string)>
            <cfreturn "">
        </cfif>
        <cfreturn >
    </cffunction>
</cfcomponent>