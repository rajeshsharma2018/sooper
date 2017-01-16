<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
  <!--<link rel="shortcut icon" href="images/favicon.png" type="image/png">-->

  <title>Tektorr</title>

  <link rel="stylesheet" href="lib/fontawesome/css/font-awesome.css">
  <link rel="stylesheet" href="lib/select2/select2.css">
  <link rel="stylesheet" href="css/quirk.css">
  <link rel="stylesheet" type="text/css" href="lib/bootstrap/css/bootstrap-select.min.css">
  <link rel="stylesheet" type="text/css" href="form_validation_css/formValidation.css">
 
  <script src="lib/jquery/jquery.js"></script>
  <script src="lib/modernizr/modernizr.js"></script>
  <script src="lib/bootstrap/js/bootstrap.js"></script>
  <script src="lib/bootstrap/js/bootstrap-select.min.js"></script>    
  <script src="form_validation_js/formValidation.popular.js"></script>
  <script src="form_validation_js/framework/bootstrap.js"></script>
  
     <script src="lib/html5shiv/html5shiv.js"></script>
  <script src="lib/respond/respond.src.js"></script>
  <script src="lib/select2/select2.js"></script>
    
   
 <script>  
 
 $(document).ready(function(){
   
	    
	    $('#signupID').formValidation({
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
	                },
	                  pwd_verify: {
	                      validators: {
	                          identical: {
	                                field: 'pwd',
	                                message: 'The passwords do not match'
	                            }
	                      }
	                  },
	                  
	                  fName: {
	                     
	                    validators: {
	                        notEmpty: {
	                            message: 'Please enter the First Name.'
	                        }
	                    }
	                },
	                termsAndConditions: { 
	                 
	                        required: true
	                            
	                         
	                    }
	                ,
	                phoneNum: { 
	                    validators: {
	                        notEmpty: {
	                            message: 'Please enter Phone Number.'
	                        }
	                    }
	                },
	                  lName: { 
	                    validators: {
	                        notEmpty: {
	                            message: 'Please enter the Last Name.'
	                        }
	                    }
	                }
	        }
	    }).on('success.form.fv', function(e) {
	         
	          var resp =  $.ajax({  
	            url:'signup.action?'+'email='+$("#emailID").val()+'&pwd='+$("#pwdID").val()+'&fName='+$("#fNameID").val()+'&lName='+$("#lNameID").val() 
	            +'&phoneNum='+$("#phoneNumID").val() +'&isTechnician='+$("#technicianID").val(),  
	            type:'POST',
	            contentType:false, 
	            async:false,
	            dataType: 'application/json;charset=utf-8'
	         
	   }).responseText; 
	     
	    	    
	    	      if(resp.trim() == 'success'){
	    	    	  

	    	          $("#signupID").attr("action", "Technician.action");
	    	          $("signupID").submit();
	    	               
	    	      }else if(resp.trim() == 'existing'){ 
	    	    	 	$("#emailSU").effect( "shake", {times:4,distance:50,direction:'right'}, 1000 );
	   	    	      return false;
	    	      }else{
	    	    	    $("#email").effect( "shake", {times:4,distance:50,direction:'right'}, 1000 );
	  	 		  
	  	 		    return false;
	    	      }
	    	      
	    	      
	   }); 
 
	      
 }); 
      
 

 
 </script>
</head>

<body class="signwrapper">

  <div class="sign-overlay"></div>
  <div class="signpanel"></div>

  <div class="signup">
    <div class="row">
      <div class="col-sm-5">
        <div class="panel">
          <div class="panel-heading">
            <h1>Tektorr</h1>
            <h4 class="panel-title">Create an Account!</h4>
          </div>
          <div class="panel-body">
            
            <form id="signupID" method="post">
            
             <div class="form-group mb15">
                <input id="fNameID" name="fName"  type="text" class="form-control" placeholder="Enter Your First Name">
              </div>
              <div class="form-group mb15">
                <input id="lNameID" name="lName" type="text" class="form-control" placeholder="Enter Your Last Name">
              </div>
              
              <div class="form-group mb15">
                <input id="emailID" name="email" type="text" class="form-control" placeholder="Enter Your Email">
              </div>
              
              <div class="form-group mb15">
                <input id="phoneNumID" name="phoneNum" type="text" class="form-control" placeholder="Enter Your Phone Number">
              </div>
              
              
              <div class="form-group mb15">
                <input id="pwdID" name="pwd" type="text" class="form-control" placeholder="Enter Your Password">
              </div>
               <div class="form-group mb15">
                <input name="pwd_verify" type="text" class="form-control" placeholder="Re-Enter Your Password">
              </div>
              
              
                <div class="form-group mb20">
                <label class="ckbox">
                  <input id="termsID" name="termsAndConditions" type="checkbox" name="checkbox">
                  <span>Accept terms and conditions</span>
                </label>
              </div>
                
                <div class="form-group mb20">
                <label class="ckbox">
                  <input id="technicianID" name="technician" type="checkbox" name="checkbox">
                  <span>I am a Technician</span>
                </label>
              </div>
 

              
              <div class="form-group">
                <button type="submit" class="btn btn-success btn-quirk btn-block">Create Account</button>
              </div>
            </form>
          </div><!-- panel-body -->
        </div><!-- panel -->
      </div><!-- col-sm-5 -->
      <div class="col-sm-7">
        <div class="sign-sidebar">
          <h3 class="signtitle mb20">Reasons to use Tektorr For Tech Support</h3>
          <p>Instant Tech Support.</p>
          <p>Market Place for qualified-certified Tech Support Experts.</p>

          <br>

          <h4 class="reason">1. Instant & 24/7</h4>
          <p>When your website or app is attractive to use, your users will not simply be using it, they’ll look forward to using it. This means that you should fashion the look and feel of your interface for your users.</p>

          <br>

          <h4 class="reason">2. Lowest Rates</h4>
          <p> World's largest Market place of Apple and Microsoft Technicians. Since the Technicians work for themselves the rates are lowest.</p>

          <hr class="invisible">

          <div class="form-group">
            <a href="SignIn.jsp" class="btn btn-default btn-quirk btn-stroke btn-stroke-thin btn-block btn-sign">Already a member? Sign In Now!</a>
          </div>
        </div><!-- sign-sidebar -->
      </div>
    </div>
  </div><!-- signup -->


 
<script>
$(function() {

  // Select2 Box
  $("select.form-control").select2({ minimumResultsForSearch: Infinity });

});
</script>

</body>
</html>
