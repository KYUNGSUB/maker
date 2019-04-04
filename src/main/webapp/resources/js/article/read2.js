$(document).ready(function() {
	var formObj = $("form[role='form']");
	console.log(formObj);
	
	$("#btn-modify").on("click", function() {
		formObj.attr("action", "modifyPage");
		formObj.attr("method", "get");
		formObj.submit();
	});
	
	$("#btn-remove").on("click", function() {
		var arr = [];
		var test = $(".uploadedList li");
		$(".uploadedList li").each(function() {
			arr.push($(this).attr("data-src"));
		});
		if(arr.length > 0) {
			$.post("/deleteAllFiles", {files: arr}, function() {});
		}
		
		formObj.attr("action", "removePage");
		formObj.submit();
	});
	
	$("#btn-listAll").on("click", function() {
		formObj.attr("method", "get");
		formObj.attr("action", "list");
		formObj.submit();
	});
	
	$("#btn-reply").on("click", function() {
		formObj.attr("method", "get");
		formObj.attr("action", "reply");
		formObj.submit();
	});

	var bId = $("#bId").val();
	$.getJSON("/article/getAttach/" + bId, function(list) {
		$(list).each(function() {
			var str = "";
			if(checkImageType(this)) {
				str = "<li data-src='" + this + "'><a href='/displayFile?fileName=" + getImageLink(this) + "'>"
						+ "<img src='/displayFile?fileName=" + this + "'/></a></li>";
			} else {
				str = "<li data-src='" + this + "'><a href='/displayFile?fileName=" + this + "'>" + getOriginalName(this) + "</a></li>";
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