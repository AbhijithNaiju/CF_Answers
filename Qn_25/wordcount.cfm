<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Qn-25-Word Count</title>
        <meta name="description" content="">
        <meta name = "viewport" content = "width=device-width, initial-scale=1">
        <link rel = "stylesheet" href="../bootstrap-5.3.3-dist/css/bootstrap.min.css">
        <link rel = "stylesheet" href="./style/index.css">
    </head>
    <cfoutput>
        <body>
            <div class="form_body">
                <div class="form_header">
                    <p>Task 2</p>
                    <span>Word Count</span>
                </div>

                <form  method="post" class="">
                    <div class = "form_element contact_name  d-flex flex-column">
                        <label class="form_element_heading">Enter the text<span>*</span></label>
                        <textarea  name="inputtext" id="inputtext" placeholder="Text" class="form-control"></textarea>
                    </div>
                    <span id="nameError" class="error_message"></span>

                    <input  type="submit" id="submitButton" name="submit" class="btn btn-primary" >
                    <a href="./index.cfm" class = "btn btn-secondary" >Home</a>
                </form>

                <cfif isDefined("form.submit") AND len(trim(form.inputtext))>
                    <cfset local.myObj = createObject("component", "components.qn_25")>
                    <cfset local.successResult = local.myObj.insertValues(form.inputtext)>
                    <div class = "text-center text-success">#local.successResult#</div>

                    <cfset local.wordCountResult = local.myObj.getwords(form.inputtext)>
                    <cfdump  var="#local.wordCountResult#">

                <cfelseif isDefined("form.submit")>
                    <div class = "text-center text-danger">Please enter the text</div>
                </cfif>
            </div>
        </body>
    </cfoutput>
</html>