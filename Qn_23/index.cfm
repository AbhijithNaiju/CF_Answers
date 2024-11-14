<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title></title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../bootstrap-5.3.3-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="./style/index.css">
    </head>
    <cfoutput>
        <body>
            <main class="main_container">
                <div class="header_div">
                    <a href="">
                        <img src="./Assets/Images/wflogo-padding.png">
                    </a>
                </div>

                <div class="form_body">
                    <div class="form_header">
                        <p>Employment Application</p>
                        <span>Infinity Box Inc.</span>
                    </div>

                    <form  method="post" class="" enctype="multipart/form-data">

                        <div class = "error_div display_none">
                            <span class = "error_div_heading" >There was a problem with your submission.</span>
                            <div class = "error_div_description">Errors have been <span>highlighted</span> below.</div>
                        </div>

                        <div class = "form_element d-flex flex-column" id="form_element">
                            <label class="form_element_heading">Which position are you applying for? <span>*</span></label>
                            <select name="positionApplying" id="positionApplying" class = "input_field" >
                                <option value=""></option>
                                <option value="Interface Designer">Interface Designer</option>
                                <option value="Software Engineer">Software Engineer</option>
                                <option value="System Administrator">System Administrator</option>
                                <option value="Office Manager">Office Manager</option>
                            </select>
                        </div>

                        <span id="positionError" class="error_message"></span>

                        <div class = "form_element d-flex flex-column">
                            <label class="form_element_heading">Are you willing to relocate? <span>*</span></label>
                            <span class = "input_field" >
                                <input type="radio" value="yes" name="relocate" id="relocateYes" checked>
                                <label >Yes</label>
                            </span>
                            <span class = "input_field" >
                                <input type="radio" value="No" name="relocate" id="relocateNo">
                                <label >No</label>
                            </span>
                        </div>

                        <span id="relocateError" class="error_message"></span>

                        <div class = "form_element date_select d-flex flex-column">
                            <label class="form_element_heading">When can you start? <span>*</span></label>
                            <input type="date" name="startDate" id="startDate" class = "input_field" >
                        </div>

                        <span id="dateError" class="error_message"></span>

                        <div class = "form_element portfolio_link  d-flex flex-column">
                            <label class="form_element_heading">Portfolio Web Site</label>
                            <input type="text" name="portfolioLink" id="portfolioLink" value="http://" class = "input_field" >
                        </div>

                        <span id="portfolioLinkError" class="error_message"></span>

                        <div class = "form_element  d-flex flex-column">
                            <label class="form_element_heading">Attach a Copy of Your Resume</label>
                            <input type="file" name="resumeImage" class = "input_field" accept="image/*">
                        </div>

                        <div class = "form_element salary_container  d-flex flex-column">
                            <label class="form_element_heading">Salary Requirements</label>
                            <div class="d-flex salary input_field" >
                                <div >
                                    <label >$</label>
                                    <input type="number" class="salary_dollars" name="salaryDollars"> . 
                                </div>
                                <div>
                                    <input type="number" class="salary_cents" name="salaryCents">
                                </div>
                            </div>
                        </div>

                        <p>Your Contact Information</p>

                        <div class = "form_element contact_name  d-flex flex-column">
                            <label class="form_element_heading">Name<span>*</span></label>
                            <div class="d-flex input_field" >
                                <input type="text"  name="firstName" id="firstName" placeholder="FirstName">
                                <input type="text" name="lastName" id="lastName" placeholder="LastName">
                            </div>
                        </div>

                        <span id="nameError" class="error_message"></span>

                        <div class = "form_element contact_email  d-flex flex-column">
                            <label class="form_element_heading">Email<span>*</span></label>
                            <input type="text"  name="email" id="email" class = "input_field" >
                        </div>

                        <span id="emailError" class="error_message"></span>

                        <div class = "form_element contact_number  d-flex flex-column">
                            <label class="form_element_heading">Phone<span>*</span></label>
                            <div class = " input_field phone_number_container" >
                                <input type="text" name="phone1" id="number1" maxlength="3" onkeydown="validateLength3(this)">
                                <input type="text" name="phone2" id="number2" maxlength="3" onkeydown="validateLength3(this)">
                                <input type="text" name="phone3" id="number3" maxlength="4" onkeydown="validateLength3(this)">
                            </div>
                        </div>

                        <div id="phoneError" class="error_message"></div>
                        <input  onclick="validate(event)" type="submit" name="submit" class = "submit_button" >
                    </form>

                    <div class="terms">
                        This site is protected by reCAPTCHA Enterprise and 
                        the Google <a href=""> Privacy Policy</a> and <a href="">Terms of Service</a> apply
                    </div>

                    <cfif isDefined("form.submit")>
                        <cfset local.structFormElements = {}>

                        <cfloop collection="#form#" item="formitem">
                            <cfset local.structFormElements[formitem]= form[formitem]>
                        </cfloop>

                        <cfset local.filelink = "">

                        <cfif len(form.resumeImage)>
                            <cfset local.uploadLocation = expandPath("./Assets/Uploaded_Images")>
                            <cffile action="upload"
                                    filefield="form.resumeImage"
                                    destination="#local.uploadLocation#"
                                    nameconflict="makeunique" result="fileUploadData">
                            <cfset local.fileLink = "#local.uploadLocation#/#fileUploadData.SERVERFILE#">
                        </cfif>

                        <cfset local.myObj = createObject("component", "components.qn_23")>
                        <cfset local.result = local.myObj.insertValues(local.structFormElements,local.fileLink)>

                        <cfif structKeyExists(local.result, "error")>
                            <div class="text-danger text-center">#local.result["error"]#</div>
                        </cfif>

                    </cfif>
                </div>

                <div class="d-flex flex-column align-items-center">
                    <a href="">
                        <img src="./Assets/Images/wufoo-logo-500x210.png" alt="" class="bottom_logo" >
                    </a>
                    <span class="bottom_description">See how easy it is to <a href=""> create a form.</a></a></span>
                </div>
                
            </main>

            <script src="../Jquery/jquery-3.7.1.js"></script>
            <script src="./script/index.js"></script>
        </body>
    </cfoutput>
</html>