<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
 
  <title>Tektorr</title>

  <link rel="stylesheet" href="lib/fontawesome/css/font-awesome.css"> 
  <link rel="stylesheet" href="css/quirk.css">
  <link rel="stylesheet" type="text/css" href="lib/bootstrap/css/bootstrap-select.min.css">
  <link rel="stylesheet" type="text/css" href="form_validation_css/formValidation.css">
  
  <script src="lib/jquery/jquery.js"></script>
    <script src="lib/jquery-ui/jquery-ui.js"></script>
  <script src="lib/modernizr/modernizr.js"></script>
  <script src="lib/bootstrap/js/bootstrap.js"></script>
  <script src="lib/bootstrap/js/bootstrap-select.min.js"></script>    
  <script src="form_validation_js/formValidation.popular.js"></script>
  <script src="form_validation_js/framework/bootstrap.js"></script>
       
 <script>  
 
 $(document).ready(function(){
  
      
     $('#loginFormID').formValidation({
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
              email: {
                     validators: {
                         notEmpty: {
                             message: 'The email address is required'
                         },
                         emailAddress: {
                             message: 'The input is not a valid email address'
                         }
                     }
                 },
             pwd: {
                      
                     validators: {
                         notEmpty: {
                             message: 'Please enter the password.'
                         }
                     }
                 }
              
             
            
         }
     }).on('success.form.fv', function(e) { 
    	 
    	 alert('email='+$("#emailID").val());
    	 alert('pwd='+$("#pwdID").val());
       var resp =    $.ajax({  
             url:'logon.action?'+'email='+$("#emailID").val()+'&pwd='+$("#pwdID").val(),  
             type:'POST',
             contentType:false,
             async:false,
             dataType: 'application/json;charset=utf-8'
         }).responseText; 
         
        
       if(resp.trim() == 'success'){

           $("#id_login_form").attr("action", "myDocs.action");
           $("id_login_form").submit();
                
       }else{
  			$("#passwordSignIn").effect( "shake", {times:4,distance:50,direction:'right'}, 1000 );
  		  	$("#id_div_trouble3").show();
       return false;
       }
         
     });

 }); 
 
 
 
 function myFunction(){
     return false;
 }

 
 </script>
     
</head>

<body class="signwrapper">

  <div class="sign-overlay"></div>
  <div class="signpanel"></div>

  <div class="panel signin">
    <div class="panel-heading">
      <h1>Tektorr</h1>
      <h4 class="panel-title">Sign-in</h4>
    </div>
    <div class="panel-body">
             
             
            
              
              
      <form id="loginFormID" method="post">
        <div class="form-group mb10">
          <div class="input-group">
            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
            <input id="emailID" name="email" type="text" class="form-control" placeholder="Enter Email">
          </div>
        </div>
        <div class="form-group nomargin">
          <div class="input-group">
            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
            <input id="pwdID" name="pwd" type="text" class="form-control" placeholder="Enter Password">
          </div>
        </div>
        <div><a href="" class="forgot">Forgot password?</a></div>
        <div class="form-group">
          <button type="submit" class="btn btn-success btn-quirk btn-block">Sign In</button>
        </div>
      </form>
      <hr class="invisible">
      <div class="form-group">
        <a href="SignUp.jsp" class="btn btn-default btn-quirk btn-stroke btn-stroke-thin btn-block btn-sign">Not a member? Sign up now!</a>
      </div>
    </div>
  </div><!-- panel -->

</body>
</html>
