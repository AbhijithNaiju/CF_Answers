<html>
    <head>
        <title>Qn 14</title>
        <link rel="stylesheet" href="../bootstrap-5.3.3-dist/css/bootstrap.min.css">
    </head>
    <body class = "w-100" >
    <cfoutput>
            <div class = " m-5 p-5  d-flex flex-column align-items-center border border-dark">
                <div class = "border-bottom border-dark pb-2" >
                14. Create a form with Image name text box , description text area & Image upload
                    field. User can upload only small size jpg,png and gif files. Add validation to
                    check uploaded file type & file size. User should not upload a image which is
                    greater than 1 MB. Once user uploaded a image,create a thumbnail image
                    (20*20 size) from uploaded images. In list page, show thumbnail image & image
                    name. While clicking on the image name, it should redirect the user to details
                    page which will show image name, description & original uploaded image.
                </div>

                <form method="POST" class = "w-100 m-4 " enctype="multipart/form-data">
                    <input type="text" name="imageName" placeholder=" Image name" class = "form-control" >
                    <input type="text" name="descriptionText" placeholder="Description text"   class = "form-control"><br>
                    <input type="file" name="inputImage" class="form-control">
                    <input name="submit" type="submit" class="btn btn-secondary w-100 my-1">
                </form>

                <cfif isDefined("form.submit")  && len(form.imageName) && len(form.descriptionText) && len(form.inputImage) gt 0>
<!---                 <cffile  action="upload" destination="C:\ColdFusion2021\cfusion\wwwroot\CF_Answers\Qn_14\Assets" filefield="form.inputImage" nameconflict="makeunique"> --->
                    <cfset local.newObject = createObject("component", "components.question_14")>
                    <cfset local.result = local.newObject.printDigits(form.imageName,form.descriptionText,form.inputImage)> 
                    
                    <div class="w-100">
                        <div class = "w-25" ><cfimage action="writeToBrowser" width="100%" source="#local.result['inputImage']#"></div>
                        <a class = "w-50" href="./showImage.cfm">#local.result['imageName']#</a>
                    </div>
                <cfelse>
                    <span class = "text-danger" >Please fill the fields</span>
                </cfif>
            </div>
        </cfoutput>
    </body>
</html>
