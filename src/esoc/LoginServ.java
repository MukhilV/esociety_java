package esoc;

import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServ
 */
@WebServlet("/LoginServ")
public class LoginServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		
	}


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		
		String mailid,password,pswrd="",persontype="";
		HttpSession session=request.getSession();
		//session.setAttribute("persontype", persontype);
		
		
		
		try {
		Dbcon obj=new Dbcon();
		Connection con=obj.createcon();
		
		mailid=request.getParameter("mail");
		password=request.getParameter("pswrd");
		persontype=request.getParameter("persontype");
		session.setAttribute("persontype", persontype);
		
		
		
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("select password from "+persontype+" where mailid='"+mailid+"'");
		while(rs.next()) {
			 pswrd=rs.getString("password");
			 
		}
		System.out.println(pswrd+","+password);
		if(pswrd.equals(password)) {
			//response.sendRedirect("Dashboard.jsp");
			
			Statement stmt1=con.createStatement();
			ResultSet rs1=stmt1.executeQuery("select * from "+persontype+" where mailid='"+mailid+"'");
			while(rs1.next()) {
				
				String email=rs1.getString("mailid");
				String uname=rs1.getString("name");
				String income=rs1.getString("income");
				String passwordindb=rs1.getNString("password");
				session.setAttribute("username",uname );
				session.setAttribute("email",email );
				session.setAttribute("income",income );
				session.setAttribute("password",passwordindb );
			}
			
			RequestDispatcher rd=request.getRequestDispatcher("Dashboard.jsp");            
			rd.include(request, response); 
			
		}
		else {
			request.setAttribute("error","Invalid Username or Password");
			RequestDispatcher rd=request.getRequestDispatcher("/index.jsp");            
			rd.include(request, response);                                                                                                                                                                                                               
		}
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
