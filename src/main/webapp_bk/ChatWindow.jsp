<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
  <!--<link rel="shortcut icon" href="images/favicon.png" type="image/png">-->

  <title>Quirk Responsive Admin Templates</title>

  <link rel="stylesheet" href="lib/fontawesome/css/font-awesome.css">
  <link rel="stylesheet" href="lib/weather-icons/css/weather-icons.css">
  <link rel="stylesheet" href="lib/jquery-toggles/toggles-full.css">

  <link rel="stylesheet" href="css/quirk.css">

  <script src="lib/modernizr/modernizr.js"></script>
  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="lib/html5shiv/html5shiv.js"></script>
  <script src="lib/respond/respond.src.js"></script>
  <![endif]-->
</head>

<body>
 
<%@ include file="Header.jsp"%>

  <section>
 
 
<%@ include file="LeftPanel.jsp"%>

    <div class="mainpanel">

      <div class="contentpanel">

        <ol class="breadcrumb breadcrumb-quirk">
          <li><a href="index.html"><i class="fa fa-home mr5"></i> Home</a></li>
          <li><a href="buttons.html">Pages</a></li>
          <li class="active">Timeline</li>
        </ol>

        <hr class="darken">

        <div class="row">
          <div class="col-sm-8 col-md-9 col-lg-10">
            <div class="timeline-wrapper">
              <div class="timeline-date">Sunday, July 05, 2015</div>

              <div class="panel panel-post-item status">
                <div class="panel-heading">
                  <div class="media">
                    <div class="media-left">
                      <a href="#">
                        <img alt="" src="images/photos/user1.png" class="media-object img-circle">
                      </a>
                    </div>
                    <div class="media-body">
                      <h4 class="media-heading">Christina R. Hill</h4>
                      <p class="media-usermeta">
                        <span class="media-time">10:30 am</span>
                        <i class="glyphicon glyphicon-map-marker"></i> <a href="">San Francisco, CA</a>
                      </p>
                    </div>
                  </div><!-- media -->
                  <ul class="panel-options">
                    <li><a class="tooltips" href="" data-toggle="tooltip" title="View Options"><i class="glyphicon glyphicon-option-vertical"></i></a></li>
                  </ul>
                </div><!-- panel-heading -->
                <div class="panel-body">
                  Prototyping is one of the best things that can happen within a project, yet it is extremely underutilized. 
                </div>
                 
                <div class="collapse" id="comment-1">
                  <ul class="media-list">
                    <li class="media">
                      <div class="media-left">
                        <a href="#">
                          <img class="media-object img-circle" src="images/photos/user2.png" alt="">
                        </a>
                      </div>
                      <div class="media-body">
                        <h4 class="media-heading">Floyd M. Romero <small>8 minutes ago</small></h4>
                        Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.
                      </div>
                    </li>
                    <li class="media">
                      <div class="media-left">
                        <a href="#">
                          <img class="media-object img-circle" src="images/photos/user3.png" alt="">
                        </a>
                      </div>
                      <div class="media-body">
                        <h4 class="media-heading">Jennie S. Gray <small>5 minutes ago</small></h4>
                        Nor again is there anyone who loves or pursues or desires to obtain pain of itself,
                      </div>
                    </li>
                  </ul>
                </div>
                 
              </div><!-- panel panel-post -->

              <div class="panel panel-post-item status">
                <div class="panel-heading">
                  <div class="media">
                    <div class="media-left">
                      <a href="#">
                        <img alt="" src="images/photos/user2.png" class="media-object img-circle">
                      </a>
                    </div>
                    <div class="media-body">
                      <h4 class="media-heading">Floyd M. Romero</h4>
                      <p class="media-usermeta">
                        <span class="media-time">09:52 am</span>
                        <i class="glyphicon glyphicon-map-marker"></i> <a href="">Sydney, Australia</a>
                      </p>
                    </div>
                  </div><!-- media -->
                  <ul class="panel-options">
                    <li><a class="tooltips" href="" data-toggle="tooltip" title="View Options"><i class="glyphicon glyphicon-option-vertical"></i></a></li>
                  </ul>
                </div><!-- panel-heading -->
                <div class="panel-body">
                  In my experience, the most important factors are the client and the project’s complexity. Even if I understand the project well, I would like a high-fidelity, high-functionality prototype just in case. One of the fundamental mistakes you can make in projects is thinking you know them well. <a href="">#prototype</a> <a href="">#complexity</a>
                </div>
                <div class="panel-footer">
                  <ul class="list-inline">
                    <li><a href=""><i class="glyphicon glyphicon-heart"></i> Like</a></li>
                    <li><a><i class="glyphicon glyphicon-comment"></i> Comments (0)</a></li>
                    <li class="pull-right">5 liked this</li>
                  </ul>
                </div>
                 
              </div><!-- panel panel-post -->

              <div class="panel panel-post-item commented">
                <div class="panel-heading">
                  <div class="media">
                    <div class="media-left">
                      <a href="#">
                        <img alt="" src="images/photos/user3.png" class="media-object img-circle">
                      </a>
                    </div>
                    <div class="media-body">
                      <h4 class="media-heading">Jennie S. Gray <span>commented on this</span></h4>
                      <p class="media-usermeta">
                        <span class="media-time">09:24 am</span>
                        <i class="glyphicon glyphicon-map-marker"></i> <a href="">Tokyo, Japan</a>
                      </p>
                    </div>
                  </div><!-- media -->
                  <ul class="panel-options">
                    <li><a class="tooltips" href="" data-toggle="tooltip" title="View Options"><i class="glyphicon glyphicon-option-vertical"></i></a></li>
                  </ul>
                </div><!-- panel-heading -->
                <div class="panel-body">
                  <div class="media">
                    <div class="media-left">
                      <a href="#">
                        <img class="media-object width100" src="images/image.png" alt="">
                      </a>
                    </div>
                    <div class="media-body">
                      <h4 class="media-heading"><a href="">Five steps to Website Redesign</a></h4>
                      <p>For the past 12 years, Website Redesign Pros has been redesigning New York City’s very own breed of internet ventures. Once considered as the last recourse to rebirth by the rarest of rare internet entrepreneurs, ...</p>
                      <p class="mt10"><a href="http://goo.gl/d0jake">http://goo.gl/d0jake</a></p>
                    </div>
                  </div>
                </div>
                <div class="panel-footer">
                  <ul class="list-inline">
                    <li><a href=""><i class="glyphicon glyphicon-heart"></i> Like</a></li>
                    <li><a data-target="#comment-2" data-toggle="collapse"><i class="glyphicon glyphicon-comment"></i> Comments (1)</a></li>
                    <li class="pull-right">2 liked this</li>
                  </ul>
                </div>
                <div class="collapse" id="comment-2">
                  <ul class="media-list">
                    <li class="media">
                      <div class="media-left">
                        <a href="#">
                          <img class="media-object img-circle" src="images/photos/user3.png" alt="">
                        </a>
                      </div>
                      <div class="media-body">
                        <h4 class="media-heading">Jennie S. Gray <small>8 minutes ago</small></h4>
                        Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.
                      </div>
                    </li>
                  </ul>
                </div>
              
              </div><!-- panel panel-post -->

               <div class="panel panel-post-item twitter">
                <div class="panel-heading">
                  <div class="media">
                    <div class="media-left">
                      <a href="#">
                        <img alt="" src="images/photos/user5.png" class="media-object img-circle">
                      </a>
                    </div>
                    <div class="media-body">
                      <h4 class="media-heading">Nicholas T. Hinkle <span>shared a tweet</span></h4>
                      <p class="media-usermeta">
                        <span class="media-time">08:46 am</span>
                        <i class="glyphicon glyphicon-map-marker"></i> <a href="">Madrid, Spain</a>
                      </p>
                    </div>
                  </div><!-- media -->
                  <ul class="panel-options">
                    <li><a class="tooltips" href="" data-toggle="tooltip" title="View Options"><i class="glyphicon glyphicon-option-vertical"></i></a></li>
                  </ul>
                </div><!-- panel-heading -->
                <div class="panel-body">
                  <p>Whenever there’s a crisis of confidence in terms of strategy, planning, or work mechanisms, a company is forced to take the restructuring route.</p>
                  <p>via Twitter</p>
                </div>
              </div><!-- panel panel-post -->

              <div class="timeline-date">Friday, July 03, 2015</div>

              <div class="panel panel-post-item twitter">
                <div class="panel-heading">
                  <div class="media">
                    <div class="media-left">
                      <a href="#">
                        <img alt="" src="images/photos/user6.png" class="media-object img-circle">
                      </a>
                    </div>
                    <div class="media-body">
                      <h4 class="media-heading">Jamie W. Bradford <span>shared a tweet</span></h4>
                      <p class="media-usermeta">
                        <span class="media-time">10:15 pm</span>
                        <i class="glyphicon glyphicon-map-marker"></i> <a href="">Bali, Indonesia</a>
                      </p>
                    </div>
                  </div><!-- media -->
                  <ul class="panel-options">
                    <li><a class="tooltips" href="" data-toggle="tooltip" title="View Options"><i class="glyphicon glyphicon-option-vertical"></i></a></li>
                  </ul>
                </div><!-- panel-heading -->
                <div class="panel-body">
                  <p>A friend of mine who is new to web designing told me he is having facing some difficulties creating layouts using tables.</p>
                  <p>via Twitter</p>
                </div>
              </div><!-- panel panel-post -->

              <div class="panel panel-post-item commented">
                <div class="panel-heading">
                  <div class="media">
                    <div class="media-left">
                      <a href="#">
                        <img alt="" src="images/photos/user3.png" class="media-object img-circle">
                      </a>
                    </div>
                    <div class="media-body">
                      <h4 class="media-heading">Jennie S. Gray <span>published a new article</span></h4>
                      <p class="media-usermeta">
                        <span class="media-time">09:24 pm</span>
                        <i class="glyphicon glyphicon-map-marker"></i> <a href="">Sacramento, CA, USA</a>
                      </p>
                    </div>
                  </div><!-- media -->
                  <ul class="panel-options">
                    <li><a class="tooltips" href="" data-toggle="tooltip" title="View Options"><i class="glyphicon glyphicon-option-vertical"></i></a></li>
                  </ul>
                </div><!-- panel-heading -->
                <div class="panel-body">
                  <div class="media">
                    <div class="media-left">
                      <a href="#">
                        <img class="media-object width100" src="images/image.png" alt="">
                      </a>
                    </div>
                    <div class="media-body">
                      <h4 class="media-heading"><a href="">Getting started with Bootstrap</a></h4>
                      <p>For any front-ender or coder, sooner or later the time comes to create his/her own small framework. It usually consists of those rules and functions that had to be repeated in every recent project...</p>
                      <p class="mt10"><a href="http://goo.gl/dXxNxR">http://goo.gl/dXxNxR</a></p>
                    </div>
                  </div>
                </div>
                <div class="panel-footer">
                  <ul class="list-inline">
                    <li><a href=""><i class="glyphicon glyphicon-heart"></i> Like</a></li>
                    <li><a><i class="glyphicon glyphicon-comment"></i> Comments (0)</a></li>
                    <li class="pull-right">18 liked this</li>
                  </ul>
                </div>
                 
              </div><!-- panel panel-post -->

              <div class="timeline-date"><a href="">Load more...</a></div>

            </div><!-- timeline-wrapper -->
          </div>
          
        </div><!-- row -->

    </div><!-- contentpanel -->

  </div><!-- mainpanel -->

</section>


<script src="lib/jquery/jquery.js"></script>
<script src="lib/jquery-ui/jquery-ui.js"></script>
<script src="lib/bootstrap/js/bootstrap.js"></script>
<script src="lib/jquery-toggles/toggles.js"></script>

<script src="js/quirk.js"></script>


</body>
</html>
