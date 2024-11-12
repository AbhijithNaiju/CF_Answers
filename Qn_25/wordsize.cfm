<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Qn-25-Word Count</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../bootstrap-5.3.3-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="./style/index.css">
    </head>
    <cfoutput>
        <body>
            <div class="form_body">
                <div class="form_header">
                    <p>Task 2</p>
                    <span>Word Count</span>
                </div>

                <form  method="post" class="">
                    <input  type="submit" id="submitButton" name="submit" class="btn btn-primary" value = "PRINT">
                    <a href="./index.cfm" class = "btn btn-secondary" >HOME</a>

                </form>

                <cfif isDefined("form.submit")>
                    <cfset local.myObj = createObject("component", "components.qn_25")>
                    <cfset local.result = local.myObj.getwords()>
                    <div class = "text-center text-success"></div>
                    <cfloop collection="#local.result#" item="word">
                        <div class="text-center">#word# #local.result[word]#</div>
                    </cfloop>
                <cfelseif isDefined("form.submit")>
                    <div class = "text-center text-danger">Please enter the text</div>
                </cfif>
            </div>
        </body>
    </cfoutput>
</html>