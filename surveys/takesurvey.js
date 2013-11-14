

$(document).ready(function () {
	
    $('#next').on('click', getNext);
    $('#prev').on('click', getPrev);

});

function getNext() {
	
    var $curr = $('.form-group:visible'),
        $next = ($curr.next().length) ? $curr.next() : $('.form-group').first();

    transition($curr, $next);
}

function getPrev() {
    var $curr = $('.form-group:visible'),
        $next = ($curr.prev().length) ? $curr.prev() : $('.form-group').last();
    transition($curr, $next);
}

function transition($curr, $next) {
    

    $next.css('z-index', 2).fadeIn('fast', function () {
        $curr.hide().css('z-index', 0);
        $next.css('z-index', 1);
    });

}