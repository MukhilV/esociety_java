package esoc;


import java.sql.*;
import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class WithdrawServ
 */
@WebServlet("/WithdrawServ")
public class WithdrawServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WithdrawServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		//PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		
		//HttpSession session=request.getSession();
		
		int reqfund=0,vault=0;
		String eventname=request.getParameter("eventname");
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		int fund=0,collected=0;
		
		
		
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
				RequestDispatcher rd=request.getRequestDispatcher("Withdraw.jsp");            
				rd.include(request, response);
				return;
			}
			
			//funds not collected
			if(collected<fund) {
				System.out.println("Cannot withdraw,funds not collected");
				request.setAttribute("deletionstatus","Cannot withdraw,funds not collected");
				RequestDispatcher rd=request.getRequestDispatcher("Withdraw.jsp");            
				rd.include(request, response);
				return;
			}
		  
			//updating vault
			Statement stmt2=con.createStatement();
			ResultSet rs2=stmt2.executeQuery("select fund from events where name='"+eventname+"'");
			while(rs2.next()){reqfund=rs2.getInt(1);}
			
			Statement stmt3=con.createStatement();
			ResultSet rs3=stmt3.executeQuery("select amount from vault where id=1");
			while(rs3.next()){vault=rs3.getInt(1);}
			
			vault=vault-reqfund;
			
			PreparedStatement ps2=con.prepareStatement("update vault set amount="+vault+" where id=1");
			int x2=ps2.executeUpdate();
			
			//inserting into outward
			PreparedStatement ps=con.prepareStatement("insert into outward(time,amount,eventname) values ('"+timestamp+"',"+reqfund+",'"+eventname+"')");
			int x=ps.executeUpdate();
			
			//deleting from events
			PreparedStatement ps3=con.prepareStatement("update events set status='completed' where name='"+eventname+"'");
			int x3=ps3.executeUpdate();
			
			System.out.println(x+","+x2+","+x3);
			
			if(x>0 && x2>0 && x3>0) {
				System.out.println("withdraw success!!");
				request.setAttribute("paymentstatus","Withdraw successful");
				
				
			}
			else {
				System.out.println("withdraw failed");
				request.setAttribute("paymentstatus","Withdraw failed");
			}
			
				RequestDispatcher rd=request.getRequestDispatcher("Withdraw.jsp");            
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
