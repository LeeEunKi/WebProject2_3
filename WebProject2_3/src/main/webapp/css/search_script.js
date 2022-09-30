$(document).ready(function () {

	//=========================
	//실행 오브젝트
	//=========================

	App.BoardCommon.init();
	
	//통합검색 object-fit : IE대응
	if($('.b-sch-ul-type03 .b-img-box a').length > 0){
		var personList = App.BoardObjectFit();
		personList.init('.b-sch-ul-type03 .b-img-box a');
	}
	
	//통합검색 object-fit : IE대응
	if($('.b-sch-ul-type04 .b-img-box a').length > 0){
		var personList = App.BoardObjectFit();
		personList.init('.b-sch-ul-type03 .b-img-box a');
	}

	//모바일 셀렉트박스
    App.MoSelBox.init();

});

var App = new Object();

//======================================================================
//Board Common
//======================================================================
App.BoardCommon = function () {
	var self;
	return {
		init: function () {
			self = this;
			//window popup
			$(document).on('click', '.b-open-pop', function(e){
				e.preventDefault();
				var popUrl = $(this).attr('href');
				window.open(popUrl, 'popup', 'width=1000,height=780,scrollbars=yes');
			});

			$('.b-pop-close-btn').click(function(){
				window.close();
			});

			// 통합검색 : 검색옵션 표시/숨김 셀렉박스
			$('.b-option-box > a').on('click', function() {
				$(this).parent().toggleClass('active');
			});
			
			$('.b-option-box').each(function () {
				var $thisBox = $(this);
				$(document).mouseup(function (e) {
					if ($thisBox.has(e.target).length === 0) {
						$thisBox.removeClass("active");
					}
				});
			});
			
			// 통합검색 : 정렬 기준 셀렉박스
			$('.b-ewha-search-wrap .bottom-box > div > a').on('click', function() {
				if(!$(this).parent().hasClass('active')) { // 열기
					$('.b-ewha-search-wrap .bottom-box > div').removeClass('active');
					$(this).parent('div').addClass('active');
				} else { // 닫기
					$('.b-ewha-search-wrap .bottom-box > div').removeClass('active');
				}
			});
			
			$('.b-ewha-search-wrap .bottom-box > div').each(function () {
				var $thisBox = $(this);
				$(document).mouseup(function (e) {
					if ($thisBox.has(e.target).length === 0) {
						$thisBox.removeClass("active");
					}
				});
			});

			// 통합검색 우측 영역 탭박스
			$('.b-keyword-tab-box > li').each(function() {
				$(this).find('a').on('click', function() {
					var idx = $(this).parent().index();

					if($(this).parents('.b-keyword-tab-box').hasClass('type01')) {
						$(this).parents('.b-box').find('.b-topic-box').hide();
						$(this).parents('.b-box').find('.b-topic-box').eq(idx).show();
					} else if($(this).parents('.b-keyword-tab-box').hasClass('type02')) {
						$(this).parents('.b-box').find('.b-word-box').hide();
						$(this).parents('.b-box').find('.b-word-box').eq(idx).show();
					}
					$(this).parent().siblings().removeClass('active');
					$(this).parent('li').addClass('active');
				});
			});


		}
	}
}();

//======================================================================
//Mobile Select Box
//======================================================================
App.MoSelBox = function () {
	var self;
	var select, mcenter;
	return {
		init: function () {
			self = this;

			//모바일 셀렉트 박스(선택시 label text 변경)
			select = $('.b-tab-sel, .sel-category');
			mcenter = $('.b-m-tab-box > label, .b-category01-m > label');
			$(".b-m-tab-box, .b-category01-m").click(function(){
				$(this).toggleClass('active');
				select.change(function(){
					var select_name = $(this).children('option:selected').text();
					$(this).siblings('label').text(select_name);            
				});
			});
		}
	}
}();

//------------------------------------------------------
//object-fit(IE)
//------------------------------------------------------  
App.BoardObjectFit = function () {
	var self;
	return {
		init: function (param) {
			if ('objectFit' in document.documentElement.style === false) {
				var container = document.querySelectorAll(param);
				for (var i = 0; i < container.length; i++) {
					var imageSource = container[i].querySelector('img').src;
					container[i].querySelector('img').style.display = 'none';
					container[i].style.backgroundSize = 'cover';
					container[i].style.backgroundImage = 'url(' + imageSource + ')';
					container[i].style.backgroundPosition = '50% 0';
				}
			}
		}
	}
};