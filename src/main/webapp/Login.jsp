

<%@ page import="org.apache.log4j.Logger" %>  

<%

%>


<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Hindupedia</title>

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


    <script type="text/javascript" src="assets/js/core/app.js"></script>
 	
    <link rel="stylesheet" type="text/css" href="form_validation_css/formValidation.css">
    <script src="form_validation_js/formValidation.popular.js"></script>
     <script src='form_validation_js/framework/bootstrap.min.js' type='text/javascript'></script> 
  
	
	<script>
	
	  $(document).ready(function(){ 
		     $('#loginID').formValidation({
	           
	            framework: 'bootstrap',
	            err: {
	                container: 'tooltip'
	            },
	         
	            icon: {
	                valid: 'checkmark icon',
	                invalid: 'remove icon',
	                validating: 'refresh icon'
	            },
	        
	            fields: {
	            uname: {
	                
	                validators: {
	                    notEmpty: {
	                        message: 'Username is required'
	                    } 
	                }
	            },
	            pwd: {
	               
	                validators: {
	                    notEmpty: {
	                        message: 'The Password is required'
	                    } 
	                }
	            } 
	                
	            }
	            }).on('success.form.fv', function(e) {
	         
	        
	            $.ajax({ 
	                 url:'login.action?'+'uname='+$("#unameID").val()+'&pwd='+$("#pwdID").val()+'&cmd=login',  
	                type:'POST',
	                contentType:false,
	                
	                dataType: 'application/json;charset=utf-8'
	                
	            });  
	            
	            return false;
	            
	      
	             });
	                
	                
	              
	                
	                
	  });  
	
	</script>

</head>

<body class="login-container">

	  <%@ include file="Header.jsp"%> 
	


	<!-- Page container -->
	<div class="page-container">

		<!-- Page content -->
		<div class="page-content">

			<!-- Main content -->
			<div class="content-wrapper">

				<!-- Content area -->
				<div class="content">

					<!-- Simple login form -->
					<form   id="loginID">
						<div class="panel panel-body login-form">
							<div class="text-center">
								<div class="icon-object border-slate-300 text-slate-300"><i class="icon-reading"></i></div>
								<h5 class="content-group">Login to your account <small class="display-block">Enter your credentials below</small></h5>
							</div>

							<div class="form-group has-feedback has-feedback-left">
								<input type="text" name="uname" id="unameID" class="form-control" placeholder="Email">
								<div class="form-control-feedback">
									<i class="icon-user text-muted"></i>
								</div>
							</div>

							<div class="form-group has-feedback has-feedback-left">
								<input type="password" name="pwd" id="pwdID" class="form-control" placeholder="Password">
								<div class="form-control-feedback">
									<i class="icon-lock2 text-muted"></i>
								</div>
                            </div>

							<div class="form-group">
								<button type="submit" class="btn btn-primary btn-block">Sign in <i class="icon-circle-right2 position-right"></i></button>
							</div>

							<div class="text-center">
								<a href="#">Forgot password?</a>
							</div>
						</div>
					</form>
					<!-- /simple login form -->


					<!-- Footer -->
					<div class="footer text-muted text-center">
						&copy; 2016. <a href="#">Hindupedia</a>   
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
