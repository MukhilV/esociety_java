package esoc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SettingsServ
 */
@WebServlet("/SettingsServ")
public class SettingsServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SettingsServ() {
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
		
		String newname=request.getParameter("newname");
		String newincome=request.getParameter("newincome");
		String newpassword=request.getParameter("newpassword");
		String oldpassword=request.getParameter("oldpassword");
		
		HttpSession session=request.getSession();
		String email=(String) session.getAttribute("email");
		
		
		String tablename="",opswrd="";
		
		
		try {
			Dbcon obj=new Dbcon();
			Connection con=obj.createcon();
			
			
			if(session.getAttribute("persontype").equals("members")) {tablename="members";}
			else {tablename="workers";}
			
			//changing name
			if(newname!="") {
			PreparedStatement ps=con.prepareStatement("update "+tablename+" set name='"+newname+"' where mailid='"+email+"'");
			int x=ps.executeUpdate();
				
			if(x>0) {
				request.setAttribute("namestatus", "Name changed");
				System.out.println("name changed");
				 
				}
			else {
				request.setAttribute("namestatus", "Name not changed");
				System.out.println("name not changed");
				
				}
			System.out.println(x+tablename+newname);
			}
			
			
			//changing income
			if(newincome!="") {
				int inc=Integer.parseInt(newincome);
				PreparedStatement ps=con.prepareStatement("update "+tablename+" set income="+inc+" where mailid='"+email+"'");
				int x=ps.executeUpdate();
				
				if(x>0) {
					request.setAttribute("incomestatus", "Income changed");
					System.out.println("income changed");
					 
					}
				else {
					request.setAttribute("incomestatus", "Income not changed");
					System.out.println("income not changed");
					
					}
				System.out.println(x+tablename+newincome);
			}
			
			//password
			if(oldpassword!="" && newpassword!="") {
				
				Statement stmt=con.createStatement();
				ResultSet rs=stmt.executeQuery("select password from "+tablename+" where mailid='"+email+"'");
				while(rs.next()) {
					 opswrd=rs.getString("password");
					 
				}
				if(opswrd.contentEquals(oldpassword)) {
				
				PreparedStatement ps=con.prepareStatement("update "+tablename+" set password='"+newpassword+"' where mailid='"+email+"'");
				int x=ps.executeUpdate();
				
				if(x>0) {
					request.setAttribute("passwordstatus", "Password changed");
					System.out.println("password changed");
					 
					}
				else {
					request.setAttribute("passwordstatus", "Password not changed");
					System.out.println("password not changed");
					
					}
				System.out.println(x+tablename+newincome);
			}
				else {
					request.setAttribute("incorrectopswrd", "Incorrect old password");
					
				}
		}
			else if((oldpassword=="" && newpassword!="")||(oldpassword!="" && newpassword=="")) {
				request.setAttribute("bothpassword", "Both passwords are needed");
				
			}
			
				
				
			RequestDispatcher rd=request.getRequestDispatcher("Setings.jsp");            
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
