<html>
    <head>
        <title>Qn 21</title>
        <link rel = "stylesheet" href = "../bootstrap-5.3.3-dist/css/bootstrap.min.css">
    </head>
    <body class = "w-100" >
        <cfoutput>
            <div class = " m-5 p-5  d-flex flex-column align-items-center border border-dark">
                <div class = "border-bottom border-dark pb-2" >
                    21. Create a birthday wishes page which contains the following fields.
                        Birthday Baby Name: Text box
                        His Email Id : Text box
                        Birthday Wishes: Text area
                        Greeting image : File upload field
                        While clicking on the submit, it should send greeting mail to the birthday guy’s
                        mail id.
                        Greeting images should be in attachment along with mail.

                </div>

                <form method="POST" class = "w-100 m-4" enctype="multipart/form-data">
                    <div  class="form-group">
                        <input type="text" name = "babyName" placeholder="Birthday Baby Name" class = "form-control">
                        <input type="email" name = "emailId" placeholder="His Email Id" class = "form-control">
                        <input type="text" name = "birthdayWishes" placeholder="Birthday Wishes" class = "form-control">
                        <input type="file" name = "greetingImage" placeholder="Greeting image" class = "form-control">
                        <input type="submit" name = "submit" class = "btn btn-primary my-2" >
                    </div>
                </form>

                <cfif isDefined("form.submit") AND len(form.babyName) AND len(form.emailId) AND len(form.birthdayWishes) AND len(form.greetingImage)>

                    <cfset local.uploadLocation = expandPath("./Assets/Uploaded_Images")>
                    <cffile action="upload" filefield="form.greetingImage" destination="#local.uploadLocation#"  nameconflict="makeunique" result="fileName">
                    <cfset local.newObject = createObject("component", "components.question_21")> 
                    <cfset local.result = local.newObject.emailFunction(form.babyName,form.emailId,form.birthdayWishes,fileName.serverfile)>

                    <span class = "text-success" > #local.result# </span>
                <cfelse>
                    <span>Please fill the input fields</span>
                </cfif>
            </div>
        </cfoutput>
    </body>
</html>
