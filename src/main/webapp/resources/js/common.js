// 영화관 찾기 메뉴
var findCinemaMenuClose = false;

function findCinemaMenu() {
	if (!findCinemaMenuClose) {
		$('.cinema').css('display', 'block');
		findCinemaMenuClose = true;
	} else {
		closeCinemaMenu()
	}
}

function findCinemaMobileMenu() {
	toggleMenu()
	$('.cinema').css('display', 'block');
}

function closeCinemaMenu() {
	$('.cinema').css('display', 'none');
	findCinemaMenuClose = false;
	$('.cinema-address-item').each(function(){
		if ($(this).hasClass('on') == 1) $(this).removeClass('on');
	});
	$('.cinema-address-item').first().addClass('on');
	$('.cinema-search-item').val('')
	searchCinema('address', '')
}

$(document).on("propertychange change keyup paste input", ".cinema-search-item", function(){ 
	var target = 'cinema_name';
	var search = $.trim($('.cinema-search-item').val())
	searchCinema(target, search)
});
	
function searchAddress(target, search, num) {
	$('.cinema-address-item').each(function(){
		if ($(this).hasClass('on') == 1) $(this).removeClass('on');
	});
	$('.cinema-address-item').eq(num).addClass('on');
	searchCinema(target, search)
}

function searchCinema(target, search) {
    $.ajax ({
        method: 'GET',
        url: 'cinema_search_menu',
        data: {"target": target, "search": search},
        success: function(dataList) {
        	$('.cinema-local-result').html('');
        	var addTag = "";
        	$.each(dataList, function(index, data){
        		addTag += "<a class='cinema-local-item' href='cinema_detail?no=" + data['cinema_id'] +"'>" + data['cinema_name'] +"</a>";
            })
            $('.cinema-local-result').append(addTag); 
        }
    })
}

// main banner - 2초마다 3개의 이미지 변경
function changeBanner() {
    change($('#bannerIndex').val());
    var num = $('#bannerIndex').val();
    num++;
    document.getElementById('bannerIndex').setAttribute('value', num);
    first_change();
}

function change(val) {
    $('.img_box').eq(val).siblings().filter('.img_box').hide();
    $('a', '.a_box').eq(val).siblings().filter('a').hide();
    $('.img_box').eq(val).show();
    $('a', '.a_box').eq(val).show();
    $('li', '.label').eq(val).css('border', ' 2px solid #4285f4');
    $('li', '.label').eq(val).siblings().filter('li').css('border', '');
}

function first_change() {
    setInterval(function() {
    if(document.getElementById('find').value == 1){}
    else{
        change($('#bannerIndex').val());
        var num = $('#bannerIndex').val()
        if (num == 2)
            document.getElementById('bannerIndex').setAttribute('value', 0);
        else {
            num++;
            document.getElementById('bannerIndex').setAttribute('value', num);
        }
    }
    }, 2000);
}

$('li','.label').mouseover(function(){
    document.getElementById('find').setAttribute('value', 1);
    }).mouseout(function(){
    document.getElementById('find').setAttribute('value', 0);
});

// mobile side menu
function toggleMenu() {
  var navbar = $('#mobile-headers #sidebar')

  navbar.toggleClass('side-open')

  if (navbar.hasClass('side-open')) {
    $('body').css('overflow-y', 'hidden');
  } else {
    $('body').css('overflow-y', 'auto');
  }
}