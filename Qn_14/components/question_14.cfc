<cfcomponent>
    <cffunction  name="printDigits" returnType="any">
        <cfargument  name="imageName" type="string"> 
        <cfargument  name="descriptionText" type="string"> 
        <cfargument  name="inputImage" type="any"> 
        <cfset local.imageSize = getFileInfo(arguments.inputImage).size>
        <cfif local.imageSize GT 1048576>
            <cfset local.result["Error"] = "Size exeeds 1 mb">
        <cfelse>
            <cfset localmyImage = imageRead(arguments.inputImage)>
            <cfset local.result['imageName'] = arguments.imageName>
            <cfset local.result['descriptionText'] = arguments.descriptionText>
            <cfset local.result['inputImage'] = localmyImage>
            <cfset session.structImage = local.result>
        </cfif>
        <cfreturn local.result>
    </cffunction>
</cfcomponent>