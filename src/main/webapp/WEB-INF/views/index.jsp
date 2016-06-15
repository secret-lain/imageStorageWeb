<html> 
<head>
	<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
    <!-- Your site title -->
    <title>Home</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta name="description" content="Your site description" />

    <!-- Favicon Image. -->
    <link rel="icon" href="/resources/images/favicon.png" type="image/x-icon" />

    <!-- Google Web Font. -->
    <link href="//fonts.googleapis.com/css?family=Lato:700,300" rel="stylesheet" type="text/css">

    <!-- Normalize v.3.0.0 - makes browsers render all elements more consistently. -->
    <link rel="stylesheet" type="text/css" href="/resources/css/normalize.min.css" />

    <!-- Stylesheet - to improve site's load speed, better use the minimized version.
         The unminified version is also included in package. -->
    <link rel="stylesheet" type="text/css" href="/resources/css/style.lite.min.css" />
    
    <!-- Scripts -->
    <script type="text/javascript" src="/resources/js/upload.js"></script>
    <script type="text/javascript" src="/resources/js/freewall.min.js"></script>
    <script type="text/javascript" src="/resources/js/jquery.cycle2.min.js"></script>
    <script type="text/javascript" src="/resources/js/jquery.slimmenu.min.js"></script>
    <script type="text/javascript" src="/resources/js/custom-script.min.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
    <script>
    $(function() {
        $("#imgInp").on('change', function(){
            readURL(this);
        });
    });
    </script>
</head>

<body id="parent">

    <!-- All content (menu, main-entry, and footer) goes inside this container. -->
    <div class="main-container">

        <!-- Logo and menu inside this container. -->
        <div class="header">
            <div class="clearfix">

                <!-- Put your site logo here. Recommended size is 165px x 50px. -->
                <div class="float-left logo">
                    <h1>
                        <a href="#">
                            <img src="/resources/images/logo.png" alt="" />
                        </a>
                    </h1>
                </div>

                <!-- Top Menu Bar -->
                <div class="float-right">
                    <ul id="top-nav" class="slimmenu">

                        <!-- To create menu, type these...
                             <li>
                                 <a href="URL" target="open-iframe">Your Menu Item</a>
                             </li>

                             Note:
                             There's a fullscreen function in this template. To prevent fullscreen (if enabled) from exiting when user clicked a link,
                             put the linked web page into an iframe by using ... target="open-iframe" ...

                             The same goes for main-entry.
                        -->
                        <li>
                            <a href="#" target="open-iframe">About</a>
                        </li>
                        <li>
                            <a href="#" target="open-iframe">Clients</a>
                        </li>
                        <li>
                            <a href="#" target="open-iframe">Terms &amp; Conditions</a>
                        </li>
                        <li>
                            <a href="#" target="open-iframe">Contact</a>
                        </li>

                        <!-- This is the filter menu, to filter and display your works based on class name (usually named after a category) in main-entry.
                             To create filter, type these...
                             <a href="#" class="filter-label" data-filter=".cat-1"> (change .cat-1 accordingly)
                        -->
                        <li>
                            <a href="#">Filter Work</a>
                            <ul>
                                <li>
                                    <a href="#" class="filter-label active">All Category</a>
                                </li>
                                <li>
                                    <a href="#" class="filter-label" data-filter=".cat-1">Filter Category 1</a>
                                </li>
                                <li>
                                    <a href="#" class="filter-label" data-filter=".cat-2">Filter Category 2</a>
                                </li>
                                <li>
                                    <a href="#" class="filter-label" data-filter=".cat-3">Filter Category 3</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#">Follow Us On</a>
                            <ul>
                                <li>
                                    <a href="#">Facebook</a>
                                </li>
                                <li>
                                    <a href="#">Twitter</a>
                                </li>
                                <li>
                                    <a href="#">Pinterest</a>
                                </li>
                                <li>
                                    <a href="#">Instagram</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
            <div style="position:relative; width:100%; height:500px;">
				<img id="previewImg" src="#" alt="previewImg" width="300" height="300" style="display:none;" /><br>
				
				<form name="form1" method="post" action="uploadResult" enctype="multipart/form-data">
					<input type="file" id="imgInp" name="uploadImg"/>
					<input type="button" id="fileUploadSubmit" value="upload" onClick=fileCheck(this.form); />
				</form>
		</div>
        </div>
		
		
		
        <!-- Main Entry. 
             All posts thumbnails and sliders go inside .main-entry div. All of them are grid based named sizeXX (XX represents number of column and row)

                size11 = 1 column x 1 row 
                size12 = 1 column x 2 rows
                size21 = 2 columns x 1 row
                size32 = 3 columns x 2 rows (I use this for inner page to show video or slideshow)

             The basic code are these...

                <div class="brick tint size12 cat-1 cycle-slideshow" data-cycle-fx="scrollHorz" data-cycle-speed="500" data-fixpos="0-0">

                    // Your image
                    <img src="URL_to_image" alt="image text alternative" />

                    <div class="overlay">
                        <h3 class="project-title">Your Project Title</h3>
                        <p class="project-description">Your project description</p>
                        <a href="URL" class="open-project" target="open-iframe">OPEN <span class="pictogram">&#xe803;</span></a>
                    </div>

                </div>

             Legend:
             * Class:
                    brick = The grid. Must be included.
                    tint = To lighten the image. FYI, tint won't work on slideshow images. Optional.
                    size12 = Size of the grid. You can change this to size11, size21, or size32. Must be included.
                    cat-1 = For filter. Optional.
                    cycle-slideshow = To display slideshow. Optional.
             
             * data-cycle-fx = Slideshow effect. 
             * data-cycle-speed = Slideshow speed.
             // For more information, visit http://jquery.malsup.com/cycle2/api/

             * data-fixpos = To fixed position grid
             // For more information, visit http://www.vnjs.net/www/project/freewall/


             You can vary them all you want. See examples below for better understanding.
        -->
        <div id="freewall" class="free-wall">

            <div class="brick tint size11 cat-2">
                <img src="/resources/images/4538256461_96f9e70e9c_b.jpg" alt="" />
                <div class="overlay">
                    <h3 class="project-title">Your Project Title</h3>
                    <p class="project-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    <a href="single-page-lite1.html" class="open-project" target="open-iframe">OPEN <span class="pictogram">&#xe803;</span></a>
                </div>
            </div>
            <div class="brick tint size11 cat-3">
                <img src="/resources/images/2310704408_361758fa28_b.jpg" alt="" />
                <div class="overlay">
                    <h3 class="project-title">Your Project Title</h3>
                    <p class="project-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    <a href="single-page-lite2.html" class="open-project" target="open-iframe">OPEN <span class="pictogram">&#xe803;</span></a>
                </div>
            </div>
            <div class="brick tint size11 cat-2">
                <img src="/resources/images/3084871415_da49ab66ea_o.jpg" alt="" />
                <div class="overlay">
                    <h3 class="project-title">Your Project Title</h3>
                    <p class="project-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    <a href="single-page-lite3.html" class="open-project" target="open-iframe">OPEN <span class="pictogram">&#xe803;</span></a>
                </div>
            </div>

            <!-- This is the slideshow for images -->
            <div class="brick size12 cycle-slideshow" data-cycle-fx="scrollHorz" data-cycle-speed="500" data-fixpos="0-3">
                <!-- Your slideshow images -->
                <img src="/resources/images/5226290116_1409794022_b.jpg" alt="" />
                <img src="/resources/images/8098729514_fa1919474d_b.jpg" alt="" />
                <img src="/resources/images/3919137679_dc05b59927.jpg" alt="" />
            </div>

            <div class="brick size11" data-fixpos="1-0">
                <!-- For text only, put your heading/paragraph inside div .cover -->
                <div class="cover">
                    <p>
                        <strong>Hello!</strong>
                    </p>
                    <p>Welcome to my portfolio. I'm Jane Doe, a 20-something photographer with passion for composition and beauty.</p>
                    <p>Feel free to explore my works. And contact me for photo queries.</p>
                </div>
            </div>
            <div class="brick tint size12 cat-3">
                <img src="/resources/images/4414454672_e91f887d34_o.jpg" alt="" />
                <div class="overlay">
                    <h3 class="project-title">Your Project Title</h3>
                    <p class="project-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    <a href="single-page-lite1.html" class="open-project" target="open-iframe">OPEN <span class="pictogram">&#xe803;</span></a>
                </div>
            </div>
            <div class="brick size11 cycle-slideshow client-number" data-cycle-fx="scrollHorz" data-cycle-speed="200" data-fixpos="1-2">
                <img src="/resources/images/3346647884_a47c71fd9a_o.jpg" alt="" />
                <img src="/resources/images/1452336320_483f721d3d_o.jpg" alt="" />
                <img src="/resources/images/4538256461_96f9e70e9c_b.jpg" alt="" />
                <img src="/resources/images/2310704408_361758fa28_b.jpg" alt="" />
                <div class="client">
                    <div class="number">365</div>
                    <div class="client-text">Happy Clients and Counting</div>
                    <div class="client-text">
                        <a href="#">
                            <strong>BE ONE!</strong>
                        </a>
                    </div>
                </div>
            </div>
            <div class="brick tint size11 cat-1">
                <img src="/resources/images/5171071313_e4c110ccb2_b.jpg" alt="" />
                <div class="overlay">
                    <h3 class="project-title">Your Project Title</h3>
                    <p class="project-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    <a href="single-page-lite2.html" class="open-project" target="open-iframe">OPEN <span class="pictogram">&#xe803;</span></a>
                </div>
            </div>
            
            <!-- This is the slideshow for text. Wrap your text inside div .cover -->
            <div class="brick size11 cycle-slideshow" data-cycle-fx="fade" data-cycle-speed="900" data-cycle-slides="> div" data-fixpos="2-2">
                <div class="cover">
                    <h2>" Odipiscing aliquet. Nulla venenatis. In pede mi, aliquet sit amet, euismod in quis neque in neque sagittis scelerisque. Fusce quis quam mollis, varius diam at, tempus mi "</h2>
                    <p>Vivamus dictum</p>
                </div>
                <div class="cover">
                    <h2>" Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sed quam facilisis, condimentum nibh eu, hendrerit purus. Ut ut malesuada odio, nec ultricies nisi "</h2>
                    <p>Morbi tempor</p>
                </div>
                <div class="cover">
                    <h2>" Suspendisse malesuada lacus nunc, eu sagittis arcu egestas non. Morbi tempor tempus lobortis. Aenean aliquet dui ipsum, eget ullamcorper nisl ornare ut. Suspendisse in vestibulum sapien "</h2>
                    <p>consectetur</p>
                </div>
            </div>
            
            <div class="brick tint size11 cat-2">
                <img src="/resources/images/4171682579_91f75f9a6a_o.jpg" alt="" />
                <div class="overlay">
                    <h3 class="project-title">Your Project Title</h3>
                    <p class="project-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    <a href="single-page-lite1.html" class="open-project" target="open-iframe">OPEN <span class="pictogram">&#xe803;</span></a>
                </div>
            </div>
            <div class="brick tint size11 cat-1">
                <img src="/resources/images/1330348274_33c00c4886_o.jpg" alt="" />
                <div class="overlay">
                    <h3 class="project-title">Your Project Title</h3>
                    <p class="project-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    <a href="single-page-lite2.html" class="open-project" target="open-iframe">OPEN <span class="pictogram">&#xe803;</span></a>
                </div>
            </div>
            <div class="brick tint size21 cat-3">
                <img src="/resources/images/4613181397_78853da480_b.jpg" alt="" />
                <div class="overlay">
                    <h3 class="project-title">Your Project Title</h3>
                    <p class="project-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    <a href="single-page-lite1.html" class="open-project" target="open-iframe">OPEN <span class="pictogram">&#xe803;</span></a>
                </div>
            </div>
            <div class="brick tint size11 cat-1">
                <img src="/resources/images/261980228_495975b20b_o.jpg" alt="" />
                <div class="overlay">
                    <h3 class="project-title">Your Project Title</h3>
                    <p class="project-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    <a href="single-page-lite2.html" class="open-project" target="open-iframe">OPEN <span class="pictogram">&#xe803;</span></a>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <div class="footer">
            <div class="float-right copyright">
                <p>&copy;2014
                    <strong>Picku</strong>. All rights reserved. Designed by <a href="http://majuter.us">Majuterus</a> <!-- Consider a donation via PayPal for me at leoariwibowo@gmail.com, if you want to remove this link -->
                </p>
            </div>
        </div>


    </div>

    <!-- All links from this homepage will be opened in this iframe, to prevent fullscreen (if enabled) from exiting if the user clicked on a link. -->
    <iframe id="open-iframe" name="open-iframe"></iframe>


</body>

</html>