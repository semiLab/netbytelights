var socket = io.connect('http://localhost');
$("#colors").on('click', "button", function(){
	var r = $(this).attr('data-r');
	var g = $(this).attr('data-g');
	var b = $(this).attr('data-b');
	var i = $("#slider-1").val();
	r = Math.floor(r * i / 255);
	g = Math.floor(g * i / 255);
	b = Math.floor(b * i / 255);
	socket.emit('setcolor', { red: r, green:g, blue: b});
});


function makeButton(r,g,b){
	$(".my-page ul").append(
		//"<button data-inline='true' data-r='"+r+"' data-g='"+g+"' data-b='"+b+"' style='background-color:rgb("+r+","+g+","+b+")'></button>"
		'<li class="ui-li ui-li-static ui-btn-up-a ui-last-child">'
		+'<div data-corners="true" data-shadow="true" data-iconshadow="true" data-wrapperels="span" data-theme="a" '
		+'data-disabled="false" class="ui-btn ui-btn-up-a ui-shadow ui-btn-corner-all" aria-disabled="false">'
		+'<span class="ui-btn-inner"><span class="ui-btn-text"></span></span>'
		+'<button data-r="'+r+'" data-g="'+g+'" data-b="'+b+'" style="background-color:rgb('+r+','+g+','+b+');" class="ui-btn-hidden" data-disabled="false">'
		+'</button></div></li>'
		);

}
makeButton(255,0,0);
makeButton(255,100,0);
makeButton(255,255,0);

makeButton(0,255,0);
makeButton(0,255,255);
makeButton(0,0,255);

makeButton(255,255,255);
makeButton(255,200,150);
makeButton(255,200,200);


makeButton(255,20,100);
makeButton(255,0,255);
makeButton(255,0,255);


