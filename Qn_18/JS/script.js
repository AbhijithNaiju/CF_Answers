function validateNumber()
{
    let number=document.getElementById("inputText1").value;
    if(number.length==0)
        {
            alert( "Please enter the phone number");
            event.preventDefault()
        }
        else if(isNaN(number))
        {
            alert("Please Enter a valid number");
            event.preventDefault()
        }
}