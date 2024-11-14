$(document).ready(function(){

	$("#listContainer>.page_heading").click(function(event){

		if($(this).next().hasClass('active'))
		{
			$(this).next().removeClass('active');
		}
		else
		{
			$(".page_heading").next().removeClass('active');
			$(this).next().addClass('active');
		}
	});

});

function confirmDelete()
{
	alert('Are you sure to delete the page');
}

function logout()
{
	if(confirm("You will log out of this page and need to authenticate again to login"))
	{
		$.ajax({
			type:"POST",
			url:"./components/question_28.cfc?method=logout",
			success: function() {
				location.reload();
			}
		});
	}
}
function deletePage(pageId)
{
	if(confirm("Confirm delete"))
	{
		$.ajax({
			type:"POST",
			url:"./components/question_28.cfc?method=deletePage",
			data:{pageId:pageId.value},
			success: function() {
				location.reload();
			}
		});
	}
}
