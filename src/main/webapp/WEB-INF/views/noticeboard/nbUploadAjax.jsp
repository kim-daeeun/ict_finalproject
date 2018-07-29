<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax 멀티 파일 업로드</title>
<style>
.fileDrop {
	width: 50%;
	height: 300px;
	border: 1px dotted blue;
	margin: 0 auto;
}

small {
	margin-left: 3px;
	font-weight: bold;
	color: gray;
}
</style>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<h3>Ajax File Upload</h3>
	<div class='fileDrop'></div>
	<input type="button" value="모두삭제"/>
	<div class='uploadedList'></div>
	
<script>
	$(".fileDrop").on("dragenter dragover", function(event){
		event.preventDefault();		// 파일이 업로드 영역으로 들어가서 펼쳐지지 않게 함
	});
	
	$(".fileDrop").on("drop", function(event){
		event.preventDefault();	
// 		event.originalEvent는 순수한 원래의 DOM이벤트를 가지고 옮
//		JQuery를 사용할경우  순수한 DOM이벤트가 아님
//		dataTransfer는 이벤트와 같이 전달된 데이터를 의미
//		그 안에 포함된 파일 데이터를 찾아내기 위해 dataTransfer.files
//		를 사용함	
		let files = event.originalEvent.dataTransfer.files;		// files 라는 배열에 들어간다	
// 		var file = files[0];
// 		파일이름을 바로 알아낼수 있음
// 		file.name;
// 		alert(file.name+"입니다")
					
		let formData = new FormData();							// index는 0번째, 1번째 업로드한 파일의 인덱스가 담겨있다
		$.each(files,function(index,item){						// file 이름을 formData에 담는다. item에는 업로드한 파일이 들어온다
			formData.append("multiFile", item);					// 키이름은 multiFile 이다
		});		
		
		$.ajax({
			  url: '/human/uploadAjax',
			  data: formData,
// 			  복수개를 업로드시 
			  dataType:'json',	// json 타입으로 받을것이다
			  
// 			  processData: false는
// 			  데이터를 일반적인 query string으로 변활할 것인지를 결정, 기본값은 true , 
// 			  'application/x-www-form-urlencoded' 타입으로 전송, 다른 형식으로 데이터를
// 			  보내기 위하여 자동 변환하고 싶지 않은 경우는 false로 지정
			  processData: false,	// processData, contentType 2개가 들어오면 Query String이 아니라 파일이 들어온다는것을 컨테이너가 안다
			  
// 			  contentType: false 는
// 			  기본값은 'application/x-www-form-urlencoded', 파일의 경우 'multipart/form-data'
// 			  방식으로 전송하기 위해서 false
			  contentType: false,
			  type: 'POST',
			  
			  // 여기에 날짜가 붙은 썸네일 이미지나 파일들이 들어온다. list가 들어온다
			  success: function(data){
				  let str ="";				 
				  alert(data);				  
				  $.each(data,function(index, fileName){
					  
					  if(checkImageType(fileName)){			// 이미지 파일이면(s_파일이름.jpg)						 
						  str ="<div><a href=displayFile?fileName="+getImageLink(fileName)+">"
								  +"<img src='displayFile?fileName="+fileName+"'/>"	
								  +"</a><small class='human' data-src='"+fileName+"'>X</small></div>";
					  }else{								// 이미지 파일이 아니면
						  str = "<div><a href='displayFile?fileName="+fileName+"'>" 
								  + getOriginalName(fileName)+"</a>"
								  +"<small class='human' data-src='"+fileName+"'>X</small></div>";
					  }				// small 은 CSS 적용됨
					  
					  $(".uploadedList").append(str);	// 업로드한 파일을 뿌려주는 장소
				  });				 
			  },
			  error : function(xhr){
					alert("error html = " + xhr.statusText);
			  }			  
			});	
	});
	
	
	// click 이벤트가 발생하는데 small인 경우에는 
	$(".uploadedList").on("click", "small", function(event){			
		let that = $(this);			// this는 small 태그가 클릭되므로 small 객체이다
	   $.ajax({
		   url:"/human/deleteFile",
		   type:"post",
		   data: {
			   fileName:$(this).attr("data-src") // small 태그의 data-src 속성값에
		   },
		   dataType:"text",		 
		   success:function(result){
			   if(result == 'deleted'){				   
				   that.parent("div").remove();	// small 태그인 x 표를 눌러서 삭제할경우 이미지를 담는 div를 삭제하라 
				   alert("삭제성공");
			   }
		   }
	   });
	});
	
	
	
	$("input[type=button]").on("click", function(event){			
		let files=[];
		$.each($(".human"),function(index,item){
// 			files[index]=$(this).attr("data-src");
			files.push($(this).attr("data-src"));		// this는 small 태그이다				
		});				
		
//	 	배열을 직렬화해서 전송함 
		$.ajaxSettings.traditional = true;				// 배열이 직열화 하는 방법이다(컨트롤러가 받는 방법이 달라진다)
	   $.ajax({
		   url:"/human/deleteAllFiles",
		   type:"post",
		   data: {files: files},						// 뒤 files 는 배열이다
		   dataType:"text",		  
		   success:function(result){
			   if(result == 'deleted'){
				   $(".uploadedList").children().remove();
				   alert("삭제성공");
			   }
		   }
	   });
	});
	
	function checkImageType(fileName){			
// 		/i는 대소문자 구분 하지 말라는 뜻임
		let pattern = /.jpg|.gif|.png/i;	// 3중에 한개이면	
		return fileName.match(pattern);		
	}
	
	// s_ 를 잘라내야 원본 파일이 오므로 원본 파일을 만드는 과정
	function getImageLink(fileName){
		
		if(!checkImageType(fileName)){
			return;
		}	
		
		let front = fileName.substr(0,12);	// 0부터 12까지 자르기
		let end = fileName.substr(14);		// 14 이후부터 자르기
		alert(front + end);					// 결과 s_가 없어진다
		return front + end;	
	}
	
	// 일반 파일일 경우 날짜 폴더명을 제거하고 뿌려주어야 함. 이미지 파일은 파일 이름이 없다
	function getOriginalName(fileName){
		if(checkImageType(fileName)){
			return;
		}
		
		let idx = fileName.indexOf("_") + 1 ;
		return fileName.substr(idx);			// idx 이후부터 잘라라.
	}

</script>










	
</body>
</html>