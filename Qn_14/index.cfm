<cfapplication name="myApplication" sessionmanagement=true>
<html>
<head>
<title>Qn 14</title>
<link rel="stylesheet" href="../bootstrap-5.3.3-dist/css/bootstrap.min.css">
</head>
<body class = "w-100" >
    <form method="POST" class = " m-5 p-5  d-flex flex-column align-items-center border border-dark">
        <div class = "border-bottom border-dark pb-2" >
           14. Create a form with Image name text box , description text area & Image upload
            field. User can upload only small size jpg,png and gif files. Add validation to
            check uploaded file type & file size. User should not upload a image which is
            greater than 1 MB. Once user uploaded a image,create a thumbnail image
            (20*20 size) from uploaded images. In list page, show thumbnail image & image
            name. While clicking on the image name, it should redirect the user to details
            page which will show image name, description & original uploaded image.
        </div>
        <div class = "w-100 m-4" >
            <input type="text" name="imageName" placeholder=" Image name" class = "w-50">
            <input type="text" name="descriptionText" placeholder="Description text" class = "w-50"><br>
            <cffile action = "upload" allowedExtensions="" nameConflict = "behavior" >
            <input onclick="validateNumber()" type="submit">
        </div>
        <cfif isDefined("form.imageName")  && len(form.imageName) gt 0 && isDefined("form.descriptionText")  && len(form.descriptionText) gt 0 >
            <cfset newObject = createObject("component", "components.question_14")>
            <cfset result = newObject.printDigits(form.imageName,form.descriptionText,form.inputImage)> 
            <cfdump  var="#result#">
        <cfelse>
            <cfoutput> Please enter a valid number
            </cfoutput>
        </cfif>
    </form>
</body>
</html>
