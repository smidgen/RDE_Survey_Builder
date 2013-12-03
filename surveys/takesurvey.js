

$(document).ready(function () {
	
    $('#next').on('click', getNext);
    $('#prev').on('click', getPrev);
    $('#submit').hide();
});

function getNext() {
	
    var $curr = $('.form-group:visible');
       // $next = ($curr.next().length) ? $curr.next() : $('.form-group').first();
    if($curr.next().length){ 
    	var $next = $curr.next(); 
        transition($curr, $next);
    }else{
    	console.log('no more next');
    	$('#submit').show();
    }

}

function getPrev() {
    var $curr = $('.form-group:visible');
        //$next = ($curr.prev().length) ? $curr.prev() : $('.form-group').last();
    if($curr.prev().length){ 
    	var $next = $curr.prev(); 
    	transition($curr, $next);
    }else{
    	console.log('no more prev');
    	
    }
    
}

function transition($curr, $next) {
    

    $next.css('z-index', 2).fadeIn('fast', function () {
        $curr.hide().css('z-index', 0);
        $next.css('z-index', 1);
    });

}