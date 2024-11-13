function printOutput(printLocation,printValue)
{
	document.getElementById(printLocation).innerHTML = printValue;
}
function validate()
{
    let positionApplying=document.getElementById("positionApplying").value;
    let firstName=document.getElementById("firstName").value;
	let email=document.getElementById("email").value;
    let startDate=document.getElementById("startDate").value;
    let portfolioLink=document.getElementById("portfolioLink").value;
	let number1=document.getElementById("number1").value;
	let number2=document.getElementById("number2").value;
	let number3=document.getElementById("number3").value;
    let phoneNumber=number1+number2+number3;
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
    if(phoneNumber.length==0)
    {
        phoneError = "Please enter the phone number";
    }
    else if(isNaN(phoneNumber))
    {
        phoneError = "Please Enter a valid number";
    }
    else if(phoneNumber.length!=10)
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

    if(isUrlValid(portfolioLink))
    {
        portfolioLinkError=""
    }
    else
    {
        portfolioLinkError="Please enter a valid URL"
    }
    printOutput("portfolioLinkError",portfolioLinkError);

    if(nameError != "" || emailError != "" || phoneError != "" || dateError != "" || relocateError != "" || positionError != "" || portfolioLinkError != "")
    {
        event.preventDefault();
    }
}

function validateLength3(inputValue) {
    if (inputValue.value.length >= 3){
        $(inputValue).next().focus();
    }
    if (inputValue.value.length <= 0){
        $(inputValue).prev().focus();
    }
  }

$(".input_field").click(function(){
    $(".form_element").removeClass("selected_element");
    $(this).parent().addClass("selected_element");
})

function isUrlValid(string) {
    try {
      new URL(string);
      return true;
    } catch (err) {
      return false;
    }
   }