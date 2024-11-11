function printOutput(printLocation,printValue)
{
	document.getElementById(printLocation).innerHTML = printValue;
}
function validate()
{
    let positionApplying=document.getElementById("positionApplying").value;
    let firstName=document.getElementById("firstName").value;
	let email=document.getElementById("email").value;
	let number=document.getElementById("number").value;
    let startDate=document.getElementById("startDate").value;
    var name_check=/[^a-zA-Z0-9\s]/;
	var email_match=/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

    if(firstName.length==0)
	{
       nameError="Please enter your first name";
	}
	else if(name_check.test(firstName))
	{
        nameError="Name should not contain any special charector";
	}
	else
	{
        nameError="";
	}
    printOutput("nameError",nameError);
    if(email.length==0)
    {
        emailError = "Please enter the email";
    }
    else if(email_match.test(email)!=true)
    {
        emailError = "Please enter a valid email";
    }
    else
    {
        emailError = "";
    }
    printOutput("emailError",emailError);
    if(number.length==0)
    {
        phoneError = "Please enter the phone number";
    }
    else if(isNaN(number))
    {
        phoneError = "Please Enter a valid number";
    }
    else if(number.length!=10)
    {
        phoneError = "Phone number must be 10 letters";
    }
    else
    {
        phoneError = "";
    }
    printOutput("phoneError",phoneError);
    if(startDate=="")
    {
        dateError = "Please select the date you can start";
    }
    else
    {
        dateError = "";
    }
    printOutput("dateError",dateError);
    if(positionApplying=="")
    {
        positionError = "Please select  position you are applying for";
    }
    else
    {
        positionError = "";
    }
    printOutput("positionError",positionError);
    if(document.getElementById("relocateYes").checked || document.getElementById("relocateNo").checked )
    {

        relocateError = "";
    }
    else
    {
        relocateError = "Pleases select one";
    }
    printOutput("relocateError",relocateError);

    if(nameError != "" || emailError != "" || phoneError != "" || dateError != "" || relocateError != "" || positionError != "")
    {
        event.preventDefault();
    }
}