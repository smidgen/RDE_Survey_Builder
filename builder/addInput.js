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
		  newdiv.setAttribute("id", counter);
		  
		  var changeInner = document.getElementById('questionBorder'+divName+'');
		  

		 if(divName == 'dynamicInput'){ 
		 
		 switch(typeDig){
			case '1':
			newdiv.innerHTML = "<br><br><div class='jumbotron2' id='questionBorder"+counter+"'><h2 id='h2_"+counter+"'>Question " 
			+ (counter) + "</h2><br><input type='text' class='form-control' name='Question"+counter+"_1'> " 
			+ "<br><br> <input type='button' class='btn btn-danger btn-sm' onClick=deleteInput(" + (counter) + ") value='Change Question Type'> <br><br><input type='button' class='btn btn-danger btn-sm' onClick=deleteEntire(" + (counter) + ") value='Delete Entire Question'> <br><br></div> ";
			document.getElementById(divName).appendChild(newdiv);
			
			
			counter++;
			break;
			
			case '2':
			newdiv.innerHTML = "<br><br><div class='jumbotron2' id='questionBorder"+counter+"'> <h2>Question " 
			+ (counter) + ":</h2> <br><input type='text' class='form-control' id='Question"+counter+"' name='Question"+counter+"_2'><br><br><h2>Checkbox Options:</h2><br><input id='type"+counter+"' type='checkbox' name='Response"+(counter)+"_"+(responseCounter)+"'> <br> <br><input class='form-control' type='text' name='Response"+(counter)+"_"+(responseCounter)+"'>" 
			+ "<br> <br><input type='button' id='check"+counter+"'  class='btn btn-primary btn-sm'  onClick= addAnother("+counter+") value='Add another checkbox input'>  <br><br> <input class='btn btn-danger btn-sm' type='button' onClick=deleteInput(" + (counter) + ") value='Change Question Type'><br><br><input type='button' class='btn btn-danger btn-sm' onClick=deleteEntire(" + (counter) + ") value='Delete Entire Question'><br><br></div> ";
			document.getElementById(divName).appendChild(newdiv);
			
			responseCounter++;
			counter++;
			break;
			
			case '3':
			newdiv.innerHTML = "<br><br><div class='jumbotron2' id='questionBorder"+counter+"'><h2>Question " 
			+ (counter) + ":</h2><br><input class='form-control' type='text' name='Question"+counter+"_3'><br><br><h2>Radio Options:</h2><br><input type='radio' id='type"+counter+"' name='Response"+(counter)+"_"+(responseCounter)+"'> <br><br> <input class='form-control' type='text' name='Response"+(counter)+"_"+(responseCounter)+"'> "  
			+ "<br> <br><input type='button' id='check"+counter+"'  class='btn btn-primary btn-sm' onClick=addAnother("+counter+") value='Add another radio button input'> <br><br> <input type='button' class='btn btn-danger btn-sm' onClick=deleteInput(" + (counter) + ") value='Change Question Type'><br><br><input type='button' class='btn btn-danger btn-sm' onClick=deleteEntire(" + (counter) + ") value='Delete Entire Question'><br><br></div> ";
			document.getElementById(divName).appendChild(newdiv);
			
			responseCounter++;
			counter++;
			break;
			
			case '4':
			newdiv.innerHTML = "<br><br> <div class='jumbotron2' id='questionBorder"+counter+"'><h2>Question " 
			+ (counter) + ":</h2><br><input type='text' class='form-control' name='Question"+counter+"_4'><br><br><h2>Drop down Options:</h2><br><input id='type"+counter+"' class='form-control' type='text' name='Response"+(counter)+"_"+(responseCounter)+"'>"  
			+ "<br> <br><input type='button' id='check"+counter+"' class='btn btn-primary btn-sm' onClick=addAnother("+counter+") value='Add another option for dropdown'> <br><br> <input type='button' class='btn btn-danger btn-sm' onClick=deleteInput(" + (counter) + ") value='Change Question Type'><br><br><input type='button' class='btn btn-danger btn-sm' onClick=deleteEntire(" + (counter) + ") value='Delete Entire Question'><br><br></div> ";
			document.getElementById(divName).appendChild(newdiv);
			
			responseCounter++;
			counter++;
			break;
			
			case '5':
			newdiv.innerHTML = "<br><br><div class='jumbotron2' id='questionBorder"+counter+"'><h2>Question " 
			+ (counter) + "</h2><br><input class='form-control' type='text' name='Question"+counter+"_5'> " 
			+ "<br> <br> <input type='button' class='btn btn-danger btn-sm' onClick=deleteInput(" + (counter) + ") value='Change Question Type';><br><br><input type='button' class='btn btn-danger btn-sm' onClick=deleteEntire(" + (counter) + ") value='Delete Entire Question'><br><br></div> ";
			document.getElementById(divName).appendChild(newdiv);
			
			counter++;
			break;
			
			}
			}
			
			else if(divName !='dynamicInput'){
			
			switch(typeDig){
			case '1':
			changeInner.innerHTML = "<h2>Question " 
			+ (divName) + "</h2><br><input class='form-control' type='text' name='Question"+divName+"_1'> " 
			+ "<br><br> <input type='button' class='btn btn-danger btn-sm' onClick=deleteInput(" + (divName) + ") value='Change Question Type'> <br><br><input type='button' class='btn btn-danger btn-sm' onClick=deleteEntire(" + (divName) + ") value='Delete Entire Question'><br><br> ";
			
			
			
			
			break;
			
			case '2':
			changeInner.innerHTML = " <h2>Question " 
			+ (divName) + ":</h2> <br><input class='form-control' type='text' id='Question"+divName+"' name='Question"+divName+"_2'><br><br><h2>Checkbox Options:</h2><br><input id='type"+divName+"' type='checkbox' name='Response"+(divName)+"_"+(responseCounter)+"'> <input class='form-control' type='text' name='Response"+(divName)+"_"+(responseCounter)+"'>  " 
			+ "<br> <br><input type='button' id='check"+divName+"'  class='btn btn-primary btn-sm'  onClick= addAnother("+divName+") value='Add another checkbox input'>  <br><br> <input class='btn btn-danger btn-sm' type='button' onClick=deleteInput(" + (divName) + ") value='Change Question Type'><br><br><input type='button' class='btn btn-danger btn-sm' onClick=deleteEntire(" + (divName) + ") value='Delete Entire Question'><br><br> ";
			
			
			
			break;
			
			case '3':
			changeInner.innerHTML = "<h2>Question " 
			+ (divName) + ":</h2><br><input class='form-control' type='text' name='Question"+divName+"_3'><br><br><h2>Radio Options:</h2><br><input type='radio' id='type"+divName+"' name='Response"+(divName)+"_"+(responseCounter)+"'> <input class='form-control' type='text' name='Response"+(divName)+"_"+(responseCounter)+"'> "  
			+ "<br> <br><input type='button' id='check"+divName+"'  class='btn btn-primary btn-sm' onClick=addAnother("+divName+") value='Add another radio button input'> <br><br> <input type='button' class='btn btn-danger btn-sm' onClick=deleteInput(" + (divName) + ") value='Change Question Type'><br><br><input type='button' class='btn btn-danger btn-sm' onClick=deleteEntire(" + (divName) + ") value='Delete Entire Question'><br><br> ";
			
			
			
			break;
			
			case '4':
			changeInner.innerHTML = "<h2>Question " 
			+ (divName) + ":</h2><br><input class='form-control' type='text' name='Question"+divName+"_4'><br><br><h2>Drop down Options:</h2><br><input id='type"+divName+"' class='form-control' type='text' name='Response"+(divName)+"_"+(responseCounter)+"'>"  
			+ "<br> <br><input type='button' id='check"+divName+"' class='btn btn-primary btn-sm' onClick=addAnother("+divName+") value='Add another option for dropdown'> <br><br> <input type='button' class='btn btn-danger btn-sm' onClick=deleteInput(" + (divName) + ") value='Change Question Type'><br><br><input type='button' class='btn btn-danger btn-sm' onClick=deleteEntire(" + (divName) + ") value='Delete Entire Question'><br><br> ";
			
			
			
			break;
			
			case '5':
			changeInner.innerHTML = "<h2>Question " 
			+ (divName) + "</h2><br><input class='form-control' type='text' name='Question"+divName+"_5'> " 
			+ "<br> <br> <input type='button' class='btn btn-danger btn-sm' onClick=deleteInput(" + (divName) + ") value='Change Question Type';><br><br><input type='button' class='btn btn-danger btn-sm' onClick=deleteEntire(" + (divName) + ") value='Delete Entire Question'> <br><br>";
			
			
			
			break;
			
			
			}
    }
}

function addAnother(divId){

	var newelement = document.createElement('input');
	var newtext = document.createElement('input');
	
	var oldelement = document.getElementById('check'+divId+'');
	var olddiv = document.getElementById(divId);
	
	var br = document.createElement('br');
	var br2 = document.createElement('br');
	
	var divtest = document.getElementById('questionBorder'+divId+'');
	
	var test = document.getElementById('type'+divId+'');
	
	var newbutton = document.createElement('input');
	newbutton.id='buttonDelete';
	newbutton.type='button';
	
	//var nbsp = document.createTextNode('\u00a0');
	//var nbsp2 = document.createTextNode('\u00a0');
	
	newtext.className="form-control";
	newelement.className="form-control";
	
	if(test.type == 'checkbox')
	{
	
	//newelement.type= 'checkbox';
	//newelement.id= 'Response'+(divId)+'_'+(responseCounter)+''; 
	//newelement.name= 'Response'+(divId)+'_'+responseCounter+''; 
	
	newtext.type='text';
	newtext.id='Response'+(divId)+'_'+responseCounter+''; 
	newtext.name= 'Response'+(divId)+'_'+responseCounter+'';
	
	newbutton.className='btn btn-danger btn-sm';
	newbutton.id='Delete Option'+responseCounter+'';
	newbutton.value='Delete Option';
	newbutton.onClick='deleteOption';
	newbutton.setAttribute("onclick","deleteOption("+divId+","+responseCounter+")");
	
	br.id='br'+(divId)+'_'+responseCounter+'';
	br2.id='br2_'+(divId)+'_'+responseCounter+'';
	
	//nbsp.id='nbsp'+(divId)+'_'+responseCounter+'';
	//nbsp2.id='nbsp2_'+(divId)+'_'+responseCounter+'';
	
	//document.getElementById(divId).appendChild(newelement);
	//document.getElementById(divId).appendChild(newtext);
	
	//divtest.insertBefore(newelement , oldelement);
	divtest.insertBefore(newtext, oldelement);
	//divtest.insertBefore(nbsp2, newtext);
	divtest.insertBefore(newbutton, oldelement);

	//divtest.insertBefore(nbsp, newbutton);
	divtest.insertBefore(br , oldelement);
	divtest.insertBefore(br2, oldelement);
	
	responseCounter++;
	}
	else if(test.type == 'radio'){
	
	//newelement.type= 'radio';
	//newelement.id= 'Response'+(divId)+'_'+responseCounter+''; 
	//newelement.name= 'Response'+(divId)+'_'+responseCounter+''; 
	
	newtext.type='text';
	newtext.id='Response'+(divId)+'_'+responseCounter+''; 
	newtext.name= 'Response'+(divId)+'_'+responseCounter+'';
	
	newbutton.className='btn btn-danger btn-sm';
	newbutton.id='Delete Option'+responseCounter+'';
	newbutton.value='Delete Option';
	newbutton.setAttribute("onclick","deleteOption("+divId+","+responseCounter+")");
	//newbutton.onclick= deleteOption(''+divId+','+responseCounter+'');
	
	br.id='br'+(divId)+'_'+responseCounter+'';
	br2.id='br2_'+(divId)+'_'+responseCounter+'';
	
	//document.getElementById(divId).appendChild(newelement);
	//document.getElementById(divId).appendChild(newtext);
	
	//divtest.insertBefore(newelement , oldelement);
	divtest.insertBefore(newtext, oldelement);
	//divtest.insertBefore(nbsp2, newtext);
	divtest.insertBefore(newbutton, oldelement);

	//divtest.insertBefore(nbsp, newbutton);
	divtest.insertBefore(br , oldelement);
	divtest.insertBefore(br2, oldelement);
	
	responseCounter++;
	}
	
	else if(test.type == 'text') {
	
	newelement.type= 'text';
	newelement.id= 'Response'+(divId)+'_'+responseCounter+''; 
	newelement.name= 'Response'+(divId)+'_'+responseCounter+''; 
	
	newbutton.className='btn btn-danger btn-sm';
	newbutton.id='Delete Option'+responseCounter+'';
	newbutton.value='Delete Option';
	newbutton.onClick='deleteOption';
	newbutton.setAttribute("onclick","deleteOption("+divId+","+responseCounter+")");
	
	br.id='br'+(divId)+'_'+responseCounter+'';
	br2.id='br2_'+(divId)+'_'+responseCounter+'';
	
	
	//document.getElementById(divId).appendChild(newelement);
	//document.getElementById(divId).appendChild(newtext);
	
	
	//divtest.insertBefore(newelement , oldelement);
	divtest.insertBefore(newelement, oldelement);
	//divtest.insertBefore(nbsp2, newelement);
	divtest.insertBefore(newbutton, oldelement);

	//divtest.insertBefore(nbsp, newbutton);
	divtest.insertBefore(br , oldelement);
	divtest.insertBefore(br2, oldelement);
	
	responseCounter++;
	}
	
	responseTrack=divId;
}




function deleteInput(num_input){

		  var parentdiv = document.getElementById("dynamicInput");		
				
	      var olddiv = document.getElementById(""+num_input+"");
		  
		  olddiv.innerHTML="<br><br><div class='jumbotron2' id='questionBorder"+num_input+"'><h2>Question Choices:</h2><br><br><input type='button'  class='btn btn-primary btn-sm' onClick=addInput('"+num_input+"','"+1+"') value='Make Text Question' ><br><br>"
		  +"<input type='button' id='check"+num_input+","+2+"'  class='btn btn-primary btn-sm' onClick=addInput('"+num_input+"','"+2+"') value='Make Checkbox Question'><br><br>"
		  +"<input type='button' id='check"+num_input+","+3+"'  class='btn btn-primary btn-sm' onClick=addInput('"+num_input+"','"+3+"') value='Make Radio Question'><br><br>"
		  +"<input type='button' id='check"+num_input+","+4+"'  class='btn btn-primary btn-sm' onClick=addInput('"+num_input+"','"+4+"') value='Make Drop Down Question'><br><br>"
		  +"<input type='button' id='check"+num_input+","+5+"'  class='btn btn-primary btn-sm' onClick=addInput('"+num_input+"','"+5+"') value='Make Date Field Question'><br><br>"
		  +"<input type='button' class='btn btn-danger btn-sm' onClick=deleteEntire(" + (num_input) + ") value='Delete Entire Question'><br><br></div>";
		  // counter--;
		  //var innerMost = document.getElementById("questionBorder");
		  
		  //olddiv.parentNode.removeChild(innerMost);
		  
	      //parentdiv.parentNode.removeChild(olddiv);
		  
		  
		  
			//parentdiv.removeChild(olddiv);
		
}

function deleteEntire(num_input){




		  var parentdiv = document.getElementById("dynamicInput");		
				
	      var olddiv = document.getElementById(""+num_input+"");
		  
			parentdiv.removeChild(olddiv);

			
			
}

function deleteOption( quest_num, option_num ){

		var quest = document.getElementById(""+quest_num+"");
		 var option = document.getElementById('Response'+quest_num+'_'+option_num+'');
		 var delete_button = document.getElementById('Delete Option'+option_num+'');
		 
		 var br = document.getElementById('br'+quest_num+'_'+option_num+'');
		 var br2 = document.getElementById('br2_'+quest_num+'_'+option_num+'');
		 
		 var nbsp = document.getElementById('nbsp'+quest_num+'_'+option_num+'');
		 var nbsp2 = document.getElementById('nbsp2_'+quest_num+'_'+option_num+'');
		 
		 option.parentNode.removeChild(option);
		 delete_button.parentNode.removeChild(delete_button);
		 
		br.parentNode.removeChild(br);
		br2.parentNode.removeChild(br2);
		
		
}

function submit_form() 
{ 
	
	document.getElementById("counter").value = counter - 1;
	document.getElementById("responseCounter").value = responseCounter - 1;
	document.getElementById("randId").value = randNum + randStr;
	document.getElementById("mainForm").submit();
	
}


