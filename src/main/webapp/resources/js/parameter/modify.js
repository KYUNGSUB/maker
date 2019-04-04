$(document).ready(function() {	
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	formObj.submit(function(event){
		var that = $(this);
		that.get(0).submit();
	});
	
	$("#btn-cancel").on("click", function() {
		self.location = "/parameter/list?page=${cri.page}&perPageNum=${cri.perPageNum}";
	});
});