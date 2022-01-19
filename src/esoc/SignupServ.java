package esoc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class SignupServ
 */
@WebServlet("/SignupServ")
public class SignupServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String mailid="",password1="",password2="",username="",persontype;
	int income=0;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignupServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		username=request.getParameter("name");
		mailid=request.getParameter("email");
		income=Integer.parseInt(request.getParameter("income"));
		password1=request.getParameter("pswrd1");
		password2=request.getParameter("pswrd2");
		persontype=request.getParameter("persontype");
		
		String tablename="";
		
		if(!password1.equals(password2)) {
			request.setAttribute("passwordstatus","password doesn't match");
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");            
			rd.include(request, response);
			return;
		}
		
		if(persontype.equals("Member")) {tablename="members";}
		else {tablename="workers";}
		
		
		try {
			Dbcon obj=new Dbcon();
			Connection conn=obj.createcon();
			PreparedStatement ps=conn.prepareStatement("insert into "+tablename+"(mailid,password,name,income) values ('"+mailid+"','"+password1+"','"+username+"',"+income+")");
			int x=ps.executeUpdate();
			if(x>0) {
				System.out.println("Registered!!");
				request.setAttribute("signupstatus","Signup successful, login again."); 
				}
			else {
				System.out.println("failed");
				request.setAttribute("signupstatus","Signup Failed, try some other time.");
				}
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");            
			rd.include(request, response);
		
		}
		
		catch(java.sql.SQLIntegrityConstraintViolationException e) {
			request.setAttribute("signupstatus","You already have an account.!");
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");            
			rd.include(request, response);
		}
		catch(Exception e) {
			System.out.println(e);
			
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
