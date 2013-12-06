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
	      mailInfo.setPassword("123456ww");//您的邮箱密码    
	      mailInfo.setFromAddress("895842346@qq.com");    
	      mailInfo.setToAddress("895842346@qq.com");    
	      mailInfo.setSubject("我就测试一下什么都不干");    
	      mailInfo.setContent("设置邮箱内容 如http://www.guihua.org 中国桂花网 是中国最大桂花网站==");    
	         //这个类主要来发送邮件   
	      SimpleMailSender sms = new SimpleMailSender();   
//        sms.sendTextMail(mailInfo);//发送文体格式    
        sms.sendHtmlMail(mailInfo);//发送html格式   

	}

}
