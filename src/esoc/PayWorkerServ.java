package esoc;

import java.io.IOException;
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

/**
 * Servlet implementation class PayWorkerServ
 */
@WebServlet("/PayWorkerServ")
public class PayWorkerServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PayWorkerServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html");
		String workerid=request.getParameter("workerid");
		String eventname=request.getParameter("eventname");
		String workername="";
		int workersal=0,oldaccbal=0,newaccbal=0,oldvault=0,newvault=0;
		int fund=0,collected=0;
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		
		
		try {
			Dbcon obj=new Dbcon();
			Connection con=obj.createcon();
			
			//no such events
			Statement stmt1=con.createStatement();
			ResultSet rs1=stmt1.executeQuery("select fund,collected from events where name='"+eventname+"' and status='active'");
			while(rs1.next()){
				fund=rs1.getInt(1);
				collected=rs1.getInt(2);
				}
			if(collected==0 && fund==0) {
				System.out.println("No such events");
				request.setAttribute("deletionstatus","No such events");
				RequestDispatcher rd=request.getRequestDispatcher("Payworker.jsp");            
				rd.include(request, response);
				return;
			}
			//funds not collected
			if(collected<fund) {
				System.out.println("Cannot withdraw,funds not collected");
				request.setAttribute("deletionstatus","Cannot withdraw,funds not collected");
				RequestDispatcher rd=request.getRequestDispatcher("Payworker.jsp");            
				rd.include(request, response);
				return;
			}
			
			//no such worker
			Statement stmt2=con.createStatement();
			ResultSet rs2=stmt2.executeQuery("select name from workers where mailid='"+workerid+"'");
			while(rs2.next()){
				workername=rs2.getString(1);
				}
			if(workername.contentEquals("")) {
				System.out.println("No such Worker");
				request.setAttribute("deletionstatus","No such Worker");
				RequestDispatcher rd=request.getRequestDispatcher("Payworker.jsp");            
				rd.include(request, response);
				return;
			}
			
			//selecting sal for given worker
			Statement stmt3=con.createStatement();
			ResultSet rs3=stmt3.executeQuery("select income,account from workers where mailid='"+workerid+"'");
			while(rs3.next()){
				workersal=rs3.getInt(1);
				oldaccbal=rs3.getInt(2);
				}
			
			if(workersal>collected) {
				System.out.println("Funds lower than worker salary");
				request.setAttribute("deletionstatus","Funds lower than worker salary");
				RequestDispatcher rd=request.getRequestDispatcher("Payworker.jsp");            
				rd.include(request, response);
				return;
			}
			
			
			newaccbal=oldaccbal+workersal;
			
			//updating worker account
			PreparedStatement ps1=con.prepareStatement("update workers set account='"+newaccbal+"' where mailid='"+workerid+"'");
			int x1=ps1.executeUpdate();
			
			//getting vault money
			Statement stmt4=con.createStatement();
			ResultSet rs4=stmt4.executeQuery("select amount from vault where id=1");
			while(rs4.next()){oldvault=rs4.getInt(1);}
			
			//calculating new vault money
			newvault=oldvault-workersal;
			
			//updating vault
			PreparedStatement ps2=con.prepareStatement("update vault set amount="+newvault+" where id=1");
			int x2=ps2.executeUpdate();
	
			//inserting into outward
			PreparedStatement ps3=con.prepareStatement("insert into outward(time,amount,eventname) values ('"+timestamp+"',"+workersal+",'"+eventname+"')");
			int x3=ps3.executeUpdate();
			
			fund=fund-workersal;
			collected=collected-workersal;
			
			//updating events table
			PreparedStatement ps4=con.prepareStatement("update events set fund='"+fund+"',collected='"+collected+"' where name='"+eventname+"'");
			int x4=ps4.executeUpdate();
			
			if(x1>0 && x2>0 && x3>0 && x4>0) {
				System.out.println("payworker success!!");
				request.setAttribute("paymentstatus","Worker paid");
				
				
			}
			else {
				System.out.println("Payment failed");
				request.setAttribute("paymentstatus","Payment failed");
			}
			
			RequestDispatcher rd=request.getRequestDispatcher("Payworker.jsp");            
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
