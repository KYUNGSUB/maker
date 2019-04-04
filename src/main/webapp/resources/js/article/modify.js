var oEditors = [];
$(document).ready(function() {
	// smarteditor 관련 부분
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors,
		elPlaceHolder : "ir1", //textarea에서 지정한 id와 일치해야 합니다. 
		//SmartEditor2Skin.html 파일이 존재하는 경로
		sSkinURI : "/resources/smarteditor/SmartEditor2Skin.html",
		htParams : {
			// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseToolbar : true,
			// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,
			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true,
			fOnBeforeUnload : function() {

			}
		},
		fOnAppLoad : function() {
			//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
			oEditors.getById["ir1"].exec("PASTE_HTML", [ "" ]);
		},
		fCreator : "createSEditor2"
	});
	
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	formObj.submit(function(event){
		event.preventDefault();
		
		// smarteditor 관련
		oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
		
		var that = $(this);
		
		var str ="";
		$(".uploadedList .delbtn").each(function(index){
			 str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("data-src") +"'> ";
		});
		
		that.append(str);

		console.log(str);
		
		that.get(0).submit();
	});
	
	$("#btn-cancel").on("click", function() {
		self.location = "/article/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
			+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
	});
	
	$(".fileDrop").on("dragenter dragover", function(event){
		event.preventDefault();
	});


	$(".fileDrop").on("drop", function(event){
		event.preventDefault();
		
		var files = event.originalEvent.dataTransfer.files;
		var file = files[0];
		var formData = new FormData();
		
		formData.append("file", file);	

		$.ajax({
			url: '/uploadAjax',
			data: formData,
			dataType:'text',
			processData: false,
			contentType: false,
			type: 'POST',
			success: function(data){
				var str = "";
				if(checkImageType(data)) {
					str = "<li><a href='/displayFile?fileName=" + getImageLink(data) + "'>"
							+ "<img src='/displayFile?fileName=" + data + "'/>"
							+ "</a><small class='delbtn' data-src=" + data + ">X</small></li>";
				} else {
					str = "<li><a href='/displayFile?fileName=" + data + "'>" + getOriginalName(data) + "</a>"
							+ "<small class='delbtn' data-src=" + data + ">X</samll></li>";
				}
				$(".uploadedList").append(str);
			}
		});	
	});
	
	$(".uploadedList").on("click", "small", function() {
		var that = $(this);
		
		$.ajax({
			url: "/deleteFile",
			type: "post",
			data: { fileName: $(this).attr("data-src")},
			dataType: "text",
			success: function(result) {
				if(result == 'deleted') {
					//alert("deleted");
					that.parent("li").remove();
				}
			}
		});
	});
	
	var bId = $("#bId").val();
	$.getJSON("/article/getAttach/" + bId, function(list) {
		$(list).each(function() {
			var str = "";
			if(checkImageType(this)) {
				str = "<li><a href='/displayFile?fileName=" + getImageLink(this) + "'>"
						+ "<img src='/displayFile?fileName=" + this + "'/>"
						+ "</a><small class='delbtn' data-src=" + this + ">X</small></li>";
			} else {
				str = "<li><a href='/displayFile?fileName=" + this + "'>" + getOriginalName(this) + "</a>"
						+ "<small class='delbtn' data-src=" + this + ">X</samll></li>";
			}
			$(".uploadedList").append(str);
		});
	});
	
	// 정규표현식을 이용해서 파일의 확장자가 존재하는지를 검사
	function checkImageType(fileName) {
		var pattern = /jpg|gif|png|jpeg/i;

		return fileName.match(pattern);
	}
	
	function getOriginalName(fileName) {
		if(checkImageType(fileName)) {
			return;
		}
		
		var idx = fileName.indexOf("_") + 1;
		return fileName.substr(idx);
	}
	
	function getImageLink(fileName) {
		if(!checkImageType(fileName)) {
			return;
		}
		
		var front = fileName.substr(0, 12);
		var end = fileName.substr(14);
		
		return front + end;
	}
});