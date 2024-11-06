<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title></title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="./Assets/style/style.css">
        <link rel="stylesheet" href="../bootstrap-5.3.3-dist/css/bootstrap.min.css">
    </head>
    <body >
        <cfoutput>
            <cfif structKeyExists(session,"structImage")>
                <div class = "w-100 d-flex flex-column align-items-center">
                    <div class = "imageContainer" >
                        <cfimage action="writeToBrowser" width="100%" height="100%" source="#session.structImage['inputImage']#">
                    </div>
                    <div>#session.structImage['imageName']#</div>
                    <div>#session.structImage['descriptionText']#</div>
                </div>
            <cfelse>
                <div class = "text-danger">Error</div> 
            </cfif>
        </cfoutput>
    </body>
</html>