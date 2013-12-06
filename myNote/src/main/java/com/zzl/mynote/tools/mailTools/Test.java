package com.zzl.mynote.tools.mailTools;


public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		MailSenderInfo mailInfo = new MailSenderInfo();    
	      mailInfo.setMailServerHost("smtp.qq.com");    
	      mailInfo.setMailServerPort("25");    
	      mailInfo.setValidate(true);    
	      mailInfo.setUserName("895842346@qq.com");    
	      mailInfo.setPassword("123456ww");
	      mailInfo.setFromAddress("895842346@qq.com");    
	      mailInfo.setToAddress("895842346@qq.com");    
	      mailInfo.setSubject("xxxxxxxxxx");    
	      mailInfo.setContent("xxxxxxxxxxxx=");    
	      SimpleMailSender sms = new SimpleMailSender();   
//        sms.sendTextMail(mailInfo);
        sms.sendHtmlMail(mailInfo);   

	}

}
