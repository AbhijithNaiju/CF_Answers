<html>
    <head>
        <title>Qn 12</title>
        <link rel="stylesheet" href="../bootstrap-5.3.3-dist/css/bootstrap.min.css">
    </head>
    <body class = "w-100" >
        <div class = " m-5 p-5  d-flex flex-column align-items-center border border-dark">
            <div class = "border-bottom border-dark pb-2" >
            12. In SQL create a table with firstname & last name columns. insert 10 records
            into that table.
            There is no primary key & numberic column in this table. Create a page with
            text box & submit button.
            User can enter numeric value less than 10. While click on submit, you should
            show all data from table
            as well as show Query’s nth row first name column without looping. Here n is
            value of the user input
            </div>

            <form method="POST" class = "w-100 m-4" >
                <input type="text" class = "form-control"  name="userInput" placeholder="Enter any number from 1 to 10" class = "w-50">
                <input type="submit" class = "btn btn-primary"  name="submit">
            </form>

            <cfif isDefined("form.submit")  && len(form.userInput)>
                <cfset newObject = createObject("component", "components.question_12")>
                <cfset local.result = newObject.printDigits()> 

                <cfif structKeyExists(local, "result")>
                    <table class = "table border" >
                        <tr>
                            <th>FIRST NAME</th>
                            <th>LAST NAME</th>
                        </tr>
                        <cfoutput query="local.result">
                            <tr>
                                <td>#FIRST_NAME#</td>
                                <td>#LAST_NAME#</td>
                            </tr>
                        </cfoutput>
                    </table>

                    <cfoutput>
                        <div>Nth row first name is "#local.result.FIRST_NAME[form.userInput]#"</div>
                    </cfoutput>
                </cfif>

            <cfelse>
                <cfoutput>
                    Please enter a valid number
                </cfoutput>
            </cfif>
        </div>
    </body>
</html>
