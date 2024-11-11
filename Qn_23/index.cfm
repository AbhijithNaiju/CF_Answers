<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title></title>        
        <link rel="stylesheet" href="./css/style.css">
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
                        <div class = "form_element d-flex flex-column">
                            <label class="form_element_heading">Which position are you applying for? <span>*</span></label>
                            <select name="positionApplying" id="positionApplying">
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
                            <span>
                                <input type="radio" value="yes" name="relocate" id="relocateYes" checked>
                                <label >Yes</label>
                            </span>
                            <span>
                                <input type="radio" value="No" name="relocate" id="relocateNo">
                                <label >No</label>
                            </span>
                        </div>
                        <span id="relocateError" class="error_message"></span>
                        <div class = "form_element date_select d-flex flex-column">
                            <label class="form_element_heading">When can you start? <span>*</span></label>
                            <input type="date" name="startDate" id="startDate">
                        </div>
                        <span id="dateError" class="error_message"></span>
                        <div class = "form_element portfolio_link  d-flex flex-column">
                            <label class="form_element_heading">Portfolio Web Site</label>
                            <input type="text" name="portfolioLink" value="http://">
                        </div>
                        <div class = "form_element  d-flex flex-column">
                            <label class="form_element_heading">Attach a Copy of Your Resume</label>
                            <input type="file" name="resumeImage">
                        </div>
                        <div class = "form_element salary_container  d-flex flex-column">
                            <label class="form_element_heading">Salary Requirements</label>
                            <div class="d-flex salary">
                                <div>
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
                            <div class="d-flex">
                                <input type="text"  name="firstName" id="firstName" placeholder="FirstName">
                                <input type="text" name="lastName" id="lastName" placeholder="LastName">
                            </div>
                        </div>
                        <span id="nameError" class="error_message"></span>
                        <div class = "form_element contact_email  d-flex flex-column">
                            <label class="form_element_heading">Email<span>*</span></label>
                            <input type="text"  name="email" id="email">
                        </div>
                        <span id="emailError" class="error_message"></span>
                        <div class = "form_element contact_number  d-flex flex-column">
                            <label class="form_element_heading">Phone<span>*</span></label>
                            <input type="text" name="phone" id="number">
                        </div>
                        <div id="phoneError" class="error_message"></div>
                        <input  onclick="validate()" type="submit" name="submit">
                    </form>
                    <div class="terms">
                        This site is protected by reCAPTCHA Enterprise and 
                        the Google <a href=""> Privacy Policy</a> and <a href="">Terms of Service</a> apply
                    </div>
                </div>
                <div class="d-flex flex-column align-items-center">
                    <a href="">
                        <img src="./Assets/Images/wufoo-logo-500x210.png" alt="" class="bottom_logo" >
                    </a>
                    <span class="bottom_description">See how easy it is to <a href=""> create a form.</a></a></span>
                </div>
            </main>
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
                <spam>#local.result#</span>
            </cfif>
            <script src="./script/index.js"></script>
        </body>
    </cfoutput>
</html>