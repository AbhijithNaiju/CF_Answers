<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Qn-24</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../bootstrap-5.3.3-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="./style/index.css">
    </head>
    <cfoutput>
        <body>
            <div class="form_body">
                <div class="form_header">
                    <p>EMAIL LOGIN</p>
                    <span></span>
                </div>

                <form  method="post" class="">
                    <p>Fill the fields</p>
                    <div class = "form_element contact_name  d-flex flex-column">
                        <label class="form_element_heading">Name<span>*</span></label>
                        <input type="text"  name="firstName" id="firstName" placeholder="FirstName" class="form-control">
                    </div>
                    <span id="nameError" class="error_message"></span>

                    <div class = "form_element contact_name  d-flex flex-column">
                        <label class="form_element_heading">Email ID<span>*</span></label>
                        <input type="text"  name="email" id="email" placeholder="Email" class="form-control" onkeydown="valueChange()">
                    </div>
                    <div id="emailError" class="error_message"></div>

                    <input type="button" onclick="validate()" class="btn btn-secondary" value="Check Email">
                    <input  type="submit" id="submitButton" name="submit" class="btn btn-primary" disabled>
                </form>
            </div>
            <cfif isDefined("form.submit")>
                <cfset local.myObj = createObject("component", "components.qn_24")>
                <cfset local.result = local.myObj.insertValues(form.firstName,form.email)>
            </cfif>
            <script src="../Jquery/jquery-3.7.1.js"></script>
            <script src="./script/index.js"></script>
        </body>
    </cfoutput>
</html>