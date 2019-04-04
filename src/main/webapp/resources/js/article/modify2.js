$(document).ready(function() {
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	formObj.submit(function(event){
		event.preventDefault();
		
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