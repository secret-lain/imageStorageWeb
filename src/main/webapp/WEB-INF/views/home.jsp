<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %> 
<html>
<head>
	<title>Home</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    
    <link href="/resources/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/bootstrap/dist/css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="/resources/bootstrap/dist/theme.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="/resources/js/upload.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
    <script>
    $(function() {
        $("#imgInp").on('change', function(){
            readURL(this);
        });
    });
    </script>
    <style>
    #header
    {
    	height: 50px;
    }
    fieldset
    {
    	width: 410px;
    	height: 310px;
    	border: 2px solid black;
    	display: inline;
    }
    #content
    {
		column-count: 2;
    }
    fieldset
    {
    	padding: 2px;
    }
    </style>
</head>
<body role="document">
<div id="header">
<%@include file="header.jsp" %>
</div>

<div class="container theme-showcase" role="main">
	<div class="jumbotron">
		<h2>Image upload</h2><br>
		<p>파일을 선택하여 이미지를 업로드 합니다. 이미지를 선택하면 미리보기에 자동으로 저장될 이미지가 보여집니다. 이미지외의 파일은 업로드가 거절될 수 있습니다.</p>
	</div>
	
	<div id="content">
		<h2>Preview</h2><br>
		<fieldset>
			<img id="previewImg" src="#" alt="previewImg" width="400" height="300" style="display:none;" />
		</fieldset>
		
		<h2>File select</h2><br>
		<form name="form1" method="post" action="uploadResult" enctype="multipart/form-data">
			<input type="file" id="imgInp" class="btn btn-primary" name="uploadImg"/><br><br>
			<input type="button" id="fileUploadSubmit" class="btn-lg btn-success" value="upload" onClick=fileCheck(this.form); />
		</form>
	</div>
</div>

<%@include file="footer.jsp" %>
</body>
</html>
