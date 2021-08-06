// Get the modal
var modal = document.getElementsByClassName('myModal')[0];

// Get the button that opens the modal
var btn = document.getElementsByClassName("myBtn")[0];

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

var modall = 0;

$(function(){
	$(document).on('click', '.myBtn', function(){
		
		// Get the modal
		modall = $(this).closest('tr').prevAll().length/2 - 1;
		modal = document.getElementsByClassName('myModal')[modall];
		
		// Get thevar button that opens the modal
		btn = document.getElementsByClassName("myBtn")[modall];
		
		// Get the <span> element that closes the modal
		span = document.getElementsByClassName("close")[modall];
		
		console.log(span);
		
		
		// When the user clicks on the button, open the modal
		// $(".myModal:nth-child("+modall+")").css("display","block");
		modal.style.display = "block";
	});
	
	// When the user clicks on <span> (x), close the modal
	$('.close').on("click", function(){
		modal.style.display = "none";
	});
	
	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}
});