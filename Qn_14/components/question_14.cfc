<cfcomponent>
    <cffunction  name="printDigits" returnType="any">
        <cfargument  name="imageName" type="string"> 
        <cfargument  name="descriptionText" type="string"> 
        <cfargument  name="inputImage" type="any">

        <cfset local.uploadLocation = expandPath("./Assets/Uploaded_Images/")>
        <cfset local.imageLink = "#local.uploadLocation##arguments.inputImage#">
        <cfset local.fileInformation = getFileInfo(local.imageLink)>
        <cfset local.fileExtension = listLast( local.fileInformation.path, ".")>
        <cfif local.fileInformation.size GT 1048576>
            <cfset local.result["Error"] = "Size exeeds 1 mb">

        <cfelseif local.fileExtension EQ "png" || local.fileExtension EQ "jpg" || local.fileExtension EQ "gif">
            <cfset local.result['imageName'] = arguments.imageName>
            <cfset local.result['descriptionText'] = arguments.descriptionText>
            <cfset local.result['inputImage'] = arguments.inputImage>
            <cfset session.structImage = local.result>

        <cfelse>
            <cfset local.result["Error"] = "Only png jpg or gif files are permitted">

        </cfif>
        <cfreturn local.result>
    </cffunction>
</cfcomponent>



