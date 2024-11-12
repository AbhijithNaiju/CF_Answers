<html>
    <head>
        <title>Qn 4</title>        
        <link rel="stylesheet" href="./css/style.css">
        <link rel="stylesheet" href="../bootstrap-5.3.3-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="./css/style.css">
    </head>
    <body class = "w-100" >
        <cfoutput>
            <div class = " m-5 p-5  d-flex flex-column align-items-center border border-dark border-bottom border-dark pb-2" >
                <div class = "border-bottom border-dark" >
                    4. Show below details in a page
                    Today's date, current Month in numeric, current month in word, Last friday
                    date, Last day of month. Show Last 5 days date & day like below.
                    Sunday should be red,<br>
                    Monday - green,<br>
                    Tuesday - orange,<br>
                    Wednesday - yellow,<br>
                    Thursday - bold black,<br>
                    Friday - blue,<br>
                    Saturday - bold red<br>
                    02-Dec-2010 - Thursday<br>
                    01-Dec-2010 - Wednesday<br>
                    30-Nov-2010 - Tuesday<br>
                    29-Dec-2010 - Monday<br>
                    28-Dec-2010 - Sunday<br>
                </div>

                <cfset local.newObject = createObject("component", "components.question_4")>
                <cfset local.printDateResult = local.newObject.printdate()>
                <cfset local.lastFive = local.newObject.lastFive()>

                <cfloop collection="#local.printDateResult#" item="j">
                    <p>#j# = #local.printDateResult[j]#</p>
                </cfloop>

                <cfloop collection = "#local.lastFive#" item = "i">
                    <p class = "#local.lastFive[i]#">
                        #i#
                    </p>
                </cfloop>
            </div> 
        </cfoutput>
    </body>
</html>
