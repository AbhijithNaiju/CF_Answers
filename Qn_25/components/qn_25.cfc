<cfcomponent>
    <cffunction  name = "insertValues" returntype = "string">
        <cfargument  name = "inputText" type="string">
        <cfloop list = "#arguments.inputText#" item = "i" delimiters = " .">
            <cfset i = trim(i)>
            <cfquery name = "wordExist"  datasource = "TESTDS">
                select count(word) as wordCount from wordsTable where word = '#i#'
            </cfquery>
            <cfif wordExist.wordCount EQ 0>
                <cfquery name = "formInput"  datasource = "TESTDS">
                    insert into wordsTable(word) values('#i#');
                </cfquery>
            </cfif>
        </cfloop>
        <cfreturn "Text inserted successfully">
    </cffunction>

    <cffunction name ="getwords" returntype="struct">
        <cfargument  name = "inputText" type="string">
        <cfset local.structWordCount = structNew("Ordered")>
        <cfset local.structWordCount = structNew("Ordered")>
        <cfset local.structLengthSorted = structNew("Ordered")>
        <cfset local.structAlphabeticSorted = structNew("Ordered")>

        <cfloop list="#arguments.inputText#" item = "i" delimiters = " ">
            <cfset i = trim(i)>
            <cfquery name = "wordExist"  datasource = "TESTDS">
                select count(word) as wordCount from wordsTable where word = '#i#'
            </cfquery>

            <cfif wordExist.wordCount EQ 0>
                <cfquery name = "formInput"  datasource = "TESTDS">
                    insert into wordsTable(word) values('#i#');
                </cfquery>
            </cfif>

            <cfif StructKeyExists(local.structWordCount,"#i#")>
                <cfset local.structWordCount[i] = local.structWordCount[i]+1>
            <cfelse>
                <cfset local.structWordCount[i] = 1>
            </cfif>
        </cfloop>

<!---         Sort based on count --->
        <cfset local.sortedArray = structSort(structWordCount,"numeric","desc")>
        <cfloop array="#local.sortedArray#" item="item">
            <cfset local.structWordCount[item] = local.structWordCount[item]>
        </cfloop>

        <cfset local.structResult["structWordCount"] = local.structWordCount>

<!---         Sort based on alphabet --->
        <cfset local.structAlphabeticSorted = StructToSorted(local.structWordCount,"text","asc")>
        <cfset local.arrayLength = arrayLen(local.sortedArray)>

        <cfset local.structResult["structAlphabeticSorted"] = local.structAlphabeticSorted>

        <cfloop from = "1" to = "#local.arrayLength#" index="i">
            <cfloop index="j" from = "#i+1#" to = "#local.arrayLength#">
                <cfif len(local.sortedArray[i]) LT len(local.sortedArray[j])>
                    <cfset local.temp = local.sortedArray[i]>
                    <cfset local.sortedArray[i] = local.sortedArray[j]>
                    <cfset local.sortedArray[j] =  local.temp>
                </cfif>
            </cfloop>
        </cfloop>


<!---         Sort based on length --->
<cfdump  var="#local.sortedArray#">
        <cfloop array="#local.sortedArray#" item="item">
            <cfset local.structWordCount[item] = local.structWordCount[item]>
        </cfloop>

        <cfset local.structResult["structLengthSorted"] = local.structWordCount>

        <cfreturn local.structResult>
    </cffunction>
</cfcomponent>