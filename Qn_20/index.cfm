<cfapplication name="myApplication" sessionmanagement=true>
<html>
<head>
<title>Qn 20</title>
<link rel="stylesheet" href="../bootstrap-5.3.3-dist/css/bootstrap.min.css">
</head>
<body class = "w-100" >
    <form method="POST" class = " m-5 p-5  d-flex flex-column align-items-center border border-dark">
        <div class = "border-bottom border-dark pb-2" >
           20. Create a page with two textboxes (captcha and email). Create captcha using
            cfimage tag.To validate the fields captcha(text validation) and email(email
            validation)using server side validation.Once user entered the captcha &
            clicked on submit,then check the entered text is equal to captcha text.If
            correct then Page should show the message(Email Address successfully
            subscribe our newsletter).

        </div>
        <cfset mycaptcha = "MYCAPTCHa">
        <cfimage action="captcha" text="#mycaptcha#" difficulty="medium" fontSize="18">
        <div class = "w-100 m-4" >
            <input type="text" name="inputcaptcha" placeholder="Enter the captcha" class = "w-50">
            <input type="text" name="inputemail" placeholder="Enter your Email" class = "w-50">
            <input onclick="validateNumber()" type="submit">
        </div>
        <cfif isDefined("form.inputText1")  && len(form.inputText1) gt 0 && isDefined("form.inputText2")  && len(form.inputText2) gt 0 >
            <cfset newObject = createObject("component", "components.question_20")>
            <cfset result = newObject.printDigits(mycaptcha,form.inputcaptcha,form. inputemail)> 
            <cfoutput>
                #result#
            </cfoutput>
        <cfelse>
            <cfoutput> Please enter a valid number
            </cfoutput>
        </cfif>
    </form>
</body>
</html>
