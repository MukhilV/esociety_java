package esoc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MailServ
 */
@WebServlet("/MailServ")
public class MailServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MailServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		
		HttpSession session1=request.getSession();
		String persontype=(String) session1.getAttribute("persontype");
		String email=(String) session1.getAttribute("email");
		String password=(String) session1.getAttribute("password");
		
		String subject=request.getParameter("subject");
		String body=request.getParameter("body");
		String to="";
		
		try {
			Dbcon obj=new Dbcon();
			Connection con=obj.createcon();
			
			String recepient="";
			String dummymail="";
			
			if(email.contentEquals("esocadmin@gmail.com") && password.contentEquals("admin")) {
				to=request.getParameter("to");
				dummymail=to;
				recepient="mukh17cs056@rmkcet.ac.in";
				
			}
			else {
				dummymail=email;
				recepient="mukhil99@gmail.com";
			}
			
			
			if(sendMail(recepient,subject,body,dummymail)) {
			System.out.println("Mail sent");
			request.setAttribute("mailstatus","Mail sent");
			}
			else {
				System.out.println("error");
				request.setAttribute("mailstatus","Sending Mail encountered some error");
			}
			RequestDispatcher rd=request.getRequestDispatcher("Feedback.jsp");            
			rd.include(request, response);
		}
		catch(Exception e) {
			System.out.println(e);
		}
	}
	
	private boolean sendMail(String recepient,String subject, String body,String dummymail) {
		
		Properties properties=new Properties();
		
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.post", "587");
		
		String myacc="mukhil1140@gmail.com";
		String pswrd="goodtime@1140";
		
		Session session=Session.getInstance(properties,new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication(){
				
				return new PasswordAuthentication(myacc,pswrd);
				
				
			}
		});
		
		Message message=prepareMessage(session,myacc,recepient,subject,body,dummymail);
		
		try {
			Transport.send(message);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
		return true;
	}
	
	private static Message prepareMessage(Session session,String myacc,String recepient,String subject,String body,String dummymail) {
		Message message=new MimeMessage(session);
		try {
			message.setFrom(new InternetAddress(myacc));
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(recepient));
			message.setSubject(subject);
			String editedbody="From:  "+dummymail+"\n"+body;
			message.setText(editedbody);
			return message;
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
