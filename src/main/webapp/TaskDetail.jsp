
<%@ page import="com.simplesarkar.model.TaskDescription" %>
<%@ page import="com.simplesarkar.utils.Constants" %>

<%
System.out.println("comes in TaskDetail.jsp");
TaskDescription td = (TaskDescription)request.getAttribute("taskDescription");
  
if(td != null){
	System.out.println("td is "+td.getId());
}
String taskText = "";

long taskId = 0L;
if(td != null){

StringBuffer stb = new StringBuffer();
stb.append(Constants.EDITOR_STUB_PREFIX);
stb.append(td.getTaskText());
stb.append(Constants.EDITOR_STUB_SUFFIX);
	taskText = stb.toString();
	taskId =td.getId();
}

%>


<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Limitless - Responsive Web Application Kit by Eugene Kopyov</title>

	<!-- Global stylesheets -->
	<link href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900" rel="stylesheet" type="text/css">
	<link href="assets/css/icons/icomoon/styles.css" rel="stylesheet" type="text/css">
	<link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css">
	<link href="assets/css/core.css" rel="stylesheet" type="text/css">
	<link href="assets/css/components.css" rel="stylesheet" type="text/css">
	<link href="assets/css/colors.css" rel="stylesheet" type="text/css">
	<!-- /global stylesheets -->

	<!-- Core JS files -->
	<script type="text/javascript" src="assets/js/plugins/loaders/pace.min.js"></script>
	<script type="text/javascript" src="assets/js/core/libraries/jquery.min.js"></script>
	<script type="text/javascript" src="assets/js/core/libraries/bootstrap.min.js"></script>
	<script type="text/javascript" src="assets/js/plugins/loaders/blockui.min.js"></script>
	<!-- /core JS files -->

	<!-- Theme JS files -->
	<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="assets/js/core/libraries/jquery_ui/widgets.min.js"></script>
	<script type="text/javascript" src="assets/js/plugins/forms/styling/switchery.min.js"></script>

	<script type="text/javascript" src="assets/js/core/app.js"></script>
	<script type="text/javascript" src="assets/js/pages/task_detailed.js"></script>
	<!-- /theme JS files -->
    
    <!-- Theme JS files -->
	<script type="text/javascript" src="assets/js/plugins/editors/summernote/summernote.min.js"></script>
	<script type="text/javascript" src="assets/js/plugins/forms/styling/uniform.min.js"></script>
 
	<script type="text/javascript" src="assets/js/pages/editor_summernote.js"></script>
	<!-- /theme JS files -->

<script>
 
$(document).ready(function(){

	 alert("this is alert in TaskDetail.jsp");
	
	$("#save").click(function(){   
    
    var len = document.getElementsByTagName("div").length;
    for (i = 0; i < len; i++) { 
    var classValue = document.getElementsByTagName("div")[i].getAttribute("class");

    if(classValue == 'note-editable panel-body'){  
    	alert(document.getElementsByTagName("div")[i].innerHTML);   
        var innerHtml = document.getElementsByTagName("div")[i].innerHTML;

        var response =    $.ajax({  
              url:'TaskUpdate.action?'+'cmd=save&taskId='+<%=taskId%>+'&taskText='+encodeURIComponent(innerHtml),  
              type:'POST',
              contentType:false,
              async:false,
              dataType: 'application/json;charset=utf-8' 
     }).responseText;   
        }
    } 
    
	alert("key="+response);
    $("#myfrm").attr("action", "TaskUpdate.action?cmd=populate&taskId="+response.trim());
    $("#myfrm").attr("method", "post" );
    $("#myfrm").submit();
    return false;
       
}); 

});  
 
</script>


    
</head>

<body class="sidebar-xs">

	<!-- Main navbar -->
	<div class="navbar navbar-inverse">
		<div class="navbar-header">
			<a class="navbar-brand" href="index.html"><img src="assets/images/logo_light.png" alt=""></a>

			<ul class="nav navbar-nav visible-xs-block">
				<li><a data-toggle="collapse" data-target="#navbar-mobile"><i class="icon-tree5"></i></a></li>
				<li><a class="sidebar-mobile-main-toggle"><i class="icon-paragraph-justify3"></i></a></li>
			</ul>
		</div>

		<div class="navbar-collapse collapse" id="navbar-mobile">
			<ul class="nav navbar-nav">
				<li><a class="sidebar-control sidebar-main-toggle hidden-xs"><i class="icon-paragraph-justify3"></i></a></li>

				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<i class="icon-git-compare"></i>
						<span class="visible-xs-inline-block position-right">Git updates</span>
						<span class="badge bg-warning-400">9</span>
					</a>
					
					<div class="dropdown-menu dropdown-content">
						<div class="dropdown-content-heading">
							Git updates
							<ul class="icons-list">
								<li><a href="#"><i class="icon-sync"></i></a></li>
							</ul>
						</div>

						<ul class="media-list dropdown-content-body width-350">
							<li class="media">
								<div class="media-left">
									<a href="#" class="btn border-primary text-primary btn-flat btn-rounded btn-icon btn-sm"><i class="icon-git-pull-request"></i></a>
								</div>

								<div class="media-body">
									Drop the IE <a href="#">specific hacks</a> for temporal inputs
									<div class="media-annotation">4 minutes ago</div>
								</div>
							</li>

							<li class="media">
								<div class="media-left">
									<a href="#" class="btn border-warning text-warning btn-flat btn-rounded btn-icon btn-sm"><i class="icon-git-commit"></i></a>
								</div>
								
								<div class="media-body">
									Add full font overrides for popovers and tooltips
									<div class="media-annotation">36 minutes ago</div>
								</div>
							</li>

							<li class="media">
								<div class="media-left">
									<a href="#" class="btn border-info text-info btn-flat btn-rounded btn-icon btn-sm"><i class="icon-git-branch"></i></a>
								</div>
								
								<div class="media-body">
									<a href="#">Chris Arney</a> created a new <span class="text-semibold">Design</span> branch
									<div class="media-annotation">2 hours ago</div>
								</div>
							</li>

							<li class="media">
								<div class="media-left">
									<a href="#" class="btn border-success text-success btn-flat btn-rounded btn-icon btn-sm"><i class="icon-git-merge"></i></a>
								</div>
								
								<div class="media-body">
									<a href="#">Eugene Kopyov</a> merged <span class="text-semibold">Master</span> and <span class="text-semibold">Dev</span> branches
									<div class="media-annotation">Dec 18, 18:36</div>
								</div>
							</li>

							<li class="media">
								<div class="media-left">
									<a href="#" class="btn border-primary text-primary btn-flat btn-rounded btn-icon btn-sm"><i class="icon-git-pull-request"></i></a>
								</div>
								
								<div class="media-body">
									Have Carousel ignore keyboard events
									<div class="media-annotation">Dec 12, 05:46</div>
								</div>
							</li>
						</ul>

						<div class="dropdown-content-footer">
							<a href="#" data-popup="tooltip" title="All activity"><i class="icon-menu display-block"></i></a>
						</div>
					</div>
				</li>
			</ul>

			<p class="navbar-text">
				<span class="label bg-success">Online</span>
			</p>

			<div class="navbar-right">
				<ul class="nav navbar-nav">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<i class="icon-people"></i>
							<span class="visible-xs-inline-block position-right">Users</span>
						</a>
						
						<div class="dropdown-menu dropdown-content">
							<div class="dropdown-content-heading">
								Users online
								<ul class="icons-list">
									<li><a href="#"><i class="icon-gear"></i></a></li>
								</ul>
							</div>

							<ul class="media-list dropdown-content-body width-300">
								<li class="media">
									<div class="media-left"><img src="assets/images/placeholder.jpg" class="img-circle img-sm" alt=""></div>
									<div class="media-body">
										<a href="#" class="media-heading text-semibold">Jordana Ansley</a>
										<span class="display-block text-muted text-size-small">Lead web developer</span>
									</div>
									<div class="media-right media-middle"><span class="status-mark border-success"></span></div>
								</li>

								<li class="media">
									<div class="media-left"><img src="assets/images/placeholder.jpg" class="img-circle img-sm" alt=""></div>
									<div class="media-body">
										<a href="#" class="media-heading text-semibold">Will Brason</a>
										<span class="display-block text-muted text-size-small">Marketing manager</span>
									</div>
									<div class="media-right media-middle"><span class="status-mark border-danger"></span></div>
								</li>

								<li class="media">
									<div class="media-left"><img src="assets/images/placeholder.jpg" class="img-circle img-sm" alt=""></div>
									<div class="media-body">
										<a href="#" class="media-heading text-semibold">Hanna Walden</a>
										<span class="display-block text-muted text-size-small">Project manager</span>
									</div>
									<div class="media-right media-middle"><span class="status-mark border-success"></span></div>
								</li>

								<li class="media">
									<div class="media-left"><img src="assets/images/placeholder.jpg" class="img-circle img-sm" alt=""></div>
									<div class="media-body">
										<a href="#" class="media-heading text-semibold">Dori Laperriere</a>
										<span class="display-block text-muted text-size-small">Business developer</span>
									</div>
									<div class="media-right media-middle"><span class="status-mark border-warning-300"></span></div>
								</li>

								<li class="media">
									<div class="media-left"><img src="assets/images/placeholder.jpg" class="img-circle img-sm" alt=""></div>
									<div class="media-body">
										<a href="#" class="media-heading text-semibold">Vanessa Aurelius</a>
										<span class="display-block text-muted text-size-small">UX expert</span>
									</div>
									<div class="media-right media-middle"><span class="status-mark border-grey-400"></span></div>
								</li>
							</ul>

							<div class="dropdown-content-footer">
								<a href="#" data-popup="tooltip" title="All users"><i class="icon-menu display-block"></i></a>
							</div>
						</div>
					</li>

					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<i class="icon-bubbles4"></i>
							<span class="visible-xs-inline-block position-right">Messages</span>
							<span class="badge bg-warning-400">2</span>
						</a>
						
						<div class="dropdown-menu dropdown-content width-350">
							<div class="dropdown-content-heading">
								Messages
								<ul class="icons-list">
									<li><a href="#"><i class="icon-compose"></i></a></li>
								</ul>
							</div>

							<ul class="media-list dropdown-content-body">
								<li class="media">
									<div class="media-left">
										<img src="assets/images/placeholder.jpg" class="img-circle img-sm" alt="">
										<span class="badge bg-danger-400 media-badge">5</span>
									</div>

									<div class="media-body">
										<a href="#" class="media-heading">
											<span class="text-semibold">James Alexander</span>
											<span class="media-annotation pull-right">04:58</span>
										</a>

										<span class="text-muted">who knows, maybe that would be the best thing for me...</span>
									</div>
								</li>

								<li class="media">
									<div class="media-left">
										<img src="assets/images/placeholder.jpg" class="img-circle img-sm" alt="">
										<span class="badge bg-danger-400 media-badge">4</span>
									</div>

									<div class="media-body">
										<a href="#" class="media-heading">
											<span class="text-semibold">Margo Baker</span>
											<span class="media-annotation pull-right">12:16</span>
										</a>

										<span class="text-muted">That was something he was unable to do because...</span>
									</div>
								</li>

								<li class="media">
									<div class="media-left"><img src="assets/images/placeholder.jpg" class="img-circle img-sm" alt=""></div>
									<div class="media-body">
										<a href="#" class="media-heading">
											<span class="text-semibold">Jeremy Victorino</span>
											<span class="media-annotation pull-right">22:48</span>
										</a>

										<span class="text-muted">But that would be extremely strained and suspicious...</span>
									</div>
								</li>

								<li class="media">
									<div class="media-left"><img src="assets/images/placeholder.jpg" class="img-circle img-sm" alt=""></div>
									<div class="media-body">
										<a href="#" class="media-heading">
											<span class="text-semibold">Beatrix Diaz</span>
											<span class="media-annotation pull-right">Tue</span>
										</a>

										<span class="text-muted">What a strenuous career it is that I've chosen...</span>
									</div>
								</li>

								<li class="media">
									<div class="media-left"><img src="assets/images/placeholder.jpg" class="img-circle img-sm" alt=""></div>
									<div class="media-body">
										<a href="#" class="media-heading">
											<span class="text-semibold">Richard Vango</span>
											<span class="media-annotation pull-right">Mon</span>
										</a>
										
										<span class="text-muted">Other travelling salesmen live a life of luxury...</span>
									</div>
								</li>
							</ul>

							<div class="dropdown-content-footer">
								<a href="#" data-popup="tooltip" title="All messages"><i class="icon-menu display-block"></i></a>
							</div>
						</div>
					</li>

					<li class="dropdown dropdown-user">
						<a class="dropdown-toggle" data-toggle="dropdown">
							<img src="assets/images/placeholder.jpg" alt="">
							<span>Victoria</span>
							<i class="caret"></i>
						</a>

						<ul class="dropdown-menu dropdown-menu-right">
							<li><a href="#"><i class="icon-user-plus"></i> My profile</a></li>
							<li><a href="#"><i class="icon-coins"></i> My balance</a></li>
							<li><a href="#"><span class="badge bg-blue pull-right">58</span> <i class="icon-comment-discussion"></i> Messages</a></li>
							<li class="divider"></li>
							<li><a href="#"><i class="icon-cog5"></i> Account settings</a></li>
							<li><a href="#"><i class="icon-switch2"></i> Logout</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- /main navbar -->


	<!-- Page container -->
	<div class="page-container">

		<!-- Page content -->
		<div class="page-content">

			<!-- Main sidebar -->
			<div class="sidebar sidebar-main">
				<div class="sidebar-content">

					<!-- User menu -->
					<div class="sidebar-user">
						<div class="category-content">
							<div class="media">
								<a href="#" class="media-left"><img src="assets/images/placeholder.jpg" class="img-circle img-sm" alt=""></a>
								<div class="media-body">
									<span class="media-heading text-semibold">Victoria Baker</span>
									<div class="text-size-mini text-muted">
										<i class="icon-pin text-size-small"></i> &nbsp;Santa Ana, CA
									</div>
								</div>

								<div class="media-right media-middle">
									<ul class="icons-list">
										<li>
											<a href="#"><i class="icon-cog3"></i></a>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<!-- /user menu -->


					<!-- Main navigation -->
					<div class="sidebar-category sidebar-category-visible">
						<div class="category-content no-padding">
							<ul class="navigation navigation-main navigation-accordion">

								<!-- Main -->
								<li class="navigation-header"><span>Main</span> <i class="icon-menu" title="Main pages"></i></li>
								<li><a href="index.html"><i class="icon-home4"></i> <span>Dashboard</span></a></li>
								<li>
									<a href="#"><i class="icon-stack2"></i> <span>Page layouts</span></a>
									<ul>
										<li><a href="layout_navbar_fixed.html">Fixed navbar</a></li>
										<li><a href="layout_navbar_sidebar_fixed.html">Fixed navbar &amp; sidebar</a></li>
										<li><a href="layout_sidebar_fixed_native.html">Fixed sidebar native scroll</a></li>
										<li><a href="layout_navbar_hideable.html">Hideable navbar</a></li>
										<li><a href="layout_navbar_hideable_sidebar.html">Hideable &amp; fixed sidebar</a></li>
										<li><a href="layout_footer_fixed.html">Fixed footer</a></li>
										<li class="navigation-divider"></li>
										<li><a href="boxed_default.html">Boxed with default sidebar</a></li>
										<li><a href="boxed_mini.html">Boxed with mini sidebar</a></li>
										<li><a href="boxed_full.html">Boxed full width</a></li>
									</ul>
								</li>
								<li>
									<a href="#"><i class="icon-copy"></i> <span>Layouts</span></a>
									<ul>
										<li><a href="../../../layout_1/LTR/index.html" id="layout1">Layout 1</a></li>
										<li><a href="index.html" id="layout2">Layout 2 <span class="label bg-warning-400">Current</span></a></li>
										<li><a href="../../../layout_3/LTR/index.html" id="layout3">Layout 3</a></li>
										<li><a href="../../../layout_4/LTR/index.html" id="layout4">Layout 4</a></li>
										<li><a href="../../../layout_5/LTR/index.html" id="layout5">Layout 5</a></li>
										<li class="disabled"><a href="../../../layout_6/LTR/index.html" id="layout6">Layout 6 <span class="label label-transparent">Coming soon</span></a></li>
									</ul>
								</li>
								<li>
									<a href="#"><i class="icon-droplet2"></i> <span>Color system</span></a>
									<ul>
										<li><a href="colors_primary.html">Primary palette</a></li>
										<li><a href="colors_danger.html">Danger palette</a></li>
										<li><a href="colors_success.html">Success palette</a></li>
										<li><a href="colors_warning.html">Warning palette</a></li>
										<li><a href="colors_info.html">Info palette</a></li>
										<li class="navigation-divider"></li>
										<li><a href="colors_pink.html">Pink palette</a></li>
										<li><a href="colors_violet.html">Violet palette</a></li>
										<li><a href="colors_purple.html">Purple palette</a></li>
										<li><a href="colors_indigo.html">Indigo palette</a></li>
										<li><a href="colors_blue.html">Blue palette</a></li>
										<li><a href="colors_teal.html">Teal palette</a></li>
										<li><a href="colors_green.html">Green palette</a></li>
										<li><a href="colors_orange.html">Orange palette</a></li>
										<li><a href="colors_brown.html">Brown palette</a></li>
										<li><a href="colors_grey.html">Grey palette</a></li>
										<li><a href="colors_slate.html">Slate palette</a></li>
									</ul>
								</li>
								<li>
									<a href="#"><i class="icon-stack"></i> <span>Starter kit</span></a>
									<ul>
										<li><a href="starters/horizontal_nav.html">Horizontal navigation</a></li>
										<li><a href="starters/1_col.html">1 column</a></li>
										<li><a href="starters/2_col.html">2 columns</a></li>
										<li>
											<a href="#">3 columns</a>
											<ul>
												<li><a href="starters/3_col_dual.html">Dual sidebars</a></li>
												<li><a href="starters/3_col_double.html">Double sidebars</a></li>
											</ul>
										</li>
										<li><a href="starters/4_col.html">4 columns</a></li>
										<li>
											<a href="#">Detached layout</a>
											<ul>
												<li><a href="starters/detached_left.html">Left sidebar</a></li>
												<li><a href="starters/detached_right.html">Right sidebar</a></li>
												<li><a href="starters/detached_sticky.html">Sticky sidebar</a></li>
											</ul>
										</li>
										<li><a href="starters/layout_boxed.html">Boxed layout</a></li>
										<li class="navigation-divider"></li>
										<li><a href="starters/layout_navbar_fixed_main.html">Fixed main navbar</a></li>
										<li><a href="starters/layout_navbar_fixed_secondary.html">Fixed secondary navbar</a></li>
										<li><a href="starters/layout_navbar_fixed_both.html">Both navbars fixed</a></li>
										<li><a href="starters/layout_fixed.html">Fixed layout</a></li>
									</ul>
								</li>
								<li><a href="changelog.html"><i class="icon-list-unordered"></i> <span>Changelog <span class="label bg-blue-400">1.4</span></span></a></li>
								<li><a href="../../RTL/index.html"><i class="icon-width"></i> <span>RTL version</span></a></li>
								<!-- /main -->

								<!-- Forms -->
								<li class="navigation-header"><span>Forms</span> <i class="icon-menu" title="Forms"></i></li>
								<li>
									<a href="#"><i class="icon-pencil3"></i> <span>Form components</span></a>
									<ul>
										<li><a href="form_inputs_basic.html">Basic inputs</a></li>
										<li><a href="form_checkboxes_radios.html">Checkboxes &amp; radios</a></li>
										<li><a href="form_input_groups.html">Input groups</a></li>
										<li><a href="form_controls_extended.html">Extended controls</a></li>
										<li><a href="form_floating_labels.html">Floating labels</a></li>
										<li>
											<a href="#">Selects</a>
											<ul>
												<li><a href="form_select2.html">Select2 selects</a></li>
												<li><a href="form_multiselect.html">Bootstrap multiselect</a></li>
												<li><a href="form_select_box_it.html">SelectBoxIt selects</a></li>
												<li><a href="form_bootstrap_select.html">Bootstrap selects</a></li>
											</ul>
										</li>
										<li><a href="form_tag_inputs.html">Tag inputs</a></li>
										<li><a href="form_dual_listboxes.html">Dual Listboxes</a></li>
										<li><a href="form_editable.html">Editable forms</a></li>
										<li><a href="form_validation.html">Validation</a></li>
										<li><a href="form_inputs_grid.html">Inputs grid</a></li>
									</ul>
								</li>
								<li>
									<a href="#"><i class="icon-file-css"></i> <span>JSON forms</span></a>
									<ul>
										<li><a href="alpaca_basic.html">Basic inputs</a></li>
										<li><a href="alpaca_advanced.html">Advanced inputs</a></li>
										<li><a href="alpaca_controls.html">Controls</a></li>
									</ul>
								</li>
								<li>
									<a href="#"><i class="icon-footprint"></i> <span>Wizards</span></a>
									<ul>
										<li><a href="wizard_steps.html">Steps wizard</a></li>
										<li><a href="wizard_form.html">Form wizard</a></li>
										<li><a href="wizard_stepy.html">Stepy wizard</a></li>
									</ul>
								</li>
								<li>
									<a href="#"><i class="icon-spell-check"></i> <span>Editors</span></a>
									<ul>
										<li><a href="editor_summernote.html">Summernote editor</a></li>
										<li><a href="editor_ckeditor.html">CKEditor</a></li>
										<li><a href="editor_wysihtml5.html">WYSIHTML5 editor</a></li>
										<li><a href="editor_code.html">Code editor</a></li>
									</ul>
								</li>
								<li>
									<a href="#"><i class="icon-select2"></i> <span>Pickers</span></a>
									<ul>
										<li><a href="picker_date.html">Date &amp; time pickers</a></li>
										<li><a href="picker_color.html">Color pickers</a></li>
										<li><a href="picker_location.html">Location pickers</a></li>
									</ul>
								</li>
								<li>
									<a href="#"><i class="icon-insert-template"></i> <span>Form layouts</span></a>
									<ul>
										<li><a href="form_layout_vertical.html">Vertical form</a></li>
										<li><a href="form_layout_horizontal.html">Horizontal form</a></li>
									</ul>
								</li>
								<!-- /forms -->

								<!-- Appearance -->
								<li class="navigation-header"><span>Appearance</span> <i class="icon-menu" title="Appearance"></i></li>
								<li>
									<a href="#"><i class="icon-grid"></i> <span>Components</span></a>
									<ul>
										<li><a href="components_modals.html">Modals</a></li>
										<li><a href="components_dropdowns.html">Dropdown menus</a></li>
										<li><a href="components_tabs.html">Tabs component</a></li>
										<li><a href="components_pills.html">Pills component</a></li>
										<li><a href="components_navs.html">Accordion and navs</a></li>
										<li><a href="components_buttons.html">Buttons</a></li>
										<li><a href="components_notifications_pnotify.html">PNotify notifications</a></li>
										<li><a href="components_notifications_others.html">Other notifications</a></li>
										<li><a href="components_popups.html">Tooltips and popovers</a></li>
										<li><a href="components_alerts.html">Alerts</a></li>
										<li><a href="components_pagination.html">Pagination</a></li>
										<li><a href="components_labels.html">Labels and badges</a></li>
										<li><a href="components_loaders.html">Loaders and bars</a></li>
										<li><a href="components_thumbnails.html">Thumbnails</a></li>
										<li><a href="components_page_header.html">Page header</a></li>
										<li><a href="components_breadcrumbs.html">Breadcrumbs</a></li>
										<li><a href="components_media.html">Media objects</a></li>
										<li><a href="components_affix.html">Affix and Scrollspy</a></li>
									</ul>
								</li>
								<li>
									<a href="#"><i class="icon-puzzle2"></i> <span>Content appearance</span></a>
									<ul>
										<li><a href="appearance_content_panels.html">Content panels</a></li>
										<li><a href="appearance_panel_heading.html">Panel heading elements</a></li>
										<li><a href="appearance_panel_footer.html">Panel footer elements</a></li>
										<li><a href="appearance_draggable_panels.html">Draggable panels</a></li>
										<li><a href="appearance_text_styling.html">Text styling</a></li>
										<li><a href="appearance_typography.html">Typography</a></li>
										<li><a href="appearance_helpers.html">Helper classes</a></li>
										<li><a href="appearance_syntax_highlighter.html">Syntax highlighter</a></li>
										<li><a href="appearance_content_grid.html">Grid system</a></li>
									</ul>
								</li>
								<li>
									<a href="#"><i class="icon-gift"></i> <span>Extra components</span></a>
									<ul>
										<li><a href="extra_sliders_noui.html">NoUI sliders</a></li>
										<li><a href="extra_sliders_ion.html">Ion range sliders</a></li>
										<li><a href="extra_session_timeout.html">Session timeout</a></li>
										<li><a href="extra_idle_timeout.html">Idle timeout</a></li>
										<li><a href="extra_trees.html">Dynamic tree views</a></li>
										<li><a href="extra_context_menu.html">Context menu</a></li>
										<li><a href="extra_fab.html">Floating action buttons</a></li>
									</ul>
								</li>
								<li>
									<a href="#"><i class="icon-spinner2 spinner"></i> <span>Animations</span></a>
									<ul>
										<li><a href="animations_css3.html">CSS3 animations</a></li>
										<li>
											<a href="#">Velocity animations</a>
											<ul>
												<li><a href="animations_velocity_basic.html">Basic usage</a></li>
												<li><a href="animations_velocity_ui.html">UI pack effects</a></li>
												<li><a href="animations_velocity_examples.html">Advanced examples</a></li>
											</ul>
										</li>
									</ul>
								</li>
								<li>
									<a href="#"><i class="icon-thumbs-up2"></i> <span>Icons</span></a>
									<ul>
										<li><a href="icons_glyphicons.html">Glyphicons</a></li>
										<li><a href="icons_icomoon.html">Icomoon</a></li>
										<li><a href="icons_fontawesome.html">Font awesome</a></li>
									</ul>
								</li>
								<!-- /appearance -->

								<!-- Layout -->
								<li class="navigation-header"><span>Layout</span> <i class="icon-menu" title="Layout options"></i></li>
								<li>
									<a href="#"><i class="icon-indent-decrease2"></i> <span>Sidebars</span></a>
									<ul>
										<li><a href="sidebar_default_collapse.html">Default collapsible</a></li>
										<li><a href="sidebar_default_hide.html">Default hideable</a></li>
										<li><a href="sidebar_mini_collapse.html">Mini collapsible</a></li>
										<li><a href="sidebar_mini_hide.html">Mini hideable</a></li>
										<li>
											<a href="#">Dual sidebar</a>
											<ul>
												<li><a href="sidebar_dual.html">Dual sidebar</a></li>
												<li><a href="sidebar_dual_double_collapse.html">Dual double collapse</a></li>
												<li><a href="sidebar_dual_double_hide.html">Dual double hide</a></li>
												<li><a href="sidebar_dual_swap.html">Swap sidebars</a></li>
											</ul>
										</li>
										<li>
											<a href="#">Double sidebar</a>
											<ul>
												<li><a href="sidebar_double_collapse.html">Collapse main sidebar</a></li>
												<li><a href="sidebar_double_hide.html">Hide main sidebar</a></li>
												<li><a href="sidebar_double_fix_default.html">Fix default width</a></li>
												<li><a href="sidebar_double_fix_mini.html">Fix mini width</a></li>
												<li><a href="sidebar_double_visible.html">Opposite sidebar visible</a></li>
											</ul>
										</li>
										<li>
											<a href="#">Detached sidebar</a>
											<ul>
												<li><a href="sidebar_detached_left.html">Left position</a></li>
												<li><a href="sidebar_detached_right.html">Right position</a></li>
												<li><a href="sidebar_detached_sticky_custom.html">Sticky (custom scroll)</a></li>
												<li><a href="sidebar_detached_sticky_native.html">Sticky (native scroll)</a></li>
												<li><a href="sidebar_detached_separate.html">Separate categories</a></li>
											</ul>
										</li>
										<li><a href="sidebar_hidden.html">Hidden sidebar</a></li>
										<li><a href="sidebar_light.html">Light sidebar</a></li>
										<li><a href="sidebar_components.html">Sidebar components</a></li>
									</ul>
								</li>
								<li>
									<a href="#"><i class="icon-sort"></i> <span>Vertical navigation</span></a>
									<ul>
										<li><a href="navigation_vertical_collapsible.html">Collapsible menu</a></li>
										<li><a href="navigation_vertical_accordion.html">Accordion menu</a></li>
										<li><a href="navigation_vertical_sizing.html">Navigation sizing</a></li>
										<li><a href="navigation_vertical_bordered.html">Bordered navigation</a></li>
										<li><a href="navigation_vertical_right_icons.html">Right icons</a></li>
										<li><a href="navigation_vertical_labels_badges.html">Labels and badges</a></li>
										<li><a href="navigation_vertical_disabled.html">Disabled navigation links</a></li>
									</ul>
								</li>
								<li>
									<a href="#"><i class="icon-transmission"></i> <span>Horizontal navigation</span></a>
									<ul>
										<li><a href="navigation_horizontal_click.html">Submenu on click</a></li>
										<li><a href="navigation_horizontal_hover.html">Submenu on hover</a></li>
										<li><a href="navigation_horizontal_elements.html">With custom elements</a></li>
										<li><a href="navigation_horizontal_tabs.html">Tabbed navigation</a></li>
										<li><a href="navigation_horizontal_disabled.html">Disabled navigation links</a></li>
										<li><a href="navigation_horizontal_mega.html">Horizontal mega menu</a></li>
									</ul>
								</li>
								<li>
									<a href="#"><i class="icon-menu3"></i> <span>Navbars</span></a>
									<ul>
										<li><a href="navbar_single.html">Single navbar</a></li>
										<li>
											<a href="#">Multiple navbars</a>
											<ul>
												<li><a href="navbar_multiple_navbar_navbar.html">Navbar + navbar</a></li>
												<li><a href="navbar_multiple_navbar_header.html">Navbar + header</a></li>
												<li><a href="navbar_multiple_header_navbar.html">Header + navbar</a></li>
												<li><a href="navbar_multiple_top_bottom.html">Top + bottom</a></li>
											</ul>
										</li>
										<li><a href="navbar_colors.html">Color options</a></li>
										<li><a href="navbar_sizes.html">Sizing options</a></li>
										<li><a href="navbar_hideable.html">Hide on scroll</a></li>
										<li><a href="navbar_components.html">Navbar components</a></li>
									</ul>
								</li>
								<li>
									<a href="#"><i class="icon-tree5"></i> <span>Menu levels</span></a>
									<ul>
										<li><a href="#"><i class="icon-IE"></i> Second level</a></li>
										<li>
											<a href="#"><i class="icon-firefox"></i> Second level with child</a>
											<ul>
												<li><a href="#"><i class="icon-android"></i> Third level</a></li>
												<li>
													<a href="#"><i class="icon-apple2"></i> Third level with child</a>
													<ul>
														<li><a href="#"><i class="icon-html5"></i> Fourth level</a></li>
														<li><a href="#"><i class="icon-css3"></i> Fourth level</a></li>
													</ul>
												</li>
												<li><a href="#"><i class="icon-windows"></i> Third level</a></li>
											</ul>
										</li>
										<li><a href="#"><i class="icon-chrome"></i> Second level</a></li>
									</ul>
								</li>
								<!-- /layout -->

								<!-- Data visualization -->
								<li class="navigation-header"><span>Data visualization</span> <i class="icon-menu" title="Data visualization"></i></li>
								<li>
									<a href="#"><i class="icon-graph"></i> <span>Echarts library</span></a>
									<ul>
										<li><a href="echarts_lines_areas.html">Lines and areas</a></li>
										<li><a href="echarts_columns_waterfalls.html">Columns and waterfalls</a></li>
										<li><a href="echarts_bars_tornados.html">Bars and tornados</a></li>
										<li><a href="echarts_scatter.html">Scatter charts</a></li>
										<li><a href="echarts_pies_donuts.html">Pies and donuts</a></li>
										<li><a href="echarts_funnels_chords.html">Funnels and chords</a></li>
										<li><a href="echarts_candlesticks_others.html">Candlesticks and others</a></li>
										<li><a href="echarts_combinations.html">Chart combinations</a></li>
									</ul>
								</li>
								<li>
									<a href="#"><i class="icon-statistics"></i> <span>D3 library</span></a>
									<ul>
										<li><a href="d3_lines_basic.html">Simple lines</a></li>
										<li><a href="d3_lines_advanced.html">Advanced lines</a></li>
										<li><a href="d3_bars_basic.html">Simple bars</a></li>
										<li><a href="d3_bars_advanced.html">Advanced bars</a></li>
										<li><a href="d3_pies.html">Pie charts</a></li>
										<li><a href="d3_circle_diagrams.html">Circle diagrams</a></li>
										<li><a href="d3_tree.html">Tree layout</a></li>
										<li><a href="d3_other.html">Other charts</a></li>
									</ul>
								</li>
								<li>
									<a href="#"><i class="icon-stats-dots"></i> <span>Dimple library</span></a>
									<ul>
										<li>
											<a href="#">Line charts</a>
											<ul>
												<li><a href="dimple_lines_horizontal.html">Horizontal orientation</a></li>
												<li><a href="dimple_lines_vertical.html">Vertical orientation</a></li>
											</ul>
										</li>
										<li>
											<a href="#">Bar charts</a>
											<ul>
												<li><a href="dimple_bars_horizontal.html">Horizontal orientation</a></li>
												<li><a href="dimple_bars_vertical.html">Vertical orientation</a></li>
											</ul>
										</li>
										<li>
											<a href="#">Area charts</a>
											<ul>
												<li><a href="dimple_area_horizontal.html">Horizontal orientation</a></li>
												<li><a href="dimple_area_vertical.html">Vertical orientation</a></li>
											</ul>
										</li>
										<li>
											<a href="#">Step charts</a>
											<ul>
												<li><a href="dimple_step_horizontal.html">Horizontal orientation</a></li>
												<li><a href="dimple_step_vertical.html">Vertical orientation</a></li>
											</ul>
										</li>
										<li><a href="dimple_pies.html">Pie charts</a></li>
										<li><a href="dimple_rings.html">Ring charts</a></li>
										<li><a href="dimple_scatter.html">Scatter charts</a></li>
										<li><a href="dimple_bubble.html">Bubble charts</a></li>
									</ul>
								</li>
								<li>
									<a href="#"><i class="icon-stats-bars"></i> <span>C3 library</span></a>
									<ul>
										<li><a href="c3_lines_areas.html">Lines and areas</a></li>
										<li><a href="c3_bars_pies.html">Bars and pies</a></li>
										<li><a href="c3_advanced.html">Advanced examples</a></li>
										<li><a href="c3_axis.html">Chart axis</a></li>
										<li><a href="c3_grid.html">Grid options</a></li>
									</ul>
								</li>
								<li>
									<a href="#"><i class="icon-google"></i> <span>Google visualization</span></a>
									<ul>
										<li><a href="google_lines.html">Line charts</a></li>
										<li><a href="google_bars.html">Bar charts</a></li>
										<li><a href="google_pies.html">Pie charts</a></li>
										<li><a href="google_scatter_bubble.html">Bubble &amp; scatter charts</a></li>
										<li><a href="google_other.html">Other charts</a></li>
									</ul>
								</li>
								<li>
									<a href="#"><i class="icon-map5"></i> <span>Maps integration</span></a>
									<ul>
										<li>
											<a href="#">Google maps</a>
											<ul>
												<li><a href="maps_google_basic.html">Basics</a></li>
												<li><a href="maps_google_controls.html">Controls</a></li>
												<li><a href="maps_google_markers.html">Markers</a></li>
												<li><a href="maps_google_drawings.html">Map drawings</a></li>
												<li><a href="maps_google_layers.html">Layers</a></li>
											</ul>
										</li>
										<li><a href="maps_vector.html">Vector maps</a></li>
									</ul>
								</li>
								<!-- /data visualization -->

								<!-- Extensions -->
								<li class="navigation-header"><span>Extensions</span> <i class="icon-menu" title="Extensions"></i></li>
								<li>
									<a href="#"><i class="icon-puzzle4"></i> <span>Extensions</span></a>
									<ul>
										<li><a href="extension_image_cropper.html">Image cropper</a></li>
										<li><a href="extension_blockui.html">Block UI</a></li>
										<li><a href="extension_dnd.html">Drag and drop</a></li>
									</ul>
								</li>
								<li>
									<a href="#"><i class="icon-popout"></i> <span>JQuery UI</span></a>
									<ul>
										<li><a href="jqueryui_interactions.html">Interactions</a></li>
										<li><a href="jqueryui_forms.html">Forms</a></li>
										<li><a href="jqueryui_components.html">Components</a></li>
										<li><a href="jqueryui_sliders.html">Sliders</a></li>
										<li><a href="jqueryui_navigation.html">Navigation</a></li>
									</ul>
								</li>
								<li>
									<a href="#"><i class="icon-upload"></i> <span>File uploaders</span></a>
									<ul>
										<li><a href="uploader_plupload.html">Plupload</a></li>
										<li><a href="uploader_bootstrap.html">Bootstrap file uploader</a></li>
										<li><a href="uploader_dropzone.html">Dropzone</a></li>
									</ul>
								</li>
								<li>
									<a href="#"><i class="icon-calendar3"></i> <span>Event calendars</span></a>
									<ul>
										<li><a href="extension_fullcalendar_views.html">Basic views</a></li>
										<li><a href="extension_fullcalendar_styling.html">Event styling</a></li>
										<li><a href="extension_fullcalendar_formats.html">Language and time</a></li>
										<li><a href="extension_fullcalendar_advanced.html">Advanced usage</a></li>
									</ul>
								</li>
								<li>
									<a href="#"><i class="icon-sphere"></i> <span>Internationalization</span></a>
									<ul>
										<li><a href="internationalization_switch_direct.html">Direct translation</a></li>
										<li><a href="internationalization_switch_query.html">Querystring parameter</a></li>
										<li><a href="internationalization_on_init.html">Set language on init</a></li>
										<li><a href="internationalization_after_init.html">Set language after init</a></li>
										<li><a href="internationalization_fallback.html">Language fallback</a></li>
										<li><a href="internationalization_callbacks.html">Callbacks</a></li>
									</ul>
								</li>
								<!-- /extensions -->

								<!-- Tables -->
								<li class="navigation-header"><span>Tables</span> <i class="icon-menu" title="Tables"></i></li>
								<li>
									<a href="#"><i class="icon-table2"></i> <span>Basic tables</span></a>
									<ul>
										<li><a href="table_basic.html">Basic examples</a></li>
										<li><a href="table_sizing.html">Table sizing</a></li>
										<li><a href="table_borders.html">Table borders</a></li>
										<li><a href="table_styling.html">Table styling</a></li>
										<li><a href="table_elements.html">Table elements</a></li>
									</ul>
								</li>
								<li>
									<a href="#"><i class="icon-grid7"></i> <span>Data tables</span></a>
									<ul>
										<li><a href="datatable_basic.html">Basic initialization</a></li>
										<li><a href="datatable_styling.html">Basic styling</a></li>
										<li><a href="datatable_advanced.html">Advanced examples</a></li>
										<li><a href="datatable_sorting.html">Sorting options</a></li>
										<li><a href="datatable_api.html">Using API</a></li>
										<li><a href="datatable_data_sources.html">Data sources</a></li>
									</ul>
								</li>
								<li>
									<a href="#"><i class="icon-alignment-unalign"></i> <span>Data tables extensions</span></a>
									<ul>
										<li><a href="datatable_extension_reorder.html">Columns reorder</a></li>
										<li><a href="datatable_extension_row_reorder.html">Row reorder</a></li>
										<li><a href="datatable_extension_fixed_columns.html">Fixed columns</a></li>
										<li><a href="datatable_extension_fixed_header.html">Fixed header</a></li>
										<li><a href="datatable_extension_autofill.html">Auto fill</a></li>
										<li><a href="datatable_extension_key_table.html">Key table</a></li>
										<li><a href="datatable_extension_scroller.html">Scroller</a></li>
										<li><a href="datatable_extension_select.html">Select</a></li>
										<li>
											<a href="#">Buttons</a>
											<ul>
												<li><a href="datatable_extension_buttons_init.html">Initialization</a></li>
												<li><a href="datatable_extension_buttons_flash.html">Flash buttons</a></li>
												<li><a href="datatable_extension_buttons_print.html">Print buttons</a></li>
												<li><a href="datatable_extension_buttons_html5.html">HTML5 buttons</a></li>
											</ul>
										</li>

										<li><a href="datatable_extension_colvis.html">Columns visibility</a></li>
									</ul>
								</li>
								<li>
									<a href="#"><i class="icon-file-spreadsheet"></i> <span>Handsontable</span></a>
									<ul>
										<li><a href="handsontable_basic.html">Basic configuration</a></li>
										<li><a href="handsontable_advanced.html">Advanced setup</a></li>
										<li><a href="handsontable_cols.html">Column features</a></li>
										<li><a href="handsontable_cells.html">Cell features</a></li>
										<li><a href="handsontable_types.html">Basic cell types</a></li>
										<li><a href="handsontable_custom_checks.html">Custom &amp; checkboxes</a></li>
										<li><a href="handsontable_ac_password.html">Autocomplete &amp; password</a></li>
										<li><a href="handsontable_search.html">Search</a></li>
										<li><a href="handsontable_context.html">Context menu</a></li>
									</ul>
								</li>
								<li>
									<a href="#"><i class="icon-versions"></i> <span>Responsive options</span></a>
									<ul>
										<li><a href="table_responsive.html">Responsive basic tables</a></li>
										<li><a href="datatable_responsive.html">Responsive data tables</a></li>
									</ul>
								</li>
								<!-- /tables -->

								<!-- Page kits -->
								<li class="navigation-header"><span>Page kits</span> <i class="icon-menu" title="Page kits"></i></li>
								<li>
									<a href="#"><i class="icon-task"></i> <span>Task manager</span></a>
									<ul>
										<li><a href="task_manager_grid.html">Task grid</a></li>
										<li><a href="task_manager_list.html">Task list</a></li>
										<li class="active"><a href="task_manager_detailed.html">Task detailed</a></li>
									</ul>
								</li>
								<li>
									<a href="#"><i class="icon-cash3"></i> <span>Invoicing</span></a>
									<ul>
										<li><a href="invoice_template.html">Invoice template</a></li>
										<li><a href="invoice_grid.html">Invoice grid</a></li>
										<li><a href="invoice_archive.html">Invoice archive</a></li>
									</ul>
								</li>
								<li>
									<a href="#"><i class="icon-people"></i> <span>User pages</span></a>
									<ul>
										<li><a href="user_pages_cards.html">User cards</a></li>
										<li><a href="user_pages_list.html">User list</a></li>
										<li><a href="user_pages_profile.html">Simple profile</a></li>
										<li><a href="user_pages_profile_cover.html">Profile with cover</a></li>
									</ul>
								</li>
								<li>
									<a href="#"><i class="icon-user-plus"></i> <span>Login &amp; registration</span></a>
									<ul>
										<li><a href="login_simple.html">Simple login</a></li>
										<li><a href="login_advanced.html">More login info</a></li>
										<li><a href="login_registration.html">Simple registration</a></li>
										<li><a href="login_registration_advanced.html">More registration info</a></li>
										<li><a href="login_unlock.html">Unlock user</a></li>
										<li><a href="login_password_recover.html">Reset password</a></li>
										<li><a href="login_hide_navbar.html">Hide navbar</a></li>
										<li><a href="login_transparent.html">Transparent box</a></li>
										<li><a href="login_background.html">Background option</a></li>
										<li><a href="login_validation.html">With validation</a></li>
										<li><a href="login_tabbed.html">Tabbed form</a></li>
										<li><a href="login_modals.html">Inside modals</a></li>
									</ul>
								</li>
								<li>
									<a href="#"><i class="icon-magazine"></i> <span>Timelines</span></a>
									<ul>
										<li><a href="timelines_left.html">Left timeline</a></li>
										<li><a href="timelines_right.html">Right timeline</a></li>
										<li><a href="timelines_center.html">Centered timeline</a></li>
									</ul>
								</li>
								<li>
									<a href="#"><i class="icon-lifebuoy"></i> <span>Support</span></a>
									<ul>
										<li><a href="support_conversation_layouts.html">Conversation layouts</a></li>
										<li><a href="support_conversation_options.html">Conversation options</a></li>
										<li><a href="support_knowledgebase.html">Knowledgebase</a></li>
										<li><a href="support_faq.html">FAQ page</a></li>
									</ul>
								</li>
								<li>
									<a href="#"><i class="icon-search4"></i> <span>Search</span></a>
									<ul>
										<li><a href="search_basic.html">Basic search results</a></li>
										<li><a href="search_users.html">User search results</a></li>
										<li><a href="search_images.html">Image search results</a></li>
										<li><a href="search_videos.html">Video search results</a></li>
									</ul>
								</li>
								<li>
									<a href="#"><i class="icon-images2"></i> <span>Gallery</span></a>
									<ul>
										<li><a href="gallery_grid.html">Media grid</a></li>
										<li><a href="gallery_titles.html">Media with titles</a></li>
										<li><a href="gallery_description.html">Media with description</a></li>
										<li><a href="gallery_library.html">Media library</a></li>
									</ul>
								</li>
								<li>
									<a href="#"><i class="icon-warning"></i> <span>Error pages</span></a>
									<ul>
										<li><a href="error_403.html">Error 403</a></li>
										<li><a href="error_404.html">Error 404</a></li>
										<li><a href="error_405.html">Error 405</a></li>
										<li><a href="error_500.html">Error 500</a></li>
										<li><a href="error_503.html">Error 503</a></li>
										<li><a href="error_offline.html">Offline page</a></li>
									</ul>
								</li>
								<!-- /page kits -->

							</ul>
						</div>
					</div>
					<!-- /main navigation -->

				</div>
			</div>
			<!-- /main sidebar -->


			<!-- Main content -->
			<div class="content-wrapper">

				<!-- Page header -->
				<div class="page-header">
					<div class="page-header-content">
						<div class="page-title">
							<h4><i class="icon-arrow-left52 position-left"></i> <span class="text-semibold">Task Manager</span> - Detailed</h4>

							<ul class="breadcrumb position-right">
								<li><a href="index.html">Home</a></li>
								<li><a href="task_manager_detailed.html">Task manager</a></li>
								<li class="active">Detailed</li>
							</ul>
						</div>

						<div class="heading-elements">
							<div class="heading-btn-group">
								<a href="#" class="btn btn-link btn-float has-text"><i class="icon-bars-alt text-primary"></i><span>Statistics</span></a>
								<a href="#" class="btn btn-link btn-float has-text"><i class="icon-calculator text-primary"></i> <span>Invoices</span></a>
								<a href="#" class="btn btn-link btn-float has-text"><i class="icon-calendar5 text-primary"></i> <span>Schedule</span></a>
							</div>
						</div>
					</div>
				</div>
				<!-- /page header -->


				<!-- Content area -->
				<div class="content">

					<!-- Detailed task -->
					<div class="row">
						<div class="col-lg-9">

							<!-- Task overview -->
							<div class="panel panel-flat">
								<div class="panel-heading mt-5">
									<h5 class="panel-title">#23: Support tickets list doesn't support commas</h5>
									<div class="heading-elements">
										<a href="#" class="btn bg-teal-400 btn-sm btn-labeled btn-labeled-right heading-btn">Check in <b><i class="icon-alarm-check"></i></b></a>
				                	</div>
								</div>

								<div class="panel-body">
									
                                    
                                    
                                    
									 
				                  <!--below is editor</%-->    
                                    
                                    
                                     

					<!-- Summernote click to edit -->
					<div class="panel panel-flat">
						<div class="panel-heading">
							<h5 class="panel-title">Click to edit</h5>
							<div class="heading-elements">
								<ul class="icons-list">
			                		<li><a data-action="collapse"></a></li>
			                		<li><a data-action="reload"></a></li>
			                		<li><a data-action="close"></a></li>
			                	</ul>
		                	</div>
						</div>

 					<form id="myfrm" action="TaskDetail.jsp"> 
						<div class="panel-body" id="panelID">
							<div class="form-group">
								<button type="button" id="edit" class="btn btn-primary"><i class="icon-pencil3 position-left"></i> Edit</button>
								<button type="button" id="save" class="btn btn-success"><i class="icon-checkmark3 position-left"></i> Save</button>
                            
                                <a href="index.jsp" >
                                <button type="button" id="cancel" class="btn btn-cancel"><i class="fa fa-undo" aria-hidden="true"></i> Cancel</button>
							</div>
                            </a>
                            
                            
							
							<div class="click2edit" id="articleTextID">
								 <%=taskText %>
							</div>
						</div>
						</form>
					</div>
					<!-- /summernote click to edit -->
 
                                    
                                    
                                    
                                    
                                    
                                    <!--editor finish -->
                                    
                                      
				                    <h6 class="text-semibold">Uploaded files</h6>
									<p>A much goodness between destructive that save stupid firefly destructively dog goldfinch continually alas pinched for outside flailed inescapably hey brought rid crud and awakened sobbed extraordinarily wherever deer before tenable yet into dalmatian opposite save close ahead next independent mindful but far.</p>

									<div class="row">
										<div class="col-md-3 col-sm-6">
											<div class="thumbnail">
												<div class="thumb">
													<img src="assets/images/placeholder.jpg" alt="">
													<div class="caption-overflow">
														<span>
															<a href="#" class="btn bg-success-300 btn-xs btn-icon"><i class="icon-zoomin3"></i></a>
															<a href="#" class="btn bg-success-300 btn-xs btn-icon"><i class="icon-download"></i></a>
														</span>
													</div>
												</div>

												<div class="caption text-center">
													 dashboard_draft.png
												</div>
											</div>
										</div>

										<div class="col-md-3 col-sm-6">
											<div class="thumbnail">
												<div class="thumb">
													<img src="assets/images/placeholder.jpg" alt="">
													<div class="caption-overflow">
														<span>
															<a href="#" class="btn bg-success-300 btn-xs btn-icon"><i class="icon-zoomin3"></i></a>
															<a href="#" class="btn bg-success-300 btn-xs btn-icon"><i class="icon-download"></i></a>
														</span>
													</div>
												</div>

												<div class="caption text-center">
													 profile_page.png
												</div>
											</div>
										</div>

										<div class="col-md-3 col-sm-6">
											<div class="thumbnail">
												<div class="thumb">
													<img src="assets/images/placeholder.jpg" alt="">
													<div class="caption-overflow">
														<span>
															<a href="#" class="btn bg-success-300 btn-xs btn-icon"><i class="icon-zoomin3"></i></a>
															<a href="#" class="btn bg-success-300 btn-xs btn-icon"><i class="icon-download"></i></a>
														</span>
													</div>
												</div>

												<div class="caption text-center">
													 shopping_cart.png
												</div>
											</div>
										</div>

										<div class="col-md-3 col-sm-6">
											<div class="thumbnail">
												<div class="thumb">
													<img src="assets/images/placeholder.jpg" alt="">
													<div class="caption-overflow">
														<span>
															<a href="#" class="btn bg-success-300 btn-xs btn-icon"><i class="icon-zoomin3"></i></a>
															<a href="#" class="btn bg-success-300 btn-xs btn-icon"><i class="icon-download"></i></a>
														</span>
													</div>
												</div>

												<div class="caption text-center">
													 sales_statistics.png
												</div>
											</div>
										</div>
									</div>
								</div>

						    	<div class="panel-footer">
									<div class="heading-elements">
										<ul class="list-inline list-inline-condensed heading-text">
											<li><span class="status-mark border-blue position-left"></span> Status:</li>
											<li class="dropdown">
												<a href="#" class="text-default text-semibold dropdown-toggle" data-toggle="dropdown">Open <span class="caret"></span></a>
												<ul class="dropdown-menu">
													<li class="active"><a href="#">Open</a></li>
													<li><a href="#">On hold</a></li>
													<li><a href="#">Resolved</a></li>
													<li><a href="#">Closed</a></li>
													<li class="divider"></li>
													<li><a href="#">Dublicate</a></li>
													<li><a href="#">Invalid</a></li>
													<li><a href="#">Wontfix</a></li>
												</ul>
											</li>
										</ul>

										<ul class="list-inline list-inline-condensed heading-text pull-right">
											<li><a href="#" class="text-default"><i class="icon-compose"></i></a></li>
											<li><a href="#" class="text-default"><i class="icon-trash"></i></a></li>
											<li class="dropdown">
												<a href="#" class="text-default dropdown-toggle" data-toggle="dropdown"><i class="icon-grid-alt"></i> <span class="caret"></span></a>
												<ul class="dropdown-menu dropdown-menu-right">
													<li><a href="#"><i class="icon-alarm-add"></i> Check in</a></li>
													<li><a href="#"><i class="icon-attachment"></i> Attach screenshot</a></li>
													<li><a href="#"><i class="icon-user-plus"></i> Assign users</a></li>
													<li><a href="#"><i class="icon-warning2"></i> Report</a></li>
												</ul>
											</li>
										</ul>
									</div>
								</div>
							</div>
							<!-- /task overview -->


							<!-- Comments -->
							<div class="panel panel-flat">
								<div class="panel-heading">
									<h5 class="panel-title text-semiold"><i class="icon-bubbles4 position-left"></i> Comments</h5>
									<div class="heading-elements">
										<a href="#" class="btn bg-blue btn-xs btn-icon"><i class="icon-plus2"></i></a>
				                	</div>
								</div>

								<div class="panel-body">
									<ul class="media-list content-group-lg stack-media-on-mobile">
										<li class="media">
											<div class="media-left">
												<a href="#"><img src="assets/images/placeholder.jpg" class="img-circle img-sm" alt=""></a>
											</div>

											<div class="media-body">
												<div class="media-heading">
													<a href="#" class="text-semibold">William Jennings</a>
													<span class="media-annotation dotted">Just now</span>
												</div>

												<p>He moonlight difficult engrossed an it sportsmen. Interested has all devonshire difficulty gay assistance joy. Unaffected at ye of compliment alteration to.</p>

												<ul class="list-inline list-inline-separate text-size-small">
													<li>114 <a href="#"><i class="icon-arrow-up22 text-success"></i></a><a href="#"><i class="icon-arrow-down22 text-danger"></i></a></li>
													<li><a href="#">Reply</a></li>
													<li><a href="#">Edit</a></li>
												</ul>
											</div>
										</li>

										<li class="media">
											<div class="media-left">
												<a href="#"><img src="assets/images/placeholder.jpg" class="img-circle img-sm" alt=""></a>
											</div>

											<div class="media-body">
												<div class="media-heading">
													<a href="#" class="text-semibold">Margo Baker</a>
													<span class="media-annotation dotted">5 minutes ago</span>
												</div>

												<p>Place voice no arise along to. Parlors waiting so against me no. Wishing calling are warrant settled was luckily. Express besides it present if at an opinion visitor.</p>

												<ul class="list-inline list-inline-separate text-size-small">
													<li>90 <a href="#"><i class="icon-arrow-up22 text-success"></i></a><a href="#"><i class="icon-arrow-down22 text-danger"></i></a></li>
													<li><a href="#">Reply</a></li>
													<li><a href="#">Edit</a></li>
												</ul>
											</div>
										</li>

										<li class="media">
											<div class="media-left">
												<a href="#"><img src="assets/images/placeholder.jpg" class="img-circle img-sm" alt=""></a>
											</div>

											<div class="media-body">
												<div class="media-heading">
													<a href="#" class="text-semibold">James Alexander</a>
													<span class="media-annotation dotted">7 minutes ago</span>
												</div>

												<p>Savings her pleased are several started females met. Short her not among being any. Thing of judge fruit charm views do. Miles mr an forty along as he.</p>

												<ul class="list-inline list-inline-separate text-size-small">
													<li>70 <a href="#"><i class="icon-arrow-up22 text-success"></i></a><a href="#"><i class="icon-arrow-down22 text-danger"></i></a></li>
													<li><a href="#">Reply</a></li>
													<li><a href="#">Edit</a></li>
												</ul>

												<div class="media">
													<div class="media-left">
														<a href="#"><img src="assets/images/placeholder.jpg" class="img-circle img-sm" alt=""></a>
													</div>

													<div class="media-body">
														<div class="media-heading">
															<a href="#" class="text-semibold">Jack Cooper</a>
															<span class="media-annotation dotted">10 minutes ago</span>
														</div>

														<p>She education get middleton day agreement performed preserved unwilling. Do however as pleased offence outward beloved by present. By outward neither he so covered.</p>

														<ul class="list-inline list-inline-separate text-size-small">
															<li>67 <a href="#"><i class="icon-arrow-up22 text-success"></i></a><a href="#"><i class="icon-arrow-down22 text-danger"></i></a></li>
															<li><a href="#">Reply</a></li>
															<li><a href="#">Edit</a></li>
														</ul>

														<div class="media">
															<div class="media-left">
																<a href="#"><img src="assets/images/placeholder.jpg" class="img-circle img-sm" alt=""></a>
															</div>

															<div class="media-body">
																<div class="media-heading">
																	<a href="#" class="text-semibold">Natalie Wallace</a>
																	<span class="media-annotation dotted">1 hour ago</span>
																</div>

																<p>Juvenile proposal betrayed he an informed weddings followed. Precaution day see imprudence sympathize principles. At full leaf give quit to in they up.</p>

																<ul class="list-inline list-inline-separate text-size-small">
																	<li>54 <a href="#"><i class="icon-arrow-up22 text-success"></i></a><a href="#"><i class="icon-arrow-down22 text-danger"></i></a></li>
																	<li><a href="#">Reply</a></li>
																	<li><a href="#">Edit</a></li>
																</ul>
															</div>
														</div>

														<div class="media">
															<div class="media-left">
																<a href="#"><img src="assets/images/placeholder.jpg" class="img-circle img-sm" alt=""></a>
															</div>

															<div class="media-body">
																<div class="media-heading">
																	<a href="#" class="text-semibold">Nicolette Grey</a>
																	<span class="media-annotation dotted">2 hours ago</span>
																</div>

																<p>Although moreover mistaken kindness me feelings do be marianne. Son over own nay with tell they cold upon are. Cordial village and settled she ability law herself.</p>

																<ul class="list-inline list-inline-separate text-size-small">
																	<li>41 <a href="#"><i class="icon-arrow-up22 text-success"></i></a><a href="#"><i class="icon-arrow-down22 text-danger"></i></a></li>
																	<li><a href="#">Reply</a></li>
																	<li><a href="#">Edit</a></li>
																</ul>
															</div>
														</div>
													</div>
												</div>
											</div>
										</li>

										<li class="media">
											<div class="media-left">
												<a href="#"><img src="assets/images/placeholder.jpg" class="img-circle img-sm" alt=""></a>
											</div>

											<div class="media-body">
												<div class="media-heading">
													<a href="#" class="text-semibold">Victoria Johnson</a>
													<span class="media-annotation dotted">3 hours ago</span>
												</div>

												<p>Finished why bringing but sir bachelor unpacked any thoughts. Unpleasing unsatiable particular inquietude did nor sir.</p>

												<ul class="list-inline list-inline-separate text-size-small">
													<li>32 <a href="#"><i class="icon-arrow-up22 text-success"></i></a><a href="#"><i class="icon-arrow-down22 text-danger"></i></a></li>
													<li><a href="#">Reply</a></li>
													<li><a href="#">Edit</a></li>
												</ul>
											</div>
										</li>
									</ul>

									<h6 class="text-semibold"><i class="icon-pencil7 position-left"></i> Your comment</h6>
									<div class="content-group">
										<div id="add-comment">Get his declared appetite distance his together now families. Friends am himself at on norland it viewing. Suspected elsewhere you belonging continued commanded she...</div>
									</div>
									
									<div class="text-right">
										<button type="button" class="btn bg-blue"><i class="icon-plus22"></i> Add comment</button>
									</div>
								</div>
							</div>
							<!-- /comments -->

						</div>

						<div class="col-lg-3">

							<!-- Timer -->
							<div class="panel panel-flat">
								<div class="panel-heading">
									<h6 class="panel-title"><i class="icon-watch position-left"></i> Task timer</h6>
									<div class="heading-elements">
										<ul class="icons-list">
					                		<li><a data-action="collapse"></a></li>
					                		<li><a data-action="reload"></a></li>
					                		<li><a data-action="close"></a></li>
					                	</ul>
				                	</div>
								</div>

								<div class="panel-body">
									<ul class="timer-weekdays mb-10">
										<li><a href="#" class="label label-default">Mon</a></li>
										<li class="active"><a href="#" class="label label-danger">Tue</a></li>
										<li><a href="#" class="label label-default">Wed</a></li>
										<li><a href="#" class="label label-default">Thu</a></li>
										<li><a href="#" class="label label-default">Fri</a></li>
										<li><a href="#" class="label label-default">Sat</a></li>
										<li><a href="#" class="label label-default">Sun</a></li>
									</ul>

								    <ul class="timer mb-10">
								        <li>
								        	09 <span>hours</span>
								        </li>
								        <li class="dots">:</li>
								        <li>
								        	54 <span>minutes</span>
								        </li>
								        <li class="dots">:</li>
								        <li>
								        	29 <span>seconds</span>
								        </li>
								    </ul>
							    </div>

						    	<div class="panel-footer panel-footer-transparent">
									<div class="heading-elements">
										<ul class="list-inline list-inline-condensed heading-text">
											<li><a href="#" class="text-default"><i class="icon-play3"></i></a></li>
											<li><a href="#" class="text-default"><i class="icon-pause"></i></a></li>
											<li><a href="#" class="text-default"><i class="icon-stop"></i></a></li>
										</ul>

										<ul class="list-inline list-inline-condensed heading-text pull-right">
											<li class="dropdown">
												<a href="#" class="text-default dropdown-toggle" data-toggle="dropdown">
													<span class="status-mark border-success position-left"></span>
													Open
													<span class="caret"></span>
												</a>

												<ul class="dropdown-menu dropdown-menu-right">
													<li class="active"><a href="#">Open</a></li>
													<li><a href="#">On hold</a></li>
													<li><a href="#">Resolved</a></li>
													<li><a href="#">Closed</a></li>
													<li class="divider"></li>
													<li><a href="#">Dublicate</a></li>
													<li><a href="#">Invalid</a></li>
													<li><a href="#">Wontfix</a></li>
												</ul>
											</li>
										</ul>
									</div>
								</div>
							</div>
							<!-- /timer -->


							<!-- Task details -->
							<div class="panel panel-flat">
								<div class="panel-heading">
									<h6 class="panel-title"><i class="icon-files-empty position-left"></i> Task details</h6>
									<div class="heading-elements">
										<ul class="icons-list">
					                		<li><a data-action="collapse"></a></li>
					                		<li><a data-action="reload"></a></li>
					                		<li><a data-action="close"></a></li>
					                	</ul>
				                	</div>
								</div>

								<table class="table table-borderless table-xs content-group-sm">
									<tbody>
										<tr>
											<td><i class="icon-briefcase position-left"></i> Project:</td>
											<td class="text-right"><span class="pull-right"><a href="#">Singular app</a></span></td>
										</tr>
										<tr>
											<td><i class="icon-alarm-add position-left"></i> Updated:</td>
											<td class="text-right">12 May, 2015</td>
										</tr>
										<tr>
											<td><i class="icon-alarm-check position-left"></i> Created:</td>
											<td class="text-right">25 Feb, 2015</td>
										</tr>
										<tr>
											<td><i class="icon-circles2 position-left"></i> Priority:</td>
											<td class="text-right">
												<div class="btn-group">
													<a href="#" class="label label-danger dropdown-toggle" data-toggle="dropdown">Highest <span class="caret"></span></a>
													<ul class="dropdown-menu dropdown-menu-right">
														<li><a href="#"><span class="status-mark position-left bg-danger"></span> Highest priority</a></li>
														<li><a href="#"><span class="status-mark position-left bg-info"></span> High priority</a></li>
														<li><a href="#"><span class="status-mark position-left bg-primary"></span> Normal priority</a></li>
														<li><a href="#"><span class="status-mark position-left bg-success"></span> Low priority</a></li>
													</ul>
												</div>
											</td>
										</tr>
										<tr>
											<td><i class="icon-history position-left"></i> Revisions:</td>
											<td class="text-right">29</td>
										</tr>
										<tr>
											<td><i class="icon-file-plus position-left"></i> Added by:</td>
											<td class="text-right"><a href="#">Winnie</a></td>
										</tr>
										<tr>
											<td><i class="icon-file-check position-left"></i> Status:</td>
											<td class="text-right">Published</td>
										</tr>
									</tbody>
								</table>

						    	<div class="panel-footer panel-footer-condensed">
									<div class="heading-elements">
										<ul class="list-inline list-inline-condensed heading-text">
											<li><a href="#" class="text-default"><i class="icon-pencil7"></i></a></li>
											<li><a href="#" class="text-default"><i class="icon-bin"></i></a></li>
										</ul>

										<ul class="list-inline list-inline-condensed heading-text pull-right">
											<li><a href="#" class="text-default"><i class="icon-statistics"></i></a></li>
											<li class="dropdown">
												<a href="#" class="text-default dropdown-toggle" data-toggle="dropdown"><i class="icon-gear"></i><span class="caret"></span></a>
												<ul class="dropdown-menu dropdown-menu-right">
													<li><a href="#"><i class="icon-alarm-add"></i> Check in</a></li>
													<li><a href="#"><i class="icon-attachment"></i> Attach screenshot</a></li>
													<li><a href="#"><i class="icon-user-plus"></i> Assign users</a></li>
													<li><a href="#"><i class="icon-warning2"></i> Report</a></li>
												</ul>
											</li>
										</ul>
									</div>
								</div>
							</div>
							<!-- /task details -->


							<!-- Task settings -->
							<div class="panel panel-flat">
								<div class="panel-heading">
									<h6 class="panel-title"><i class="icon-cog3 position-left"></i> Task settings</h6>
									<div class="heading-elements">
										<ul class="icons-list">
					                		<li><a data-action="collapse"></a></li>
					                		<li><a data-action="reload"></a></li>
					                		<li><a data-action="close"></a></li>
					                	</ul>
				                	</div>
								</div>

								<div class="panel-body">
									<form action="#">
										<div class="form-group">
											<div class="checkbox checkbox-switchery checkbox-right switchery-xs">
												<label class="display-block">
													<input type="checkbox" class="switchery" checked="checked">
													Publish after save
												</label>	
											</div>

											<div class="checkbox checkbox-switchery checkbox-right switchery-xs">
												<label class="display-block">
													<input type="checkbox" class="switchery">
													Allow comments
												</label>
											</div>

											<div class="checkbox checkbox-switchery checkbox-right switchery-xs">
												<label class="display-block">
													<input type="checkbox" class="switchery" checked="checked">
													Allow users to edit the task
												</label>
											</div>

											<div class="checkbox checkbox-switchery checkbox-right switchery-xs">
												<label class="display-block">
													<input type="checkbox" class="switchery" checked="checked">
													Use task timer
												</label>
											</div>

											<div class="checkbox checkbox-switchery checkbox-right switchery-xs">
												<label class="display-block">
													<input type="checkbox" class="switchery">
													Auto saving
												</label>
											</div>

											<div class="checkbox checkbox-switchery checkbox-right switchery-xs">
												<label class="display-block">
													<input type="checkbox" class="switchery" checked="checked">
													Allow attachments
												</label>
											</div>
										</div>

										<div class="row">
											<div class="col-md-6">
												<p><button class="btn btn-default btn-sm btn-block" type="button">Reset</button></p>
											</div>

											<div class="col-md-6">
												<p><button class="btn btn-primary btn-sm btn-block" type="button">Save</button></p>
											</div>
										</div>
									</form>
								</div>
							</div>
							<!-- /task settings -->


							<!-- Revisions -->
							<div class="panel panel-flat">
								<div class="panel-heading">
									<h6 class="panel-title"><i class="icon-git-commit position-left"></i> Revisions</h6>
									<div class="heading-elements">
										<ul class="icons-list">
					                		<li><a data-action="collapse"></a></li>
					                		<li><a data-action="reload"></a></li>
					                		<li><a data-action="close"></a></li>
					                	</ul>
				                	</div>
								</div>

								<div class="panel-body">
									<ul class="media-list">
										<li class="media">
											<div class="media-left"><a href="#" class="btn border-primary text-primary btn-icon btn-flat btn-sm btn-rounded"><i class="icon-git-pull-request"></i></a></div>
											<div class="media-body">
												Drop the IE <a href="#">specific hacks</a> for temporal inputs
												<div class="media-annotation">4 minutes ago</div>
											</div>
										</li>

										<li class="media">
											<div class="media-left"><a href="#" class="btn border-warning text-warning btn-icon btn-flat btn-sm btn-rounded"><i class="icon-git-commit"></i></a></div>
											<div class="media-body">
												Add full font overrides for popovers and tooltips
												<div class="media-annotation">36 minutes ago</div>
											</div>
										</li>

										<li class="media">
											<div class="media-left"><a href="#" class="btn border-info text-info btn-icon btn-flat btn-sm btn-rounded"><i class="icon-git-branch"></i></a></div>
											<div class="media-body">
												<a href="#">Chris Arney</a> created a new <span class="text-semibold">Design</span> branch
												<div class="media-annotation">2 hours ago</div>
											</div>
										</li>

										<li class="media">
											<div class="media-left"><a href="#" class="btn border-success text-success btn-icon btn-flat btn-sm btn-rounded"><i class="icon-git-merge"></i></a></div>
											<div class="media-body">
												<a href="#">Eugene Kopyov</a> merged <span class="text-semibold">Master</span> and <span class="text-semibold">Dev</span> branches
												<div class="media-annotation">Dec 18, 18:36</div>
											</div>
										</li>

										<li class="media">
											<div class="media-left"><a href="#" class="btn border-primary text-primary btn-icon btn-flat btn-sm btn-rounded"><i class="icon-git-pull-request"></i></a></div>
											<div class="media-body">
												Have Carousel ignore keyboard events
												<div class="media-annotation">Dec 12, 05:46</div>
											</div>
										</li>
									</ul>
								</div>
							</div>
							<!-- /revisions -->


							<!-- Attached files -->
							<div class="panel panel-flat">
								<div class="panel-heading">
									<h6 class="panel-title"><i class="icon-link position-left"></i> Attached files</h6>
									<div class="heading-elements">
										<ul class="icons-list">
					                		<li><a data-action="collapse"></a></li>
					                		<li><a data-action="reload"></a></li>
					                		<li><a data-action="close"></a></li>
					                	</ul>
				                	</div>
								</div>

								<div class="panel-body">
									<ul class="media-list">
										<li class="media">
											<div class="media-left media-middle">
												<i class="icon-file-word icon-2x text-muted"></i>
											</div>

											<div class="media-body">
												<a href="#" class="media-heading text-semibold">Overdrew_scowled.doc</a>
												<ul class="list-inline list-inline-separate list-inline-condensed text-size-mini text-muted">
													<li>Size: 1.2Mb</li>
													<li>Added by <a href="#">Winnie</a></li>
												</ul>
											</div>

											<div class="media-right media-middle">
												<ul class="icons-list">
													<li><a href="#"><i class="icon-download"></i></a></li>
												</ul>
											</div>
										</li>

										<li class="media">
											<div class="media-left media-middle">
												<i class="icon-file-stats icon-2x text-muted"></i>
											</div>

											<div class="media-body">
												<a href="#" class="media-heading text-semibold">And_less_maternally.pdf</a>
												<ul class="list-inline list-inline-separate list-inline-condensed text-size-mini text-muted">
													<li>Size: 0.9Mb</li>
													<li>Added by <a href="#">Eugene</a></li>
												</ul>
											</div>

											<div class="media-right media-middle">
												<ul class="icons-list">
													<li><a href="#"><i class="icon-download"></i></a></li>
												</ul>
											</div>
										</li>

										<li class="media">
											<div class="media-left media-middle">
												<i class="icon-file-pdf icon-2x text-muted"></i>
											</div>
											
											<div class="media-body">
												<a href="#" class="media-heading text-semibold">The_less_overslept.pdf</a>
												<ul class="list-inline list-inline-separate list-inline-condensed text-size-mini text-muted">
													<li>Size: 4.3Mb</li>
													<li>Added by <a href="#">Natalie</a></li>
												</ul>
											</div>
											
											<div class="media-right media-middle">
												<ul class="icons-list">
													<li><a href="#"><i class="icon-download"></i></a></li>
												</ul>
											</div>
										</li>

										<li class="media">
											<div class="media-left media-middle">
												<i class="icon-file-video icon-2x text-muted"></i>
											</div>
											
											<div class="media-body">
												<a href="#" class="media-heading text-semibold">Well_equitably.mov</a>
												<ul class="list-inline list-inline-separate list-inline-condensed text-size-mini text-muted">
													<li>Size: 14.8Mb</li>
													<li>Added by <a href="#">Jenny</a></li>
												</ul>
											</div>

											<div class="media-right media-middle">
												<ul class="icons-list">
													<li><a href="#"><i class="icon-download"></i></a></li>
												</ul>
											</div>
										</li>
									</ul>
								</div>
							</div>
							<!-- /attached files -->


							<!-- Assigned users -->
							<div class="panel panel-flat">
								<div class="panel-heading">
									<h6 class="panel-title"><i class="icon-users position-left"></i> Assigned users</h6>
									<div class="heading-elements">
										<ul class="icons-list">
					                		<li><a data-action="collapse"></a></li>
					                		<li><a data-action="reload"></a></li>
					                		<li><a data-action="close"></a></li>
					                	</ul>
				                	</div>
								</div>

								<div class="panel-body">
									<ul class="media-list">
										<li class="media">
											<div class="media-left">
												<a href="#">
													<img src="assets/images/placeholder.jpg" class="img-sm img-circle" alt="">
													<span class="badge bg-warning-400 media-badge">6</span>
												</a>
											</div>

											<div class="media-body media-middle text-semibold">
												Rebecca Jameson
												<div class="media-annotation">Web developer</div>
											</div>

											<div class="media-right media-middle">
												<ul class="icons-list text-nowrap">
													<li>
														<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-more2"></i></a>
														<ul class="dropdown-menu dropdown-menu-right">
															<li><a href="#"><i class="icon-comment-discussion pull-right"></i> Start chat</a></li>
															<li><a href="#"><i class="icon-phone2 pull-right"></i> Make a call</a></li>
															<li><a href="#"><i class="icon-mail5 pull-right"></i> Send mail</a></li>
															<li class="divider"></li>
															<li><a href="#"><i class="icon-statistics pull-right"></i> Statistics</a></li>
														</ul>
													</li>
												</ul>
											</div>
										</li>

										<li class="media">
											<div class="media-left">
												<a href="#">
													<img src="assets/images/placeholder.jpg" class="img-sm img-circle" alt="">
													<span class="badge bg-warning-400 media-badge">9</span>
												</a>
											</div>

											<div class="media-body media-middle text-semibold">
												Walter Sommers
												<div class="media-annotation">Lead developer</div>
											</div>

											<div class="media-right media-middle">
												<ul class="icons-list text-nowrap">
													<li>
														<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-more2"></i></a>
														<ul class="dropdown-menu dropdown-menu-right">
															<li><a href="#"><i class="icon-comment-discussion pull-right"></i> Start chat</a></li>
															<li><a href="#"><i class="icon-phone2 pull-right"></i> Make a call</a></li>
															<li><a href="#"><i class="icon-mail5 pull-right"></i> Send mail</a></li>
															<li class="divider"></li>
															<li><a href="#"><i class="icon-statistics pull-right"></i> Statistics</a></li>
														</ul>
													</li>
												</ul>
											</div>
										</li>

										<li class="media">
											<div class="media-left">
												<a href="#"><img src="assets/images/placeholder.jpg" class="img-sm img-circle" alt=""></a>
											</div>

											<div class="media-body media-middle text-semibold">
												Otto Gerwald
												<div class="media-annotation">Front end developer</div>
											</div>

											<div class="media-right media-middle">
												<ul class="icons-list text-nowrap">
													<li>
														<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-more2"></i></a>
														<ul class="dropdown-menu dropdown-menu-right">
															<li><a href="#"><i class="icon-comment-discussion pull-right"></i> Start chat</a></li>
															<li><a href="#"><i class="icon-phone2 pull-right"></i> Make a call</a></li>
															<li><a href="#"><i class="icon-mail5 pull-right"></i> Send mail</a></li>
															<li class="divider"></li>
															<li><a href="#"><i class="icon-statistics pull-right"></i> Statistics</a></li>
														</ul>
													</li>
												</ul>
											</div>
										</li>

										<li class="media">
											<div class="media-left">
												<a href="#"><img src="assets/images/placeholder.jpg" class="img-sm img-circle" alt=""></a>
											</div>

											<div class="media-body media-middle text-semibold">
												Vince Satmann
												<div class="media-annotation">UX expert</div>
											</div>

											<div class="media-right media-middle">
												<ul class="icons-list text-nowrap">
													<li>
														<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-more2"></i></a>
														<ul class="dropdown-menu dropdown-menu-right">
															<li><a href="#"><i class="icon-comment-discussion pull-right"></i> Start chat</a></li>
															<li><a href="#"><i class="icon-phone2 pull-right"></i> Make a call</a></li>
															<li><a href="#"><i class="icon-mail5 pull-right"></i> Send mail</a></li>
															<li class="divider"></li>
															<li><a href="#"><i class="icon-statistics pull-right"></i> Statistics</a></li>
														</ul>
													</li>
												</ul>
											</div>
										</li>

										<li class="media">
											<div class="media-left">
												<a href="#"><img src="assets/images/placeholder.jpg" class="img-sm img-circle" alt=""></a>
											</div>

											<div class="media-body media-middle text-semibold">
												Jason Leroy
												<div class="media-annotation">SEO specialist</div>
											</div>

											<div class="media-right media-middle">
												<ul class="icons-list text-nowrap">
													<li>
														<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-more2"></i></a>
														<ul class="dropdown-menu dropdown-menu-right">
															<li><a href="#"><i class="icon-comment-discussion pull-right"></i> Start chat</a></li>
															<li><a href="#"><i class="icon-phone2 pull-right"></i> Make a call</a></li>
															<li><a href="#"><i class="icon-mail5 pull-right"></i> Send mail</a></li>
															<li class="divider"></li>
															<li><a href="#"><i class="icon-statistics pull-right"></i> Statistics</a></li>
														</ul>
													</li>
												</ul>
											</div>
										</li>
									</ul>
								</div>
							</div>
							<!-- /assigned users -->


							<!-- Latest comments -->
							<div class="panel panel-flat">
								<div class="panel-heading">
									<h6 class="panel-title"><i class="icon-bubbles3 position-left"></i> Latest comments</h6>
									<div class="heading-elements">
										<ul class="icons-list">
					                		<li><a data-action="collapse"></a></li>
					                		<li><a data-action="reload"></a></li>
					                		<li><a data-action="close"></a></li>
					                	</ul>
				                	</div>
								</div>

								<ul class="media-list media-list-linked">
									<li class="media">
										<a href="#" class="media-link">
											<div class="media-left"><img src="assets/images/placeholder.jpg" class="img-sm img-circle" alt=""></div>
											<div class="media-body">
												<div class="media-heading"><span class="text-semibold">Will Samuel</span> <span class="media-annotation pull-right">Just now</span></div>
												<span class="text-muted">And he looked over at the alarm clock, ticking..</span>
											</div>
										</a>
									</li>

									<li class="media">
										<a href="#" class="media-link">
											<div class="media-left"><img src="assets/images/placeholder.jpg" class="img-sm img-circle" alt=""></div>
											<div class="media-body">
												<div class="media-heading"><span class="text-semibold">Margo Baker</span> <span class="media-annotation pull-right">1 hour ago</span></div>
												<span class="text-muted">However hard he threw himself onto..</span>
												
											</div>
										</a>
									</li>

									<li class="media">
										<a href="#" class="media-link">
											<div class="media-left"><img src="assets/images/placeholder.jpg" class="img-sm img-circle" alt=""></div>
											<div class="media-body">
												<div class="media-heading"><span class="text-semibold">Monica Smith</span> <span class="media-annotation pull-right">2 days ago</span></div>
												<span class="text-muted">Yes, but was it possible to quietly sleep through..</span>
											</div>
										</a>
									</li>

									<li class="media">
										<a href="#" class="media-link">
											<div class="media-left"><img src="assets/images/placeholder.jpg" class="img-sm img-circle" alt=""></div>
											<div class="media-body">
												<div class="media-heading"><span class="text-semibold">Jordana Mills</span> <span class="media-annotation pull-right">Monday</span></div>
												<span class="text-muted">What should he do now? The next train went at..</span>
											</div>
										</a>
									</li>

									<li class="media">
										<a href="#" class="media-link">
											<div class="media-left"><img src="assets/images/placeholder.jpg" class="img-sm img-circle" alt=""></div>
											<div class="media-body">
												<div class="media-heading"><span class="text-semibold">John Craving</span> <span class="media-annotation pull-right">May 24</span></div>
												<span class="text-muted">Gregor then turned to look out the window..</span>
											</div>
										</a>
									</li>
								</ul>
							</div>
							<!-- /latest comments -->

						</div>
					</div>
					<!-- /detailed task -->


					<!-- Footer -->
					<div class="footer text-muted">
						&copy; 2015. <a href="#">Limitless Web App Kit</a> by <a href="http://themeforest.net/user/Kopyov" target="_blank">Eugene Kopyov</a>
					</div>
					<!-- /footer -->

				</div>
				<!-- /content area -->

			</div>
			<!-- /main content -->

		</div>
		<!-- /page content -->

	</div>
	<!-- /page container -->

</body>
</html>
