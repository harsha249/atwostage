<%-- 
    Document   : adminlogin
    Created on : Feb 15, 2015, 7:28:23 PM
    Author     : Lucky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="true" name="mssmarttagspreventparsing" />
	<meta http-equiv="imagetoolbar" content="no" />
	<title>s h a r e &nbsp;y o u  r &nbsp; I d e a s &nbsp; &amp; &nbsp; T h o u g h t s</title>
	<link href="css/style-ind.css" rel="stylesheet" type="text/css" />
	<!-- IE fixes -->
	<!--[if lte IE 6]>
	<style type="text/css">
		#ccnt {_height:1200px;}
		.post {padding:0 0 25px;}
	</style>
	<![endif]-->
	<script type="text/javascript">
	/*
	 * Simple JS function for setting the search value
	 */
	function clS(t){
		var srch = document.getElementById('s'), val = srch.value.toString().toLowerCase(), re = /^\s+$/;
		if(t) {
			if(val == 'search...' || val == 'search'){ 
				srch.value = '';
			}
		} else {
			if(val == 'search...' || val == 'search' || val == '' || re.test(val)) {
				srch.value = 'search...';
			}
		}
	}
	</script>
    
<script type="text/javascript">

	 function loginvalidate()
{
	    var u =document.login_form.uname1.value;
		if(u=="" )
  		{
   		  alert( "Please provide your User Name!" );
    		 document.login_form.uname1.focus();
    	     return false;
   }
   	
	    var f =document.login_form.pass1.value;
		if(f=="" )
  		{
   		  alert( "Please provide your User Name!" );
    		 document.login_form.pass1.focus();
    	     return false;
   }

}


  function validate()
{
	
	   if( document.myform.uname.value == "" )
   {
     alert( "Please provide your User Name!" );
     document.myform.uname.focus() ;
     return false;
   }
   	
 var f = document.myform.pass.value;
	if(f=="")
	{
		alert("Enter The Password");
		document.myform.pass.focus();
		return false;
	}
var g = document.myform.repass.value;
	if(f!=g)
	{
		alert("Enter The Same Content In Both Password Fields");
		document.myform.repass.focus();
		return false;
	}
	if(f.length<6)
		{
			alert("Enter The Password Morethan 6 digits");
			document.myform.pass.focus();
			return false;
		} 
	
	   if( document.myform.fname.value == "" )
   {
     alert( "Please provide your Name!" );
     document.myform.fname.focus() ;
     return false;
   }
   
	if ( ( myform.sex[0].checked == false ) && ( myform.sex[1].checked == false ) && ( myform.sex[2].checked == false )) 
	{
	alert ( "Please choose your Gender!" ); 
     document.myform.sex[0].focus() ;
     document.myform.sex[2].focus() ;
     document.myform.sex[1].focus() ;
	return false;
	}
	
 

	var dd=document.myform.dd.value;
   if(dd.length=="")
   {
     alert( "Please provide your Birth Date!" );
     document.myform.dd.focus() ;
	return false;
	}
    if(isNaN(dd))
   {
     alert( "Please provide Numeric value!" );
     document.myform.dd.focus() ;
	return false;
	}
	    if((dd<0)||(dd>31))
   {
     alert( "Please provide valid Date!" );
     document.myform.dd.focus() ;
	return false;
	}

	
	var mm=document.myform.mm.value;
   if(mm.length=="")
   {
     alert( "Please provide Month!" );
     document.myform.mm.focus() ;
	return false;
	}
    if(isNaN(mm))
   {
     alert( "Please provide Numeric value!" );
     document.myform.mm.focus() ;
	return false;
	}

    if((mm<0)||(mm>12))
   {
     alert( "Please provide valid Month!" );
     document.myform.mm.focus() ;
	return false;
	}



	var yy=document.myform.yyyy.value;
   if(yy.length=="")
   {
     alert( "Please provide Year!" );
     document.myform.yyyy.focus() ;
	return false;
	}
    if(isNaN(yy))
   {
     alert( "Please provide Numeric value!" );
     document.myform.yyyy.focus() ;
	return false;
	}

    if((yy<1940)||(yy>2011))
   {
     alert( "Please provide valid Year!" );
     document.myform.yyyy.focus() ;
	return false;
	}
	
	var x=document.forms["myform"]["email"].value;
	var atpos=x.indexOf("@");
	var dotpos=x.lastIndexOf(".");
	if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length)
  	{
  	alert("Please provide a valid email id");
  	document.myform.email.focus();
  	return false;
 	 }
   
   
   
   


   }
</script>
    <style>
    label { 
    float: left; 
    display: block; 
    width: 11em; 
}

.datefield { 
    display: inline; 
    padding: 0.3em; 
	margin-left:20px;
    background: #FFF; 
    border-radius: 4px;
    color: #666;
}

.datefield * { 
    display: inline-block;
}

.datefield input { 
    width: 20px;
	height:40px; 
    padding: 0 0.4em; 
    border: none; 
    font-size: 100%; 
    background: none;
    color: #000;            
}

.datefield input#year { width:2.5em; }
.datefield input:focus { outline:none; }

    </style>
    

</head>

<body >

<div class="main">

<!-- Header -->
  <div id="hdr" style="margin:0 auto;"> 
    <div id="logo"> <a href="#"></a> </div>
    <!-- Slogan -->
   
    <div style="margin-top:-130px;padding-right:30px;width:500px;float:right;"> 
      <form id="login_form" action="adminloginchk.jsp" method="post" name="login_form" onsubmit="loginvalidate()">
        <table cellspacing="0">
          <tr> 
            <td class="html7magic"><label for="uname1" style="color:#FF00dd;font-size:16px">User 
              name</label></td>
            <td class="html7magic"><label for="pass1" style="color:#FF00dd;font-size:16px">Password</label></td>
          </tr>
          <tr>
            <td><input type="text" class="inputtext" name="uname1" id="uname1" tabindex="1" /></td>
            <td><input type="password" class="inputtext" name="pass1" id="pass1" tabindex="2" /></td>
            <td> <label class="uiButton uiButtonConfirm" id="loginbutton" for="u_0_b"> 
              <input value="Log In"tabindex="4" type="submit" id="u_0_b" style="height:26px;"  />
              </label> </td>
          </tr>
          <tr> 
            <td class="login_form_label_field"><div>
                <div class="uiInputLabel clearfix"> 
                  <label for="persist_box" style="font-size:14px;margin-right:-30px;"></label>
                </div>
                <input type="hidden" name="default_persistent" value="0" />
              </div></td>
            <td class="login_form_label_field"></td>
          </tr>
        </table>
      </form>
    </div>
  </div>
<!--    <marquee behavior="scroll" direction="left" scrollamount="4" style="font-size:22px;color:#0FF;margin-top:-10px;" >www.chennaisunday.com</marquee>
-->


	  
      <p style="font-size:24px;font-family:Tahoma, Geneva,sans-serif;line-height:1em;text-align:justify;margin-right:300px;float:right;color:#CF6">
            <u><a href="index.html">Back</a></u></p>          
             
            
            
                 

</div>



	

</div>
</body>
</html>


  