package utils;

import java.util.Properties;

import javax.mail.Session;
import javax.mail.Authenticator;
import javax.mail.Transport;
import javax.mail.PasswordAuthentication;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

public class EmailSender {
    static Properties properties=new Properties();

    static{
        properties.put("mail.transport.protocol","smtp");
        properties.put("mail.smtp.host","smtp-mail.outlook.com");
        properties.put("mail.smtp.port","587");
        properties.put("mail.smtp.auth","true");
        properties.put("mail.smtp.starttls.enable","true");
    }

    public static boolean sendEmail(String toEmail,String subject,String message){
        boolean flag=false;
        Session session=Session.getInstance(properties,new EmailAuthenticator());
        MimeMessage mm=new MimeMessage(session);
        try{
            mm.setFrom("sparshshrivastava2307@outlook.com");
            mm.setRecipients(Message.RecipientType.TO, toEmail);
            mm.setSubject(subject);
            mm.setContent(message,"text/html");
            Transport.send(mm);
            flag=true;
        }catch(MessagingException e){
            e.printStackTrace();
        }
        return flag;
    }

    public static boolean sendOTPEmail(String email,String otp){
        String otpMail="<h1>Welcome to Tentwale</h1>"+"<br><br><p>Use this otp to confirm signup!!<p><b>"+otp+"</b>";
        boolean f=sendEmail(email,"TentWale signup OTP",otpMail);
        return f;
    }

    public static boolean resetEmail(String email){
        String subject="Reset Password Email";
        String message="<h1>Welcome to Tentwale</h1>"+"<br><br><p>Use this link to reset your password!!<p><b>"+"<a href='http://localhost:8080/tentwale/reset_password.do?email="+email+"'>Navigate throught this link</a></b>";
        boolean f=sendEmail(email,subject,message);
        return f;
    }
}

class EmailAuthenticator extends Authenticator{
    public PasswordAuthentication getPasswordAuthentication(){
        return new PasswordAuthentication("sparshshrivastava2307@outlook.com","SS23072002ss");
    }
}
