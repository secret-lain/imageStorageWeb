<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>Photo Gallery</title>
<link href="resources/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<link href="resources/css/style.css" rel="stylesheet" type="text/css" media="all" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script src="resources/js/jquery-1.11.1.min.js"></script>
<script src="resources/js/bootstrap.js"></script>
<script src="resources/js/upload.js"></script>
<!--startsmothscrolling-->
<script type="text/javascript" src="resources/js/move-top.js"></script>
<script type="text/javascript" src="resources/js/easing.js"></script>
<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event){		
				event.preventDefault();
				$('html,body').animate({scrollTop:$(this.hash).offset().top},1200);
			});
		});
		
	</script>
<!--endsmothscrolling-->
<!--pop-up-->
<script src="resources/js/menu_jquery.js"></script>
<!--//pop-up-->
<!--gallery-->
<script src="resources/js/jquery.chocolat.js"></script>
		<link rel="stylesheet" href="resources/css/chocolat.css" type="text/css" media="screen">
		<!--light-box-files -->
		<script type="text/javascript">
		$(function() {
			$('.gallery a').Chocolat();
		});
		$(function() {
	        $("#imgInp").on('change', function(){
	            readURL(this);
	            //this.Chocolat();
	        });
	    });
		</script>
<!--/gallery-->
<style>
.filebox label {
  display: inline-block;
  padding: .5em .75em;
  color: #999;
  font-size: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #fdfdfd;
  cursor: pointer;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
}

.filebox input[type="file"] {  /* 파일 필드 숨기기 */
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip:rect(0,0,0,0);
  border: 0;
}
</style>
</head>
<body>
		<!--header-->
			<div class="header">
				<div class="container">
						<div class="logo">
							<h1><a href="/">Image Gallery - home</a></h1>
						</div>
					</div>
			</div>
			<!--header-->
			<!--banner-->
				<div class="banner top-banner">
					<div class="container">
					<nav class="navbar navbar-default">
			  <div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					 <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
				</div>
        <!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			  <ul class="nav navbar-nav cl-effect-16">
				<li><a href="/">Home <span class="sr-only">(current)</span></a></li>
				<li><a href="#">About</a></li>
				 <li class="dropdown">
				  <a href="#" data-hover="SERVICES" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Services<span class="caret"></span></a>
				  <ul class="dropdown-menu">
					 <li><a href="#">Services1</a></li>
					<li><a href="#">Services2</a></li>
					<li><a href="#">Services3</a></li>
				  </ul>
				</li>
					<li class="active"><a href="#">Gallery</a></li>
					<li><a href="#">Codes</a></li>
					<li><a href="#">Contact</a></li>
				</ul>
			</div><!-- /.navbar-collapse -->
		  </div><!-- /.container-fluid -->
		</nav>
	</div>
</div>

<!--indicate-->
	<div class="indicate">
		<div class="container">
			<div>
				<div class="clearfix col-md-4 col-xs-12">
					<img id="previewImg" src="#" alt="previewImg" width="400px" height="400px" style="display:none;" />
				</div>
		        
		        <div class="col-md-8 col-xs-12">
				<form name="form1" method="post" action="upload.do" enctype="multipart/form-data">
					<div class="col-md-12" style="padding-top: 10px">
						<div class="col-md-6 col-xs-6" align="right">
							<p>File select</p>
						</div>
						
						<div class="col-md-6 filebox" align="left">
							<label for="imgInp">파일 찾기</label>
		    				<input type="file" id="imgInp" name="uploadImg" style="display: none;">
						</div>
					</div>
					
					<div class="col-md-12">
						<div class="col-md-6 col-xs-6" align="right">
							<p>File Description</p>
						</div>
						
						<div class="col-md-6" align="left">
							<input type="text" name="fileDescription" width="100%">		
						</div>
					</div>
					<div class="col-md-12" style="padding-top: 30px">
						<input type="button" name="fileUploadSubmit" class="btn-lg btn-success" value="upload" onClick=fileCheck(this.form); />
					</div>
					
				</form>
				</div>
			</div>
		</div>
	</div>
<!--indicate-->

<!--banner-->
<div class="content">
	<div class="gallery">
		<h2>Images</h2>
		<div class="gallery-grids">
			<ul>
				<c:forEach var="item" items="${images}" varStatus="i">
            	<li>
					<a href="resources/images/${item.linkHash}">
						<img src="resources/images/${item.linkHash}" alt="" />	
						<div class="glry-bgd">
						</div>
					</a>
				</li>
				</c:forEach>
			</ul>
			<div class="clearfix"> </div>
		</div>	
	</div>
</div>
	<!--//gallery -->

			
			
			<!--footer-->
		<div class="footer-section">
						<div class="container">
							<div class="footer-top">
						<p>&copy; 2015 Photo Stream. All rights reserved | Design by <a href="http://w3layouts.com">W3layouts</a></p>
									</div>
							<script type="text/javascript">
						$(document).ready(function() {
							/*
							var defaults = {
					  			containerID: 'toTop', // fading element id
								containerHoverID: 'toTopHover', // fading element hover id
								scrollSpeed: 1200,
								easingType: 'linear' 
					 		};
							*/
							
							$().UItoTop({ easingType: 'easeOutQuart' });
							
						});
					</script>
				<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
				</div>
			</div>


<!-- div id="content">
	<!-- div id="internal">
		<form name="form2" method="GET" action="initTable.do">
			<input type="submit" name="initTable" value="initializingTable" />
		</form>
	</div>
</div>
real SavePath = ${path}
<br>
<cforEach var="item" items="${images}" varStatus="i">
<div class="brick tint size11">
                <a href="#"><img src="/resources/images/${item.linkHash}" alt="" /></a>
                <div class="overlay">
                    <h3 class="project-title">${item.description}</h3>
                    <p class="project-description">${item.uploadDate}</p>
                </div>
            </div>
</cforEach -->

</body>
</html>
