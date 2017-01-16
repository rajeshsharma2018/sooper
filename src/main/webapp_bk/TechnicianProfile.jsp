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
  <link rel="stylesheet" href="lib/select2/select2.css">

  <link rel="stylesheet" href="css/quirk.css">

  <script src="lib/modernizr/modernizr.js"></script>

   
<script src="lib/jquery/jquery.js"></script>
    
       <script src="lib/jquery-ui/jquery-ui.js"></script>
<script src="lib/bootstrap/js/bootstrap.js"></script>
<script src="lib/jquery-toggles/toggles.js"></script>
<script src="lib/select2/select2.js"></script>
<script src="lib/jquery-validate/jquery.validate.js"></script>


<script src="form_validation_js/formValidation.popular.js"></script>
<script src="form_validation_js/framework/bootstrap.js"></script>
<script src="js/quirk.js"></script>
<script>
$(document).ready(function(){

  'use strict';
  
  $("#divLPProfile").hide();  
 

  $('#techProfileFormID').formValidation({
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
    	  
    	  fName: {
              
              validators: {
                   notEmpty: {
                      message: 'Please enter your First Name.'
                  }
              }
          },
	 	 lName: {
              
              validators: {
                  notEmpty: {
                      message: 'Please enter your Last Name.'
                  }
              }
          },
          
           emailName: {
                  validators: {
                      email: true,
                      notEmpty: {
                          message: 'The Email address is required'
                      },
                      emailAddress: {
                          message: 'The input is not a valid email address'
                      }
                  }
              },
              phoneName: {
                  validators: {
                     
                      notEmpty: {
                          message: 'The Phone Number is required'
                      } 
                  }
              },
             titleName: {
                  validators: {
                      notEmpty: {
                          message: 'The Title is required'
                      } 
                  }
              },
              lnkdProfileName: {
               
                  validators: {
                      url : true,
                      notEmpty: {
                          message: 'The LinkedIn Profile url is required'
                      } 
                  }
              },
              rateName: {
                  validators: {
                      number:true,
                      notEmpty: {
                          message: 'Please enter your Rate'
                      } 
                  }
              }
          
         
      }
  }).on('success.form.fv', function(e) {  
	  
	  alert('certifications = '+ $("#certID").val());
	 
	   
     
    var resp =    $.ajax({  
          url:'technician.action?fName='+$("#fNameID").val()+'&email='+$("#emailID").val()+
          '&phoneNum='+$("#phoneID").val()+'&title='+$("#titleID").val()+
          '&lName='+$("#lNameID").val()+'&linkedInProfile='+$("#lnkdProfileID").val()+
          '&country='+$("#countryID").val()+'&aboutMe='+$("#aboutMeID").val()+'&english='+$("#englishID").val() +
          '&tktrRate='+$("#tktrRateID").val()+'&rate='+$("#rateID").val(),
          
          type:'POST',
        
          
          contentType:false,
          async:false,
          dataType: 'application/json;charset=utf-8'
      }).responseText; 
      
     
    if(resp.trim() == 'success'){
		alert('comes in success');
		
        $("#id_login_form").attr("action", "myDocs.action");
        $("id_login_form").submit();
             
    }else{
			$("#passwordSignIn").effect( "shake", {times:4,distance:50,direction:'right'}, 1000 );
		  	$("#id_div_trouble3").show();
    return false;
    }
      
  });

}); 

  
  
</script> 
</head>

<body>  
    <%@ include file="Header.jsp"%> 

    <section> 
        <%@ include file="LeftPanel.jsp"%>

  <div class="mainpanel">

    <div class="contentpanel">

     
      <div class="row">

        <div class="col-md-6">
          <div class="panel">
              <div class="panel-heading nopaddingbottom">
                <h4 class="panel-title">Update Your Profile</h4>
                <p>Please provide your profile information below.</p>
              </div>
              <div class="panel-body">
                <hr>
                <form id="techProfileFormID"   class="form-horizontal">
            	 <div class="form-group">
                    <label class="col-sm-3 control-label"> Upload Picture <span class="text-danger"></span></label>
                    <div class="col-sm-8">
      <button id="techPicID" class="btn btn-danger btn-quirk btn-block mb20">Upload Your Photo</button>
                     </div>
                  </div>
           
           
           
                  <div class="form-group">
                    <label class="col-sm-3 control-label">First Name <span class="text-danger">*</span></label>
                    <div class="col-sm-8">
                      <input type="text" id="fNameID" name="fName" class="form-control" placeholder="Type your First Name..." required />
                    </div>
                  </div>
                    <div class="form-group">
                    <label class="col-sm-3 control-label">Last Name <span class="text-danger">*</span></label>
                    <div class="col-sm-8">
                      <input type="text" name="lName" id="lNameID" class="form-control" placeholder="Type your Last Name..." required />
                    </div>
                  </div>
                    

                  <div class="form-group">
                    <label class="col-sm-3 control-label">Email <span class="text-danger">*</span></label>
                    <div class="col-sm-8">
                      <input type="email" id="emailID" name="emailName" class="form-control" placeholder="Type your Email..." required />
                    </div>
                  </div>
                    
                     
                  <div class="form-group">
                    <label class="col-sm-3 control-label">Phone <span class="text-danger">*</span></label>
                    <div class="col-sm-8">
                      <input type="phone" id="phoneID" name="phoneName" class="form-control" placeholder="Type your Phone..." required />
                    </div>
                  </div>
                    
                        
                    <div class="form-group">
                         <label class="col-sm-3 control-label">Your Title<span class="text-danger">*</span>
                        </label>
                    <div class="col-sm-8">
                      <input type="text" id="titleID" name="titleName" class="form-control"  placeholder="EXAMPLE: Tech Engineer With 5+ years Experience" required/>
                    </div>
                  </div>
                    
                    
                    
                  <div class="form-group">
                    <label class="col-sm-3 control-label">LinkedIn Profile</label>
                    <div class="col-sm-8">
                      <input type="text" id="lnkdProfileID" name="lnkdProfileName" class="form-control" />
                    </div>
                  </div>

                 <div class="form-group">
                    <label class="col-sm-3 control-label nopaddingtop">Certifications <span class="text-danger">*</span></label>
                    <div class="col-sm-9">
                      <label class="ckbox">
                        <input id="certID" type="checkbox" name="certName[]" required>
                        <span>Apple Certified Technical Coordinator (ACTC)</span>
                      </label>
                      <label class="ckbox">
                        <input type="checkbox" name="certName[]">
                        <span>ACSP: Apple Certified Support Professional</span>
                      </label>
                      <label class="ckbox">
                        <input type="checkbox" name="certName[]">
                        <span>Microsoft Certified IT Professional (MCITP) </span>
                      </label>
                        <label class="ckbox">
                        <input type="checkbox" name="certName[]">
                        <span>Microsoft Certified Professional (MCP) </span>
                      </label>
                      
                      <label class="ckbox">
                        <input type="checkbox" name="certName[] ">
                        <span>None</span>
                      </label>
                        
                        
                      <label class="error" for="int[]"></label>
                    </div>
                  </div><!-- form-group -->

                    <div class="form-group">
                    <label class="col-sm-3 control-label">Country <span class="text-danger">*</span></label>
                    <div class="col-sm-2">
                      <select id="countryID" name="countryName" class="select2" name="fruits" style="width: 100%" data-placeholder="Choose One" required>
                        <option value="">&nbsp;</option>
                        <option value="us">US</option>
                        <option value="uk">UK</option>
                        <option value="sg">Singapore</option>
                        <option value="au">Australia</option>
                      </select>
                      <label class="error" for="country"></label>
                    </div>
                  </div><!-- form-group -->

                    
                        <div class="form-group">
                    <label class="col-sm-3 control-label">Brief Professional Overview<span class="text-danger">*</span></label>
                    <div class="col-sm-8">
                      <textarea rows="5" id="aboutMeID" name="aboutMeName" class="form-control" placeholder="Type your comment..." required></textarea>
                    </div>
                  </div>
                    
                      <div class="form-group">
                    <label class="col-sm-3 control-label">English Proficiency <span class="text-danger">*</span></label>
                    <div class="col-sm-2">
                      <select id="englishID" name="englishName" class="select2" name="english" style="width: 100%" data-placeholder="Choose One" required>
                        <option value="">&nbsp;</option>
                        <option value="basic">Basic</option>
                        <option value="conversational">Conversational</option>
                        <option value="fluent">Fluent</option>
                        <option value="native">Native</option>
                          
                      </select>
                      <label class="error" for="english"></label>
                    </div>
                  </div><!-- form-group -->
<br><br><br><br>

                  <hr> 
                    <br><br><br><br>
                    
                     <div class="form-group">
                         <label class="col-sm-3 control-label">Your Hourly Rate<span class="text-danger">*</span>
                          <h6>This is what user sees</h6></label>
                    <div class="col-sm-8">
                      <input type="text" id="rateID" name="rateName" class="form-control" placeholder="Your Rate in US Dollars" required />
                    </div>
                  </div>
                    
                    <div class="form-group">
                         <label class="col-sm-3 control-label">20% Tektorr Service Fee<span class="text-danger">*</span>
                          <h6>Tektorr Commission</h6></label>
                    <div class="col-sm-8">
                      <input type="text" id="tktrRateID" name="tktrRateName" class="form-control" placeholder="Tektorr Commission in US Dollars"   />
                    </div>
                  </div>
                    
                    
                    <div class="form-group">
                         <label class="col-sm-3 control-label">You Will Receive 
                        </label>
                    <div class="col-sm-8">
                      <input type="text" id="yourRateID" name="yourRateName" class="form-control"  disabled="true" />
                    </div>
                  </div>
                    
                    
                    
                    
                  <hr>

                  <div class="row">
                    <div class="col-sm-9 col-sm-offset-3">
                      <button class="btn btn-success btn-quirk btn-wide mr5">Submit</button>
                      <button type="reset" class="btn btn-quirk btn-wide btn-default">Reset</button>
                    </div>
                  </div>

                </form>
              </div><!-- panel-body -->
          </div><!-- panel -->

        </div><!-- col-md-6 -->

      
      </div><!--row -->

      <div class="row">

     
        
      </div><!-- row-->

    </div><!-- contentpanel -->

  </div><!-- mainpanel -->
</section>
 
 
 </body>
</html>
