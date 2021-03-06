
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="com.ceva.base.common.utils.CevaCommonConstants"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<%String ctxstr = request.getContextPath(); %>
<% String appName= session.getAttribute(CevaCommonConstants.ACCESS_APPL_NAME).toString(); %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Create Entity</title>
 


<script type='text/javascript'>

var val = 1;
var rowindex = 0;
var colindex = 0;

$(function(){
var data = {
    "ReportFrequency": [
		{
        "Position": "Not Required",
        "Name": {
			"0":"Not Required"             
        }},
        {
        "Position": "Daily",
        "Name": {
			"0":"Not Required",
            "1": "1",
            "2": "2",
            "3": "3",
			"4": "4",
            "5": "5",
            "6": "6",
			"7": "7",
			"8": "8",
            "9": "9",
            "10": "10",
			"11": "11",
            "12": "12",
            "13": "13",
			"14": "14",
			"15": "15",
            "16": "16",
            "17": "17",
			"18": "18",
            "19": "19",
            "20": "20",
			"21": "21",
			"22": "22",
            "23": "23",
            "24": "24",
			"25": "25",
            "26": "26",
            "27": "27",
			"28": "28",
			"29": "29",
            "30": "30",
			"31": "31"
        }},
    {
        "Position": "Weekly",
        "Name": {
			"0": "Not Required",
            "11": "01-Sunday",
            "12": "02-Monday",
            "13": "03-Tuesday",
			"14": "04-Wednesday",
			"15": "05-Thursday",
			"16": "06-Friday",
			"17": "07-Saturday"
        }},
    {

        "Position": "Monthly",
        "Name": {
			"0": "Not Required",
            "1": "1",
            "2": "2",
            "3": "3",
			"4": "4",
            "5": "5",
            "6": "6",
			"7": "7",
			"8": "8",
            "9": "9",
            "10": "10",
			"11": "11",
            "12": "12",
            "13": "13",
			"14": "14",
			"15": "15",
            "16": "16",
            "17": "17",
			"18": "18",
            "19": "19",
            "20": "20",
			"21": "21",
			"22": "22",
            "23": "23",
            "24": "24",
			"25": "25",
            "26": "26",
            "27": "27",
			"28": "28",
			"29": "29",
			"30": "30",
			"31": "31" 
        }},
	{
        "Position": "Quarterly",
        "Name": {
			"0":"Not Required",
			"Q1,Q2,Q3,Q4":"All",
            "Q1": "Jan-Mar",
            "Q2": "Apr-Jun",
            "Q3": "Jul-Sep",
			"Q4": "Oct-Dec"
        }},
	{
        "Position": "Yearly",
        "Name": {
			"0": "Not Required",
            "11": "01-January",
            "12": "02-February",
            "13": "03-March",
			"14": "04-April",
			"15": "05-May",
			"16": "06-June",
			"17": "07-July",
			"18": "08-Auguest",
			"19": "09-September",
			"20": "10-October",
			"21": "11-November",
			"22": "12-December"
        }}
    ]
};

	var obj = {
			  "hrs": "12"
			  //"min": "59" 
			};
			
	/*var timeArray = new Array(23,59,59);
	 
	$.each( timeArray, function( index, value ){
		conso	le.log(index+"<=======>"+value ); 
	});*/
 
	$.each( obj, function( key, value ) { 
		var i = 0;
		 
		for (i = 1; i <= value; i++ ) { 
			var options = $('<option/>', {value: i , text: i});
			 $('#'+key).append(options);
		}
	});
	
$.each(data.ReportFrequency, function(i, v) {
    // create option with value as index - makes it easier to access on change
    var options = $('<option/>', {value: v.Position, text: v.Position}).attr('data-id',i);    
    // append the options to job selectbox
    $('#Frequency').append(options);
});

// bind change event
	$('#Frequency').change(function() {
		// cache this
		var $el = $(this); 
		// get data-id attr from selected option 
	   // var selid = $('#Frequency option:selected').text();
		 var selid = $('option:selected',this).val(); 
		 
		 $( "#addText" ).text( "Select "+selid );
		// empty select
		 if(selid == 'Daily') {
			selid = 1; 
		 } else if (selid == 'Weekly') {
			selid = 2;
		 } else if (selid == 'Monthly') {
			selid = 3;
		 } else if (selid == 'Quarterly') {
			selid = 4;
		 } else if (selid == 'Yearly') {
			selid = 5;
		 } else if (selid == 'Not Required') {
			selid = 0;
		 } 
		
		$('#FrequencyData').empty();
		// get name values for selected option
		
		if(selid != 0 && selid != 1) {
			$('#freqcont').show();
			$('#FrequencyData').show();
			$('#hrs').hide();
			//$('#min').hide();
			$('#daytype').hide(); 
			//$('#timepick').hide();
			$('#FrequencyData').show();
			$.each(data.ReportFrequency[selid].Name, function(i, v) {
				// create option elements
				var options = $('<option/>', {value: v, text: v});
				// append the options to name selectbox
				$('#FrequencyData').append(options);
			});  
		} else if(selid == 1){
			$('#hrs').show();
			//$('#min').show();
			$('#daytype').show(); 
			$('#freqcont').show();
			$('#FrequencyData').hide();
		} else {
			$('#freqcont').hide();
			$('#FrequencyData').hide();
			$('#hrs').hide();
			//$('#min').hide();
			$('#daytype').hide(); 
		}
	
	}).change();// trigger change() on page load to fill name selectbox
 
		var arrayData = {
			'schTableInsertion' : '${responseJSON.reportSchRecords}'
		};
			
 		 $.each(arrayData, function(selectKey, arrvalue ){ 
			//console.log("arrvalue["+arrvalue+"]");    
			var json = $.parseJSON(arrvalue);  
			 
			 $.each(json, function(i, v) {
				  //console.log("key["+v.TxnRefNo+"]  value["+v.frequencies+"]");    
				  var addclass = "";
							
				if(val % 2 == 0 ) {
					addclass = "even";
					val++;
				}
				else {
					addclass = "odd";
					val++;
				}  
				var rowCount = $('#tbody_data > tr').length;
			
				rowindex = ++rowindex;
				colindex = ++ colindex; 
				 var appendTxt = "<tr class="+addclass+" index='"+rowindex+"'> "+
									"<td class='col_"+colindex+"'> &nbsp;"+rowindex+"</td>"+
									"<td class='col_'><input type='hidden' name='frequencies' value='"+v.frequencies+"' />"+v.frequencies+"</td>"+	
									"<td class='col_'><input type='hidden' name='dateTime' value='"+v.dateTime+"' />"+v.dateTime.split("##")[1]+" </td>"+ 
									"<td class='col_'><input type='hidden' name='emailids' value='"+v.emailids+"' />"+v.emailids+"</td>"+
									"<td class='col_'><input type='hidden' name='reports' value='"+v.reports+"' /> "+v.reports.split("##")[1]+" </td> "+
									"<td class='center '>  <a class='btn btn-min btn-danger' href='#' id='deleteemail'> <i class='icon-trash icon-white'></i> </a></td></tr>";
			 
				 $("#tbody_data").append(appendTxt);	 
			 });  
		 
		}); 
		
		var arrayData = {
			'reportname' : '${responseJSON.reportDetails}'
		}; 
		
		$.each(arrayData, function(selectKey, arrvalue ){ 
			var json = $.parseJSON(arrvalue); 
			var options = ''; 
			 
			options =$('<option/>', {value: 'Not Required', text: 'Not Required'});  
			$('#'+selectKey).append(options); 
			
			 $.each(json, function(i, v) {
				 options = $('<option/>', {value: v.key, text: v.val});    
				 $('#'+selectKey).append(options);
			 });  
		 
		}); 
		
		
		$('#submitDat').live('click',function() {
			//alert('here');
			/*var submit = false;
			var searchRow = $("#DataTables_Table_0 tbody tr").length;  
			if(searchRow > 0) {  
				
				$("#dialog-confirm" ).dialog({
				  resizable: false,
				  height:140,
				  modal: true,
				  buttons: {
					"Schedule Confimation": function() {
					 submit = true;
					  $( this ).dialog("close");  
					},
					Cancel: function() {
					  $( this ).dialog( "close" );
					}
				  }
				});  
			} else {
			
				$("#dialog-close" ).dialog({
				  resizable: false,
				  height:140,
				  modal: true,
				  buttons: { 
					"Close": function() {
					  $( this ).dialog( "close" );
					}
				  }
				}); 
				//alert('Please add reports to schedule');
			} */ 
			 
		}); 
		
		 
		
	  
			$("select").change(function() {
				var id = $(this).attr('id');
				//console.log("id ==> "+id);
				if( $('#'+id+'  option:selected').text() != 'Not Required') {
					$('#'+id).removeAttr('style');
					//$('td.reportnameTd > span').text(''); 
			   } else if($('#'+id+'  option:selected').text().indexOf('Not Required') !=-1 ) {
				
			   }
			   
			   if( id == 'hrs' || id == 'daytype') {
					$('#'+id).css({"display" : "inline-block",
									"width":"60px"});
			   }
			}); 
			
			$("#emails").keypress(function() {
				var id = $(this).attr('id');
				//console.log("id ==> "+id);
				if( $('#'+id+'  option:selected').text() != 'Not Required') {
					$('#'+id).removeAttr('style');
			   }  
			});  
			
			// The below event is to delete the entire row on selecting the delete button 
			$('#deleteemail').live('click',function() {  
				$(this).parent().parent().remove();
				if($('#tbody_data > tr').length == 0) { rowindex = 0; colindex=0; }
			}); 
			
			var index = 0;
			// The below code is to fetch the row index from the add row table  
			//$('table#DataTables_Table_0 tbody tr').live('click',function() { 	
				//  index = $(this).attr('index');  
			//});
			
			// The below code is to fetch the <td> columns and setting to the respective input types 
			$('#editDat').live('click',function() {
				index = $(this).attr('index');  
				var searchRow = "DataTables_Table_0 tbody tr:eq("+(--index)+") td"; 
				$('#'+searchRow).each(function (indexTd) {
					// alert("index posting in loop is ==> "+indexTd); 
					 if (indexTd == 1) {
						// Frequency
					 } else if(indexTd == 2) {
						// Time or Date
					 } else if(indexTd == 3) {
						// email ids
					 } else if(indexTd == 4) {
						// Reports
						alert($(this).text());
					 } 
					 
				});  
			});  
			
			$('#addCap').live('click',function() { 
				var v_report_name = '';
				var v_report_val = $("#reportname").val();
				var v_frequency = $("#Frequency option:selected").text();
				var v_frequency_data = $("#FrequencyData option:selected").text();
				var v_email =  $('#emails').val(); 
				var v_hrs =  $("#hrs option:selected").text();
				var v_day_type =  $("#daytype option:selected").text();
				var v_date_time = "";
				var textDate = '';
				
				$('#reportname').removeAttr('style');
				$('#emails').removeAttr('style');
				$('#Frequency').removeAttr('style');
				//$('#FrequencyData').removeAttr('style');
				//$("#hrs").removeAttr('style'); 
				
				
				if( (v_email != undefined && v_email != '') 
						&& (v_frequency != 'Not Required' && v_email != '')  
						&& (v_report_val != null && v_report_val != '' && v_report_val.indexOf('Not Required') == -1)  ) {
					
					if(v_frequency == 'Daily') { 
						
						if(v_day_type.indexOf("pm") !=-1 ) {
							 v_hrs = (parseInt(v_hrs) + 12);  
						} else {
							v_hrs = (v_hrs == 12 ? "0" : v_hrs);
						}
						v_hrs = (v_hrs < 10 ? "0"+v_hrs : v_hrs)+":00"; 
						v_date_time = v_hrs;
						textDate='Everyday - '+ ($("#hrs option:selected").text() + $("#daytype option:selected").text());
				 
						
					} else if(v_frequency == 'Weekly') {
						textDate=v_frequency_data.split('-')[1]+' - 12am';
						v_date_time= v_frequency_data.split('-')[1]+"~23:50";
					} else if(v_frequency == 'Monthly') {
						var ext = ""; 
						if( v_frequency_data == 2 || v_frequency_data == 22 ) ext = 'nd';
						else if( v_frequency_data == 3 || v_frequency_data == 23 ) ext = 'rd';
						else if( v_frequency_data == 1 || v_frequency_data == 21 ||  v_frequency_data == 31 ) ext = 'st';
						else  ext = 'th';
						textDate=v_frequency_data+ext+' of every month - 12am';
						v_date_time= v_frequency_data+"~23:52";
					} else if(v_frequency == 'Quarterly') {
						//textDate='30 th of '+v_frequency_data+' - 12am';
						var textToPrint = "";
						var valForQuarterly = "";
						 
						if(v_frequency_data == "All" ){
							textToPrint = "Every Last Day Of Quarterly";
							valForQuarterly = "ALLQ~3,6,9,12";
						}
						if(v_frequency_data == 'Q1'){
							textToPrint = "End Of 1st Quarterly";
							valForQuarterly = "Q1~3";
						}
						if(v_frequency_data == 'Q2'){
							textToPrint = "End Of 2nd Quarterly";
							valForQuarterly = "Q2~6";
						}
						if(v_frequency_data == 'Q3'){
							textToPrint = "End Of 3rd Quarterly";
							valForQuarterly = "Q3~9";
						}
						if(v_frequency_data == 'Q4'){
							textToPrint = "End Of 4th Quarterly";
							valForQuarterly = "Q4~12";
						}
						//textDate= v_frequency_data+' - 12am';
						textDate= textToPrint;
						v_date_time= valForQuarterly+"~23:54";
					} else if(v_frequency == 'Yearly') {
						textDate='30 th '+v_frequency_data.split('-')[1]+' - 12am';
						v_date_time= v_frequency_data.replace('-','~')+"~23:56";
					} 
					
					//console.log("textDate ::: "+ textDate);
					//console.log("v_date_time ::: "+ v_date_time);
					
					v_report_val =  $("#reportname").val().join(','); 
				 
					$('#reportname option:selected').each(function(i, item) {
						var rep = $(this).text(); 
						//rep = rep.substring(rep.indexOf('-')+1);
						console.log(rep);
						if(i == 0) v_report_name+= rep;
						else v_report_name+= ", " + rep; 
					}); 
					
					var addclass = "";
					
					if(val % 2 == 0 ) {
						addclass = "even";
						val++;
					}
					else {
						addclass = "odd";
						val++;
					}  
					var rowCount = $('#tbody_data > tr').length;
					
					rowindex = ++rowindex;
					colindex = ++ colindex; 
				
					var appendTxt = "<tr class="+addclass+" index='"+rowindex+"'> "+
										"<td> &nbsp;"+rowindex+"</td>"+
										"<td><input type='hidden' name='frequencies' value='"+v_frequency+"' />"+v_frequency+"</td>"+	
										"<td><input type='hidden' name='dateTime' value='"+(v_date_time+"##"+textDate)+"' />"+textDate+" </td>"+ 
										"<td><input type='hidden' name='emailids' value='"+v_email+"' />"+v_email+"</td>"+
										"<td><input type='hidden' name='reports' value='"+(v_report_val+"##"+v_report_name)+"' /> "+v_report_name+" </td> "+
										"<td>  <a class='btn btn-min btn-danger' href='#' id='deleteemail' index='"+rowindex+"'> <i class='icon-trash icon-white'></i> </a></td></tr>";
				 
					$("#tbody_data").append(appendTxt);	 
					$('#emails').val(''); 
					$('#Frequency').val('Select'); 
					$('#FrequencyData').hide();
					$('#freqcont').hide();
					$('#hrs').hide();
					$('#hrs').val('1'); 
					$('#reportname > option').removeAttr("selected"); 
					$('#Frequency,#FrequencyData').val("Not Required"); 
					 
				} else {  
					if( v_report_val == null || v_report_val.indexOf('Not Required') !=-1) {
					
						$('#reportname').css({"border-color": "red", 
									 "border-weight":"1px", 
									 "border-style":"solid"});
					} 
					if( v_email != undefined || v_email != '')	{			 
						$('#emails').css({"border-color": "red", 
										 "border-weight":"1px", 
										 "border-style":"solid"}); 
					}
					
					if( v_frequency == null || v_frequency.indexOf('Not Required') !=-1) {			 
						$('#Frequency').css({"border-color": "red", 
										 "border-weight":"1px", 
										 "border-style":"solid"});
									 
					} else {
					
						if(v_frequency == 'Daily') {
							if($("#hrs").val() == null ) {
								$('#hrs').css({"border-color": "red", 
											 "border-weight":"1px", 
											 "border-style":"solid"}); 
							}
							
						} else { 
							
						}
					}
					
				 }
				 
				
			});    
		}); 
</script>	
</head>
<body> 
<form method="post" id="form1" name="form1" class="form-horizontal" action="insertreportscheduled.action">
	<div id="content" class="span10">
				<div>
					<ul class="breadcrumb">
						<li>
							<a href="home.action">Home</a> <span class="divider">&gt;&gt;</span>
						</li> 
						<li><a href="#">Report Scheduler</a>
						</li>
					</ul>
				</div> 
  
	<table height="3">
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
				
	
		<div class="row-fluid sortable"> 
			<div class="box span12"> 
					<div class="box-header well" data-original-title>
						 <i class="icon-edit"></i>Scheduling Reports 
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							
						</div>
					</div>
				<div class="box-content">
						
				<fieldset>
							<div class="control-group">
								<label class="control-label" for="focusedInput">Report Name <font color=red>*</font></label>
								<div class="controls">
									<select name="reportname" id="reportname" multiple data-rel="chosen">  
								  </select>
								</div>
						</div>
  
						<div class="control-group">
								<label class="control-label" for="focusedInput">Frequency <font color=red>*</font></label>
								<div class="controls">
								  <select name="Frequency" id="Frequency">
								  </select> 
								</div>  
						  </div>
						<div class="control-group" id="freqcont">
								<label class="control-label" for="focusedInput">  <span id="addText"> </span> <font color=red>*</font></label>
								<div class="controls"> 
								  <select name="FrequencyData" id="FrequencyData"> 
								  </select>
								  <select name="hrs" id="hrs" style="width:60px"> 
									</select>  
									<select name="daytype" id="daytype" style="width:60px">
										<option value="am">am</option>
										<option value="am">pm</option>
									</select> 
								</div>  
						</div>	 
				 </fieldset>   
							
				  <div class="control-group">
					<table cellpadding=0 cellspacing=0  > 
					<tr>
						<td>
							<label class="control-label" for="Email">Email <font color=red>*</font></label>
							 <div class="controls">
							  <input  type="text"  id="emails" name="emails" />
							</div>
						</td> 
						<td> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<input type="button" class="btn" name="addCap" id="addCap" value="Add All" ></input></td>  
					</tr></table>
				  </div>
				  
					<div class="box-content">	  
						 
						<table width="100%" class="table table-striped table-bordered bootstrap-datatable " 
								id="DataTables_Table_0" >
						  <thead>
								<tr >
									<th width="1%"  >Sno</th>
									<th width="7%"  >Frequency</th>
									<th width="25%">Time/Day </th>
									<th width="25%">Email IDs</th>
									<th width="25%" >Reports</th>
									<th width="10%"  >Action</th> 
								</tr>
						  </thead>    
						  <tbody  id="tbody_data">
							 
						  </tbody>
						</table> 
					</div>
								 
								
				  <div class="form-actions">
					<input type="button" class="btn btn-primary" >Schedule Reports</input>
					<!-- <input type="button" name="submit" class="btn btn-primary" id="submitDat" value="Schedule Reports"/> -->
					<input type="button" class="btn " >Cancel</input>
 				  </div>
				  </div>
				</div>	 
				
				<div id="dialog-confirm" title="Confirmation Of Records" style="display:none">
				  <p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>Please click on confirm to schedule the reports.</p>
				</div> 
				<div id="dialog-close" title="No Records Selected" style="display:none">
				  <p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>Please add atleast one record to schedule.</p>
				</div> 
		</div> 
   </div> 
 </div>
</div> 
</form>
</body>
</html>