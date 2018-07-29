<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    


	<style>
	
		@import 'https://fonts.googleapis.com/css?family=Raleway';	
		
		div {
			font-family: Raleway;
		}
		
		#toprow {
			height: 45px;
			padding-top: 12px;
			font-size: 18px;
			font-weight: bold;
		}
		/* 시작... navbar 고정 */


		/* 타이틀 애니메이션 코드 Bounce start */ 
		@-webkit-keyframes bounce {
		    0%, 20%, 50%, 80%, 100% {-webkit-transform: translateY(0);}
		    40% {-webkit-transform: translateY(-30px) }
		    60% {-webkit-transform: translateY(-20px);}
		} 
		@keyframes bounce {
		    0%, 20%, 50%, 80%, 100% {transform: translateY(0);}
		    40% {transform: translateY(-30px);}
		    60% {transform: translateY(-20px);}
		} 
		
		
		#toprow {
		    -webkit-animation-duration: 5s;
		    animation-duration: 5s;
		    -webkit-animation-name: bounce;
		    animation-name: bounce;
		}					
	/* 타이틀 애니메이션 코드 Bounce End */



	/* Border from Y to X  */
		li.borderYtoX > a:before, li.borderYtoX > a:after
		{
			position: absolute;
			opacity: 0.5;
			height: 100%;
			width: 0px;
			content: '';
			background: #FFF;
			transition: all 0.3s;
		}

		li.borderYtoX > a:before
		{
			left: 0px;
			top: 0px;
		}

		li.borderYtoX > a:after
		{
			right: 0px;
			bottom: 0px;
		}

		li.borderYtoX > a:hover:before, li.borderYtoX > a:hover:after
		{
			opacity: 1;
			height: 2px;
			width: 100%;
		}
		/*  Border from Y to X End */


		/* 메뉴들 사이의 간격 조절 */
		#myNavbar > ul > li {
			margin:0px 15px 0px 15px;
		}


		/* Remove the navbar's default margin-bottom and rounded borders */
		.navbar {
			margin-bottom: 0;
			border-radius: 0;
		}


		/*		하위메뉴 크기 조절 */
		#myNavbar > ul > li {
			margin:0px;
			padding:0px;
			font-size: 16px;
		}

		/* 메뉴들 hover 시 컬러 변경 */
		#myNavbar ul li:hover {
			background-color: red;
		}

		/* #myNavbar 는 상위 ul 의 상단 */
		/* dropdown =상위 li, dropdown-menu=하위 ul */
		.dropdown:hover > .dropdown-menu {
			display:block;
		}

		.dropdown > .dropdown-menu {			/* 하위 메뉴에 적용 */
			margin : 0px;
			padding : 0px;

			border:0px solid red;
			border-radius:5px;
			box-shadow:0px 1px 3px rgba(0,0,0,.3);			
		}

		.dropdown-menu > li {

			margin : 0px;
			padding: 8px 0px;
			font:bold 15px "굴림";
		}

/* 
		.dropdown-menu > li > a {
			color: blue;
		}

 */		.dropdown-menu > li > a:hover, .dropdown-menu > li > a:focus {
			background-color:red;
			color: white;
		}




		.dropdown-menu > li:last-child {
			border-bottom-left-radius:5px;
			border-bottom-right-radius:5px;
		}


		/* 끝... navbar 고정 */



/*			***************************		*/


		.affix {
			top: 0;
			width: 100%;
			z-index: 9999 !important;
		}

		.affix + .container-fluid {
			padding-top: 70px;
		}







		/*			***************************		*/
		/* 시작... navbar 고정 및 컬러 변경 */
		.affix {
			top: 0;
			width: 100%;
			-webkit-transition: all .5s ease-in-out;
			transition: all .5s ease-in-out;
			background-color: #F44336;
			border-color: #F44336;
		}

		.affix a {
			color: #fff !important;
			padding: 15px !important;
			-webkit-transition: all .5s ease-in-out;
			transition: all .5s ease-in-out;
		}
		
		.affix ul > li > ul > li > a {
			color: black !important;
		}	
		
		.affix ul > li > ul > li > a:hover {
			color: white !important;
		}			


		.affix-top a {
			position : static;
			padding: 15px !important;
		}



		/* 끝... navbar 고정 및 컬러 변경 */
		
		

			


		/*			***************************		*/



		.item h1 {
			font-size: 50px;
			text-shadow: black 0.2em 0.2em 0.2em;
			color: white;
		}

		.item p {
			margin-top: 30px;
			margin-bottom: 100px;
		}



		/* Add a gray background color and some padding to the footer */
		footer {
			background-color: #f2f2f2;
			padding: 25px;
		}

		.carousel-inner img {
			width: 100%;
			margin: auto;
			min-height:200px;
		}

		/* Hide the carousel text when the screen is less than 600 pixels wide */
		@media (max-width: 600px) {
			.carousel-caption {
				display: none;
			}
		}

	</style>



