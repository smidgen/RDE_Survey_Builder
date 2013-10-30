var counter = 1;
function addInput(divName){
     
          var newdiv = document.createElement('div');
          newdiv.innerHTML = "<div id='"+ (counter) + "'> Question " 
		  + (counter) + " <br><input type='text' name='Question'> <br> Question id: " 
		  + (counter) + "<br><input type ='text' name='Question_id' value='" 
		  + (counter) + "'> <br> <input type='button' value='Delete a Text Field' onClick=deleteInput(" + (counter) + ");></div> ";
          document.getElementById(divName).appendChild(newdiv);
          counter++;
    
}

function deleteInput(num_input){

	      var olddiv = document.getElementById(num_input);
	      olddiv.parentNode.removeChild(olddiv);
		  counter--;
		  
}

function submit_form() 
{ 
	document.getElementById("mainForm").submit();
  
     document.getElementById("nextForm").submit();
    
}