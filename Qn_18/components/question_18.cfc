<cfcomponent>
    <cffunction  name="printDigits" returnType="query">
        <cfset myquery=queryNew("id,name,email","integer,varchar,varchar")>

        <cfset queryAddRow(myquery,[{id=1,name='Dinil',email='dinil@gmail.com'},
                                    {id=2,name='Jibin',email='jibin@gmail.com'}])>

        <cfset queryAddRow(myquery)>
        <cfset querySetCell(myquery,'id',2)>
        <cfset querySetCell(myquery,'name','gosal')>
        <cfset querySetCell(myquery,'email','gosal@gmail.com')>
        <cfreturn myquery>
    </cffunction>
</cfcomponent>