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
	
	$("#replyForm").submit(function(event){
		event.preventDefault();
		
		// smarteditor 관련
		oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
		
		var that = $(this);

		that.get(0).submit();
	});
});