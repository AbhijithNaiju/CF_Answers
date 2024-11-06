<cfcomponent>
    <cffunction  name="printDigits" returnType="any">
        <cfargument  name="imageName" type="any"> 
        <cfargument  name="descriptionText" type="any"> 
        <cfargument  name="inputImage" type="any"> 
<!---         <cfset imagetype = imageGetProperty(attributes.inputImage, "type")> --->
        <cfif GetFileInfo("c:\Users\Abhijith\Downloads\pexels-eberhardgross-1612351.jpg").size gt 1000000>
            <cfreturn "file exeeds the input limit(1 MB)">
        <cfelse>
            <cfreturn "Ok">
        </cfif>
    </cffunction>
</cfcomponent>