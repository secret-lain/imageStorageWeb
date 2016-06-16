/**
 * 
 */
function readURL(input) {
	if (input.files && input.files[0]) {
		var file = input.value;//File Path
		var fileExt = file.substring(file.lastIndexOf('.') + 1); //
		if (fileExt == "jpg" || fileExt == "png" || fileExt == "gif") {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#previewImg').attr('src', e.target.result);
				$('#previewImg').attr('style', "display:inline;");
			}	
			reader.readAsDataURL(input.files[0]);
		}
		else{
			alert("jpg,png,gif파일만 올릴 수 있습니다.");
		}
	}

}
function fileCheck(frm) {
	var file = frm.imgInp.value;//File Path
	var fileExt = file.substring(file.lastIndexOf('.') + 1); //
	var bSubmitCheck = true;

	if (!file) {
		alert("There is no file");
		return;
	}
	if (fileExt == "jpg" || fileExt == "png" || fileExt == "gif") {
		var result = confirm("file upload");
		if (result == true)
			frm.submit();
		else
			return;
	} else {
		alert("jpg,png,gif파일만 올릴 수 있습니다.");
	}
}