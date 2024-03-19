
$.urlParam = function(name){
	var results = new RegExp('[\?&amp;]' + name + '=([^&amp;#]*)').exec(window.location.href);
	if (results==null){
		return null;
	}
	else{
		return results[1] || 0;
	}
}

var scMCobj = {
	ca1bottom:new Array({
		sel:"#lImg"
		,sCss:{transform:"translateX(-34px)"}
		,eCss:{transform:"translateX(0)"}
	},{
		sel:"#rImg"
		,sCss:{transform:"translateX(34px)"}
		,eCss:{transform:"translateX(0)"}
	})
};

var scrollObjANI = {};
var scrollObj;

var leadingZeros = function (date, num) {
	var zero = '';
 	date = date.toString();

 	if (date.length < num) {
  	for (i = 0; i < num - date.length; i++)
   		zero += '0';
 	}
 	return zero + date;
}

function playIconSet(k) {
	if( k == 'play') {
		$('#icon-play').addClass('active');
		$('#icon-pause').removeClass('active');
	}
	else if(k == 'pause') {
		$('#icon-play').removeClass('active');
		$('#icon-pause').addClass('active');
	}
}

//vimeo
var revapi = null ;
var sliderAuto = null ;
var is_play = true ;



$(document).ready(function() {

		
	var iframe = document.getElementById("ivideo");
	var player = new Vimeo.Player(iframe);
	var bool = false ;
	player.setVolume(0);

	$("#vimeo-area, .vimeoSlogan, .vimeo_play").click(function(){
		player.getPaused().then(function(paused) {
			if(paused){
				player.play();
				player.setVolume(1);
			}else{
				player.pause();
			}
		});
	});

	$('.vscrollDown').click(function() {
		var lan = parseInt($('#section2').offset().top) ;
		$('html, body').animate({ scrollTop: lan }, { duration:500 });
	});

	$('.vimeo_play').click(function() {
		$('.all_wrap').prepend(
		   '<div class="mfp-bg mfp-fade mfp-ready"></div>\
			<div class="mfp-wrap mfp-close-btn-in mfp-auto-cursor mfp-fade mfp-ready">\
				<div class="mfp-container mfp-iframe-holder">\
					<div class="mfp-content">\
						<div class="mfp-iframe-scaler">\
							<button type="button" class="mfp-close">×</button>\
							<iframe id="ivideo1" src="https://player.vimeo.com/video/474931090?api=1&autoplay=1&loop=1&autopause=0&muted=1&quality=1080p&controls=0" width="100%" height="100%" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen allow=autoplay></iframe>\
						</div>\
					</div>\
				</div>\
			</div>'
		);

		var iframe1 = document.getElementById("ivideo1");
		var player1 = new Vimeo.Player(iframe1);

		player1.play();
		player1.setVolume(1);

		$('.mfp-bg, .mfp-wrap, .mfp-close').click(function() {
			$('.mfp-bg').remove();
			$('.mfp-wrap').remove();
			player.play();
		});
	});

	$('#icon-play').addClass('active');
	$('#icon-pause').removeClass('active');
	// 메인 슬라이드
	var owl = $('.main-slides');
	owl.owlCarousel({
		items:1,
		loop:true,
		animateIn: 'fadeIn',
		animateOut: 'fadeOut',
		pagination: true,
		autoplay:true,
		lazyLoad: true,
		autoplayTimeout:5000,
		autoplayHoverPause:false,
		nav:true,
		dots:true,
		navText:["<img src='http://img.einet.kr/responsive/home/carousel/theme01/arrow-left.png' />", "<img src='http://img.einet.kr/responsive/home/carousel/theme01/arrow-right.png' />"],
		onInitialized : function(e) {
			var cur = (e.item.index - e.relatedTarget._clones.length / 2) + 1;
			var idx =  leadingZeros(cur, 2);
			var cnt = leadingZeros(e.item.count, 2);

			$('.pageObj .now').text(idx);
			$('.pageObj .all').text(cnt);
		},
		onChanged : function(e) {
			var curr = 1;
			var no = 1;

			$('#firstSlider button.owl-dot').each(function() {
				if($(this).hasClass('active')) {
					curr = no;
					return false;
				}
				no++;
			}) ;

			var idx =  leadingZeros(no, 2);
			$('.pageObj .now').text(idx);
		}
	});

	$(document).on('click','#icon-play',function(e) {
		owl.trigger('play.owl.autoplay',[4000]) ;
		playIconSet('play') ;
	});

	$(document).on('click','#icon-pause',function(e) {
		owl.trigger('stop.owl.autoplay',[4000]) ;
		playIconSet('pause') ;
	});

	$('.owl-prev').hover(
	  function() {
		owl.trigger('stop.owl.autoplay',[4000]) ;
	  }, function() {
		owl.trigger('play.owl.autoplay',[4000]) ;
	  }
	);

	$('.owl-next').hover(
	  function() {
		owl.trigger('stop.owl.autoplay',[4000]) ;
	  }, function() {
		owl.trigger('play.owl.autoplay',[4000]) ;
	  }
	);
	
	//roomList_wrap
	var swiper = new Swiper('.roomList_wrap .swiper-container', {
		slidesPerView: 3,
		spaceBetween: 25,
		loop: false,
		pagination: {
			el: '.swiper-pagination',
			clickable: true
		},
		navigation: {
			nextEl: '.roomList_wrap .swiper-button-next',
			prevEl: '.roomList_wrap .swiper-button-prev',
		},
		breakpoints: {
			1100: {
				slidesPerView: 2,
				spaceBetween: 20
			},
			820: {
				slidesPerView: 2,
				spaceBetween: 10
			},
			600: {
				slidesPerView: 'auto',
				spaceBetween: 10
			}
		}
	});
	
	
	//facList_wrap
	var swiper1 = new Swiper('.facList_wrap .swiper-container', {
		slidesPerView: 3,
		spaceBetween: 25,
		loop: false,
		pagination: {
			el: '.swiper-pagination',
			clickable: true
		},
		navigation: {
			nextEl: '.facList_wrap .swiper-button-next',
			prevEl: '.facList_wrap .swiper-button-prev',
		},
		breakpoints: {
			1100: {
				slidesPerView: 2,
				spaceBetween: 20
			},
			820: {
				slidesPerView: 2,
				spaceBetween: 10
			},
			600: {
				slidesPerView: 'auto',
				spaceBetween: 10
			}
		}
	});



	scrollObj = $.parallax({
		 setWrap: window
		,setSel	: "#section1,#section2,#section5,#section7"
		,getMc	: scMCobj
		,step : function(obj){
			for(var k in obj){
				if(scrollObjANI[obj[k].name]!=true && (obj[k].oP>=0 && obj[k].oP<=1)){
					scrollObjANI[obj[k].name] = true;
					obj[k].obj.addClass("ANI")
				}else if(scrollObjANI[obj[k].name]!=false && (obj[k].oP<0 || obj[k].oP>1)){
					scrollObjANI[obj[k].name] = false;
					obj[k].obj.removeClass("ANI")
				}
			}
		}
	});
	
	scrollObj.setMCall(0);
});
