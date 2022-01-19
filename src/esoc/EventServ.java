package esoc;

import java.io.*;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class EventServ
 */
@WebServlet("/EventServ")
public class EventServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventServ() {
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
		String email=(String) session.getAttribute("email");
		
		String eventname=request.getParameter("eventname");
		String eventdesc=request.getParameter("eventdesc");
		String from=request.getParameter("from");
		String to=request.getParameter("to");
		int fund=Integer.parseInt(request.getParameter("fund"));
		
		try {
			Dbcon obj=new Dbcon();
			Connection con=obj.createcon();
			PreparedStatement ps=con.prepareStatement("insert into events(`name`,`desc`,`from`,`to`,`fund`,`status`) values ('"+eventname+"','"+eventdesc+"','"+from+"','"+to+"','"+fund+"','active');");
			int x=ps.executeUpdate();
			if(x>0) {
				System.out.println("event created!");
				request.setAttribute("eventstatus","Event Created"); 
				}
			else {
				System.out.println("event creation failed");
				request.setAttribute("eventstatus","Event not created, due to some error");
				}
			RequestDispatcher rd=request.getRequestDispatcher("CreateEvent.jsp");            
			rd.include(request, response);
		}
		catch(java.sql.SQLIntegrityConstraintViolationException e) {
			request.setAttribute("eventstatus","Event already created or name of event is already taken"); 
			
			RequestDispatcher rd=request.getRequestDispatcher("CreateEvent.jsp");            
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
