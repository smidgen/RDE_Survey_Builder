var counter = 1;
var responseCounter = 1;


var responseTrack = 1;


function addInput(divName, typeDig){
     
          var newdiv = document.createElement('div');
		  
		 switch(typeDig){
			case '1':
			newdiv.innerHTML = "<div id='"+ (counter) + "'> Question " 
			+ (counter) + "<br><input type='text' name='Question"+counter+"_1'> " 
			+ "<br> <input type='button' value='Delete a Text Field' onClick=deleteInput(" + (counter) + ");></div> ";
			document.getElementById(divName).appendChild(newdiv);
			
			
			counter++;
			break;
			
			case '2':
			newdiv.innerHTML = "<div id='"+ (counter) + "'> Question " 
			+ (counter) + ":<input type='text' id='Question"+counter+"' name='Question"+counter+"_2'><br><input id='type"+counter+"' type='checkbox' name='Response"+(counter)+"_"+(responseCounter)+"'> <input type='text' name='Response"+(counter)+"_"+(responseCounter)+"'>" 
			+ "<br> <input type='button' id='check"+counter+"' value='Add another checkbox input' onClick= addAnother("+counter+")> <br> <input type='button' value='Delete a Text Field' onClick=deleteInput(" + (counter) + ")></div> ";
			document.getElementById(divName).appendChild(newdiv);
			
			responseCounter++;
			counter++;
			break;
			
			case '3':
			newdiv.innerHTML = "<div id='"+ (counter) + "'> Question " 
			+ (counter) + ":<input type='text' name='Question"+counter+"_3'><br><input type='radio' id='type"+counter+"' name='Response"+(counter)+"_"+(responseCounter)+"'> <input type='text' name='Response"+(counter)+"_"+(responseCounter)+"'>"  
			+ "<br>  <input type='button' id='check"+counter+"'  value='Add another radio button input' onClick=addAnother("+counter+")> <br> <input type='button' value='Delete a Text Field' onClick=deleteInput(" + (counter) + ")><br></div> ";
			document.getElementById(divName).appendChild(newdiv);
			
			responseCounter++;
			counter++;
			break;
			
			case '4':
			newdiv.innerHTML = "<div id='"+ (counter) + "'> Question " 
			+ (counter) + ":<input type='text' name='Question"+counter+"_4'><br><input id='type"+counter+"' type='text' name='Response"+(counter)+"_"+(responseCounter)+"'>"  
			+ "<br>  <input type='button' id='check"+counter+"'  value='Add another option for dropdown' onClick=addAnother("+counter+")> <br> <input type='button' value='Delete a Text Field' onClick=deleteInput(" + (counter) + ")><br></div> ";
			document.getElementById(divName).appendChild(newdiv);
			
			responseCounter++;
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
	newelement.id= 'Response'+(counter-1)+'_'+(responseCounter)+''; 
	newelement.name= 'Response'+(counter-1)+'_'+responseCounter+''; 
	
	newtext.type='text';
	newtext.id='Response'+(counter-1)+'_'+responseCounter+''; 
	newtext.name= 'Response'+(counter-1)+'_'+responseCounter+'';
	
	//document.getElementById(divId).appendChild(newelement);
	//document.getElementById(divId).appendChild(newtext);
	
	olddiv.insertBefore(newelement , oldelement);
	olddiv.insertBefore(newtext, oldelement);
	olddiv.insertBefore(br , oldelement);
	
	responseCounter++;
	}
	else if(test.type == 'radio'){
	
	newelement.type= 'radio';
	newelement.id= 'Response'+(counter-1)+'_'+responseCounter+''; 
	newelement.name= 'Response'+(counter-1)+'_'+responseCounter+''; 
	
	newtext.type='text';
	newtext.id='Response'+(counter-1)+'_'+responseCounter+''; 
	newtext.name= 'Response'+(counter-1)+'_'+responseCounter+'';
	
	//document.getElementById(divId).appendChild(newelement);
	//document.getElementById(divId).appendChild(newtext);
	
	olddiv.insertBefore(newelement , oldelement);
	olddiv.insertBefore(newtext, oldelement);
	olddiv.insertBefore(br , oldelement);
	
	responseCounter++;
	}
	
	else if(test.type == 'text') {
	
	newelement.type= 'text';
	newelement.id= 'Response'+(counter-1)+'_'+responseCounter+''; 
	newelement.name= 'Response'+(counter-1)+'_'+responseCounter+''; 
	
	
	//document.getElementById(divId).appendChild(newelement);
	//document.getElementById(divId).appendChild(newtext);
	
	olddiv.insertBefore(newelement , oldelement);
	
	olddiv.insertBefore(br , oldelement);
	
	responseCounter++;
	}
	
	responseTrack=divId;
}




function deleteInput(num_input){

	      var olddiv = document.getElementById(num_input);
		  
	      olddiv.parentNode.removeChild(olddiv);
		  
		  
		  
		  counter--;
		  
		  
}

function submit_form() 
{ 
	
	document.getElementById("counter").value = counter - 1;
	document.getElementById("responseCounter").value = responseCounter - 1;
	document.getElementById("mainForm").submit();
	
}