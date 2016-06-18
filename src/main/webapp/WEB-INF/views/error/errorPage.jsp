<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %> 

<html>
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600" media="screen" rel="stylesheet" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" media="screen" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="/resources/css/errorPage.css" />
  </head>
  <body class="sign error-page-wrapper background-color background-image">
    <div class="sign-container">
	<div class="nob"></div>
	<div class="post left"></div>
	<div class="post right"></div>
	<div class="pane">
		<div class="headline sign-text-color">
			${errorCode}
		</div>
		<div class="context sign-text-color">
			${errorComment}
		</div>
	</div>
</div>
<div class="text-container">
	<div class="headline secondary-text-color">
		${errorCode}
	</div>
	<div class="context primary-text-color">
		<p>
			${errorComment}
		</p>
	</div>
</div>

    <script>
      // Notice Animation
      function ErrorPage(e,t,n){this.$container=$(e),this.$contentContainer=this.$container.find(n=="sign"?".sign-container":".content-container"),this.pageType=t,this.templateName=n}ErrorPage.prototype.centerContent=function(){var e=this.$container.outerHeight(),t=this.$contentContainer.outerHeight(),n=(e-t)/2,r=this.templateName=="sign"?-100:0;this.$contentContainer.css("top",n+r)},ErrorPage.prototype.initialize=function(){var e=this;this.centerContent(),this.$container.on("resize",function(t){t.preventDefault(),t.stopPropagation(),e.centerContent()}),this.templateName=="plain"&&window.setTimeout(function(){e.$contentContainer.addClass("in")},500),this.templateName=="sign"&&$(".sign-container").animate({textIndent:0},{step:function(e){$(this).css({transform:"rotate("+e+"deg)","transform-origin":"top center"})},duration:1e3,easing:"easeOutBounce"})},ErrorPage.prototype.createTimeRangeTag=function(e,t){return"<time utime="+e+' simple_format="MMM DD, YYYY HH:mm">'+e+"</time> - <time utime="+t+' simple_format="MMM DD, YYYY HH:mm">'+t+"</time>."},ErrorPage.prototype.handleStatusFetchSuccess=function(e,t){if(e=="503")$("#replace-with-fetched-data").html(t.status.description);else if(!t.scheduled_maintenances.length)$("#replace-with-fetched-data").html("<em>(there are no active scheduled maintenances)</em>");else{var n=t.scheduled_maintenances[0];$("#replace-with-fetched-data").html(this.createTimeRangeTag(n.scheduled_for,n.scheduled_until)),$.fn.localizeTime()}},ErrorPage.prototype.handleStatusFetchFail=function(e){$("#replace-with-fetched-data").html("<em>(enter a valid StatusPage.io url)</em>")},ErrorPage.prototype.fetchStatus=function(e,t){if(!e||!t||t=="404")return;var n="",r=this;t=="503"?n=e+"/api/v2/status.json":n=e+"/api/v2/scheduled-maintenances/active.json",$.ajax({type:"GET",url:n}).success(function(e,n){r.handleStatusFetchSuccess(t,e)}).fail(function(e,n){r.handleStatusFetchFail(t)})};
      var ep = new ErrorPage('body', "404", "sign");
      ep.initialize();

      // hack to make sure content stays centered >_<
      // Locate Notice board to center
      $(window).on('resize', function() {
        $('body').trigger('resize')
      })

    </script>

    
  </body>
</html>
