<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    
 
	
	<script>
	
	
		<!-- nav 마우스 hover 를 이용하여 하위 메뉴 나오게 하기 -->

        /*
              $(document).ready(function(){

                  $('.dropdown,.dropdown-menu').hover(function(){

                      if($(window).width()>=768){
                          $(this).addClass('open').trigger('shown.bs.dropdown', relatedTarget)
                          return false;
                      }

                  },function() {
                      if ($(window).width() >= 768) {
                          $(this).removeClass('open').trigger('hidden.bs.dropdown', relatedTarget)
                          return false;
                      }
                  },function () {
                      $(this).css('background-color','red')
                  }

            })

        })
        */


/*
                $(function(){
                    $("#myNavbar ul li").hover(function(){
                        $('ul:first',this).show();
                    }, function(){
                        $('ul:first',this).hide();
                    });
                 });
*/
/*
        $(function(){
            $("ul li").mouseover(function(){
                $(this).children("ul").show();
                $(this).find("a").addClass("on");
            });
            $("ul li").mouseout(function(){
                $(this).children("ul").hide();
                $(this).find("a").removeClass("on");
            });
        });
*/

/*
        $(document).on('mouseover', '.dropdown', function () {
            $('.dropdown-menu').slideDown(200);
        });
        $(document).on('mouseover', 'div', function () {
            if (!$(this).hasClass('topMenu')) {
                $('.dept02').slideUp(200);
            }
        });
*/

/*
        $(document).ready(function(){
            $(".dropdown").hover(function(){
                var submenu = $(this).next("ul");

                // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
                if( submenu.is(":visible") ){
                    submenu.slideUp(200);
                }else{
                    submenu.slideDown(200);
                }
            }).mouseover(function(){
                $(this).next("ul").slideDown();
            });

            // menu class 중에 두번째 있는 menu 의 하위에 있는 a태그에 클릭 이벤트를 발생시킨다.
            $(".menu :eq(1)>a").click();
        });
*/








	</script>

    
    