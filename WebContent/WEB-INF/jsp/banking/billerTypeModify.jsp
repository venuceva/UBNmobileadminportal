
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Ceva</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Another one from the CodeVinci">
<meta name="author" content="Team">
<%@page import="com.ceva.base.common.utils.CevaCommonConstants"%>
<%@taglib uri="/struts-tags" prefix="s"%>  
<%String ctxstr = request.getContextPath(); %>
<% String appName= session.getAttribute(CevaCommonConstants.ACCESS_APPL_NAME).toString(); %>
<%@taglib uri="/struts-tags" prefix="s"%> 
<link rel="stylesheet" type="text/css" media="screen" href='${pageContext.request.contextPath}/css/jquery.cleditor.min.css' /> 
<style type="text/css">
.errors {
	  font-weight: bold;
	  color: red;
	  padding: 2px 8px;
	  margin-top: 2px;
}

input#billerType{text-transform:uppercase};
input#billerId{text-transform:uppercase}; 
</style>

<script type="text/javascript"> 
var billerrules = {
		rules : {
			institute : { required : true },
			operator : { required : true },
			billerType : { required : true  },
			billerTypeDescription : { required : true }, 
 			fixedamountcheck : { required : true },
			amount : {
				required: {
					depends: function(element) {
						if ($("#fixed-amt-y").attr("checked") == "checked"){
							return true;
						} else {
							return false;
					   }
					}
				 }    
				, number : {
					depends: function(element) {
						if ($("#fixed-amt-y").attr("checked") == "checked"){
							return true;
						} else {
							return false;
					   }
					}
				}
			},
			billerIdLen : {
				required: {
					depends: function(element) {
						if ($("#billerid-y").attr("checked") == "checked"){
							return true;
						} else {
							return false;
					   }
					}
				 }    
				, number : {
					depends: function(element) {
						if ($("#billerid-y").attr("checked") == "checked"){
							return true;
						} else {
							return false;
					   }
					}
				}
			},
			systemmodes : { required : true },
			billeridcheck : { required : true },
			bfubCreditAccount : {    required : false,  notEqualTo: ['#bfubDebitAccount'], regexchk: /^([A-Z0-9]{14,14})$/i  },
			bfubDebitAccount : {    required : false, notEqualTo: ['#bfubCreditAccount'], regexchk: /^([A-Z0-9]{14,14})$/i }
		},		
		messages : {
			institute : { 
				required : "Please Select Core Banking." 
		  	}, 
		 	 	operator : { 
				required : "Please Select Mobile Network Operator." 
			} , 
				billerType : { 
					required : "Please Enter Biller Type." 
			} , 
				billerTypeDescription : { 
					required : "Please Enter Biller Type Description." 
			},
			 	amount : { 
					required : "Please Enter Fixed Amount." 
			}, billerIdLen : { 
				required : "Please Enter Biller Id Length." 
			},
			  systemmodes : { 
					required : "Please Select System Integration Modes." 
			}, bfubCreditAccount : {
				regexchk :   "Only alpha with caps and numeric of 14 characters allowed." 
			}, bfubDebitAccount : {
				regexchk :   "Only alpha with caps and numeric of 14 characters allowed.." 
			}
		},
		errorPlacement: function(error, element) {
		    if ( element.is( ':radio' ) || element.is( ':checkbox' ) )
				error.appendTo( element.parent() );
		    else if ( element.is( ':password' ) )
				error.hide();
		    else
				error.insertAfter( element );
		}
	};

 
	var form2Rules = {
	     rules : { 
	    	 billerId : {  required: true   },
	    	 billerIdDescription : {  required: true } ,
	    	 bfubCreditAcctBillerId : { required : false , notEqualTo: ['#bfubDebitAcctBillerId'], regexchk: /^([A-Z0-9]{14,14})$/i  },
	    	 bfubDebitAcctBillerId : { required : false , notEqualTo: ['#bfubCreditAcctBillerId'], regexchk: /^([A-Z0-9]{14,14})$/i  }
	    },  
	    messages : {
	    	billerId : {   required: "Please Input Account Number."    },
	    	billerIdDescription : {   required: "Please Select Account Description." },
	    	bfubCreditAcctBillerId : {
				regexchk :   "Only alpha with caps and numeric of 14 characters allowed." 
			}, bfubDebitAcctBillerId : {
				regexchk :   "Only alpha with caps and numeric of 14 characters allowed." 
			}
	    } ,
		errorPlacement: function(error, element) {
		    if ( element.is( ':radio' ) || element.is( ':checkbox' ) )
				error.appendTo( element.parent() );
		    else if ( element.is( ':password' ) )
				error.hide();
		    else
				error.insertAfter( element );
		}
	};


$(document).ready(function(){ 
	
	$("#dialog").dialog({
	      autoOpen: false,
	      modal: true
     });
	 
	
	jQuery.validator.addMethod("notEqualTo",
			function(value, element, param) {
			    var notEqual = true;
			    value = $.trim(value);
			    for (i = 0; i < param.length; i++) {
			        if (value == $.trim($(param[i]).val())) { notEqual = false; }
			    }
			    return this.optional(element) || notEqual;
			},
			"Please enter a diferent value."
			);
	
	$.validator.addMethod("regexchk", function(value, element, regexpr) { 
		 return this.optional(element) || regexpr.test(value); 
	   }, ""); 
	
	/* jQuery.validator.addMethod("alphanumeric", function(value, element) {
	    return this.optional(element) || /^([A-Z0-9]{14,14})$/i.test(value);
	}, "Letters, numbers, spaces or underscores only please"); */
	
	
	$('#btn-submit').on('click',function() { 
		$('#billerMsg').text('');
		$('#error_dlno').text('');
		var finalData = "";
		$("#form1").validate(billerrules); 
		console.log($("#form1").valid());
		if($("#form1").valid()) {
			$("#form1").validate().cancelSubmit = true;
			
			<%-- var queryString = "method=searchBfubAccounts&bfubCreditAccount="+ $('#bfubCreditAccount').val()+"&bfubDebitAccount="+ $('#bfubDebitAccount').val()+"&operator="+$('#operator').val()+"&billerType="+$('#billerType').val()+"&type=BILLERTYPE&billeridcheckval=N";	
			$.getJSON("paybillJsonCall.action", queryString,function(data) { 
				v_message = data.message; 
				userstatus = data.status;  
				masterstatus = data.masterStatus;  
 				var flag1 = false;
				 
 				if(v_message == "SUCCESS") {
 					if(userstatus != null 
 							&& masterstatus != null ) {  
 							
 						if("~NO~".indexOf(userstatus) != -1 && "~NO~".indexOf(masterstatus) != -1){
 							flag1 = true;
 						} else {
 							if(userstatus == 'BTFOUND' && masterstatus == '~NO~'){
 								$('#error_dlno').text('Biller Type Exists.');
 							} else if(userstatus == 'MDCRNOTFOUND' && masterstatus == 'MDDRNOTFOUND'){
 								$('#error_dlno').text('Both Credit Account && Debit Account Of Biller Type Not Found In Master Table.');
 							} else if(userstatus == 'MDCRNOTFOUND'){
 								$('#error_dlno').text('Credit Account Of Biller Type Not Found In Master Table.');
 							} else if(masterstatus == 'MDDRNOTFOUND'){
 								$('#error_dlno').text('Debit Account Of Biller Type Not Found In Master Table.');
 							} if(userstatus == 'BTCRFOUND'){
 								$('#error_dlno').text('Biller Type is already associated with the "Credit Account", please input another.');
 							} 
 							 
 						} 
 						
 						if(flag1) {
 							$('#billerMsg').text('');
 							$('#error_dlno').text('');
 							
 		 					$('#multi-row > span').each(function(index) {  
 				 				if(index == 0)  finalData = $(this).text();
 								else finalData += "#"+ $(this).text();
 							}); 
 						 
 							$('#multiData').val(finalData); 
 							$('#billerType').val($('#billerType').val().toUpperCase());
 							$('#fixedamountcheckval').val($('input[name=fixedamountcheck]:checked').val());	 
 							$('#billeridcheckval').val($('input[name=billeridcheck]:checked').val());	 
 							
 							$('#selectBoxData').val($('select#institute option:selected').text()+"##"+$('select#operator option:selected').text()+"##"+$('select#systemmodes option:selected').text());
 						 
 							 $("#dialog").dialog({
 							      buttons : {
 							        "Confirm" : function() { 
 							          $("#form1")[0].action="<%=request.getContextPath()%>/<%=appName %>/modifyBillerTypeConfirm.action";
 									  $("#form1").submit();
 							        },
 							        "Cancel" : function() {
 							           $(this).dialog("close");
 							        }
 							      }
 							    });

 							    $("#dialog").dialog("open");  
 						}
 						
 						return true;   
 					
 					} else {
 						
 					} 
 				} else {
 					$('#error_dlno').text(v_message);
 				}
				
			});
 --%>
		 $('#selectBoxData').val($('select#institute option:selected').text()+"##"+$('select#operator option:selected').text()+"##"+$('select#systemmodes option:selected').text());
			 
			 $("#dialog").dialog({
			      buttons : {
			        "Confirm" : function() { 
			          $("#form1")[0].action="<%=request.getContextPath()%>/<%=appName %>/modifyBillerTypeConfirm.action";
					  $("#form1").submit();
			        },
			        "Cancel" : function() {
			           $(this).dialog("close");
			        }
			      }
			    });
		
			    $("#dialog").dialog("open");  

			
		} else {
			return false;
		}
						
	}); 
	
	$('#btn-Cancel').live('click',function() {  
		$("#form1").validate().cancelSubmit = true;
		$("#form1")[0].action="<%=request.getContextPath()%>/<%=appName %>/mpesaAccManagement.action";
		$("#form1").submit();					
	}); 
	
	 
    $("input[name=fixedamountcheck]:radio").change(function () {
    	$('#billerMsg').text('');
    	$('#error_dlno').text('');
    	
        if ($("#fixed-amt-y").attr("checked")) {
         	$('#fixed-amt-tr').show();
         }
        if ($("#fixed-amt-n").attr("checked")){
        	$('#fixed-amt-tr').hide(); 
         } 
    });
    
    $("input[name=billeridcheck]:radio").change(function () {
    	$('#billerMsg').text('');
    	$('#error_dlno').text('');
    	
    	clearVals();
    	
         if($('#billerid-y').attr("checked")){
        	$('#billerid-div').show();
        	$('.acctbillertype').hide(); 
        	$('#bfubCreditAccount').val('');
        	$('#bfubDebitAccount').val(''); 
        	$('#biller-len-tr').show();
    	} else {
    		$('#billerid-div').hide();
    		$('.acctbillertype').show();
    		$('#biller-len-tr').hide();
     	}
    });
	
});

//For Closing Select Box Error Message_Start
$(document).on('change','select',function(event) {  
	 if($('#'+$(this).attr('id')).next('label').text().length > 0) {
		  $('#'+$(this).attr('id')).next('label').text(''); 
		  $('#'+$(this).attr('id')).next('label').remove();
	 }
 
});
//For Closing Select Box Error Message_End 
</SCRIPT>  
<script type="text/javascript"> 
/** Form2 Add,Modify Starts*/
var val = 1; 
var rowindex = 0;
var colindex = 0;
var userstatus = "";
var masterstatus = "";
var v_message = "";
var listid = "".split(",");
var headerList = "billerId,billerIdDescription,bfubCreditAcctBillerId,bfubDebitAcctBillerId".split(",");
var tabArry ; 
var modTabArry ;  
var modHeaderBodyArry ;  

var index1 = "";
var searchTdRow = "";
var searchTrRows = "";
var selTextList = ""; 
var headerList = "billerId,billerIdDescription,bfubCreditAcctBillerId,bfubDebitAcctBillerId".split(",");
var rowCount = 0;
function clearVals(){ 
	$('#billerId').val('');
	$('#billerIdDescription').val('');
	$('#bfubCreditAcctBillerId').val('');
	$('#bfubDebitAcctBillerId').val('');
	
	 
	rowCount = $('#tbody_data > tr').length; 
	if(rowCount > 0 )  $("#error_dlno").text('');
}

function commonData(id,type){
	var hiddenInput ="";
	var hiddenNames = "";
	var tabarrindex = 0;
	tabArry = new Array();
	modTabArry = new Array(); 
	try {
 		$(id).find('input[type=text],input[type=hidden],select,textarea').each(function(indxf){ 
			var nameInput = "";
			var valToSpn =  "";
			try {
				  nameInput = $(this).attr('name'); 
				  valToSpn = ($(this).attr('value') == '' ? ' ' :  nameInput == 'billerId'? $(this).attr('value').toUpperCase() : $(this).attr('value')); 
			} catch(e1) {
				console.log('The Exception Stack is :: '+ e1);
			} 
 			
			if(nameInput != undefined) {
			  if(indxf == 0)  {
				hiddenInput += valToSpn;
				hiddenNames += nameInput;
			  } else {
				hiddenInput += ","+valToSpn; 
				hiddenNames += ","+nameInput; 
			  }
			  
			   if(jQuery.inArray(nameInput, headerList) != -1){ 
				  if(selTextList.indexOf(nameInput) != -1) {
					tabArry[tabarrindex] = ($('select#'+nameInput+' option:selected').text().trim() == "Select" ? " " : $('select#'+nameInput+' option:selected').text().trim()); 
					modTabArry[tabarrindex] = ($('select#'+nameInput+' option:selected').text().trim() == "Select" ? " " : $('select#'+nameInput+' option:selected').text().trim()); 
				  } else {
					tabArry[tabarrindex] = valToSpn; 
					modTabArry[tabarrindex] = valToSpn; 
				  } 
				  tabarrindex++;
			  }
			} 
			 
		}); 
	} catch (e) {
		console.log(e);
	}  
	return hiddenInput+"@@"+hiddenNames;
}

var addbillerInfo = function (clickType) {
	 // add custom behaviour
	 var appendTxt = "";
	 var tabArrText = ""; 
	 var data1 = "";
	try { 
		data1 = commonData('#biller-details','ADD');
		 
		rowindex = $("#multi-row > span") .length ;
		$("#multi-row").append("<span id='hidden_span_"+rowindex+"' index="+rowindex+" ind-id='"+tabArry[0]+"' hid-names='"+data1.split("@@")[1]+"' ></span>");
		$('#multi-row > span#hidden_span_'+rowindex).append(data1.split("@@")[0]);
	 
		var addclass = ""; 
		
		if(val % 2 == 0 ){
			addclass = "even";
			val++;
		} else {
			addclass = "odd";
			val++;
		}
		
		colindex = ++ colindex;
		
		$(tabArry).each(function(index){ 
			tabArrText+="<td>"+tabArry[index].trim()+"</td> ";
		});
		
		appendTxt = "<tr class="+addclass+" align='center' id='tr-"+rowindex+"' index='"+rowindex+"'>"+
				"<td class='col_"+colindex+"'>"+colindex+"</td>"+ tabArrText+ 
 				"<td><a class='btn btn-min btn-info' href='#' id='edit-biller' index='"+rowindex+"' title='Edit Biller' data-rel='tooltip'> <i class='icon-edit icon-white'></i></a> &nbsp;<a class='btn btn-min btn-warning' href='#' id='row-cancel' index='"+rowindex+"' title='Reset Biller' data-rel='tooltip'> <i class='icon icon-undo icon-white'></i></a>&nbsp; <a class='btn btn-min btn-danger' href='#' id='delete-biller' index='"+rowindex+"' title='Delete Biller' data-rel='tooltip'> <i class='icon-trash icon-white'></i></a></td></tr>";
 		
	} catch(e) {
		console.log(e);
	}   
	return appendTxt; 
};
	
var modBankAccVals = function (clickType) {
	 // add custom behaviour
		var tabArrText = "";
		var appendTxt = ""; 
		 
		var data1 = ""; 
	try {  
		modHeaderBodyArry = new Array();
		
		data1 = commonData('#biller-details','MODIFY'); 
		
		modHeaderBodyArry[0]=data1.split("@@")[1];
		modHeaderBodyArry[1]=data1.split("@@")[0];
	} catch(e)  {
		console.log(e);
	}  
	//console.log(data1.split("@@")[1]+"##"+data1.split("@@")[0]);
	return ""; 
};

/** Form2 Add,Modify Ends*/

function alignSerialNo(serialId) {  
	if($(serialId).length > 0) {
		$(serialId +' > td:first-child').each(function(index){  
			$(this).text(index+1);
		}); 
	}
}

function recordCheck(idtocheck,billerId,creditAcct,debitAcct){ 
	var check = false; 
	var userIdRecords = new Array();
	var data = '';
	 
	try { 
		if($(idtocheck).length > 0) {
			// To Check The Record Exists In The Add-Row
			$(idtocheck+' > td:nth-child(2)').each(function(indx){ 
 				userIdRecords[indx]=$(this).text().trim(); 
			}); 
			
			if(jQuery.inArray(billerId.toUpperCase().trim(), userIdRecords) != -1){ 
				//check = true; 
				data = 'Biller id exists in the below table, please input another.';
			}  else {
				data =  'NO';
			} 
			
		} else {
			return 'NO';
		}
		
		
	} catch(e){
		console.log(e);
		return 'Error while adding biller id.';
	} 
	 
	return data;
}




function loadToolTip(){
	$('[rel="tooltip"],[data-rel="tooltip"]').tooltip({"placement":"bottom",delay: { show: 400, hide: 200 }});
}
$(function(){

	/** Form2 Add Row Validation Starts*/
		// Add Row Starts Here.
		 $('#add-biller').live('click', function(){
			$("#billerMsg").text('');
	 		$("#error_dlno").text('');	 
			$("#form2").validate(form2Rules); 
			 var textMess = "#tbody_data > tr";  
			 var flag = false; 
			 
 			 if($('#billerType').val() .length > 0 ) {
	 				if($("#form2").valid() ) {  
						// Is To Check Account Exist's or not 
						var dat1 = recordCheck(textMess,$('#billerId').val(),$('#bfubCreditAcctBillerId').val(),$('#bfubDebitAcctBillerId').val()); 
	 										
						if(dat1 == 'NO') { 						
							var queryString = "method=searchBfubAccounts&bfubCreditAccount="+ $('#bfubCreditAcctBillerId').val()+"&bfubDebitAccount="+ $('#bfubDebitAcctBillerId').val()+"&operator=NO&billerId="+$('#billerId').val()+"&type=BILLERID&billeridcheckval=N&billerType="+$('#billerType').val();	
							$.getJSON("paybillJsonCall.action", queryString,function(data) { 
								userstatus = data.status; 
								v_message = data.message;  
								masterstatus = data.masterStatus;   
								if(v_message == "SUCCESS") {			
									if(userstatus != null 
										&& masterstatus != null ) {   
											
										if("~NO~".indexOf(userstatus) != -1 && "~NO~".indexOf(masterstatus) != -1){
											flag = true;
										} else {
											if(userstatus == 'BIWBTFOUND' && masterstatus == '~NO~'){
												$('#error_dlno').text('Biller Id Is Already Associated With Biller Type.');
											} else if(userstatus == 'MDCRNOTFOUND' && masterstatus == 'MDDRNOTFOUND'){
												$('#error_dlno').text('Both Credit Account && Debit Account Of Biller Id Not Found In Master Table.');
											} else if(userstatus == 'MDCRNOTFOUND'){
												$('#error_dlno').text('Credit Account Of Biller Id Not Found In Master Table.');
											} else if(masterstatus == 'MDDRNOTFOUND'){
												$('#error_dlno').text('Debit Account Of Biller Id Not Found In Master Table.');
											} if(userstatus == 'BTCRFOUND'){
												$('#error_dlno').text('Biller Id is already associated with the "Credit Account", please input another.');
											} 
											 
										} 
		
											if(flag) {
												$('#billerId').val($('#billerId').val().toUpperCase());
												
												var appendTxt = addbillerInfo("ADD");
						 						$("#tbody_data").append(appendTxt);  
												clearVals();
												alignSerialNo(textMess); 
												$("#bankAcctMsg").text('');
												$('#error_dlno').text('');
												loadToolTip(); 
											}
									
									} else {
										 $('#billerMsg').text('');
										 $('#error_dlno').text('');
								} 
									
							} else {
								$('#billerMsg').text(v_message);
							}
									
							}); 
							
						  } else {
							  
								$("#error_dlno").text('');
								$('#billerMsg').text(dat1);
						 } 
					
						   	
				 } else { 
					 return false;
				 } 
 			 } else { 
 				$('#error_dlno').text('Please Input Biller Type Under Biller Type Information.');
			 } 	 
				 
		});
		
		
		// Update Edited-Row Starts Here.
		$('#mod-biller').live('click', function () {
			$("#error_dlno").text('');	 
			$("#form2").validate(form2Rules); 
			
			var flag = false;  
			if($("#form2").valid()) { 
				// Is To Check Account Exist's or not  
				var dat1 = recordCheck(textMess,$('#billerId').val(),$('#bfubCreditAcctBillerId').val(),$('#bfubDebitAcctBillerId').val());
				
				if(dat1 == 'NO') { 
					var queryString = "method=searchBfubAccounts&bfubCreditAccount="+ $('#bfubCreditAcctBillerId').val()+"&bfubDebitAccount="+ $('#bfubDebitAcctBillerId').val()+"&operator=NO&billerId="+$('#billerId').val()+"&type=BILLERID&billeridcheckval=N&billerType="+$('#billerType').val();	
					$.getJSON("paybillJsonCall.action", queryString,function(data) { 
						userstatus = data.status; 
						v_message = data.message;  
						masterstatus = data.masterStatus;   
						
							if(v_message == "SUCCESS") {
								if(userstatus != null 
									&& masterstatus != null ) {   
										
										if("~NO~".indexOf(userstatus) != -1 && "~NO~".indexOf(masterstatus) != -1){
											flag = true;
										} else {
											if(userstatus == 'BIWBTFOUND' && masterstatus == '~NO~'){
												$('#error_dlno').text('Biller Id Is Already Associated With Biller Type.');
											} else if(userstatus == 'MDCRNOTFOUND' && masterstatus == 'MDDRNOTFOUND'){
												$('#error_dlno').text('Both Credit Account && Debit Account Of Biller Id Not Found In Master Table.');
											} else if(userstatus == 'MDCRNOTFOUND'){
												$('#error_dlno').text('Credit Account Of Biller Id Not Found In Master Table.');
											} else if(masterstatus == 'MDDRNOTFOUND'){
												$('#error_dlno').text('Debit Account Of Biller Id Not Found In Master Table.');
											} if(userstatus == 'BTCRFOUND'){
												$('#error_dlno').text('Biller Id is already associated with the "Credit Account", please input another.');
											} 
											 
										} 
			
										
										if(flag) {
											
											$('#billerId').val($('#billerId').val().toUpperCase());
											var spanValues = modBankAccVals("MODIFY");
											
								 			searchTdRow = '#'+searchTrRows+"#tr-"+index1 +' > td';
								 			$(searchTdRow).each(function(index,value) {
								 				if(index == 1){
													$(this).text(modTabArry[0]);
												}if(index == 2){
													$(this).text(modTabArry[1]);
												}if(index == 3){
													$(this).text(modTabArry[2]);
												}if(index == 4){
													$(this).text(modTabArry[3]);
												} 
											}); 
								 			
								 			$("#multi-row span").each(function(index,value) { 
								 				 if($(this).attr("index") == index1 ) {  
													 $(this).attr("hid-names",modHeaderBodyArry[0]);
													 $(this).text(modHeaderBodyArry[1]); 
													 return;
												 }
											}); 
										 
											clearVals();   
											alignSerialNo("#tbody_data > tr");
											
											//Hide Update Button and Display Add Button
											$('#mod-biller').hide();
											$('#add-biller').show();
										
										} else {
											 $('#billerMsg').text('');
											 $('#error_dlno').text('');
										} 
									}
							} else {
								$('#billerMsg').text(v_message);
							} 
					}); 
				} else {
					  
					$("#error_dlno").text('');
					$('#billerMsg').text(dat1);
			 	} 
			} else {
				return false;				
			}  
		}); 
		
		// The below event is to Edit row on selecting the delete button 
		$('#edit-biller').live('click',function() { 
			$("#form2").validate().cancelSubmit = true;
			
			index1 = $(this).attr('index');  
			var parentId =$(this).parent().closest('tbody').attr('id'); 
			searchTrRows = parentId+" tr"; 
			searchTdRow = '#'+searchTrRows+"#tr-"+index1 +' > td';
			
			var idSearch = "";
			var hidnames = "";
			var text_val = ""; 
	 	 
			var spanData = $("#multi-row > span#hidden_span_"+index1);
			hidnames =  $("#multi-row > span#hidden_span_"+index1).attr('hid-names');
			text_val =  $("#multi-row > span#hidden_span_"+index1).text();  
			
			var hidarr=hidnames.split(",");
			var textarr=text_val.split(","); 
			 
			
			$(hidarr).each(function(index,value) { 
				 if(jQuery.inArray( value, listid ) != -1){
					$('#'+value).find('option').each(function( i, opt ) { 
						if( opt.value == textarr[index] ) {
							$(opt).attr('selected', 'selected');
							$('#'+value).trigger("liszt:updated");
						}
					}); 
				} else {	
					$("#"+value).val(textarr[index] == undefined ? " " : textarr[index] .trim()); 
				}
			}); 
			
			//Hide Add Button and Display Update Button
			$('#mod-biller').show();
			$('#add-biller').hide();
			
		});
		
		// The below event is to delete the entire row on selecting the delete button 
		$("#delete-biller").live('click',function() { 
			var delId = $(this).attr('index');
			$(this).parent().parent().remove();
	 		
			var spanId = "";
			$('#multi-row > span').each(function(index){  
				spanId =  $(this).attr('index'); 
				if(spanId == delId) {
					$(this).remove();
				}
			}); 
			
			clearVals();
			// Aligning the serial number
			alignSerialNo("#tbody_data > tr");
			
			//Show Add Button and Hide Update Button
			$('#mod-biller').hide();
			$('#add-biller').show();
			$('.tooltip').remove();
			$('#billerMsg').text('');
			//$('#error_dlno').text('');
		}); 
		
		// Clear Form Records Row Starts Here.
		$('#row-cancel').live('click', function () {
			$("#error_dlno").text(''); 
			 clearVals(); 
			 
			//Show Add Button and Hide Update Button
			$('#mod-biller').hide();
			$('#add-biller').show();
		}); 
		
		
		// To do regular expression
		
		//([a-zA-Z0-9_-]*) 
		$('#billerType').live('focus',function (e) {
 			$('#regex').val(regPrepare($(this).val().toUpperCase())); 
		}).live('blur',function(e) { 
			$('#regex').val(regPrepare($(this).val().toUpperCase()));
		});
		
});

function regPrepare(val){
	var str=")([a-zA-Z0-9_-]*)";
	var str1="(";
	
	return str1+val+str;	
}

/** Form2 Add Row Validation Ends*/
</script>
</head> 
<body> 
	  <div id="content" class="span10">  
		    <div> 
				<ul class="breadcrumb">
				  <li> <a href="home.action">Home</a> <span class="divider"> &gt;&gt; </span> </li>
				  <li><a href="mpesaAccManagement.action">Mpesa A/C Management</a><span class="divider"> &gt;&gt; </span> </li>
				   <li><a href="#">Modify Biller Type</a></li>
				</ul>
			</div>  
			
			<table height="3">
			 <tr>
			    <td colspan="3">
			    	<div class="messages" id="messages"><s:actionmessage /></div>
			    	<div class="errors" id="errors"><s:actionerror /></div>
			    </td>
		    </tr>
		 </table>
	<form name="form1" id="form1" method="post" autocomplete="off" style="margin: 0px 0px 50px">	 	
		<div class="row-fluid sortable"> 
			<div class="box span12">  
				<div class="box-header well" data-original-title>
					 <i class="icon-edit"></i>Biller Type Details  
					<div class="box-icon">
						<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
						<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
						
					</div>
				</div>
							
				<div class="box-content">
					<fieldset>
 					<table width="98%"  border="0" cellpadding="5" cellspacing="1" 
						class="table table-striped table-bordered bootstrap-datatable " > 
						
							<tr > 
								<td width="20%"><label for="Select Institute"><strong>Select Core Banking<font color="red">*</font></strong></label></td>
								<td width="30%" colspan=3> <s:select cssClass="chosen-select" 
										headerKey="" 
										headerValue="Select"
										list="payBillBean.responseJSON.institutesel" 
										name="institute" 
	 									id="institute" 
	 									value="payBillBean.institute" 
										requiredLabel="true" 
										theme="simple"
										data-placeholder="Choose Institute..." 
	 									 />  &nbsp; <label id="institute-id" class="errors" ></label>
	 							</td>								 
							</tr> 
							<tr > 
								<td><label for="Select Operator"><strong>Select Mobile Network Operator<font color="red">*</font></strong></label></td>
								<td> <s:select cssClass="chosen-select" 
										headerKey="" 
										headerValue="Select"
										list="payBillBean.responseJSON.operatorsel" 
										name="operator" 
	 									id="operator" 
	 									value="payBillBean.operator" 
										requiredLabel="true" 
										theme="simple"
										data-placeholder="Choose Operator..." 
	 									 />  &nbsp; <label id="operator-id" class="errors" ></label>
	 							</td> 								 
							</tr> 
							 <tr> 
								<td ><label for="Biller Type"><strong>Biller Type(Client Details)<font color="red">*</font></strong></label></td>
								<%-- <td ><input type="text" name="billerType"  id="billerType" required=true  value="<s:property value='payBillBean.billerType' />"   />   </td> --%>
								<td ><s:property value='payBillBean.billerType' /><input type="hidden" name="billerType"  id="billerType" required=true  value="<s:property value='payBillBean.billerType' />"   />   </td>
										 		 
							</tr> 
							<tr > 
								<td><label for="Biller Type Description"><strong>Biller Type Description<font color="red">*</font></strong></label></td>
								<td><textarea name="billerTypeDescription"  id="billerTypeDescription"   required=true style="height: 69px; width: 453px;" ><s:property value='payBillBean.billerTypeDescription' /></textarea> </td> 
								 
							</tr> 
							<tr> 
								<td><label for="Regular Expression"><strong>Regular Expression</strong></label></td>
								<td> <input type="text" name="regex"  id="regex" value="<s:property value='payBillBean.regex' />" readonly  />   </td>  
							</tr> 
							<tr >  
								<td><label for="Has Fixed Amount ?"><strong>Has Fixed Amount ?<font color="red">*</font></strong></label></td>
								<td><input type="radio" id="fixed-amt-y" name="fixedamountcheck" value="Y" checked> Yes &nbsp;
									 <input type="radio" id="fixed-amt-n" name="fixedamountcheck" value="N"> No
									 <input type="hidden" name="fixedamountcheckval"  id="fixedamountcheckval" value="<s:property value='payBillBean.fixedamountcheckval' />"    />  
								</td>							
							</tr>  
							<tr id="fixed-amt-tr"> 
								<td><label for="Fixed Amount(ksh)"><strong>Fixed Amount(ksh)<font color="red">*</font></strong></label></td>
								<td> <input type="text" name="amount"  id="amount" value="<s:property value='payBillBean.amount' />" required=true   />   </td>  
							</tr> 
							<tr id="biller-len-tr"> 
								<td><label for="Biller ID Length"><strong>Biller ID Length </strong></label></td>
								<td> <input type="text" name="billerIdLen"  id="billerIdLen" value="<s:property value='payBillBean.billerIdLen' />" required=true   />   </td>  
							</tr>  
							<tr > 
								<td><label for="System Integration Mode"><strong>System Integration Mode<font color="red">*</font></strong></label></td>
								<td> <s:select cssClass="chosen-select" 
										headerKey="" 
										headerValue="Select"
										list="payBillBean.responseJSON.systemmodessel" 
										name="systemmodes"
										value="payBillBean.systemmodes" 
	 									id="systemmodes" 
										requiredLabel="true" 
										theme="simple"
										data-placeholder="Choose System Mode..." 
	 									 />  &nbsp;  
	 							</td>  
							</tr>  
							<tr >  
								<td><label for="Has Biller Id ?"><strong>Has Biller Id ?<font color="red">*</font></strong></label></td>
								<td><input type="radio" id="billerid-y" name="billeridcheck" value="Y" > Yes &nbsp;
									 <input type="radio" id="billerid-n" name="billeridcheck" value="N" checked> No
									 <input type="hidden" name="billeridcheckval"  id="billeridcheckval" value="<s:property value='payBillBean.billeridcheckval' />"    />  
								</td>							
							</tr>
							<tr class="acctbillertype">  
								<td><label for="Credit Account"><strong>Credit Account</strong></label></td>
								<td><input type="text" name="bfubCreditAccount"  id="bfubCreditAccount" value="<s:property value='payBillBean.bfubCreditAccount' />"   />  </td>							
							</tr> 
							<tr class="acctbillertype">  
								<td><label for="Debit Account"><strong>Debit Account</strong></label></td>
								<td><input type="text" name="bfubDebitAccount"  id="bfubDebitAccount" value="<s:property value='payBillBean.bfubDebitAccount' />"   /> 
 									<input type="hidden" name="selectBoxData"  id="selectBoxData"   value="<s:property value='payBillBean.selectBoxData' />"  />  
								</td>							
							</tr>
							<tr>  
								<td> <label for="Maker Id"><strong>Maker Id</strong></label></td>
								<td><s:property value='payBillBean.makerId' />  <input type="hidden" name="makerId"  id="makerId"   value="<s:property value='payBillBean.makerId' />"  /> </td>  
							</tr>  
							<tr>  
								  
								<td><label for="Maker Date"><strong>Maker Date </strong></label></td>
								<td><s:property value='payBillBean.makerDttm' />   <input type="hidden" name="makerDttm"  id="makerDttm"   value="<s:property value='payBillBean.makerDttm' />"  />
							</tr>  
							<tr>															
								<td> <label for="Authorized Id"><strong>Authorized Id</strong></label></td>
								<td><s:property value='payBillBean.authId' />   <input type="hidden" name="authId"  id="authId"   value="<s:property value='payBillBean.authId' />"  /></td> 
								    
							</tr>
							<tr>															
								  
								<td><label for="Authorized Date"><strong>Authorized Date</strong></label></td>
								<td><s:property value='payBillBean.authDttm' />   
								<input type="hidden" name="authDttm"  id="authDttm"   value="<s:property value='payBillBean.authDttm' />"  />
								<input type="hidden" name="id"  id="id" value="<s:property value='payBillBean.id' />"  />
							</tr> 
					</table>
				</fieldset>  
			</div>
		</div>
		</div>
	</form>
	
	<div id="dialog" title="Confirmation Required" style="display:none">
		   Proceed ?
	</div>
   	<div class="form-actions" >
         <input type="button" class="btn btn-success" name="btn-submit" id="btn-submit" value="Submit" width="100" ></input>&nbsp;
         <input type="button" class="btn btn-info" name="btn-Cancel" id="btn-Cancel" value="Back" width="100" ></input>&nbsp;
         <span id ="error_dlno" class="errors"></span>
       </div>  
               						 
	</div>
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
    
    if($('#fixedamountcheckval').val() == 'Y'){
    	$('#fixed-amt-y').attr('checked','');
    	$('#fixed-amt-n').removeAttr('checked');
    	$('#fixed-amt-tr').show();
	} else {
		$('#fixed-amt-n').attr('checked','');
		$('#fixed-amt-y').removeAttr('checked');
		$('#fixed-amt-tr').hide();
	}
    clearVals();
    if($('#billeridcheckval').val() == 'Y' &&  $('#billerid-y').attr("checked")){
    	$('#billerid-div').show();
    	
    	$('.acctbillertype').hide();
    	$('#bfubCreditAccount').val('');
    	$('#bfubDebitAccount').val(''); 
    	$('#biller-len-tr').show();
	} else {
		
		$('#billerid-div').hide();
		$('.acctbillertype').show();
		$('#biller-len-tr').hide();
	}
});	  
</script>
</body>
</html> 