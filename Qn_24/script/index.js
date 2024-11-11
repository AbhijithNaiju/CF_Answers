function printOutput(printLocation,printValue)
{
	document.getElementById(printLocation).innerHTML = printValue;
}
function validate()
{
    let firstName = document.getElementById("firstName").value;
	let email = document.getElementById("email").value;
    let submitButton = document.getElementById("submitButton")
    let name_check = /[^a-zA-Z0-9\s]/;
	let email_match = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    var nameError = "";
    var emailError = "";
    if(firstName.length == 0)
	{
       nameError="Please enter your first name";
	}
	else if(name_check.test(firstName))
	{
        nameError="Name should not contain any special charector";
	}
    printOutput("nameError",nameError);
    if(email.length == 0)
    {
        emailError = "Please enter the email";
    }
    else if(email_match.test(email)!=true)
    {
        emailError = "Please enter a valid email";
    }
    printOutput("emailError",emailError);
   
    if(nameError == "" && emailError == "")
    {
        $.ajax({
            type:"POST",
            url:"./components/qn_24.cfc?method=emailExists",
            data: {email:email},
            success: function(result) {
                if(result)
                {
                    submitButton.disabled = true;
                    printOutput("emailError","Email already exists");
                }
                else
                {
                    submitButton.disabled = false ;
                    printOutput("emailError","");
                }
            }
        });
    }
    else{
        submitButton.disabled = true;
    }
}
function valueChange()
{
    submitButton.disabled = true;
}