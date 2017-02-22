(function ( $ ) {

	$.fn.UpDownBootSideMenu = function( options ) {

		var oldCode, newCode, side;

		newCode = "";

		var settings = $.extend({
			side:"up",
			autoClose:true
		}, options );

		side = settings.side;
		autoClose = settings.autoClose;

		this.addClass("container updownsidebar");

		if(side=="up"){
			this.addClass("updownsidebar-up");
		}else if(side=="down"){
			this.addClass("updownsidebar-down");
		}else{
			this.addClass("updownsidebar-up");	
		}

		oldCode = this.html();
		newCode += "<div class=\"updowntoggler\">\n";
		newCode += "<span class=\"glyphicon glyphicon-chevron-down\">&nbsp;</span> <span class=\"glyphicon glyphicon-chevron-up\">&nbsp;</span>\n";
		newCode += "</div>\n";
		newCode += "<div class=\"row\">\n";
		newCode += "	<div class=\"col-xs-12 col-sm-12 col-md-12 col-lg1-12\" data-side=\""+side+"\">\n"+ oldCode+" </div>\n";
		newCode += "</div>\n";
		this.html(newCode);

		if(autoClose){
			$(this).find(".updowntoggler").trigger("click");
		}

	};

	$(document).on('click', '.updownsidebar .list-group-item', function(){
		$('.updownsidebar .list-group-item').each(function(){
			$(this).removeClass('active');
		});
		$(this).addClass('active');
	});


	$(document).on('click', '.updownsidebar .list-group-item', function(event){
		var idToToggle, this_offset, this_x, this_y, href, side;
		event.preventDefault();
		href = $(this).attr('href');

		if(href.substr(0,1)=='#'){

			idToToggle = href.substr(1,href.length); 

			if(searchUpDownSubMenu(idToToggle)){

				this_offset = $(this).offset();
				side = $(this).parent().parent().attr('data-side');

				if(side=='up'){
					this_x = $(this).height() + 10;
					this_y = this_offset.top +1;
					$('#'+idToToggle).css('up', this_x);
					$('#'+idToToggle).css('top', this_y);			
				}else if(side=='down'){
					this_x = $(this).height()+10;
					this_y = this_offset.top +1;
					$('#'+idToToggle).css('down', this_x);
					$('#'+idToToggle).css('top', this_y);			
				}

				$('#'+idToToggle).fadeIn();

			}else{
				$('.submenu').fadeOut();
			}
		}
	});


	$(document).on('click','.updowntoggler', function(){
		var updowntoggler = $(this);
		var container = updowntoggler.parent();
		var listaClassi = container[0].classList;
		var side = getUpDownSide(listaClassi);
		var containerHeight = container.height();
		var status = container.attr('data-status');
		console.log("status = "+status);
		if(!status){
			status = "opened";
		}
		doUpDownAnimation(container, containerHeight, side, status);
	});

	/*Cerca un div con classe submenu e id uguale a quello passato*/
	function searchUpDownSubMenu(id){
		var found = false;
		$('.submenu').each(function(){
			var thisId = $(this).attr('id');
			if(id==thisId){
				found = true;
			}
		});
		return found;
	}

//restituisce il lato del updownsidebar in base alla classe che trova settata
function getUpDownSide(listaClassi){
	var side;
	for(var i = 0; i<listaClassi.length; i++){
		if(listaClassi[i]=='updownsidebar-up'){
			side = "up";
			break;
		}else if(listaClassi[i]=='updownsidebar-down'){
			side = "down";
			break;
		}else{
			side = null;
		}
	}
	return side;
}
//esegue l'animazione
function doUpDownAnimation(container, containerHeight, sidebarSide, sidebarStatus){
	var updowntoggler = container.children()[0];
	if(sidebarStatus=="opened"){
		if(sidebarSide=="up"){
			container.animate({
				top:-(containerHeight+2)
			});
			toggleUpDownArrow(updowntoggler, "up");
		}else if(sidebarSide=="down"){
			container.animate({
				bottom:- (containerHeight +2)
			});
			toggleUpDownArrow(updowntoggler, "down");
		}
		container.attr('data-status', 'closed');
	}else{
		if(sidebarSide=="up"){
			container.animate({
				top:0
			});
			toggleUpDownArrow(updowntoggler, "down");
		}else if(sidebarSide=="down"){
			container.animate({
				bottom:0
			});
			toggleUpDownArrow(updowntoggler, "up");
		}
		container.attr('data-status', 'opened');

	}

}

function toggleUpDownArrow(updowntoggler, side){
	if(side=="up"){
		console.log("now up,will change to down");
		$(updowntoggler).children(".glyphicon-chevron-down").css('display', 'block');
		$(updowntoggler).children(".glyphicon-chevron-up").css('display', 'none');
	}else if(side=="down"){
		console.log("now down,will change to up");
		$(updowntoggler).children(".glyphicon-chevron-up").css('display', 'block');
		$(updowntoggler).children(".glyphicon-chevron-down").css('display', 'none');
	}
}

}( jQuery ));

