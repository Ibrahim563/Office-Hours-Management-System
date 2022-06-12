/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;
import java.util.Date;
import java.util.Properties;
import javax.mail.*;  
import javax.mail.internet.*;  
import javax.activation.*;  

/**
 *
 * @author Pc
 */
public class MAIL {
    public void SendMail(String m_to,String m_subject,String m_text) throws MessagingException{
        String  d_email = "fcaiservice@gmail.com";
        String d_uname = "fcaiservice";
        String d_password = "waleedkamal";
        String d_host = "smtp.gmail.com";
        String d_port  = "465"; //465,587;
        Properties props = new Properties();
        props.put("mail.smtp.user", d_email);
        props.put("mail.smtp.host", d_host);
        props.put("mail.smtp.port", d_port);
        props.put("mail.smtp.starttls.enable","true");
        props.put("mail.smtp.debug", "true");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.socketFactory.port", d_port);
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.socketFactory.fallback", "false");
        
        MyAuth auth = new MyAuth();
        Session session = Session.getInstance(props, auth);
        session.setDebug(true);
        MimeMessage msg = new MimeMessage(session);
        msg.setText(m_text);
        msg.setSubject(m_subject);
        msg.setFrom(new InternetAddress(d_email));
        msg.addRecipient(MimeMessage.RecipientType.TO, new InternetAddress(m_to));
        Transport transport = session.getTransport("smtps");
        transport.connect(d_host, 465, d_uname, d_password);
        transport.sendMessage(msg, msg.getAllRecipients());
        transport.close();
        
    }
}
