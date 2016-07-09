<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<title>Home</title>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    
    <!-- loading basic bootstrap -->
    <link href="/resources/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/bootstrap/dist/css/bootstrap-theme.min.css" rel="stylesheet">
		
	<!-- loading Favicon Image -->
	<link rel="icon" href="/resources/favicon.png" type="image/s-icon">
	
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
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
    	width: 310px;
    	height: 310px;
    	border: 2px solid black;
    	display: inline;
    	padding: 2px;
    }
    #content
    {
		height: 360px;
		background-color: #cce6ff;
		margin-bottom: 0px;
    }
    #internal
    {
    	column-count: 2;
    	width: 70%;
    	height: 360px;
    	margin-left: auto;
    	margin-right: auto;
    	padding-top: 5px;
    }
    #freewall
    {
    	margin-top: 0px;
    }
    </style>
</head>
<body role="document">
<div id="header">
<%@include file="header.jsp" %>
</div>	

<div id="content">
	<div id="internal">
		<h3>Preview</h3><br>
		<fieldset>
			<img id="previewImg" src="#" alt="previewImg" width="300" height="300" style="display:none;" />
		</fieldset>
		         
		<form name="form1" method="post" action="upload.do" enctype="multipart/form-data">
			<h3>File select</h3><br>
			<label class="btn btn-default btn-file">
    			파일 찾기 <input type="file" id="imgInp" name="uploadImg" style="display: none;">
			</label>
			<br><br>
			<h3>File title</h3><br>
			<input type="text" name="fileDescription" size="48"><br><br><br>
			<input type="button" name="fileUploadSubmit" class="btn-lg btn-success" value="upload" onClick=fileCheck(this.form); />
			<!-- fileDescription == Controller에 @RequestParam으로 인자를 넘기기위해 name으로 변경. -->
		</form>
		<form name="form2" method="GET" action="initTable.do">
			<input type="submit" name="initTable" value="initializingTable" />
		</form>
	</div>
</div>
real SavePath = ${path}
<br>
<c:forEach var="item" items="${images}" varStatus="i">
<div class="brick tint size11">
                <img src="/resources/images/${item.linkHash}" alt="" />
                <div class="overlay">
                    <h3 class="project-title">Your Project Title</h3>
                    <p class="project-description">다람쥐 쳇바퀴에 돌아</p>
                    <a href="#" class="open-project">OPEN <span class="pictogram">&#xe803;</span></a>
                </div>
            </div>
</c:forEach>

<%@include file="footer.jsp" %>
</body>
</html>
