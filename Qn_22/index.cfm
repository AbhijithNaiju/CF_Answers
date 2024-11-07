<html>
    <head>
        <title>Qn 22</title>
        <link rel="stylesheet" href="../bootstrap-5.3.3-dist/css/bootstrap.min.css">
    </head>
    <body class = "w-100" >
        <cfoutput>
            <div class = " m-5 p-5  d-flex flex-column align-items-center border border-dark">
                <div class = "border-bottom border-dark pb-2" >
                    Show the below json info in table format.
                    Json:
                    [{"Name":"saravanan","Age":27,"LOCATION":"dubai"},{"Name":"Ram","Age":26,"LOCAT
                    ION":"Kovilpatti"}]
                </div>
                <form method="POST" class = "w-100 m-4 form-control" >
                    <input name="submit" type="submit" class = "btn btn-secondary w-100"  value="Button">
                </form>

                <cfif isDefined("form.submit")>
                    <cfset local.newObject = createObject("component", "components.question_22")>
                    <cfset local.result = local.newObject.printDigits()>
                    <table class = "table border">
                        <tr>
                            <cfloop collection="#local.result[1]#" item="i">
                                <th>#i#</th>
                            </cfloop>
                        </tr>
                        <cfloop array="#local.result#" ITEM="j">
                            <tr>
                                <td>#j.name#</td>
                                <td>#j.Age#</td>
                                <td>#j.Location#</td>
                            </tr>
                        </cfloop>
                        <tr></tr>
                    </table>
                <cfelse>
                    Click Button to print                   
                </cfif>
            </div>
        </cfoutput>
    </body>
</html>
