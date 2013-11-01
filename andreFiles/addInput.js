var counter = 1;
function addInput(divName, typeDig){
     
          var newdiv = document.createElement('div');
		  
		 switch(typeDig){
			case '1':
			newdiv.innerHTML = "<div id='"+ (counter) + "'> Question " 
			+ (counter) + "<br><input type='text' name='Question"+counter+"'> " 
			+ "<br> <input type='button' value='Delete a Text Field' onClick=deleteInput(" + (counter) + ");></div> ";
			document.getElementById(divName).appendChild(newdiv);
			counter++;
			break;
			
			case '2':
			newdiv.innerHTML = "<div id='"+ (counter) + "'> Question " 
			+ (counter) + "<br><input type='checkbox' name='Question"+counter+"'> <input type='text' name='Question"+counter+"'>" 
			+ "<br> <input type='button' value='Add another checkbox input' onClick='addInput('dynamicInput', '2');> <br> <input type='button' value='Delete a Text Field' onClick=deleteInput(" + (counter) + ");></div> ";
			document.getElementById(divName).appendChild(newdiv);
			counter++;
			break;
			
			case '3':
			newdiv.innerHTML = "<div id='"+ (counter) + "'> Question " 
			+ (counter) + "<br><input type='radio' name='Question"+counter+"'> <input type='text' name='Question"+counter+"'>"  
			+ "<br>  <input type='button' value='Add another radio button input' onClick=addInput(`dynamicInput`, `3`);> <br> <input type='button' value='Delete a Text Field' onClick=deleteInput(" + (counter) + ")><br></div> ";
			document.getElementById(divName).appendChild(newdiv);
			counter++;
			break;
    }
}

function deleteInput(num_input){

	      var olddiv = document.getElementById(num_input);
	      olddiv.parentNode.removeChild(olddiv);
		  counter--;
		  
}

function submit_form() 
{ 
	
	document.getElementById("counter").value = counter - 1;
	document.getElementById("mainForm").submit();
 
    
}