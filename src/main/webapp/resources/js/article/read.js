$(document).ready(function() {
	var formObj = $("form[role='form']");
	console.log(formObj);
	
	$("#btn-modify").on("click", function() {
		formObj.attr("action", "modifyPage");
		formObj.attr("method", "get");
		formObj.submit();
	});
	
	$("#btn-remove").on("click", function() {
		formObj.attr("action", "removePage");
		formObj.submit();
	});
	$("#btn-listAll").on("click", function() {
		formObj.attr("method", "get");
		formObj.attr("action", "listPage");
		formObj.submit();
	});
});