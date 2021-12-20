package com.ceva.base.common.dao;

import java.sql.Connection;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.log4j.Logger;
import org.json.JSONObject;

import com.ceva.unionbank.services.core.ServiceManager;
import com.ceva.unionbank.util.ConnectionHelper;

public class CommonOtploginDAO {

	private static Logger logger = Logger.getLogger(CommonOtploginDAO.class);

	public static final String ADD_ACCOUNT = "ADD_ACT";
	public static final String DEV_REP = "DEV_REP";
	public static final String CHANGE_PASSWORD = "CHANGE_PASSWORD";
	public static final String CHANGE_PIN = "CHANGE_PIN";
	public static final String ADD_BEN = "ADD_BEN";
	public static final String DEV_REP_REQ = "DEV_REP_REQ";

	public static final String FORGET_PASSWORD = "FORGET_PASSWORD";
	public static final String INVITEFRIEND = "INVITEFRIEND";
	public static final String TOKENLOGINAUTH = "TOKENLOGINAUTH";
	public static final String REV_PAY = "REV_PAY";

	//public static JSONObject sendSms(String userId, String type, JSONObject extrainfo, String channel) {
		/*
		 * 
		 * Connection connection = null; PreparedStatement pstmt = null ; String
		 * fetchuserdataQuery=null; ResultSet rs = null; JSONObject smsRequest = new
		 * JSONObject(); JSONObject smsRespJson = new JSONObject(); String
		 * fisrName=null,actNo=null,mobileNo=null,smsmessage=null ;
		 * 
		 * try {
		 * 
		 * connection = ConnectionHelper.getConnection();
		 * 
		 * if("USSD".equals(channel)){
		 * 
		 * fetchuserdataQuery = "select distinct MCM.FIRST_NAME , "+
		 * " MAD.ACCT_NO , MCI.MOBILE_NUMBER   from MOB_CUSTOMER_MASTER MCM , MOB_ACCT_DATA MAD ,"
		 * + " MOB_CONTACT_INFO MCI "+
		 * " where MCM.ID=MAD.CUST_ID and MCM.ID=MCI.CUST_ID and "+
		 * " upper(MCI.MOBILE_NUMBER)=? and  MAD.PRIM_FLAG='P'";
		 * 
		 * }else{
		 * 
		 * fetchuserdataQuery =
		 * "select distinct  nvl(MCM.FIRST_NAME,'Customer')  , MAD.ACCT_NO , MCI.MOBILE_NUMBER  "
		 * +
		 * " from MOB_CUSTOMER_MASTER MCM , MOB_ACCT_DATA MAD , MOB_CONTACT_INFO MCI "+
		 * " where MCM.ID=MAD.CUST_ID and MCM.ID=MCI.CUST_ID and upper(MCM.USER_ID)=upper(?) and  MAD.PRIM_FLAG='P'"
		 * ;
		 * 
		 * }
		 * 
		 * logger.info("Fetch user status Query ["+fetchuserdataQuery+"]");
		 * 
		 * pstmt = connection.prepareStatement(fetchuserdataQuery); pstmt.setString(1 ,
		 * userId );
		 * 
		 * rs = pstmt.executeQuery();
		 * 
		 * while (rs.next()) {
		 * 
		 * fisrName = rs.getString(1); actNo = rs.getString(2); mobileNo =
		 * rs.getString(3);
		 * 
		 * }
		 * 
		 * if(fisrName!=null&&actNo!=null&&mobileNo!=null) {
		 * 
		 * if(type.equals(ADD_ACCOUNT)) { String reqactno =
		 * extrainfo.has("accountNumber")?extrainfo.getString("accountNumber"):"";
		 * smsmessage="Dear "+fisrName+",you have successfully added a new account no:"
		 * +reqactno+"" + " to your profile with username:"+userId+"." +
		 * "For enquiries call 07007007000.";
		 * 
		 * }else if(type.equals(DEV_REP)) { smsmessage="Dear "
		 * +fisrName+", you have successfully logged into your account from another device.If this action was not "
		 * + "performed by you,please call 07007007000"; }else if
		 * (type.equals(CHANGE_PASSWORD)) { smsmessage="Dear "
		 * +fisrName+", you have successfully changed your password on the UnionMobile App."
		 * + "If this action was not performed by you,please call 07007007000."; }else
		 * if (type.equals(CHANGE_PIN)) { smsmessage="Dear "
		 * +fisrName+", you have successfully changed your PIN on the UnionMobile App."
		 * + "If this action was not performed by you,please call 07007007000."; }else
		 * if (type.equals(ADD_BEN)) {
		 * 
		 * String
		 * benAccountName=extrainfo.has("accountname")?extrainfo.getString("accountname"
		 * ):""; smsmessage="Dear "
		 * +fisrName+", you have successfully added a new beneficiary "
		 * +benAccountName+" to your profile. " +
		 * "If this action was not performed by you, please call 07007007000."; }else
		 * if(type.equals(DEV_REP_REQ)) { String otp = extrainfo.has("otp") ?
		 * extrainfo.getString("otp") : "" ;
		 * smsmessage="Dear customer, kindly use one time pin "
		 * +otp+" to authenticate your device change request.";
		 * 
		 * } else if(type.equals(FORGET_PASSWORD)) {
		 * 
		 * String otp = createRandomNumber(6);
		 * MobileBankingDao.otpgenForRegistration(actNo , mobileNo , channel ,otp );
		 * smsmessage = "Dear customer, kindly use one time pin "
		 * +otp+" to authenticate your password change request.";
		 * smsRespJson.put("mobileno", mobileNo); smsRespJson.put("accountno", actNo );
		 * 
		 * } else if(type.equals(INVITEFRIEND)) {
		 * 
		 * String invitename = extrainfo.getString("invitename"); String userfullname =
		 * extrainfo.getString("userfullname"); String invmobileNo =
		 * extrainfo.getString("mobile"); mobileNo= CommonUtil.getMobNo(invmobileNo);
		 * logger.info("After change Mobileno ["+mobileNo+"] invitename["
		 * +invitename+"] userfullname["+userfullname+"]"); smsmessage =
		 * "Dear "+invitename+", "+userfullname+" has invited you to join UnionMobile."
		 * +
		 * "You can download the UnionMobile app from PlayStore,AppStore or Windows Store."
		 * ;
		 * 
		 *//**
			 * Date : 11-06-2018 Reason : Stop Sending sms for confirmation and stop
			 * charging customer for few sms . sending otp will get charged for customer
			 */
		/*
		 * 
		 * actNo="";
		 * 
		 * 
		 * } else if(type.equals(TOKENLOGINAUTH)) {
		 * 
		 * String otp = extrainfo.has("otp") ? extrainfo.getString("otp") : "" ;
		 * smsmessage ="Dear customer, kindly use one time pin "
		 * +otp+" to authenticate your transaction.";
		 * 
		 * } else if(type.equals(REV_PAY)){
		 * 
		 * String webguid=extrainfo.has("webguid")?extrainfo.getString("webguid"):"";
		 * String
		 * amountpaid=extrainfo.has("amountpaid")?extrainfo.getString("amountpaid"):"";
		 * String revname=extrainfo.has("revname")?extrainfo.getString("revname"):"";
		 * 
		 * String receipturl =
		 * extrainfo.has("receipturl")?extrainfo.getString("receipturl"):""; String
		 * receiptID = extrainfo.has("receiptID")?extrainfo.getString("receiptID"):"";
		 * String receiptCode =
		 * extrainfo.has("receiptCode")?extrainfo.getString("receiptCode"):"";
		 * 
		 * 
		 * smsmessage = "Dear "+fisrName+", LASG payment was successful." +
		 * "Amount:"+amountpaid+" Revenue Name:"+revname+" Date:"+getDateFomate();
		 * 
		 * smsmessage = "Dear Customer, LASG payment of "+amountpaid+" for "
		 * +revname+" was successful." +
		 * "Receipt ID:"+receiptID+" Receipt Code:"+receiptCode+" Receipt URL:"
		 * +receipturl+" Date:"+getDateFomate() ;
		 * 
		 *//**
			 * Date : 11-06-2018 Reason : Stop Sending sms for confirmation and stop
			 * charging customer for few sms . sending otp will get charged for customer
			 */
		/*
		 * 
		 * actNo="";
		 * 
		 * }
		 * 
		 * smsRequest.put("mobileNo", mobileNo); smsRequest.put("message", smsmessage );
		 * smsRequest.put("source", channel); smsRequest.put("accountNo", actNo);
		 * smsRequest.put("transtype",type);
		 * 
		 * logger.info("smsRequest ["+smsRequest+"]"); JSONObject smsresp = new
		 * ServiceManager().sendSMS(smsRequest); logger.info("smsresp ["+smsresp+"]");
		 * 
		 * if(smsresp.getBoolean("isValid")) { smsRespJson.put("respcode", "00");
		 * smsRespJson.put("respdesc", "SUCCESS");
		 * 
		 * }else{
		 * 
		 * smsRespJson.put("respcode", "02"); smsRespJson.put("respdesc",
		 * "SMS sending Fail"); }
		 * 
		 * }
		 * 
		 * 
		 * } catch (Exception ex) {
		 * 
		 * ex.printStackTrace();
		 * 
		 * } finally {
		 * 
		 * ConnectionHelper.closePreparedStatement(pstmt);
		 * ConnectionHelper.closeResultSet(rs);
		 * ConnectionHelper.closeConnection(connection);
		 * 
		 * }
		 * 
		 * return smsRespJson;
		 * 
		 * 
		} */

	public static String getDateFomate() {
		// Feb 26 2018 at 14:52
		DateFormat dateFormat = new SimpleDateFormat("MMM dd yyyy");
		DateFormat dateFormat2 = new SimpleDateFormat("HH:mm");
		Date date = new Date();
		System.out.println(dateFormat.format(date));
		return dateFormat.format(date).concat(" at ").concat(dateFormat2.format(date));
	}

	public final static String createRandomNumber(long len) {

		if (len > 18)
			throw new IllegalStateException("To many digits");
		long tLen = (long) Math.pow(10, len - 1) * 9;

		long number = (long) (Math.random() * tLen) + (long) Math.pow(10, len - 1) * 1;

		String tVal = number + "";

		if (tVal.length() != len) {
			throw new IllegalStateException("The random number '" + tVal + "' is not '" + len + "' digits");
		}

		return tVal;

	}

	public static void main(String[] args) {

	}

	public static net.sf.json.JSONObject sendSms(String phoneno, String tokenloginauth2,
			net.sf.json.JSONObject smsRequest, String channel) {

		Connection connection = null;
		JSONObject smsRequest1 = new JSONObject();
		net.sf.json.JSONObject smsRespJson = new net.sf.json.JSONObject();
		String smsmessage = null;
		
		try {

			connection = ConnectionHelper.getConnection();

		
			String otp = smsRequest.has("otp") ? smsRequest.getString("otp") : "";
			smsmessage = "Dear customer, kindly use one time pin " + otp + " to authenticate your transaction.";
			
			logger.info("sendsmsnew [" + smsmessage + "]");
			
			smsRequest1.put("mobileNo", phoneno);
			smsRequest1.put("message", smsmessage);
			smsRequest1.put("source", channel);
			//smsRequest1.put("accountNo", actNo);
			//smsRequest1.put("transtype", type);

			logger.info("smsRequest [" + smsRequest1 + "]");
			JSONObject smsresp = new ServiceManager().sendSMS(smsRequest1);
			//send SMS already available in agent-wallet-integrator.2.1.1v
			logger.info("smsresp [" + smsresp + "]");

			if (smsresp.getBoolean("isValid")) {
				smsRespJson.put("respcode", "00");
				smsRespJson.put("respdesc", "SUCCESS");

			} else {

				smsRespJson.put("respcode", "02");
				smsRespJson.put("respdesc", "SMS sending Fail");
			}

			
			}catch (Exception e) {
				e.printStackTrace();
			
		}

		return smsRespJson;

	}

}
