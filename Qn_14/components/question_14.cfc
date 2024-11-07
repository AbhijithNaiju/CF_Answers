<cfcomponent>
    <cffunction  name="printDigits" returnType="any">
        <cfargument  name="imageName" type="string"> 
        <cfargument  name="descriptionText" type="string"> 
        <cfargument  name="inputImage" type="any"> 
        <cfset imageSize = getFileInfo(arguments.inputImage).size>
        <cfif imagesize GT 1048576>
            <cfset local.result["Error"] = "Size exeeds 1 mb">
        <cfelse>
            <cfset myImage = imageRead(arguments.inputImage)>
            <cfset local.result['imageName'] = arguments.imageName>
            <cfset local.result['descriptionText'] = arguments.descriptionText>
            <cfset local.result['inputImage'] = myImage>
            <cfset session.structImage = local.result>
        </cfif>
        <cfreturn local.result>
    </cffunction>
</cfcomponent>