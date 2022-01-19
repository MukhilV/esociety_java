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

/**
 * Servlet implementation class ModifyEventServ
 */
@WebServlet("/ModifyEventServ")
public class ModifyEventServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyEventServ() {
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
		
		int fund=0,fund1=0,collected=0,x=0,f=0;
		String oldeventname=(String)request.getParameter("oldeventname");
		String neweventname=(String)request.getParameter("neweventname");
		String neweventdesc=(String)request.getParameter("neweventdesc");
		String from=(String)request.getParameter("from");
		String to=(String)request.getParameter("to");
		String strfund=""+request.getParameter("fund");
		if(!strfund.equals("")) fund=Integer.parseInt(strfund);
		
		
		
		try {
			Dbcon obj=new Dbcon();
			Connection con=obj.createcon();
			
			//getting collected funds from events table
			Statement stmt1=con.createStatement();
			ResultSet rs1=stmt1.executeQuery("select fund,collected from events where name='"+oldeventname+"' and status='active'");
			while(rs1.next()){
				fund1=rs1.getInt(1);
				collected=rs1.getInt(2);
				}
			
			//no such events
			if(collected==0 && fund1==0) {
				System.out.println("No such events");
				request.setAttribute("modificationstatus","No such events");
				RequestDispatcher rd=request.getRequestDispatcher("CreateEvent.jsp");            
				rd.include(request, response);
				return;
			}
			
			
			//updating desc
			if(!neweventdesc.equals("")) {
				PreparedStatement ps=con.prepareStatement("UPDATE `esociety`.`events` SET `desc` = '"+neweventdesc+"' where (`name` = '"+oldeventname+"')");
				x=ps.executeUpdate();
				if(x>0) f=1;
				else f=0;
			}
			
			//updating from
			if(!from.equals("")) {
				PreparedStatement ps=con.prepareStatement("UPDATE `esociety`.`events` SET `from` = '"+from+"' where (`name` = '"+oldeventname+"')");
				x=ps.executeUpdate();
				if(x>0) f=1;
				else f=0;
			}
			
			//updating to
			if(!to.equals("")) {
				PreparedStatement ps=con.prepareStatement("UPDATE `esociety`.`events` SET `to` = '"+to+"' where (`name` = '"+oldeventname+"')");
				x=ps.executeUpdate();
				if(x>0) f=1;
				else f=0;
			}
			
			//updating fund
			if(fund!=0) {
				PreparedStatement ps=con.prepareStatement("update events set fund='"+fund+"' where name='"+oldeventname+"'");
				x=ps.executeUpdate();
				if(x>0) f=1;
				else f=0;
			}
			
			//updating name
			if(!neweventname.equals("")) {
				PreparedStatement ps=con.prepareStatement("update events set name='"+neweventname+"' where name='"+oldeventname+"'");
				x=ps.executeUpdate();
				if(x>0) f=1;
				else f=0;
			}
			
			if(f!=0) {
				System.out.println("Modified!");
				request.setAttribute("modificationstatus","Modified!");
				
				
			}
			else {
				System.out.println("Modification failed!");
				request.setAttribute("modificationstatus","Modification failed!");
			}
			
				RequestDispatcher rd=request.getRequestDispatcher("CreateEvent.jsp");            
				rd.include(request, response);

			
			}
		catch(Exception e) {System.out.println(e);}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
