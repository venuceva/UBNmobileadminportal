
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>NBK</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Another one from the CodeVinci">
<meta name="author" content="">
<%@page import="com.ceva.base.common.utils.CevaCommonConstants"%>
<%String ctxstr = request.getContextPath(); %>
<% String appName= session.getAttribute(CevaCommonConstants.ACCESS_APPL_NAME).toString(); %> 
 
 

<script type="text/javascript" >
	 
$(document).ready(function(){ 
	 
	$('#btn-submit').live('click',function() {  
		  
		$("#form1")[0].action="<%=request.getContextPath()%>/<%=appName %>/limitAuthManagentAct.action";
		$("#form1").submit();				
	});
	 
}); 
 
</script>
	 
	 
</head>

<body>
	<form name="form1" id="form1" method="post" action="">
	
	<div id="content" class="span10"> 
			    <div>
					<ul class="breadcrumb">
					 <li><a href="#">Home</a> <span class="divider"> &gt;&gt; </span></li>
							<li><a href="#">Float Management</a> <span class="divider"> &gt;&gt; </span></li>
							<li><a href="#">Limit Management</a> <span class="divider"> &gt;&gt; </span></li>
							<li><a href="#">Authorization</a></li>
					</ul>
				</div>
			 
		<div class="row-fluid sortable">

			<div class="box span12">

				<div class="box-header well" data-original-title>
						<i class="icon-edit"></i>Terminal Limit Authorization Acknowledge
					<div class="box-icon">
						<a href="#" class="btn btn-setting btn-round"><i
							class="icon-cog"></i></a> <a href="#"
							class="btn btn-minimize btn-round"><i
							class="icon-chevron-up"></i></a>

					</div>
				</div>
						
				<div class="box-content">
				 <fieldset> 
						<table width="950" border="0" cellpadding="5" cellspacing="1" 
									class="table table-striped table-bordered bootstrap-datatable "> 
								 <tr>
									<td></td>
									<td >Limit Amount of kshs ${responseJSON.terminalLimit} /= successfully  ${responseJSON.approveReject} to Terminal ${responseJSON.terminalID} .</td>
									<td ></td>	
								</tr>
						</table>  
				</fieldset>  
				</div>
			</div>
		</div>  
              					 
		 <div class="form-actions">
				<input type="button" name="btn-submit" class="btn btn-primary" id="btn-submit" value="Next" /> 
		 </div>  
	</div><!--/#content.span10-->
		 
</form> 
</body>
</html>
