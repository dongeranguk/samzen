function writeSave() {
	
	if(document.writeForm.writer.value == "") {
		alert("작성자를 입력하세요.");
		return false;
	}
	if(document.writeForm.subject.value == "") {
		alert("제목을 입력하세요.");
		return false;
	}
	
	if(document.writeForm.content.value == "") {
		alert("내용을 입력하세요.");
		document.writeForm.content.focus();
		return false;
	}
	if(document.writeForm.passwd.value == "") {
		alert("비밀번호를 입력하세요.");
		document.writeForm.passwd.focus();
		return false;
	}
}