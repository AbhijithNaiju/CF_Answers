<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Qn-26</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../bootstrap-5.3.3-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="./style/index.css">
    </head>
    <cfoutput>
        <body>
            <div class="form_body">
                <div class="form_header">
                    <p>Text</p>
                    <span>ColdFusion & DB</span>
                </div>

                <form  method="post" class = "" enctype="multipart/form-data">
                    <div class = "form_element contact_name  d-flex flex-column">
                        <label class = "form_element_heading">Enter the text<span>*</span></label>
                        <input type = "file" name = "inputFile" class = "form-control" accept=".txt">
                    </div>

                    <input  type="submit" id="submitButton" name="submit" class="btn btn-primary" >
                </form>

                <cfif isDefined("form.submit")>
                    <cffile  action="read" file="#form.inputFile#" variable = "inputText">
                    <cfset local.myObj = createObject("component", "components.qn_26")>
                    <cfset local.result = local.myObj.insertValues(inputText)>
                    <div class = "text-center text-success">#local.result#</div>
                <cfelseif isDefined("form.submit")>
                    <div class = "text-center text-danger">Please enter the text</div>
                </cfif>
            </div>
        </body>
    </cfoutput>
</html>