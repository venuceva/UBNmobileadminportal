<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title> </title>
<%@page import="com.ceva.base.common.utils.CevaCommonConstants"%>
<%String ctxstr = request.getContextPath(); %>
<% String appName= session.getAttribute(CevaCommonConstants.ACCESS_APPL_NAME).toString(); %>
 <%@taglib uri="/struts-tags" prefix="s"%>  
 
<style type="text/css">
label.error {
	 /*  font-weight: bold; */
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
<script type="text/javascript" >
$(document).ready(function(){ 
	var acctRules = {
			   rules : {
				   acType : { required : true},
				   businessUnit : { required : true},
				   description : { required : true},
				   productCode : { required : true},
				   channelID : { required : true},
				   customerType : { required : true},
				   customerSubType : { required : true},
				   custSegmentID : { required : true},
				   subProductID : { required : true},
				   isCustSWIFTEnabled : { required : true},
				   isChequeBookReq : { required : true},
				   chequeBookType : { required : true},
				   restrictionFlag : { required : true},
				   isdebitCardReq : { required : true},
				   isEStatementReq : { required : true},
				   isInternetBankingReq : { required : true},
				   isBancassuranceReq : { required : true},
				   isSimpleBankingReq : { required : true} ,
				   isCreditCardReq : { required : true}
			   },  
			   messages : {
				   acType : { 
				   		required : "Please Select Core Banking."
					} ,
					customerType : { 
				   		required : "Please Enter Customer Type."
					} ,
					customerSubType : { 
				   		required : "Please Enter Customer Sub Type."
					} ,
					businessUnit : { 
				   		required : "Please Enter Business Unit."
					} ,
					description : { 
				   		required : "Please Enter Description."
					} ,
					productCode : { 
				   		required : "Please Enter Product Code."
					} ,
					channelID : { 
				   		required : "Please Enter Channel Id."
					} ,
					custSegmentID : { 
				   		required : "Please Enter Customer Segment Id."
					} ,
					subProductID : { 
				   		required : "Please Enter Sub Product Id."
					} ,
					isCustSWIFTEnabled : { 
				   		required : "Please Select Customer Swift."
					} ,
					isChequeBookReq : { 
				   		required : "Please Select Cheque Book."
					} ,
					chequeBookType : { 
				   		required : "Please Cheque Book Type."
					} ,
					restrictionFlag : { 
				   		required : "Please Enter Restriction Flag."
					} ,
					isdebitCardReq : { 
				   		required : "Please Select Debit Card."
					} ,
					isEStatementReq : { 
				   		required : "Please Select E-Statement."
					} ,
					isInternetBankingReq : { 
				   		required : "Please Select Internet Banking."
					} ,
					isBancassuranceReq : { 
				   		required : "Please Select Bank Assurance."
					} ,
					isSimpleBankingReq : { 
				   		required : "Please Select Simple Banking."
					} ,
					isCreditCardReq : { 
				   		required : "Please Select Credit Card."
					} 
			   } 
	};
			 
	$('#btn-make-payment').on('click', function(){
			$("#form1").validate(acctRules);
			if($("#form1").valid()) { 
				$('#form1').attr("action", 'AccountSettingUpdateSubmit.action').attr("method", "post"); 
				$('#form1').submit();
				 return true; 
			} else { 
				return false;
			}
		//alert("hello");
		
	});
	
});

</script>
</head>
 <body>  
 <form name="form1" id="form1" action="" method="post" > 
	<div id="content" class="span10">
			<ul class="breadcrumb">
				<li>
					<a href="home.action">Home</a> <span class="divider">&gt;&gt;</span>
				</li>
				<li><a href="accountproperties.action">Account Properties</a>  <span class="divider">&gt;&gt;</span>
				</li> 
				<li><a href="#">Account Properties Modify</a>  
				</li> 
			</ul>
		<table>
			<tr>
				<td colspan="3">
					<div class="messages" id="messages">
						<s:actionmessage />
					</div>
					<div class="errors" id="errors">
						<s:actionerror />
					</div>
				</td>
			</tr>
		</table>  
		<div class="row-fluid sortable" > 
			<div class="box span12">
				<div class="box-header well" data-original-title>
					 <i class="icon-edit"></i>&nbsp;Account Settings Modify
					<div class="box-icon">
						<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
						<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a> 
					</div>
				</div> 		
				<div class="box-content">
					<fieldset>  
 							<table width="950"  border="0" cellpadding="5" cellspacing="1" 
								class="table table-striped table-bordered bootstrap-datatable" id="account-details" >
								<tr class="odd">
									<td width="20%"><label for="DL No"> <strong>Type Of Account<font color="red">*</font></strong></label></td>
									<td width="30%">
											<s:select cssClass="chosen-select" 
												 headerKey="" 
												 headerValue="Select"
												 list="#{'INSTID1':'BFUB','INSTID2':'IMAL/AMANAH'}"
												 name="acType" 
												 value="accountPropBean.acType" 
												 id="acType" 
												 requiredLabel="true" 
												 theme="simple"
												 data-placeholder="Choose Type Of Account..." 
										   />
									 </td>
									 <td width="20%"><label for="BusinessUnit"><strong>Business Unit<font color="red">*</font></strong></label></td>
									<td width="30%"><input type="text" name="businessUnit" id="businessUnit" class="field" maxlength="15" value='<s:property value='accountPropBean.businessUnit' />' /></td>
								</tr>
								<tr>
									<td><label for="Description"><strong>Description<font color="red">*</font></strong></label></td>
									<td colspan=3><input type="text" name="description" id="description" style="width:440px" value="<s:property value='accountPropBean.description' />" /></td>
									
								</tr>
								<tr>
									<td><label for="ProductCode"><strong>Product Code<font color="red">*</font></strong></label></td>
									<td><input type="text" name="productCode" id="productCode" maxlength="25" value='<s:property value='accountPropBean.productCode' />'/></td>
									<td><label for="ChannelID"><strong>Channel ID<font color="red">*</font></strong></label></td>
									<td><input type="text" name="channelID" id="channelID" class="field" maxlength="15" value='<s:property value='accountPropBean.channelID' />' /></td>
								</tr>
								<tr>
									<td><label for="Customer Type"><strong>Customer Type<font color="red">*</font></strong></label></td>
									<td><input name="customerType" autocomplete="off" type="text" class="field" id="customerType" value='<s:property value='accountPropBean.customerType' />' /> </td>
									<td><label for="CustomerSubType"><strong>Customer Sub Type<font color="red">*</font></strong></label></td>
									<td><input name="customerSubType" autocomplete="off" type="text" class="field" id="customerSubType" value='<s:property value='accountPropBean.customerSubType' />'/> </td>
								</tr>
							<tr>
								<td><label for="CustSegmentID"><strong> Customer Segment ID<font color="red">*</font></strong></label></td>
								<td><input type="text" name="custSegmentID" id="custSegmentID" maxlength="25" value='<s:property value='accountPropBean.custSegmentID' />'/></td>
								<td><label for="SubProductID"><strong>Sub Product ID<font color="red">*</font></strong></label></td>
								<td><input type="text" name="subProductID" id="subProductID" maxlength="35" value='<s:property value='accountPropBean.subProductID' />'/></td>
								
							</tr>
							<tr>
								<td><label for="IsCustSWIFTEnabled"><strong>Is Customer SWIFT Enabled<font color="red">*</font></strong></label></td>
								<td>
										<s:select cssClass="chosen-select" 
												 headerKey="" 
												 headerValue="Select"
												 list="#{'true':'True','false':'False'}" 
												 name="isCustSWIFTEnabled" 
												 value="accountPropBean.isCustSWIFTEnabled" 
												 id="isCustSWIFTEnabled" 
												 requiredLabel="true" 
												 theme="simple"
												 data-placeholder="Choose Type Of Account..." 
										   />
								 </td>
								<td ><label for="IsChequeBookReq"><strong>Is Cheque Book Required<font color="red">*</font></strong></label></td>
								<td >
									<s:select cssClass="chosen-select" 
												 headerKey="" 
												 headerValue="Select"
												 list="#{'true':'True','false':'False'}" 
												 name="isChequeBookReq" 
												 value="accountPropBean.isChequeBookReq" 
												 id="isChequeBookReq" 
												 requiredLabel="true" 
												 theme="simple"
												 data-placeholder="Choose Cheque Book..." 
										   />
								</td>
							</tr> 
							<tr>
								<td ><label for="ChequeBookType"><strong>Cheque Book Type<font color="red">*</font></strong></label></td>
								<td ><input type="text" name="chequeBookType" id="chequeBookType" maxlength="35" value='<s:property value='accountPropBean.chequeBookType' />' /></td>
								<td ><label for="RestrictionFlag"><strong>Restriction Flag<font color="red">*</font></strong></label></td>
								<td ><input type="text" name="restrictionFlag" id="restrictionFlag" maxlength="35" value='<s:property value='accountPropBean.restrictionFlag' />'/></td>
							</tr> 
							<tr>
								<td ><label for="IsdebitCardReq"><strong>Is Debit Card Required<font color="red">*</font></strong></label></td>
								<td >
										<s:select cssClass="chosen-select" 
												 headerKey="" 
												 headerValue="Select"
												 list="#{'true':'True','false':'False'}" 
												 name="isdebitCardReq" 
												 value="accountPropBean.isdebitCardReq" 
												 id="isdebitCardReq" 
												 requiredLabel="true" 
												 theme="simple"
												 data-placeholder="Choose Debit Card..." 
										   />
								
							   </td>
								<td><label for="IsEStatementReq"><strong>Is E-Statement Required<font color="red">*</font></strong></label></td>
								<td>
									<s:select cssClass="chosen-select" 
												 headerKey="" 
												 headerValue="Select"
												 list="#{'true':'True','false':'False'}" 
												 name="isEStatementReq" 
												 value="accountPropBean.isEStatementReq" 
												 id="isEStatementReq" 
												 requiredLabel="true" 
												 theme="simple"
												 data-placeholder="Choose E-Statement..." 
										   />
								</td>
							</tr> 
							<tr>
								<td><label for="IsInternetBankingReq"><strong>Is Internet Banking Required<font color="red">*</font></strong></label></td>
								<td>
									<s:select cssClass="chosen-select" 
												 headerKey="" 
												 headerValue="Select"
												 list="#{'true':'True','false':'False'}" 
												 name="isInternetBankingReq" 
												 value="accountPropBean.isInternetBankingReq" 
												 id="isInternetBankingReq" 
												 requiredLabel="true" 
												 theme="simple"
												 data-placeholder="Choose Internet Banking..." 
										   />
								
								</td>
								<td><label for="IsBancassuranceReq"><strong>Is Bank assurance Required<font color="red">*</font></strong></label></td>
								<td>
										<s:select cssClass="chosen-select" 
												 headerKey="" 
												 headerValue="Select"
												 list="#{'true':'True','false':'False'}" 
												 name="isBancassuranceReq" 
												 value="accountPropBean.isBancassuranceReq" 
												 id="isBancassuranceReq" 
												 requiredLabel="true" 
												 theme="simple"
												 data-placeholder="Choose Bank assurance..." 
										   />
								
							</td>
							</tr> 
							<tr>
									<td><label for="IsSimpleBankingReq"><strong>Is Simple Banking Required<font color="red">*</font></strong></label></td>
									<td>
										<s:select cssClass="chosen-select" 
												 headerKey="" 
												 headerValue="Select"
												 list="#{'true':'True','false':'False'}" 
												 name="isSimpleBankingReq" 
												 value="accountPropBean.isSimpleBankingReq" 
												 id="isSimpleBankingReq" 
												 requiredLabel="true" 
												 theme="simple"
												 data-placeholder="Choose Simple Banking..." 
											   />
									
									 </td>
									<td ><label for="IsCreditCardReq"><strong>Is Credit Card Required<font color="red">*</font></strong></label></td>
									<td >
										<s:select cssClass="chosen-select" 
												 headerKey="" 
												 headerValue="Select"
												 list="#{'true':'True','false':'False'}" 
												 name="isCreditCardReq" 
												 value="accountPropBean.isCreditCardReq" 
												 id="isCreditCardReq" 
												 requiredLabel="true" 
												 theme="simple"
												 data-placeholder="Choose Credit Card..." 
										   /> 
									</td>
								</tr> 
							
							</table> 
 					</fieldset> 
				<div class="form-actions" id="form1-submit"> 
					<input type="button" name="btn-make-payment" class="btn btn-success" id="btn-make-payment" value="Submit" />
					<span id ="error_dlno" class="errors"></span>		 	
				</div>					
				</div>
			</div> 
		</div> 
	</div>
	<input type="hidden" name="accountId" id="accountId" value='<s:property value='accountPropBean.accountId' />'/>
	</form>
</body> 
 <script type="text/javascript">
$(function(){ 
	var config = {
      '.chosen-select'           : {},
      '.chosen-select-deselect'  : {allow_single_deselect:true},
      '.chosen-select-no-single' : {disable_search_threshold:10},
      '.chosen-select-no-results': {no_results_text:'Oops, nothing found!'},
      '.chosen-select-width'     : {width:"95%"}
    };
	
    for (var selector in config) {
      $(selector).chosen(config[selector]);
    }  
});  
</script>
</html>