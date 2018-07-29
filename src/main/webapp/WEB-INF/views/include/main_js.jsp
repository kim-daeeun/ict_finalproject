<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    
 
	
	<script>
	
	<!-- 기업 정보 클릭시 해당 지역 페이지 링크 -->
	$(function(){
		$(".BizPageMove").on("click", function(){
			
			if ($(this).prev().text() == "공공기관") {
				window.location = "gjofficial.ict";			
				
			}else if($(this).prev().text() == "광주지역") {
				window.location = "donggu.ict";
				
			}else if($(this).prev().text() == "전남지역") {
				window.location = "njcity.ict";
			}
		
		});
	});
	
	/* 메인화면 공지사항 링크 */ 
	 
	$(document).ready(function(){	 
		 mChangeNb();
				
		$("#tdNba1").add("#tdNba2").add("#tdNbb1").add("#tdNbb2").add("#tdNbc1").add("#tdNbc2").hover(function(){
			clearTimeout(vChanTxt);
		},
		function(){
			mChangeNb();			
		});	

	});

	i=0;
	function mChangeNb(){	
	
		let listEndNum = $("#nbListEndNum").val();		
		
		let tempa1 = ".a1"+(i+0);
		let tempa2 = ".a2"+(i+0);
		
		let a1Num=$(tempa1).val();
		let a2Title=$(tempa2).val();		
		let a1NumHtml=a1Num + "<br/><span class='label label-warning'>New </span>";		

		$("#tdNba1").hide();
		$("#tdNba2").hide();		
		
		$("#tdNba1").fadeOut();
		$("#tdNba2").fadeOut();	
			
		$("#tdNba1").html(a1NumHtml).fadeIn("slow");
		$("#tdNba2").text(a2Title).fadeIn("slow");	
		
		
		let tempb1 = ".a1"+(i+1);
		let tempb2 = ".a2"+(i+1);
		
		let b1Num=$(tempb1).val();
		let b2Title=$(tempb2).val();
		let b1NumHtml=b1Num + "<br/><span class='label label-warning'>New </span>";	
		
	
		$("#tdNbb1").hide();
		$("#tdNbb2").hide();		
		
		$("#tdNbb1").fadeOut();
		$("#tdNbb2").fadeOut();	
			
		$("#tdNbb1").html(b1NumHtml).fadeIn("slow");
		$("#tdNbb2").text(b2Title).fadeIn("slow");		
		
		
	
		let tempc1 = ".a1"+(i+2);
		let tempc2 = ".a2"+(i+2);
		
		let c1Num=$(tempc1).val();
		let c2Title=$(tempc2).val();
		let c1NumHtml=c1Num + "<br/><span class='label label-warning'>New </span>";
		

		$("#tdNbc1").hide();
		$("#tdNbc2").hide();		
		
		$("#tdNbc1").fadeOut();
		$("#tdNbc2").fadeOut();	
			
		$("#tdNbc1").html(c1NumHtml).fadeIn("slow");
		$("#tdNbc2").text(c2Title).fadeIn("slow");
		
		
		i++;				
		if(i>listEndNum-2){
			i=0;
		}	
		vChanTxt = setTimeout(mChangeNb,3000);						
	}	
	
	

	
	
	
	$(function(){
		
		$.ajax({
			 type:"Post",
			 url:"/ictinfo/empRate.ict",	
			 dataType:"json", 
			 success:function(data){
				 

				//alert(JSON.stringify(data));
				//alert(data["job-search"].jobs.job[0].company.name.content);

				 
				 let vEmpUrl = data["job-search"].jobs.job[0].company.name.href;				 
				 let vShortCut = "<a href='" + vEmpUrl + "' class='pull-right' target='_blank'>more...</a>";			 
				 
				 let vTemp = data["job-search"].jobs.job[0].company.name.content;
				 let vCompany = "<a href='" + vEmpUrl + "'>" + vTemp + "</a>";  
				 
				 let vPart = data["job-search"].jobs.job[0].position.industry.content;
				 let vEmpType = data["job-search"].jobs.job[0].position["experience-level"].content;
				 
				 $("#empInfoShortCut").html(vShortCut);
				 $("#empInfo01").html(vCompany);
				 $("#empInfo02").html(vPart);
				 $("#empInfo03").html(vEmpType);
			 }			

		});			

	}); 


	
	

	</script>

    
    