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

                <cfif isDefined("form.submit") AND structKeyExists(form, "inputFile") AND len(form.inputFile)>

                    <cfset local.uploadLocation = expandPath("./uploads/")>
                    <cffile action="upload" fileField="inputFile" destination="#local.uploadLocation#" nameConflict="makeUnique" result="uploadResult">

                    <cfset local.fileInfo = getFileInfo("#local.uploadLocation##uploadResult.serverfile#")>
                    <cfset local.fileExtension = listLast( local.fileInfo.path, ".")>

                    <cfif local.fileExtension EQ "txt">

                        <cffile  action="read" file="#form.inputFile#" variable = "inputText">
                        <cfset local.myObj = createObject("component", "components.qn_26")>
                        <cfset local.result = local.myObj.insertValues(inputText)>

                        <cfif structKeyExists(local.result, "success")>
                            <div class = "text-center text-success">#local.result#</div>
                        </cfif>

                    <cfelse>

                        <div class="text-center text-danger">Only .txt files are allowed.</div>

                    </cfif>
                <cfelseif isDefined("form.submit")>
                    <div class = "text-center text-danger">Please enter the file</div>
                </cfif>

            </div>
        </body>
    </cfoutput>
</html>