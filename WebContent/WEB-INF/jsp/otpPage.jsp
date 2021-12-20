<%@taglib uri="/struts-tags" prefix="s"%>
<%@page import="com.ceva.base.common.utils.CevaCommonConstants"%>
<%String ctxstr = request.getContextPath(); %>
<% String appName= session.getAttribute(CevaCommonConstants.ACCESS_APPL_NAME).toString(); %>
 <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%=application.getInitParameter("pageTitle") %></title>
<meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Another one from the CodeVinci">
<meta name="author" content="Team">
 <%@ include file="css.jsp" %> 
<link href="${pageContext.request.contextPath}/css/loginstyle.css" rel="stylesheet" media="screen" />
<link href="${pageContext.request.contextPath}/css/style_ceva.css" rel="stylesheet" type='text/css' />

<script type="text/javascript" src="${pageContext.request.contextPath}/js/pbkdf2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/aes.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/rightclick_script.js"></script>


<style type="text/css">
.login__submit {
    position: relative;
    width: 100%;
    height: 4rem!important;
    margin: 2rem 0 1.2rem!important;
    color: rgba(255, 255, 255, 0.8);
    background: #00AEEF;
    font-size: 1.5rem;
    border-radius: 3rem;
    cursor: pointer;
    overflow: hidden;
    font-weight: bold;
    -webkit-transition: width 0.3s 0.15s, font-size 0.1s 0.15s;
    transition: width 0.3s 0.15s, font-size 0.1s 0.15s;
}
	.errorMessage {
	font-weight: bold;
	color: white;
	padding: 2px 8px;
	margin-top: 2px;
}

.errors {
	background-color: #FFCCCC;
	border: 0px solid #CC0000;
	width: 400px;
	margin-bottom: 8px;
}

.error {
	background-color: #FFCCCC;
	border: 0px solid #CC0000;
	width: 400px;
	margin-bottom: 8px;
}

.errors li {
	list-style: none;
}

body {
	padding-bottom: 40px;
}

.sidebar-nav {
	padding: 9px 0;
}

.full-spn-right {
	margin-left: 1200px;
}

</style>


<script src="<%= ctxstr %>/js/jquery-1.7.2.min.js"></script>    
<script language="javascript" type="text/javascript">
	<%-- $(document).ready(function () {
		$("#form1")[0].action = "<%=ctxstr %>/banking/redirectlogin.action";
		$("#form1").submit();
	}); --%>
	
	$(document).ready(function () {
		

		
		function submit(){
			

				if(true){
					 var otpval=$("#otpval").val();
					 $("#form1")[0].action = "<%=ctxstr %>/banking/otpValidate.action";
					<%-- $("#form1")[0].action='<%=request.getContextPath()%>/banking/otpValidate.action'; --%>
					$("#form1").submit();
					return true;
				
			} else {
					return false;
				}

			}
		
	$('#otp').on('click', function() {
			
			
			if($('#votp').val()==""){
				$('#errormsg').text("Please Enter OTP ")
				return false;
			}
			submit();
		});		
	
	
	});
	
</script> 
</head>

<body>

<form name="form1" id="form1" method="post" action="">
	<!-- hiding save passwords -->
	<input type="password" style="display:none"/>
		
	
	
		 <div class="demo" >
    <div class="login">
     <div style="
     padding: 30px 40px;
		  text-align:center;
     font-size: 20px;
		  color:#FFFFFF;
		  font-weight:bold;
		  /* background: url(images/pattern-ttl111.png); */
     "><!-- Mobile Banking --></div>
     <div style="padding: 1px 1px;transition: opacity 0.1s, -webkit-transform 0.3s cubic-bezier(0.17, -0.65, 0.665, 1.25);"></div>
     <div style="background-color:#00AEEF;">
				<section class="display:table-cell">
					<img src="images/logo-main.png" width="200" height="80" style="padding-left:20px;margin-right: -100px; text-align: right; margin-bottom: 30px; margin-left: -6px;"
						alt="logo">
				</section>
			
				</div> 
				
				
				<span style="
			
		  margin-top:100px;
		  padding: 10px 20px;
		  text-align:center;
		  border: none;
		  border-radius: 10px;
		  color: rgba(0, 0, 0, 0.7);
		  position: relative;
		  font-size: 2rem;
		  font-weight:bold;"><s:actionmessage cssClass="" cssErrorClass="" />
				<s:actionerror />
				<div id="errormsg" style="color:white;" ></div>
				</span>
				
				
      <div class="login__form" >
        <div class="login__row">
          <svg class="login__icon name svg-icon" viewBox="0 0 20 20">
            <path d="M0,20 a10,8 0 0,1 20,0z M10,0 a4,4 0 0,1 0,8 a4,4 0 0,1 0,-8" />
          </svg>
          <input type="text" class="login__input name" maxlength="5" id="votp" name="votp" placeholder="Enter OTP ">
 
        </div>
 
    
       
        <p class="submit">
        <input type="button" class="login__submit"    name="otp" id="otp" value="Verify OTP">
        </p>
            <div >
			<a href="#" target="_blank" style="color: #00AEEF;font-size: 1.5rem;margin-right: -195px; text-align: right; margin-bottom: 10px;">Resend</a>
		</div >
        <div >
			<a href="http://www.cevaltd.com/" target="_blank"><img width="80" height="40" alt="logo" style="margin-right: -195px; text-align: right; margin-bottom: 10px;margin-top: 20px;" src="images/logo_ceva.png"></img></a>
		</div >
      </div>
       
    </div>
  
   </div>

		<script src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
	</form>


</body>
</html>