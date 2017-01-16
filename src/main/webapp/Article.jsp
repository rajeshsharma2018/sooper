 
<%@ page import="com.wiki.model.Article" %>

<%@ page import="org.apache.log4j.Logger" %>  


<% 


Logger logger = Logger.getLogger( "Article.jsp" );

logger.info("Article.jsp");

Article a = (Article)request.getAttribute("article");
long articleId = a.getId();
  

%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Hindupedia - Hindu Knowledgebase</title>

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
	<script type="text/javascript" src="assets/js/plugins/editors/summernote/summernote.min.js"></script>
	<script type="text/javascript" src="assets/js/plugins/forms/styling/uniform.min.js"></script>

	<script type="text/javascript" src="assets/js/core/app.js"></script>
	<script type="text/javascript" src="assets/js/pages/editor_summernote.js"></script>
	<!-- /theme JS files -->



<script>


$(document).ready(function(){
$("#save").click(function(){   
    var len = document.getElementsByTagName("div").length;
    for (i = 0; i < len; i++) { 
    var classValue = document.getElementsByTagName("div")[i].getAttribute("class");

    if(classValue == 'note-editable panel-body'){  
    	alert(document.getElementsByTagName("div")[i].innerHTML);   
        var innerHtml = document.getElementsByTagName("div")[i].innerHTML;

        var response =    $.ajax({  
              url:'article.action?'+'cmd=save&articleId='+<%=articleId%>+'&articleText='+encodeURIComponent(innerHtml),  
              type:'POST',
              contentType:false,
              async:false,
              dataType: 'application/json;charset=utf-8' 
     }).responseText;   
        }
    }
    
     
     
       return ;
}); 

});  
 
</script> 
</head>

<body>



	<!-- Main navbar -->
	   <%@ include file="Header.jsp"%> 
	
	<!-- /main navbar -->


	<!-- Page container -->
	<div class="page-container">

		<!-- Page content -->
		<div class="page-content">

			<!-- Main sidebar -->
			 
			<!-- /main sidebar -->


			<!-- Main content -->
			<div class="content-wrapper">

				<!-- Page header -->
				<div class="page-header page-header-default">
					<div class="page-header-content">
						<div class="page-title">
                            <h4><a href="index.action"><i class="icon-arrow-left52 position-left"></i> <span class="text-semibold">Go Back</span> - Home</h4></a>
						</div>

						 
					</div>

					<div class="breadcrumb-line">
						<ul class="breadcrumb">
							<li><a href="index.jsp"><i class="icon-home2 position-left"></i> Home</a></li>
							 
							<li class="active">Article</li>
						</ul>

						<ul class="breadcrumb-elements">
							<li><a href="#"><i class="icon-comment-discussion position-left"></i> Support</a></li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">
									<i class="icon-gear position-left"></i>
									Settings
									<span class="caret"></span>
								</a>

								<ul class="dropdown-menu dropdown-menu-right">
									<li><a href="#"><i class="icon-user-lock"></i> Account security</a></li>
									<li><a href="#"><i class="icon-statistics"></i> Analytics</a></li>
									<li><a href="#"><i class="icon-accessibility"></i> Accessibility</a></li>
									<li class="divider"></li>
									<li><a href="#"><i class="icon-gear"></i> All settings</a></li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
				<!-- /page header -->


				<!-- Content area -->
				<div class="content">

				 

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

						<div class="panel-body" id="panelID">
							<div class="form-group">
								<button type="button" id="edit" class="btn btn-primary"><i class="icon-pencil3 position-left"></i> Edit</button>
								<button type="button" id="save" class="btn btn-success"><i class="icon-checkmark3 position-left"></i> Save</button>
                            
                                <a href="index.jsp" >
                                <button type="button" id="cancel" class="btn btn-cancel"><i class="fa fa-undo" aria-hidden="true"></i> Cancel</button>
							</div>
                            </a>
							
							<div class="click2edit" id="articleTextID">
								 <%=a.getArticleText()%>
							 </div>
						</div>
					</div>
					<!-- /summernote click to edit -->
 

					<!-- Footer -->
					<%@ include file="Footer.jsp"%> 
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


 