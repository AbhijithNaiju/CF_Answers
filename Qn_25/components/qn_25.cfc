<cfcomponent>
    <cffunction  name = "insertValues" returntype = "struct">

        <cfargument  name = "inputText" type="string">

        <cfset local.structResult = structNew()>

        <cfloop list = "#arguments.inputText#" item = "i" delimiters = " .">

            <cfset i = trim(i)>

            <cfquery name = "wordExist">
                SELECT count(word) 
                AS wordCount 
                FROM wordsTable 
                WHERE word = <cfqueryparam value='#i#' cfsqltype="cf_sql_varchar">;
            </cfquery>

            <cfif wordExist.wordCount EQ 0>
                <cfquery name = "formInput">
                    INSERT INTO wordsTable(word) 
                    VALUES(<cfqueryparam value='#i#' cfsqltype="cf_sql_varchar">);
                </cfquery>
            </cfif>

        </cfloop>
        <cfset local.structResult["succes"] = "Text inserted successfully">
        <cfreturn local.structResult>
    </cffunction>

    <cffunction  name="createWordStruct" returntype="struct">

        <cfargument  name = "inputText" type="string">

        <cfset local.structWordCount = structNew("Ordered")>

        <cfloop list="#arguments.inputText#" item = "i" delimiters = " .">

            <cfset i = trim(i)>

            <cfif len(i) GE 3 AND  Not isNumeric(i)>

                <cfquery name = "wordExist">
                    SELECT count(word) 
                    AS wordCount 
                    FROM wordsTable 
                    WHERE word = <cfqueryparam value='#i#' cfsqltype="cf_sql_varchar">;
                </cfquery>

                <cfif wordExist.wordCount EQ 0>
                    <cfquery name = "formInput">
                        INSERT INTO wordsTable(word) 
                        VALUES('#i#');
                    </cfquery>
                </cfif>

                <cfif StructKeyExists(local.structWordCount,"#i#")>
                    <cfset local.structWordCount[i] = local.structWordCount[i]+1>
                <cfelse>
                    <cfset local.structWordCount[i] = 1>
                </cfif>

            </cfif>

        </cfloop>

        <cfreturn local.structWordCount>
    </cffunction>

    <cffunction name ="getSortedStructs" returntype="struct">

        <cfargument  name = "structWordCount" type="struct">

        <cfset local.structLengthSorted = structNew("Ordered")>
        <cfset local.structWordSorted = structNew("Ordered")>
        <cfset local.structAlphabeticSorted = structNew("Ordered")>



    <!---         Sort based on count --->
        <cfset local.sortedArray = structSort(arguments.structWordCount,"numeric","desc")>

        <cfloop array="#local.sortedArray#" item="item">
            <cfset local.structWordSorted[item] = arguments.structWordCount[item]>
        </cfloop>

        <cfset local.structResult["structWordSorted"] = local.structWordSorted>

    <!---         Sort based on alphabet --->
        <cfset local.structAlphabeticSorted = StructToSorted(arguments.structWordCount,"text","asc")>
        <cfset local.arrayLength = arrayLen(local.sortedArray)>
        <cfset local.structResult["structAlphabeticSorted"] = local.structAlphabeticSorted>

    <!---         Sort based on length --->
        <cfloop from = "1" to = "#local.arrayLength#" index="i">
            <cfloop index="j" from = "#i+1#" to = "#local.arrayLength#">

                <cfif len(local.sortedArray[i]) LT len(local.sortedArray[j])>
                    <cfset local.temp = local.sortedArray[i]>
                    <cfset local.sortedArray[i] = local.sortedArray[j]>
                    <cfset local.sortedArray[j] =  local.temp>
                </cfif>

            </cfloop>
        </cfloop>

        <cfloop array="#local.sortedArray#" item="item">
            <cfset local.structLengthSorted[item] = arguments.structWordCount[item]>
        </cfloop>
        
        <cfset local.structResult["structLengthSorted"] = local.structLengthSorted>

        <cfreturn local.structResult>
    </cffunction>
</cfcomponent>