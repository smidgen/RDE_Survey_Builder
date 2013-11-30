var counter = 1;
var responseCounter = 1;


var responseTrack = 1;


var min = 10;
var max = 99;
var randNum = Math.floor(Math.random() * (max - min +1)) + min;
var randStr;

var alphabet = new Array();
alphabet[0] = "a";
alphabet[1] = "b";
alphabet[2] = "c";
alphabet[3] = "d";
alphabet[4] = "e";
alphabet[5] = "f";
alphabet[6] = "g";
alphabet[7] = "h";
alphabet[8] = "i";
alphabet[9] = "j";
alphabet[10] = "k";
alphabet[11] = "l";
alphabet[12] = "m";
alphabet[13] = "n";
alphabet[14] = "o";
alphabet[15] = "p";
alphabet[16] = "q";
alphabet[17] = "r";
alphabet[18] = "s";
alphabet[19] = "t";
alphabet[20] = "u";
alphabet[21] = "v";
alphabet[22] = "w";
alphabet[23] = "x";
alphabet[24] = "y";
alphabet[25] = "z";

for(var i=0; i < 3; i++){
var randIndex = Math.floor(Math.random() * 26)

	
	if(i==0){
	randStr = alphabet[randIndex];
	}
	else{
	randStr = randStr + alphabet[randIndex];
	}
	
}

function addInput(divName, typeDig){
     
          var newdiv = document.createElement('div');
		  newdiv.setAttribute("id", typeDig);
		 switch(typeDig){
			case '1':
			newdiv.innerHTML = "Question " 
			+ (counter) + "<br><input type='text' name='Question"+counter+"_1'> " 
			+ "<br><br> <button type='button' class='btn btn-danger btn-sm' onClick=deleteInput(" + (counter) + ");> Delete a Text Field</button> ";
			document.getElementById(divName).appendChild(newdiv);
			
			
			counter++;
			break;
			
			case '2':
			newdiv.innerHTML = "Question " 
			+ (counter) + ": <br><input type='text' id='Question"+counter+"' name='Question"+counter+"_2'><br><br><input id='type"+counter+"' type='checkbox' name='Response"+(counter)+"_"+(responseCounter)+"'> <input type='text' name='Response"+(counter)+"_"+(responseCounter)+"'>" 
			+ "<br> <button type='button' id='check"+counter+"'  class='btn btn-primary btn-sm'  onClick= addAnother("+counter+")>Add another checkbox input </button> <br><br> <button class='btn btn-danger btn-sm' type='button' onClick=deleteInput(" + (counter) + ")>Delete a Checkbox Field</button> <br> ";
			document.getElementById(divName).appendChild(newdiv);
			
			responseCounter++;
			counter++;
			break;
			
			case '3':
			newdiv.innerHTML = "Question " 
			+ (counter) + ":<br><input type='text' name='Question"+counter+"_3'><br><br><input type='radio' id='type"+counter+"' name='Response"+(counter)+"_"+(responseCounter)+"'> <input type='text' name='Response"+(counter)+"_"+(responseCounter)+"'>"  
			+ "<br> <button type='button' id='check"+counter+"'  class='btn btn-primary btn-sm' onClick=addAnother("+counter+")>Add another radio button input</button> <br><br> <button type='button' class='btn btn-danger btn-sm' onClick=deleteInput(" + (counter) + ")>Delete a Radio Button Field</button><br> ";
			document.getElementById(divName).appendChild(newdiv);
			
			responseCounter++;
			counter++;
			break;
			
			case '4':
			newdiv.innerHTML = " Question " 
			+ (counter) + ":<br><input type='text' name='Question"+counter+"_4'><br><br><input id='type"+counter+"' type='text' name='Response"+(counter)+"_"+(responseCounter)+"'>"  
			+ "<br> <button type='button' id='check"+counter+"'  class='btn btn-primary btn-sm' onClick=addAnother("+counter+")>Add another option for dropdown</button> <br><br> <button type='button' class='btn btn-danger btn-sm' onClick=deleteInput(" + (counter) + ")>Delete a Dropdown Field</button><br> ";
			document.getElementById(divName).appendChild(newdiv);
			
			responseCounter++;
			counter++;
			break;
			
			case '5':
			newdiv.innerHTML = "Question " 
			+ (counter) + "<br><input type='text' name='Question"+counter+"_5'> " 
			+ "<br> <br> <button type='button' class='btn btn-danger btn-sm' onClick=deleteInput(" + (counter) + ");>Delete a Date Field</button><br> ";
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
	olddiv.insert(br);
	
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
	document.getElementById("randId").value = randNum + randStr;
	document.getElementById("mainForm").submit();
	
}