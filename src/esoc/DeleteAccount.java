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
 * Servlet implementation class DeleteAccount
 */
@WebServlet("/DeleteAccount")
public class DeleteAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteAccount() {
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
		HttpSession session=request.getSession();
		
		String persontype=(String) session.getAttribute("persontype");
		String email=(String) session.getAttribute("email");
		String password=(String) session.getAttribute("password");
		String name=(String) session.getAttribute("usernname");
		
		String delpassword=request.getParameter("delpassword");
		String opswrd="";
		
		try {
			Dbcon obj=new Dbcon();
			Connection con=obj.createcon();
			
			//checking password
				
				Statement stmt=con.createStatement();
				ResultSet rs=stmt.executeQuery("select password from "+persontype+" where mailid='"+email+"'");
				while(rs.next()) {
					 opswrd=rs.getString("password");
					 
				}
				if(opswrd.contentEquals(delpassword)) 
				{
				
				PreparedStatement ps=con.prepareStatement("delete from "+persontype+" where mailid='"+email+"'");
				int x=ps.executeUpdate();
				
				if(x>0) {
					request.setAttribute("delaccstatus", " Account Deleted");
					System.out.println("Account deleted");
					
					RequestDispatcher rd=request.getRequestDispatcher("index.jsp");            
					rd.include(request, response);
					 
					}
				else {
					request.setAttribute("delaccstatus", "Account not deleted due to some error");
					System.out.println("Account not deleted due to some error");
					
					RequestDispatcher rd=request.getRequestDispatcher("Setings.jsp");            
					rd.include(request, response);
					}
				
				
				}
				else {
					
					request.setAttribute("delaccstatus", "Incorrect Password");
					System.out.println("Incorrect Password");
					
					RequestDispatcher rd=request.getRequestDispatcher("Setings.jsp");            
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
