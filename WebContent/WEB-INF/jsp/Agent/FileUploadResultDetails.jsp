<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>MicroInsurance</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Another one from the CodeVinci">
<meta name="author" content="">
<%@page import="com.ceva.base.common.utils.CevaCommonConstants"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
	String ctxstr = request.getContextPath();
	String appName = session.getAttribute(
			CevaCommonConstants.ACCESS_APPL_NAME).toString();
%>
<script language="Javascript" src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
<script language="Javascript" src="${pageContext.request.contextPath}/js/authenticate.js"></script>
<script language="javascript" src="${pageContext.request.contextPath}/js/sha256.js" ></script>
<link href="${pageContext.request.contextPath}/css/body.css" rel="stylesheet" type="text/css">

<link href="${pageContext.request.contextPath}/css/link/css1" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/link/screen.css">
<link href="${pageContext.request.contextPath}/css/link/sticky.css" rel="stylesheet" type="text/css">

<script type="text/javascript">




function funcall(v){
	
	$("#application").val(v);
	var url="${pageContext.request.contextPath}/<%=appName %>/fileuploadapprovaldetailsresult.action"; 
	$("#form1")[0].action=url;
	$("#form1").submit();
	return true;
}

</script>
<s:set value="responseJSON" var="respData" />

</head>
<body>
<form name="form1" id="form1" method="post" >
	<div id="content" class="span10">
			<!-- content starts -->
			<div>
				<ul class="breadcrumb">
					<li><a href="home.action">Home</a> <span class="divider"> &gt;&gt; </span></li>
					<li><a href="#">Wallet Transaction Reversal Request Approval</a></li>
					
				</ul>
			</div>
			 <div id="errormsg" class="errores"></div>
			 <div  class="screenexit"></div>
			 
			
			 
			<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<!-- Customer Negotiated Rate Confirmation -->
						Search Details
						 <div class="box-icon"> 
						<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a> 
						<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a> 
					  </div>
					</div>
					
				 
					<div class="box-content" id="secondaryDetails">
						<fieldset>
						
							
							<table width="950"  border="0" cellpadding="5" cellspacing="1" 
								class="table table-striped table-bordered bootstrap-datatable" id="check-kra-details" >
								
								<tr class="odd" id="mobileselect" >
								<td ><strong>Request Type</strong></td>
									<td ><strong>Approved</strong></td>
 									<td><strong>Rejected</strong></td>
									
							</tr>
							
							<tr class="odd" id="searchenter" >
									<td >Pre Enrolment </td>
									<td ><div class='label label-success' onclick=funcall("FUNDING_COMPLETED") style="cursor: pointer;">${responseJSON.VIEW_LMT_DATA.FUNDING_COMPLETED}</div></td>
									<td><div class='label label-important' onclick=funcall("FUNDING_REJECTED") style="cursor: pointer;">${responseJSON.VIEW_LMT_DATA.FUNDING_REJECTED}</div></td>
									
								</tr>
							
							
								
							</table>
							
						</fieldset>
						
					</div>
					
				</div>
			</div>
			
			<input name="application" type="hidden" id="application"     />
			
			<div class="form-actions" align="left"> 
				<input type="button" id="non-printable" class="btn btn-info" onclick="redirectAct();" value="Cancel" />
				 
			</div>  

	
			
			</div>
			

</form>

	
</body>
</html>
