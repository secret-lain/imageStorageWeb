<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %> 
<html>
<head>
	<title>Home</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
    <script type="text/javascript" src="/resources/upload.js"></script>
    <script>
    $(function() {
        $("#imgInp").on('change', function(){
            readURL(this);
        });
    });
    </script>
</head>
<body>
<h1>
	Image upload page!  
</h1>

<img id="previewImg" src="#" alt="previewImg" width="300" height="300" style="display:none;" /><br>

<form name="form1" method="post" action="uploadResult" enctype="multipart/form-data">
	<input type="file" id="imgInp" name="uploadImg"/>
	<input type="button" id="fileUploadSubmit" value="upload" onClick=fileCheck(this.form); />
</form>


</body>
</html>
