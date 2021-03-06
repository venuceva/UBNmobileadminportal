
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
 


var payBillRules = {
   rules : {
		biller : { required : true },
		modeOfPayment : { required : true },
		amount : { required : true }
   },  
   messages : {
    biller : { 
			required : "Please select biller."
        },
	modeOfPayment : { 
			required : "Please select mode of payment."
        },
	amount : { 
			required : "Please enter amount."
        }
   } 
  };
  
function getRadio(){
	
	var selectedVal = "";
	var selected = $("input[type='radio'][name='custSelect']:checked");
	if (selected.length > 0) {
		selectedVal = selected.val();
	}
	return selectedVal;
}	
		
		
function onSubmit(){
	var billerName=$( "#biller option:selected" ).text();
	$("#billerName").val(billerName);
	$("#form1").validate(payBillRules);
	if($("#form1").valid()){
		var selectedVal=getRadio();
		if(selectedVal!=""){
			$("#form1")[0].action='<%=request.getContextPath()%>/<%=appName %>/billPaymentSubmit.action';
			$("#form1").submit();
			return true;
		}else{
			alert("Please select atleast one record.");
			return false;
		}
		
	}else{
			return false;
	}
}

function getCustomerKey(key){
	 var CKey="CUST"+key;
	 var custKey=$("#"+CKey).val();
	 $("#customerKey").val(custKey);
}
$(document).ready(function() { 
	$("#searchFieldsDiv").hide();
	var mydata ='${responseJSON.BillerList}';
    	var json = jQuery.parseJSON(mydata);
    	$.each(json, function(i, v) {
    	    var options = $('<option/>', {value: v.val, text:v.key+"-"+v.val}).attr('data-id',i);    
    	    $('#biller').append(options);
    	});
		
	var config = {
      '.chosen-select'           : {},
      '.chosen-select-deselect'  : {allow_single_deselect:true},
      '.chosen-select-no-single' : {disable_search_threshold:10},
      '.chosen-select-no-results': {no_results_text:'Oops, nothing found!'},
      '.chosen-select-width'     : {width:"95%"}
    }
    for (var selector in config) {
      $(selector).chosen(config[selector]);
    }

	$('#biller').live('change',function(){
		$("#searchFieldsDiv").show();
		  var billerId=$("#biller option:selected" ).val();
		  var methodKey="searchFields";
		 if(billerId=='') {
			$("#customer-info-details").hide();
			$("#bill-payment-details").hide();
			$("#searchFieldsDiv").hide();
			$('#searchFieldsTab > thead').empty();
		 } else {
			var searchFields;
			var allSearchFields;
			var formInput='billerId='+billerId+'&methodKey='+methodKey;
			
			$("#bill-payment-details").show();
			
			 $.getJSON('getBillerSerachFieldsAct.action', formInput,function(data) {
					searchFields = data.responseJSON.SearchFields;
					$("#seachFieldsData").val(searchFields);
					console.log("searchFields ==> "+searchFields);
					allSearchFields=searchFields.split(",");
					var appendStr="";
					$('#searchFieldsTab').empty();
					for(var i=0;i<allSearchFields.length;i++){
						var addclass = "";
					 
						if(i % 2 == 0 ){
							addclass = "even";
						} else {
							addclass = "odd";
						}
						var MyField= allSearchFields[i].split("#");
						var appendStr="<tr align='center'><td class="+addclass+">"+MyField[0]+" </td> "+
						"<td><input type='text' name='"+MyField[1]+"' id='"+MyField[1]+"' /></td> "+
						"</tr>";
						$("#searchFieldsTab").append(appendStr);
					}
					
				});
				
			$("#searchFieldsDiv").append('<table id="SearchFieldTable" class="">');
		 } 
	 });	


	$("input[type=text]").live('blur',function() {
		var billerId=$("#biller option:selected" ).val(); 
		var index=0; 
		var id=$(this).attr('id');
		if(id != 'amount' && id != 'mobileNo') {
			var dataVal=$(this).val();
			
			if(dataVal=="") {
				//$('#customerDataDiv').html('');
				//$("#customer-info-details").hide();
			} else {
				
				index++;
				// console.log("["+dataVal+"]");
				if(dataVal.length>0) {
					
					$('#customerDataDiv').html('');
					var formInput='billerId='+billerId+'&methodKey=customerData&id='+id+'&dataVal='+dataVal;
					$.getJSON('getBillerSerachDataAct.action', formInput,function(data) { 
						var customerData ="";
						customerData = data.responseJSON;
						var custData="";
						custData=customerData["tableHeader"];
						
						var jsonData=customerData["CUSTOMER_DATA"];
						var tab="";
						var sCustData="";
						sCustData=custData.split(",");
						if(jsonData.length == 0) {
							$('#customerDataDiv').html('');
							tab="";
						}
						
						if(jsonData.length > 0)  {	
							
							$("#customer-info-details").show();
							
							tab='<table id="customerDataTable" width="950" border="0" cellpadding="5" cellspacing="1" class="table table-striped table-bordered bootstrap-datatable "></table>';
							$("#customerDataDiv").append(tab);
							var tableTxt="";
							tableTxt="<thead id='cHead'><tr role='row' id='CustDataHeader'><th aria-label='#: activate to sort column descending' style='width: 35px;'>Select</th></tr></thead>"
										+"<tbody role='alert' aria-live='polite' aria-relevant='all' id='CustDataBody'>"
										+"</tbody>";
							$("#customerDataTable").append(tableTxt);
						
						
							for(var i=0;i<sCustData.length;i++){
								var thData="<th aria-label='#: activate to sort column descending' style='width: 35px;'>"+sCustData[i]+"</th>";
								$("#CustDataHeader").append(thData);									
							}
							
							for(i in jsonData){
								var key = i;
								var val = jsonData[i];
								var rowTxt = "<tr index='"+i+"' id='"+i+"' ><td><input type='radio' name='custSelect' id='"+key+"' value='"+key+"' onClick='getCustomerKey("+key+");'></input></td></tr> ";
								$("#CustDataBody").append(rowTxt);
								var m=0;
								for(j in val){
									var sub_key = j;
									var sub_val = val[j];
									var columnTxt ="";	
									if(sub_key=="ACCT_NO"){
										var cKey="CUST"+key;
										 columnTxt ="<td class='sorting_1'><input type='hidden' name='"+cKey+"' id='"+cKey+"' value='"+sub_val+"'>"+sub_val+"</td>";	
									}else{
										 columnTxt ="<td class='sorting_1'>"+sub_val+"</td>";	
									}
									$("#"+key).append(columnTxt);
								}
							}	
						
						} else {
							$("#customer-info-details").hide();
						} 
						index++; 
					}); 
				} else {
				
					console.log("id["+id+"] dataVal ["+dataVal+"]");
				}
			}
		}
		
	});
	
	$("#mobileNo,#amount").keypress(function (e) {
		 //if the letter is not digit then display error and don't type anything
		 if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
			//display error message
			$("#"+$(this).attr('id')+"_err").html("Digits Only").show().fadeOut("slow");
				   return false;
			}
	   }); 
});
	
 

function getPaymode(){
	var selectData=$( "#modeOfPayment option:selected" ).text();
	if(selectData=="Select") {
		document.getElementById("cash").style.display = "none";
		document.getElementById("mobile").style.display = "none";
	}else if(selectData=="Cash") {
		document.getElementById("cash").style.display = "";
		document.getElementById("mobile").style.display = "none";
	}else if(selectData=="POS") {
		document.getElementById("cash").style.display = "";
		document.getElementById("mobile").style.display = "none";
	}else if(selectData=="Mpesa") {
		document.getElementById("cash").style.display = "";
		document.getElementById("mobile").style.display = "";
		
	}
}
</script>
</head>

<body>
<form name="form1" id="form1" method="post" action="">
			<div id="content" class="span10">  
			    <div>
					<ul class="breadcrumb">
					  <li> <a href="home.action">Home</a> <span class="divider"> &gt;&gt;</span> </li>
					  <li> <a href="#">Biller</a> <span class="divider"> &gt;&gt; </span></li>
					  <li><a href="#">Bill Payment</a></li>
					</ul>
				</div>
				<div class="row-fluid sortable"><!--/span-->

					<div class="box span12"> 
						<div class="box-header well" data-original-title>
							<i class="icon-edit"></i>Bill Payment
							<div class="box-icon">
								<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
								<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>

							</div>
						</div>

						<div id="Biller" class="box-content">
							<fieldset>  
								<table width="950" border="0" cellpadding="5" cellspacing="1" 
									class="table table-striped table-bordered bootstrap-datatable " >
									<tr class="even">
										<td width="20%"><strong><label for="Biller">Biller<font color="red">*</font></label></strong></td>
										<td colspan="3">
											<select id="biller" name="biller"  data-placeholder="Choose User Designation..." 
											class="chosen-select" style="width: 220px;">
												<option value="">Select</option>
											</select>
										</td> 
									</tr>
										<input type="hidden" name="billerName" id="billerName" />
								</table>
							 </fieldset>  
						</div> 
					</div>
				</div>

				<div class="row-fluid sortable" id="searchFieldsDiv"> 
					<div class="box span12">
							<div class="box-header well" data-original-title>
								<i class="icon-edit"></i>Customer Details Search
								<div class="box-icon">
									<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
									<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
								</div>
							</div>
							<div class="box-content">
								<fieldset>  
									<table id="searchFieldsTab" width="950" border="0" cellpadding="5" cellspacing="1" 
										class="table table-striped table-bordered bootstrap-datatable ">
										
									</table>
								</fieldset>  
							</div>
							<input type="hidden" name="seachFieldsData" id="seachFieldsData" /> 
					</div>
				</div>
				
				<div class="row-fluid sortable" id="customer-info-details" style="display:none">
					<div class="box span12">
							<div class="box-header well" data-original-title>
								<i class="icon-edit"></i>Customer Details
								<div class="box-icon">
									<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
									<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
								</div>
							</div>
							<div id="customerDataDiv"  class="box-content"> 
							</div>
						<input name="customerKey" type="hidden"  id="customerKey" class="field"  value="" /> 
					</div>
				</div> 
				
				<div class="row-fluid sortable" id="bill-payment-details" style="display:none">
						<div class="box span12">
							<div class="box-header well" data-original-title>
								<i class="icon-edit"></i>Bill Payment Details
								<div class="box-icon">
									<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
									<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
								</div>
							</div>
							<div class="box-content" id="payment-details"> 
								<fieldset>
									<table width="950" border="0" cellpadding="5" cellspacing="1" class="table table-striped table-bordered bootstrap-datatable ">
										<tr class="even">
											<td width="20%"><strong><label for="Merchant Name">Mode of Payment<font color="red">*</font></label></strong></td>
											<td colspan="3">
												<select id="modeOfPayment" name="modeOfPayment"  data-placeholder="Choose User Designation..." 
															class="chosen-select" style="width: 220px;" required='true' onChange="getPaymode()">
													<option value="">Select</option>
													<option value="CASH">Cash</option>
													<option value="POS">POS</option>
													<option value="MPESA">Mpesa</option>
												</select>
											</td>
											 
										</tr>
										<tr class="odd" id="cash"  style="display:none">
											<td><strong><label for="Amount">Amount<font color="red">*</font></label></strong>  </td>
											<td>
												<input name="amount" type="text" id="amount" class="field"  maxlength="50" /><span id="amount_err" class="errmsg"></span>
											</td>
											<td></td>
											<td></td>
										</tr>
										<tr class="odd" id="mobile"  style="display:none">
											<td><strong><label for="Amount">Mobile No<font color="red">*</font></label></strong>  </td>
											<td>
												<input name="mobileNo" type="text" id="mobileNo" class="field"  maxlength="50" /> <span id="mobileNo_err" class="errmsg"></span>
											</td>
											<td></td>
											<td></td>
										</tr>
									</table> 
								</fieldset>
							</div> 
						</div>
				</div>
				<div class="form-actions">
					<a  class="btn btn-danger" href="#" onClick="onSubmit();">Submit</a>
				</div> 
			</div>
	<input type="hidden" name="token" id="token" value="${responseJSON.token}"/>
</form> 
 </body>
</html>
