package esoc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DeleteEventServ
 */
@WebServlet("/DeleteEventServ")
public class DeleteEventServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteEventServ() {
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
				String eventname=request.getParameter("eventname");
				int fund=0,collected=0,vault=0,amountOfDeletedEvent=0;
				String mailid="";int eachamount=0,x1=0;
				
				
				try {
					Dbcon obj=new Dbcon();
					Connection con=obj.createcon();
					
					//getting collected funds from events table
					Statement stmt1=con.createStatement();
					ResultSet rs1=stmt1.executeQuery("select fund,collected from events where name='"+eventname+"' and status='active'");
					while(rs1.next()){
						fund=rs1.getInt(1);
						collected=rs1.getInt(2);
						}
					
					//no such events
					if(collected==0 && fund==0) {
						System.out.println("No such events");
						request.setAttribute("deletionstatus","No such events");
						RequestDispatcher rd=request.getRequestDispatcher("CreateEvent.jsp");            
						rd.include(request, response);
						return;
					}
					
					//refund logic
					Statement stmt2=con.createStatement();
					ResultSet rs2=stmt2.executeQuery("select mailid,amount from inward where event='"+eventname+"'");
					while(rs2.next()){
						mailid=rs2.getString(1);
						eachamount=rs2.getInt(2);
						
						//updating members table
						int eachwallet=0;
						
						Statement stmt3=con.createStatement();
						ResultSet rs3=stmt3.executeQuery("select wallet from "+persontype+" where mailid='"+mailid+"'");
						while(rs3.next()){eachwallet=rs3.getInt(1);}
						eachwallet=eachwallet+eachamount;
						
						PreparedStatement ps1=con.prepareStatement("update "+persontype+" set wallet="+eachwallet+" where mailid='"+mailid+"'");
						x1=ps1.executeUpdate();
						
						
						}
					
					//getting sum(amount) from inward table of the event that is deleted
					Statement stmt4=con.createStatement();
					ResultSet rs4=stmt4.executeQuery("select sum(amount) from inward where event='"+eventname+"'");
					while(rs4.next()){amountOfDeletedEvent=rs4.getInt(1);}
					
					
					//updating vault
					Statement stmt5=con.createStatement();
					ResultSet rs5=stmt5.executeQuery("select amount from vault where id=1");
					while(rs5.next()){vault=rs5.getInt(1);}
					
					vault=vault-amountOfDeletedEvent;
					
					PreparedStatement ps2=con.prepareStatement("update vault set amount="+vault+" where id=1");
					int x2=ps2.executeUpdate();
				  	
					//updating event table status=deleted
					PreparedStatement ps3=con.prepareStatement("update events set status='deleted' where name='"+eventname+"'");
					int x3=ps3.executeUpdate();
					System.out.println(x1+","+x2+","+x3);
					if( x1>0 && x2>0 && x3>0) {
						System.out.println("Event deleted!!");
						request.setAttribute("deletionstatus","Event deleted and refund initiated");
						
						
					}
					else {
						System.out.println("Event deletion failed");
						request.setAttribute("deletionstatus","Event deletion failed");
					}
					
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
