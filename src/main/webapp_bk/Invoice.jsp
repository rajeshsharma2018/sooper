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
  <link rel="stylesheet" href="lib/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css">
  <link rel="stylesheet" href="lib/select2/select2.css">

  <link rel="stylesheet" href="css/quirk.css">

  <script src="/lib/modernizr/modernizr.js"></script>
  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="lib/html5shiv/html5shiv.js"></script>
  <script src="lib/respond/respond.src.js"></script>
  <![endif]-->
</head>

<body>

  <header>
    <div class="headerpanel">

      <div class="logopanel">
        <h2><a href="index.html">Quirk</a></h2>
      </div><!-- logopanel -->

      <div class="headerbar">

        <a id="menuToggle" class="menutoggle"><i class="fa fa-bars"></i></a>

        <div class="searchpanel">
          <div class="input-group">
            <input type="text" class="form-control" placeholder="Search for...">
            <span class="input-group-btn">
              <button class="btn btn-default" type="button"><i class="fa fa-search"></i></button>
            </span>
          </div><!-- input-group -->
        </div>

        <div class="header-right">
          <ul class="headermenu">
            <li>
              <div id="noticePanel" class="btn-group">
                <button class="btn btn-notice alert-notice" data-toggle="dropdown">
                  <i class="fa fa-globe"></i>
                </button>
                <div id="noticeDropdown" class="dropdown-menu dm-notice pull-right">
                  <div role="tabpanel">
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs nav-justified" role="tablist">
                      <li class="active"><a data-target="#notification" data-toggle="tab">Notifications (2)</a></li>
                      <li><a data-target="#reminders" data-toggle="tab">Reminders (4)</a></li>
                    </ul>

                    <!-- Tab panes -->
                    <div class="tab-content">
                      <div role="tabpanel" class="tab-pane active" id="notification">
                        <ul class="list-group notice-list">
                          <li class="list-group-item unread">
                            <div class="row">
                              <div class="col-xs-2">
                                <i class="fa fa-envelope"></i>
                              </div>
                              <div class="col-xs-10">
                                <h5><a href="">New message from Weno Carasbong</a></h5>
                                <small>June 20, 2015</small>
                                <span>Soluta nobis est eligendi optio cumque...</span>
                              </div>
                            </div>
                          </li>
                          <li class="list-group-item unread">
                            <div class="row">
                              <div class="col-xs-2">
                                <i class="fa fa-user"></i>
                              </div>
                              <div class="col-xs-10">
                                <h5><a href="">Renov Leonga is now following you!</a></h5>
                                <small>June 18, 2015</small>
                              </div>
                            </div>
                          </li>
                          <li class="list-group-item">
                            <div class="row">
                              <div class="col-xs-2">
                                <i class="fa fa-user"></i>
                              </div>
                              <div class="col-xs-10">
                                <h5><a href="">Zaham Sindil is now following you!</a></h5>
                                <small>June 17, 2015</small>
                              </div>
                            </div>
                          </li>
                          <li class="list-group-item">
                            <div class="row">
                              <div class="col-xs-2">
                                <i class="fa fa-thumbs-up"></i>
                              </div>
                              <div class="col-xs-10">
                                <h5><a href="">Rey Reslaba likes your post!</a></h5>
                                <small>June 16, 2015</small>
                                <span>HTML5 For Beginners Chapter 1</span>
                              </div>
                            </div>
                          </li>
                          <li class="list-group-item">
                            <div class="row">
                              <div class="col-xs-2">
                                <i class="fa fa-comment"></i>
                              </div>
                              <div class="col-xs-10">
                                <h5><a href="">Socrates commented on your post!</a></h5>
                                <small>June 16, 2015</small>
                                <span>Temporibus autem et aut officiis debitis...</span>
                              </div>
                            </div>
                          </li>
                        </ul>
                        <a class="btn-more" href="">View More Notifications <i class="fa fa-long-arrow-right"></i></a>
                      </div><!-- tab-pane -->

                      <div role="tabpanel" class="tab-pane" id="reminders">
                        <h1 id="todayDay" class="today-day">...</h1>
                        <h3 id="todayDate" class="today-date">...</h3>

                        <h5 class="today-weather"><i class="wi wi-hail"></i> Cloudy 77 Degree</h5>
                        <p>Thunderstorm in the area this afternoon through this evening</p>

                        <h4 class="panel-title">Upcoming Events</h4>
                        <ul class="list-group">
                          <li class="list-group-item">
                            <div class="row">
                              <div class="col-xs-2">
                                <h4>20</h4>
                                <p>Aug</p>
                              </div>
                              <div class="col-xs-10">
                                <h5><a href="">HTML5/CSS3 Live! United States</a></h5>
                                <small>San Francisco, CA</small>
                              </div>
                            </div>
                          </li>
                          <li class="list-group-item">
                            <div class="row">
                              <div class="col-xs-2">
                                <h4>05</h4>
                                <p>Sep</p>
                              </div>
                              <div class="col-xs-10">
                                <h5><a href="">Web Technology Summit</a></h5>
                                <small>Sydney, Australia</small>
                              </div>
                            </div>
                          </li>
                          <li class="list-group-item">
                            <div class="row">
                              <div class="col-xs-2">
                                <h4>25</h4>
                                <p>Sep</p>
                              </div>
                              <div class="col-xs-10">
                                <h5><a href="">HTML5 Developer Conference 2015</a></h5>
                                <small>Los Angeles CA United States</small>
                              </div>
                            </div>
                          </li>
                          <li class="list-group-item">
                            <div class="row">
                              <div class="col-xs-2">
                                <h4>10</h4>
                                <p>Oct</p>
                              </div>
                              <div class="col-xs-10">
                                <h5><a href="">AngularJS Conference 2015</a></h5>
                                <small>Silicon Valley CA, United States</small>
                              </div>
                            </div>
                          </li>
                        </ul>
                        <a class="btn-more" href="">View More Events <i class="fa fa-long-arrow-right"></i></a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </li>
            <li>
              <div class="btn-group">
                <button type="button" class="btn btn-logged" data-toggle="dropdown">
                  <img src="images/photos/loggeduser.png" alt="" />
                  Elen Adarna
                  <span class="caret"></span>
                </button>
                <ul class="dropdown-menu pull-right">
                  <li><a href="profile.html"><i class="glyphicon glyphicon-user"></i> My Profile</a></li>
                  <li><a href="#"><i class="glyphicon glyphicon-cog"></i> Account Settings</a></li>
                  <li><a href="#"><i class="glyphicon glyphicon-question-sign"></i> Help</a></li>
                  <li><a href="signin.html"><i class="glyphicon glyphicon-log-out"></i> Log Out</a></li>
                </ul>
              </div>
            </li>
            <li>
              <button id="chatview" class="btn btn-chat alert-notice">
                <span class="badge-alert"></span>
                <i class="fa fa-comments-o"></i>
              </button>
            </li>
          </ul>
        </div><!-- header-right -->
      </div><!-- headerbar -->
    </div><!-- header-->
  </header>

  <section>

    <div class="leftpanel">
      <div class="leftpanelinner">

        <!-- ################## LEFT PANEL PROFILE ################## -->

        <div class="media leftpanel-profile">
          <div class="media-left">
            <a href="#">
              <img src="images/photos/loggeduser.png" alt="" class="media-object img-circle">
            </a>
          </div>
          <div class="media-body">
            <h4 class="media-heading">Elen Adarna <a data-toggle="collapse" data-target="#loguserinfo" class="pull-right"><i class="fa fa-angle-down"></i></a></h4>
            <span>Software Engineer</span>
          </div>
        </div><!-- leftpanel-profile -->

        <div class="leftpanel-userinfo collapse" id="loguserinfo">
          <h5 class="sidebar-title">Address</h5>
          <address>
            4975 Cambridge Road
            Miami Gardens, FL 33056
          </address>
          <h5 class="sidebar-title">Contact</h5>
          <ul class="list-group">
            <li class="list-group-item">
              <label class="pull-left">Email</label>
              <span class="pull-right">me@themepixels.com</span>
            </li>
            <li class="list-group-item">
              <label class="pull-left">Home</label>
              <span class="pull-right">(032) 1234 567</span>
            </li>
            <li class="list-group-item">
              <label class="pull-left">Mobile</label>
              <span class="pull-right">+63012 3456 789</span>
            </li>
            <li class="list-group-item">
              <label class="pull-left">Social</label>
              <div class="social-icons pull-right">
                <a href="#"><i class="fa fa-facebook-official"></i></a>
                <a href="#"><i class="fa fa-twitter"></i></a>
                <a href="#"><i class="fa fa-pinterest"></i></a>
              </div>
            </li>
          </ul>
        </div><!-- leftpanel-userinfo -->

        <ul class="nav nav-tabs nav-justified nav-sidebar">
          <li class="tooltips active" data-toggle="tooltip" title="Main Menu"><a data-toggle="tab" data-target="#mainmenu"><i class="tooltips fa fa-ellipsis-h"></i></a></li>
          <li class="tooltips unread" data-toggle="tooltip" title="Check Mail"><a data-toggle="tab" data-target="#emailmenu"><i class="tooltips fa fa-envelope"></i></a></li>
          <li class="tooltips" data-toggle="tooltip" title="Contacts"><a data-toggle="tab" data-target="#contactmenu"><i class="fa fa-user"></i></a></li>
          <li class="tooltips" data-toggle="tooltip" title="Settings"><a data-toggle="tab" data-target="#settings"><i class="fa fa-cog"></i></a></li>
          <li class="tooltips" data-toggle="tooltip" title="Log Out"><a href="signin.html"><i class="fa fa-sign-out"></i></a></li>
        </ul>

        <div class="tab-content">

          <!-- ################# MAIN MENU ################### -->

          <div class="tab-pane active" id="mainmenu">
            <h5 class="sidebar-title">Favorites</h5>
            <ul class="nav nav-pills nav-stacked nav-quirk">
              <li><a href="index.html"><i class="fa fa-home"></i> <span>Dashboard</span></a></li>
              <li><a href="widgets.html"><span class="badge pull-right">10+</span><i class="fa fa-cube"></i> <span>Widgets</span></a></li>
              <li><a href="maps.html"><i class="fa fa-map-marker"></i> <span>Maps</span></a></li>
            </ul>

            <h5 class="sidebar-title">Main Menu</h5>
            <ul class="nav nav-pills nav-stacked nav-quirk">
              <li class="nav-parent">
                <a href=""><i class="fa fa-check-square"></i> <span>Forms</span></a>
                <ul class="children">
                  <li><a href="general-forms.html">Form Elements</a></li>
                  <li><a href="form-validation.html">Form Validation</a></li>
                  <li><a href="form-wizards.html">Form Wizards</a></li>
                  <li><a href="wysiwyg.html">Text Editor</a></li>
                </ul>
              </li>
              <li class="nav-parent"><a href=""><i class="fa fa-suitcase"></i> <span>UI Elements</span></a>
                <ul class="children">
                  <li><a href="buttons.html">Buttons</a></li>
                  <li><a href="icons.html">Icons</a></li>
                  <li><a href="typography.html">Typography</a></li>
                  <li><a href="alerts.html">Alerts &amp; Notifications</a></li>
                  <li><a href="tabs-accordions.html">Tabs &amp; Accordions</a></li>
                  <li><a href="sliders.html">Sliders</a></li>
                  <li><a href="graphs.html">Graphs &amp; Charts</a></li>
                  <li><a href="panels.html">Panels</a></li>
                  <li><a href="extras.html">Extras</a></li>
                </ul>
              </li>
              <li class="nav-parent active"><a href=""><i class="fa fa-th-list"></i> <span>Tables</span></a>
                <ul class="children">
                  <li><a href="basic-tables.html">Basic Tables</a></li>
                  <li class="active"><a href="data-tables.html">Data Tables</a></li>
                </ul>
              </li>
              <li class="nav-parent"><a href=""><i class="fa fa-file-text"></i> <span>Pages</span></a>
                <ul class="children">
                  <li><a href="asset-manager.html">Asset Manager</a></li>
                  <li><a href="people-directory.html">People Directory</a></li>
                  <li><a href="timeline.html">Timeline</a></li>
                  <li><a href="profile.html">Profile</a></li>
                  <li><a href="blank.html">Blank Page</a></li>
                  <li><a href="notfound.html">404 Page</a></li>
                  <li><a href="signin.html">Sign In</a></li>
                  <li><a href="signup.html">Sign Up</a></li>
                </ul>
              </li>
            </ul>
          </div><!-- tab-pane -->

          <!-- ######################## EMAIL MENU ##################### -->

          <div class="tab-pane" id="emailmenu">
            <div class="sidebar-btn-wrapper">
              <a href="compose.html" class="btn btn-danger btn-block">Compose</a>
            </div>

            <h5 class="sidebar-title">Mailboxes</h5>
            <ul class="nav nav-pills nav-stacked nav-quirk nav-mail">
              <li><a href="email.html"><i class="fa fa-inbox"></i> <span>Inbox (3)</span></a></li>
              <li><a href="email.html"><i class="fa fa-pencil"></i> <span>Draft (2)</span></a></li>
              <li><a href="email.html"><i class="fa fa-paper-plane"></i> <span>Sent</span></a></li>
            </ul>

            <h5 class="sidebar-title">Tags</h5>
            <ul class="nav nav-pills nav-stacked nav-quirk nav-label">
              <li><a href="#"><i class="fa fa-tags primary"></i> <span>Communication</span></a></li>
              <li><a href="#"><i class="fa fa-tags success"></i> <span>Updates</span></a></li>
              <li><a href="#"><i class="fa fa-tags warning"></i> <span>Promotions</span></a></li>
              <li><a href="#"><i class="fa fa-tags danger"></i> <span>Social</span></a></li>
            </ul>
          </div><!-- tab-pane -->

          <!-- ################### CONTACT LIST ################### -->

          <div class="tab-pane" id="contactmenu">
            <div class="input-group input-search-contact">
              <input type="text" class="form-control" placeholder="Search contact">
              <span class="input-group-btn">
                <button class="btn btn-default" type="button"><i class="fa fa-search"></i></button>
              </span>
            </div>
            <h5 class="sidebar-title">My Contacts</h5>
            <ul class="media-list media-list-contacts">
              <li class="media">
                <a href="#">
                  <div class="media-left">
                    <img class="media-object img-circle" src="images/photos/user1.png" alt="">
                  </div>
                  <div class="media-body">
                    <h4 class="media-heading">Christina R. Hill</h4>
                    <span><i class="fa fa-phone"></i> 386-752-1860</span>
                  </div>
                </a>
              </li>
              <li class="media">
                <a href="#">
                  <div class="media-left">
                    <img class="media-object img-circle" src="images/photos/user2.png" alt="">
                  </div>
                  <div class="media-body">
                    <h4 class="media-heading">Floyd M. Romero</h4>
                    <span><i class="fa fa-mobile"></i> +1614-650-8281</span>
                  </div>
                </a>
              </li>
              <li class="media">
                <a href="#">
                  <div class="media-left">
                    <img class="media-object img-circle" src="images/photos/user3.png" alt="">
                  </div>
                  <div class="media-body">
                    <h4 class="media-heading">Jennie S. Gray</h4>
                    <span><i class="fa fa-phone"></i> 310-757-8444</span>
                  </div>
                </a>
              </li>
              <li class="media">
                <a href="#">
                  <div class="media-left">
                    <img class="media-object img-circle" src="images/photos/user4.png" alt="">
                  </div>
                  <div class="media-body">
                    <h4 class="media-heading">Alia J. Locher</h4>
                    <span><i class="fa fa-mobile"></i> +1517-386-0059</span>
                  </div>
                </a>
              </li>
              <li class="media">
                <a href="#">
                  <div class="media-left">
                    <img class="media-object img-circle" src="images/photos/user5.png" alt="">
                  </div>
                  <div class="media-body">
                    <h4 class="media-heading">Nicholas T. Hinkle</h4>
                    <span><i class="fa fa-skype"></i> nicholas.hinkle</span>
                  </div>
                </a>
              </li>
              <li class="media">
                <a href="#">
                  <div class="media-left">
                    <img class="media-object img-circle" src="images/photos/user6.png" alt="">
                  </div>
                  <div class="media-body">
                    <h4 class="media-heading">Jamie W. Bradford</h4>
                    <span><i class="fa fa-phone"></i> 225-270-2425</span>
                  </div>
                </a>
              </li>
              <li class="media">
                <a href="#">
                  <div class="media-left">
                    <img class="media-object img-circle" src="images/photos/user7.png" alt="">
                  </div>
                  <div class="media-body">
                    <h4 class="media-heading">Pamela J. Stump</h4>
                    <span><i class="fa fa-mobile"></i> +1773-879-2491</span>
                  </div>
                </a>
              </li>
              <li class="media">
                <a href="#">
                  <div class="media-left">
                    <img class="media-object img-circle" src="images/photos/user8.png" alt="">
                  </div>
                  <div class="media-body">
                    <h4 class="media-heading">Refugio C. Burgess</h4>
                    <span><i class="fa fa-mobile"></i> +1660-627-7184</span>
                  </div>
                </a>
              </li>
              <li class="media">
                <a href="#">
                  <div class="media-left">
                    <img class="media-object img-circle" src="images/photos/user9.png" alt="">
                  </div>
                  <div class="media-body">
                    <h4 class="media-heading">Ashley T. Brewington</h4>
                    <span><i class="fa fa-skype"></i> ashley.brewington</span>
                  </div>
                </a>
              </li>
              <li class="media">
                <a href="#">
                  <div class="media-left">
                    <img class="media-object img-circle" src="images/photos/user10.png" alt="">
                  </div>
                  <div class="media-body">
                    <h4 class="media-heading">Roberta F. Horn</h4>
                    <span><i class="fa fa-phone"></i> 716-630-0132</span>
                  </div>
                </a>
              </li>
            </ul>
          </div><!-- tab-pane -->

          <!-- #################### SETTINGS ################### -->

          <div class="tab-pane" id="settings">
            <h5 class="sidebar-title">General Settings</h5>
            <ul class="list-group list-group-settings">
              <li class="list-group-item">
                <h5>Daily Newsletter</h5>
                <small>Get notified when someone else is trying to access your account.</small>
                <div class="toggle-wrapper">
                  <div class="leftpanel-toggle toggle-light success"></div>
                </div>
              </li>
              <li class="list-group-item">
                <h5>Call Phones</h5>
                <small>Make calls to friends and family right from your account.</small>
                <div class="toggle-wrapper">
                  <div class="leftpanel-toggle-off toggle-light success"></div>
                </div>
              </li>
            </ul>
            <h5 class="sidebar-title">Security Settings</h5>
            <ul class="list-group list-group-settings">
              <li class="list-group-item">
                <h5>Login Notifications</h5>
                <small>Get notified when someone else is trying to access your account.</small>
                <div class="toggle-wrapper">
                  <div class="leftpanel-toggle toggle-light success"></div>
                </div>
              </li>
              <li class="list-group-item">
                <h5>Phone Approvals</h5>
                <small>Use your phone when login as an extra layer of security.</small>
                <div class="toggle-wrapper">
                  <div class="leftpanel-toggle toggle-light success"></div>
                </div>
              </li>
            </ul>
          </div><!-- tab-pane -->


        </div><!-- tab-content -->

      </div><!-- leftpanelinner -->
    </div><!-- leftpanel -->

  <div class="mainpanel">

    <div class="contentpanel">

      <ol class="breadcrumb breadcrumb-quirk">
        <li><a href="index.html"><i class="fa fa-home mr5"></i> Home</a></li>
        <li><a href="basic-tables.html">Tables</a></li>
        <li class="active">Data Tables</li>
      </ol>

      <div class="panel">
        <div class="panel-heading">
          <h4 class="panel-title">Basic Styling</h4>
          <p>DataTables has most features enabled by default, so all you need to do to use it with one of your own tables is to call the construction function.</p>
        </div>
        <div class="panel-body">
          <div class="table-responsive">
            <table id="dataTable1" class="table table-bordered table-striped-col">
              <thead>
                <tr>
                  <th>Name</th>
                  <th>Position</th>
                  <th>Office</th>
                  <th>Age</th>
                  <th>Start date</th>
                  <th>Salary</th>
                </tr>
              </thead>

              <tfoot>
                <tr>
                  <th>Name</th>
                  <th>Position</th>
                  <th>Office</th>
                  <th>Age</th>
                  <th>Start date</th>
                  <th>Salary</th>
                </tr>
              </tfoot>

              <tbody>
                <tr>
                  <td>Tiger Nixon</td>
                  <td>System Architect</td>
                  <td>Edinburgh</td>
                  <td>61</td>
                  <td>2011/04/25</td>
                  <td>$320,800</td>
                </tr>
                <tr>
                  <td>Garrett Winters</td>
                  <td>Accountant</td>
                  <td>Tokyo</td>
                  <td>63</td>
                  <td>2011/07/25</td>
                  <td>$170,750</td>
                </tr>
                <tr>
                  <td>Ashton Cox</td>
                  <td>Junior Technical Author</td>
                  <td>San Francisco</td>
                  <td>66</td>
                  <td>2009/01/12</td>
                  <td>$86,000</td>
                </tr>
                <tr>
                  <td>Cedric Kelly</td>
                  <td>Senior Javascript Developer</td>
                  <td>Edinburgh</td>
                  <td>22</td>
                  <td>2012/03/29</td>
                  <td>$433,060</td>
                </tr>
                <tr>
                  <td>Airi Satou</td>
                  <td>Accountant</td>
                  <td>Tokyo</td>
                  <td>33</td>
                  <td>2008/11/28</td>
                  <td>$162,700</td>
                </tr>
                <tr>
                  <td>Brielle Williamson</td>
                  <td>Integration Specialist</td>
                  <td>New York</td>
                  <td>61</td>
                  <td>2012/12/02</td>
                  <td>$372,000</td>
                </tr>
                <tr>
                  <td>Herrod Chandler</td>
                  <td>Sales Assistant</td>
                  <td>San Francisco</td>
                  <td>59</td>
                  <td>2012/08/06</td>
                  <td>$137,500</td>
                </tr>
                <tr>
                  <td>Rhona Davidson</td>
                  <td>Integration Specialist</td>
                  <td>Tokyo</td>
                  <td>55</td>
                  <td>2010/10/14</td>
                  <td>$327,900</td>
                </tr>
                <tr>
                  <td>Colleen Hurst</td>
                  <td>Javascript Developer</td>
                  <td>San Francisco</td>
                  <td>39</td>
                  <td>2009/09/15</td>
                  <td>$205,500</td>
                </tr>
                <tr>
                  <td>Sonya Frost</td>
                  <td>Software Engineer</td>
                  <td>Edinburgh</td>
                  <td>23</td>
                  <td>2008/12/13</td>
                  <td>$103,600</td>
                </tr>
                <tr>
                  <td>Jena Gaines</td>
                  <td>Office Manager</td>
                  <td>London</td>
                  <td>30</td>
                  <td>2008/12/19</td>
                  <td>$90,560</td>
                </tr>
                <tr>
                  <td>Quinn Flynn</td>
                  <td>Support Lead</td>
                  <td>Edinburgh</td>
                  <td>22</td>
                  <td>2013/03/03</td>
                  <td>$342,000</td>
                </tr>
                <tr>
                  <td>Charde Marshall</td>
                  <td>Regional Director</td>
                  <td>San Francisco</td>
                  <td>36</td>
                  <td>2008/10/16</td>
                  <td>$470,600</td>
                </tr>
                <tr>
                  <td>Haley Kennedy</td>
                  <td>Senior Marketing Designer</td>
                  <td>London</td>
                  <td>43</td>
                  <td>2012/12/18</td>
                  <td>$313,500</td>
                </tr>
                <tr>
                  <td>Tatyana Fitzpatrick</td>
                  <td>Regional Director</td>
                  <td>London</td>
                  <td>19</td>
                  <td>2010/03/17</td>
                  <td>$385,750</td>
                </tr>
                <tr>
                  <td>Michael Silva</td>
                  <td>Marketing Designer</td>
                  <td>London</td>
                  <td>66</td>
                  <td>2012/11/27</td>
                  <td>$198,500</td>
                </tr>
                <tr>
                  <td>Paul Byrd</td>
                  <td>Chief Financial Officer (CFO)</td>
                  <td>New York</td>
                  <td>64</td>
                  <td>2010/06/09</td>
                  <td>$725,000</td>
                </tr>
                <tr>
                  <td>Gloria Little</td>
                  <td>Systems Administrator</td>
                  <td>New York</td>
                  <td>59</td>
                  <td>2009/04/10</td>
                  <td>$237,500</td>
                </tr>
                <tr>
                  <td>Bradley Greer</td>
                  <td>Software Engineer</td>
                  <td>London</td>
                  <td>41</td>
                  <td>2012/10/13</td>
                  <td>$132,000</td>
                </tr>
                <tr>
                  <td>Dai Rios</td>
                  <td>Personnel Lead</td>
                  <td>Edinburgh</td>
                  <td>35</td>
                  <td>2012/09/26</td>
                  <td>$217,500</td>
                </tr>
                <tr>
                  <td>Jenette Caldwell</td>
                  <td>Development Lead</td>
                  <td>New York</td>
                  <td>30</td>
                  <td>2011/09/03</td>
                  <td>$345,000</td>
                </tr>
                <tr>
                  <td>Yuri Berry</td>
                  <td>Chief Marketing Officer (CMO)</td>
                  <td>New York</td>
                  <td>40</td>
                  <td>2009/06/25</td>
                  <td>$675,000</td>
                </tr>
                <tr>
                  <td>Caesar Vance</td>
                  <td>Pre-Sales Support</td>
                  <td>New York</td>
                  <td>21</td>
                  <td>2011/12/12</td>
                  <td>$106,450</td>
                </tr>
                <tr>
                  <td>Doris Wilder</td>
                  <td>Sales Assistant</td>
                  <td>Sidney</td>
                  <td>23</td>
                  <td>2010/09/20</td>
                  <td>$85,600</td>
                </tr>
                <tr>
                  <td>Angelica Ramos</td>
                  <td>Chief Executive Officer (CEO)</td>
                  <td>London</td>
                  <td>47</td>
                  <td>2009/10/09</td>
                  <td>$1,200,000</td>
                </tr>
                <tr>
                  <td>Gavin Joyce</td>
                  <td>Developer</td>
                  <td>Edinburgh</td>
                  <td>42</td>
                  <td>2010/12/22</td>
                  <td>$92,575</td>
                </tr>
                <tr>
                  <td>Jennifer Chang</td>
                  <td>Regional Director</td>
                  <td>Singapore</td>
                  <td>28</td>
                  <td>2010/11/14</td>
                  <td>$357,650</td>
                </tr>
                <tr>
                  <td>Brenden Wagner</td>
                  <td>Software Engineer</td>
                  <td>San Francisco</td>
                  <td>28</td>
                  <td>2011/06/07</td>
                  <td>$206,850</td>
                </tr>
                <tr>
                  <td>Fiona Green</td>
                  <td>Chief Operating Officer (COO)</td>
                  <td>San Francisco</td>
                  <td>48</td>
                  <td>2010/03/11</td>
                  <td>$850,000</td>
                </tr>
                <tr>
                  <td>Shou Itou</td>
                  <td>Regional Marketing</td>
                  <td>Tokyo</td>
                  <td>20</td>
                  <td>2011/08/14</td>
                  <td>$163,000</td>
                </tr>
                <tr>
                  <td>Michelle House</td>
                  <td>Integration Specialist</td>
                  <td>Sidney</td>
                  <td>37</td>
                  <td>2011/06/02</td>
                  <td>$95,400</td>
                </tr>
                <tr>
                  <td>Suki Burks</td>
                  <td>Developer</td>
                  <td>London</td>
                  <td>53</td>
                  <td>2009/10/22</td>
                  <td>$114,500</td>
                </tr>
                <tr>
                  <td>Prescott Bartlett</td>
                  <td>Technical Author</td>
                  <td>London</td>
                  <td>27</td>
                  <td>2011/05/07</td>
                  <td>$145,000</td>
                </tr>
                <tr>
                  <td>Gavin Cortez</td>
                  <td>Team Leader</td>
                  <td>San Francisco</td>
                  <td>22</td>
                  <td>2008/10/26</td>
                  <td>$235,500</td>
                </tr>
                <tr>
                  <td>Martena Mccray</td>
                  <td>Post-Sales support</td>
                  <td>Edinburgh</td>
                  <td>46</td>
                  <td>2011/03/09</td>
                  <td>$324,050</td>
                </tr>
                <tr>
                  <td>Unity Butler</td>
                  <td>Marketing Designer</td>
                  <td>San Francisco</td>
                  <td>47</td>
                  <td>2009/12/09</td>
                  <td>$85,675</td>
                </tr>
                <tr>
                  <td>Howard Hatfield</td>
                  <td>Office Manager</td>
                  <td>San Francisco</td>
                  <td>51</td>
                  <td>2008/12/16</td>
                  <td>$164,500</td>
                </tr>
                <tr>
                  <td>Hope Fuentes</td>
                  <td>Secretary</td>
                  <td>San Francisco</td>
                  <td>41</td>
                  <td>2010/02/12</td>
                  <td>$109,850</td>
                </tr>
                <tr>
                  <td>Vivian Harrell</td>
                  <td>Financial Controller</td>
                  <td>San Francisco</td>
                  <td>62</td>
                  <td>2009/02/14</td>
                  <td>$452,500</td>
                </tr>
                <tr>
                  <td>Timothy Mooney</td>
                  <td>Office Manager</td>
                  <td>London</td>
                  <td>37</td>
                  <td>2008/12/11</td>
                  <td>$136,200</td>
                </tr>
                <tr>
                  <td>Jackson Bradshaw</td>
                  <td>Director</td>
                  <td>New York</td>
                  <td>65</td>
                  <td>2008/09/26</td>
                  <td>$645,750</td>
                </tr>
                <tr>
                  <td>Olivia Liang</td>
                  <td>Support Engineer</td>
                  <td>Singapore</td>
                  <td>64</td>
                  <td>2011/02/03</td>
                  <td>$234,500</td>
                </tr>
                <tr>
                  <td>Bruno Nash</td>
                  <td>Software Engineer</td>
                  <td>London</td>
                  <td>38</td>
                  <td>2011/05/03</td>
                  <td>$163,500</td>
                </tr>
                <tr>
                  <td>Sakura Yamamoto</td>
                  <td>Support Engineer</td>
                  <td>Tokyo</td>
                  <td>37</td>
                  <td>2009/08/19</td>
                  <td>$139,575</td>
                </tr>
                <tr>
                  <td>Thor Walton</td>
                  <td>Developer</td>
                  <td>New York</td>
                  <td>61</td>
                  <td>2013/08/11</td>
                  <td>$98,540</td>
                </tr>
                <tr>
                  <td>Finn Camacho</td>
                  <td>Support Engineer</td>
                  <td>San Francisco</td>
                  <td>47</td>
                  <td>2009/07/07</td>
                  <td>$87,500</td>
                </tr>
                <tr>
                  <td>Serge Baldwin</td>
                  <td>Data Coordinator</td>
                  <td>Singapore</td>
                  <td>64</td>
                  <td>2012/04/09</td>
                  <td>$138,575</td>
                </tr>
                <tr>
                  <td>Zenaida Frank</td>
                  <td>Software Engineer</td>
                  <td>New York</td>
                  <td>63</td>
                  <td>2010/01/04</td>
                  <td>$125,250</td>
                </tr>
                <tr>
                  <td>Zorita Serrano</td>
                  <td>Software Engineer</td>
                  <td>San Francisco</td>
                  <td>56</td>
                  <td>2012/06/01</td>
                  <td>$115,000</td>
                </tr>
                <tr>
                  <td>Jennifer Acosta</td>
                  <td>Junior Javascript Developer</td>
                  <td>Edinburgh</td>
                  <td>43</td>
                  <td>2013/02/01</td>
                  <td>$75,650</td>
                </tr>
                <tr>
                  <td>Cara Stevens</td>
                  <td>Sales Assistant</td>
                  <td>New York</td>
                  <td>46</td>
                  <td>2011/12/06</td>
                  <td>$145,600</td>
                </tr>
                <tr>
                  <td>Hermione Butler</td>
                  <td>Regional Director</td>
                  <td>London</td>
                  <td>47</td>
                  <td>2011/03/21</td>
                  <td>$356,250</td>
                </tr>
                <tr>
                  <td>Lael Greer</td>
                  <td>Systems Administrator</td>
                  <td>London</td>
                  <td>21</td>
                  <td>2009/02/27</td>
                  <td>$103,500</td>
                </tr>
                <tr>
                  <td>Jonas Alexander</td>
                  <td>Developer</td>
                  <td>San Francisco</td>
                  <td>30</td>
                  <td>2010/07/14</td>
                  <td>$86,500</td>
                </tr>
                <tr>
                  <td>Shad Decker</td>
                  <td>Regional Director</td>
                  <td>Edinburgh</td>
                  <td>51</td>
                  <td>2008/11/13</td>
                  <td>$183,000</td>
                </tr>
                <tr>
                  <td>Michael Bruce</td>
                  <td>Javascript Developer</td>
                  <td>Singapore</td>
                  <td>29</td>
                  <td>2011/06/27</td>
                  <td>$183,000</td>
                </tr>
                <tr>
                  <td>Donna Snider</td>
                  <td>Customer Support</td>
                  <td>New York</td>
                  <td>27</td>
                  <td>2011/01/25</td>
                  <td>$112,000</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div><!-- panel -->

      <div class="panel">
        <div class="panel-heading">
          <h4 class="panel-title">Data Table With Child Rows</h4>
          <p>This can be used to show additional information about a row, useful for cases where you wish to convey more information about a row than there is space for in the host table.</p>
        </div>
        <div class="panel-body">
          <div class="table-responsive">
            <table id="exRowTable" class="table table-bordered table-striped-col">
              <thead>
                <tr>
                  <th></th>
                  <th>Name</th>
                  <th>Position</th>
                  <th>Office</th>
                  <th>Start Date</th>
                  <th>Salary</th>
                </tr>
              </thead>
            </table>
          </div>
        </div>
      </div><!-- panel -->

    </div><!-- contentpanel -->
  </div><!-- mainpanel -->

</section>

<script src="lib/jquery/jquery.js"></script>
<script src="lib/jquery-ui/jquery-ui.js"></script>
<script src="lib/bootstrap/js/bootstrap.js"></script>
<script src="lib/jquery-toggles/toggles.js"></script>
<script src="lib/datatables/jquery.dataTables.js"></script>
<script src="lib/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.js"></script>
<script src="lib/select2/select2.js"></script>

<script src="js/quirk.js"></script>
<script>
$(document).ready(function() {

  'use strict';

  $('#dataTable1').DataTable();

  var exRowTable = $('#exRowTable').DataTable({
    responsive: true,
    'fnDrawCallback': function(oSettings) {
      $('#exRowTable_paginate ul').addClass('pagination-active-success');
    },
    'ajax': 'ajax/objects.txt',
    'columns': [{
      'class': 'details-control',
      'orderable': false,
      'data': null,
      'defaultContent': ''
    },
    { 'data': 'name' },
    { 'data': 'position' },
    { 'data': 'office' },
    { 'data': 'start_date'},
    { 'data': 'salary' }
    ],
    'order': [[1, 'asc']]
  });

  // Add event listener for opening and closing details
  $('#exRowTable tbody').on('click', 'td.details-control', function () {
    var tr = $(this).closest('tr');
    var row = exRowTable.row( tr );

    if ( row.child.isShown() ) {
      // This row is already open - close it
      row.child.hide();
      tr.removeClass('shown');
    } else {
      // Open this row
      row.child( format(row.data()) ).show();
      tr.addClass('shown');
    }
  });

  function format (d) {
    // `d` is the original data object for the row
    return '<h4>'+d.name+'<small>'+d.position+'</small></h4>'+
    '<p class="nomargin">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>';
  }

  // Select2
  $('select').select2({ minimumResultsForSearch: Infinity });

});
</script>
</body>
</html>
