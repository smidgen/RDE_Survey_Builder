var counter = 1;
var responsecounter = 2;
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
			+ (counter) + ":<input type='text' id='Question"+counter+"' name='Question"+counter+"'><br><input id='type"+counter+"' type='checkbox' name='Response"+counter+"'> <input type='text' name='Response"+counter+"'>" 
			+ "<br> <input type='button' id='check"+counter+"' value='Add another checkbox input' onClick= addAnother("+counter+")> <br> <input type='button' value='Delete a Text Field' onClick=deleteInput(" + (counter) + ")></div> ";
			document.getElementById(divName).appendChild(newdiv);
			counter++;
			break;
			
			case '3':
			newdiv.innerHTML = "<div id='"+ (counter) + "'> Question " 
			+ (counter) + ":<input type='text' name='Question"+counter+"'><br><input type='radio' id='type"+counter+"' name='Response"+counter+"'> <input type='text' name='Response"+counter+"'>"  
			+ "<br>  <input type='button' id='check"+counter+"'  value='Add another radio button input' onClick=addAnother("+counter+")> <br> <input type='button' value='Delete a Text Field' onClick=deleteInput(" + (counter) + ")><br></div> ";
			document.getElementById(divName).appendChild(newdiv);
			counter++;
			break;
    }
}

function addAnother(divId){

	var newelement = document.createElement('input');
	var newtext = document.createElement('input');
	var oldelement = document.getElementById('check'+divId+'');
	var olddiv = document.getElementById(divId);
	var br = document.createElement("br");
	var typeDig = '2';
	
	var test = document.getElementById('type'+divId+'');
	
	if(test.type == 'checkbox')
	{
	
	newelement.type= 'checkbox';
	newelement.id= 'Response'+counter+''; 
	newelement.name= 'Response'+counter+''; 
	
	newtext.type='text';
	newtext.id='Response'+counter+''; 
	newtext.name= 'Response'+counter+'';
	
	//document.getElementById(divId).appendChild(newelement);
	//document.getElementById(divId).appendChild(newtext);
	
	olddiv.insertBefore(newelement , oldelement);
	olddiv.insertBefore(newtext, oldelement);
	olddiv.insertBefore(br , oldelement);
	responsecounter++;
	}
	else{
	
	newelement.type= 'radio';
	newelement.id= 'Response'+counter+''; 
	newelement.name= 'Response'+counter+''; 
	
	newtext.type='text';
	newtext.id='Response'+counter+''; 
	newtext.name= 'Response'+counter+'';
	
	//document.getElementById(divId).appendChild(newelement);
	//document.getElementById(divId).appendChild(newtext);
	
	olddiv.insertBefore(newelement , oldelement);
	olddiv.insertBefore(newtext, oldelement);
	olddiv.insertBefore(br , oldelement);
	responsecounter++;
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