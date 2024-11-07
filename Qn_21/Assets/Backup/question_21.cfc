<cfcomponent>
    <cffunction  name="emailFunction" returnType="string">
        <cfargument name="babyName" type="any" required="true">
        <cfargument name="emailId" type="any" required="true">
        <cfargument name="birthdayWishes" type="any" required="true">
        <cfargument name="greetingImage" type="any" required="true">
        <cfset local.result = ''>
<!---         <cfset local.uploadLocation = expandPath("./Assets/")>
        <cffile action="upload" filefield="arguments.greetingImage"  destination="#local.uploadLocation#"  nameconflict="makeunique">
        <cfset uploadedImage = cffile.serverfile>
        <cfoutput>
        <h3>Uploaded Image:</h3>
        <img src="#local.uploadLocation##uploadedImage#" alt="Uploaded Image" />
        <br>
        <p>File uploaded successfully! File name: #uploadedImage#</p>
    </cfoutput>  
        <cfset imagepath = expandPath(relative_path)> --->
            <cfmail
                from = "abhijithnaiju@gmail.com"
                to = "#arguments.emailId#"
                subject = "Birthday wishes #arguments.babyName#"
                type = "text">
                #arguments.birthdayWishes#
                <cfimage action="writeToBrowser" source="#arguments.greetingImage#">
            </cfmail>
        <cfset local.result = "Email sent successfully">
        <cfreturn local.result>
    </cffunction>
</cfcomponent>