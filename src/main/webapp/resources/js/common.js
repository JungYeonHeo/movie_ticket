/* 
 * 헤더 영화관찾기 메뉴
 * 배너 
 */ 

var findCinemaMenuClose = false

function findCinemaMenu() {
	if (!findCinemaMenuClose) {
		$('.cinema').css('display', 'block')
		findCinemaMenuClose = true;
	} else {
		closeCinemaMenu()
	}
}

function findCinemaMobileMenu() {
	toggleMenu()
	$('.cinema').css('display', 'block')
}

// 헤더 영화관 찾기 메뉴 - 닫기 (닫으면 '전체'로 표시되게 설정)
function closeCinemaMenu() {
	$('.cinema').css('display', 'none')
	findCinemaMenuClose = false
	$('.cinema-address-item').first().addClass('on').siblings().removeClass('on')
	$('.cinema-search-item').val('')
	searchCinema('address', '')
}

// 헤더 영화관 찾기 메뉴 - 검색
$(document).on("propertychange change keyup paste input", ".cinema-search-item", function() { 
	var target = 'cinema_name'
	var search = $('.cinema-search-item').val().trim()
	searchCinema(target, search)
})
	
// 헤더 영화관 찾기 메뉴 - 지역 클릭
function searchAddress(target, search, num) {
	$('.cinema-address-item').eq(num).addClass('on').siblings().removeClass('on')
	searchCinema(target, search)
}

// 헤더 영화관 찾기 메뉴 - 검색과 지역 클릭 결과
function searchCinema(target, search) {
    $.ajax ({
        method: 'GET',
        url: 'cinema_search_menu',
        data: {"target": target, "search": search},
        success: function(dataList) {
        	$('.cinema-local-result').html('')
        	var addTag = ''
        	$.each(dataList, function(index, data){
        		addTag += "<a class='cinema-local-item' href='cinema_detail?no=" + data['cinema_id'] +"'>" + data['cinema_name'] +"</a>"
            })
            $('.cinema-local-result').append(addTag)
        }
    })
}

// main banner - 2초마다 3개의 이미지 변경
function changeBanner() {
    change($('#bannerIndex').val())
    var num = $('#bannerIndex').val()
    num++;
    document.getElementById('bannerIndex').setAttribute('value', num)
    first_change();
}

function change(val) {
    $('.img_box').eq(val).siblings().filter('.img_box').hide()
    $('a', '.a_box').eq(val).siblings().filter('a').hide()
    $('.img_box').eq(val).show()
    $('a', '.a_box').eq(val).show()
    $('li', '.label').eq(val).css('border', ' 2px solid #4285f4')
    $('li', '.label').eq(val).siblings().filter('li').css('border', '')
}

function first_change() {
    setInterval(function() {
    if (document.getElementById('find').value == 1) {}
    else {
        change($('#bannerIndex').val())
        var num = $('#bannerIndex').val()
        if (num == 2)
            document.getElementById('bannerIndex').setAttribute('value', 0)
        else {
            num++;
            document.getElementById('bannerIndex').setAttribute('value', num)
        }
    }
    }, 2000)
}

$('li','.label').mouseover(function(){
    document.getElementById('find').setAttribute('value', 1)
    }).mouseout(function(){
    document.getElementById('find').setAttribute('value', 0)
})

// mobile side menu
function toggleMenu() {
  var navbar = $('#mobile-headers #sidebar')

  navbar.toggleClass('side-open')

  if (navbar.hasClass('side-open')) {
    $('body').css('overflow-y', 'hidden')
  } else {
    $('body').css('overflow-y', 'auto')
  }
}

// 모바일 헤더 메뉴
$(document).on('click', '.ico-m-mypage', function() { 
	location.href= 'mypage'
})

$(document).on('click', '.ico-m-ticket', function() { 
	location.href= 'ticket'
})

// mypage post 
//function goMypage() {
//	var form = document.createElement('form')
//	form.setAttribute('method', 'post')
//	form.setAttribute('action', "/ticket/mypage")
//	document.body.appendChild(form)
//	form.submit()
//}