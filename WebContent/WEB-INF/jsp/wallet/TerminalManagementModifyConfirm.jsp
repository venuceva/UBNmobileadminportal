<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"> 
<%@taglib uri="/struts-tags" prefix="s"%>  
<%@page import="com.ceva.base.common.utils.CevaCommonConstants"%>
 
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<%String ctxstr = request.getContextPath(); %>
<% String appName= session.getAttribute(CevaCommonConstants.ACCESS_APPL_NAME).toString(); %> 
 

<style type="text/css">
label.error {
	  font-weight: bold;
	  color: red;
	  padding: 2px 8px;
	  margin-top: 2px;
}
.errmsg {
color: red;
}
.errors {
color: red;
}
</style>
<script type="text/javascript">

$(function() {  
	
	 
  
	$('#btn-back').on('click', function(){
		$("#form1")[0].action='<%=request.getContextPath()%>/<%=appName %>/home.action'; 
		$("#form1").submit();
		return true;
	});
	
	$('#btn-submit').on('click', function(){
		$("#form1")[0].action='<%=request.getContextPath()%>/<%=appName %>/terminalmanagementmodifyAck.action'; 
		$("#form1").submit();
		
		 $(this).prop('disabled', true);
			$("#btn-submit").hide();
		return true;
	}); 
});

</script> 
</head> 
<body>
<form name="form1" id="form1" method="post"> 
		
			<div id="content" class="span10">  
			    <div> 
					<ul class="breadcrumb">
					  <li> <a href="home.action">Home</a> <span class="divider"> &gt;&gt; </span> </li>
					   <li> <a href="#">Terminal Management</a>  </li> 
 					</ul>
				</div>  

				<table>
					<tr>
						<td colspan="3">
							<div class="messages" id="messages"><s:actionmessage /></div>
							<div class="errors" id="errors"><s:actionerror /></div>
						</td>
					</tr>
				</table>
			
  <div class="row-fluid sortable"> 
	<div class="box span12"> 
			<div class="box-header well" data-original-title>
					<i class="icon-edit"></i>Terminal Modify Confirmation
				<div class="box-icon">
					<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a> 
					<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
				</div>
			</div>  
				<div class="box-content">
					<fieldset> 
						<table width="950" border="0" cellpadding="5" cellspacing="1"
												class="table table-striped table-bordered bootstrap-datatable ">
											
											
										   <tr class="even">
										   <td width="25%"><label for="Address Line 1"><strong>Terminal Id</strong></label></td>
												<td width="25%">${responseJSON.terminalid}
												<input  type="hidden"   name="terminalid" id="terminalid" class="field" value="${responseJSON.terminalid}" /></td>
										   		<td width="25%"><label for="IDType"><strong>Terminal Make</strong></label></td>
												<td width="25%">${responseJSON.terminalmake}
												<input type="hidden" name="terminalmake"  id="terminalmake"   value="${responseJSON.terminalmake}"   /></td>
												
										   </tr>
										    

										   <tr class="odd">
										   <td width="25%"><label for="IDNumber"><strong>Model Number</strong></label>	</td>
												<td width="25%">${responseJSON.modelnumber}
												<input type="hidden" class="field" name="modelnumber" id="modelnumber"  value="${responseJSON.modelnumber}" /></td>
										   <td ><label for="Address Line 1"><strong>Serial Number</strong></label></td>
												<td >${responseJSON.serialnumber}
												<input  type="hidden"   name="serialnumber" id="serialnumber" class="field" value="${responseJSON.serialnumber}" /></td>
											
											</tr>
											<tr class="odd">		
										     	<td><label for="Address Line 1"><strong>Status</strong></label></td>
												<td>${responseJSON.termilstatus}
												<input  type="hidden"   name="termilstatus" id="termilstatus" class="field" value="${responseJSON.termilstatus}" />
												</td>
										   <td></td>
										    <td></td>
												
											</tr>
										
										  

									</table>
				</fieldset> 
				
				</div>  
				
	  </div>
	  </div> 
	  
	
										<input type="hidden" name="langugae"  id="langugae"   value="English"  />
			
	
		<div >
			<a href="#" id="btn-back" class="btn btn-danger ajax-link">&nbsp;Home </a>&nbsp;
			<a href="#" id="btn-submit" class="btn btn-success ajax-link">&nbsp;Confirm</a>					 
		</div> 
	</div> 	 
 </form>

</body> 
</html>