<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %> 
<html>
<head>
	<title>Home</title>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    
    <!-- loading basic bootstrap -->
    <link href="/resources/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/bootstrap/dist/css/bootstrap-theme.min.css" rel="stylesheet">
    <!-- 
	  -->
	  
	<!-- Stylesheet - to improve site's load speed, better use the minimized version.
     The unminified version is also included in package. -->
	<link rel="stylesheet" type="text/css" href="/resources/css/style.lite.min.css" />
		
	<!-- Normalize v.3.0.0 - makes browsers render all elements more consistently. -->
	<link rel="stylesheet" type="text/css" href="/resources/css/normalize.min.css" />
	
	<!-- Google Web Font. -->
    <link href="//fonts.googleapis.com/css?family=Lato:700,300" rel="stylesheet" type="text/css">
		
	<!-- loading Favicon Image -->
	<link rel="icon" href="/resources/images/favicon.png" type="image/s-icon">
	
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
	</div>
</div>
<img src="/resources/images/${images[2].linkHash}" width=300px height=300px/>
<br>
${path}
<!-- div id="freewall" class="free-wall main-entry">
            <div class="brick tint size11">
                <img src="/resources/images/5171071313_e4c110ccb2_b.jpg" alt="" />
                <div class="overlay">
                    <h3 class="project-title">Your Project Title</h3>
                    <p class="project-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    <a href="single-page-lite1.html" class="open-project">OPEN <span class="pictogram">&#xe803;</span></a>
                </div>
            </div>
            <div class="brick tint size11">
                <img src="/resources/images/5171071313_e4c110ccb2_b.jpg" alt="" />
                <div class="overlay">
                    <h3 class="project-title">Your Project Title</h3>
                    <p class="project-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    <a href="single-page-lite1.html" class="open-project">OPEN <span class="pictogram">&#xe803;</span></a>
                </div>
            </div>
            <div class="brick tint size11">
                <img src="/resources/images/1452336320_483f721d3d_o.jpg" alt="" />
                <div class="overlay">
                    <h3 class="project-title">Your Project Title</h3>
                    <p class="project-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    <a href="single-page-lite2.html" class="open-project">OPEN <span class="pictogram">&#xe803;</span></a>
                </div>
            </div>
            <div class="brick tint size11">
                <img src="/resources/images/4171682579_91f75f9a6a_o.jpg" alt="" />
                <div class="overlay">
                    <h3 class="project-title">Your Project Title</h3>
                    <p class="project-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    <a href="single-page-lite1.html" class="open-project">OPEN <span class="pictogram">&#xe803;</span></a>
                </div>
            </div>
            <div class="brick tint size11">
                <img src="/resources/images/1330348274_33c00c4886_o.jpg" alt="" />
                <div class="overlay">
                    <h3 class="project-title">Your Project Title</h3>
                    <p class="project-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    <a href="single-page-lite2.html" class="open-project">OPEN <span class="pictogram">&#xe803;</span></a>
                </div>
            </div>
            <div class="brick tint size11">
                <img src="/resources/images/4171682579_91f75f9a6a_o.jpg" alt="" />
                <div class="overlay">
                    <h3 class="project-title">Your Project Title</h3>
                    <p class="project-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    <a href="single-page-lite1.html" class="open-project">OPEN <span class="pictogram">&#xe803;</span></a>
                </div>
            </div>
            <div class="brick tint size11">
                <img src="/resources/images/1330348274_33c00c4886_o.jpg" alt="" />
                <div class="overlay">
                    <h3 class="project-title">Your Project Title</h3>
                    <p class="project-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    <a href="single-page-lite2.html" class="open-project">OPEN <span class="pictogram">&#xe803;</span></a>
                </div>
            </div>
            <div class="brick tint size11">
                <img src="/resources/images/5171071313_e4c110ccb2_b.jpg" alt="" />
                <div class="overlay">
                    <h3 class="project-title">Your Project Title</h3>
                    <p class="project-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    <a href="single-page-lite1.html" class="open-project">OPEN <span class="pictogram">&#xe803;</span></a>
                </div>
            </div>
            <div class="brick tint size11">
                <img src="/resources/images/1452336320_483f721d3d_o.jpg" alt="" />
                <div class="overlay">
                    <h3 class="project-title">Your Project Title</h3>
                    <p class="project-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    <a href="single-page-lite2.html" class="open-project">OPEN <span class="pictogram">&#xe803;</span></a>
                </div>
            </div>
            <div class="brick tint size11">
                <img src="/resources/images/1330348274_33c00c4886_o.jpg" alt="" />
                <div class="overlay">
                    <h3 class="project-title">Your Project Title</h3>
                    <p class="project-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    <a href="single-page-lite2.html" class="open-project">OPEN <span class="pictogram">&#xe803;</span></a>
                </div>
            </div>
            <div class="brick tint size11">
                <img src="/resources/images/5171071313_e4c110ccb2_b.jpg" alt="" />
                <div class="overlay">
                    <h3 class="project-title">Your Project Title</h3>
                    <p class="project-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    <a href="single-page-lite1.html" class="open-project">OPEN <span class="pictogram">&#xe803;</span></a>
                </div>
            </div>
            <div class="brick tint size11">
                <img src="/resources/images/1452336320_483f721d3d_o.jpg" alt="" />
                <div class="overlay">
                    <h3 class="project-title">Your Project Title</h3>
                    <p class="project-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    <a href="single-page-lite2.html" class="open-project">OPEN <span class="pictogram">&#xe803;</span></a>
                </div>
            </div>                 		
</div -->

<%@include file="footer.jsp" %>
</body>
</html>
