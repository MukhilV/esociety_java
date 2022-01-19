package esoc;

import java.io.*;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DashboardServ
 */
@WebServlet("/DashboardServ")
public class DashboardServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DashboardServ() {
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
		
		int wallet=0;
		int amount=Integer.parseInt(request.getParameter("amt"));
		String eventname=request.getParameter("eventname");
		int collected=0,total=0,vault=0,reqfund=0,fund=0;
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		
		System.out.println(eventname);
		
		try {
			Dbcon obj=new Dbcon();
			Connection con=obj.createcon();
		  
			//getting collected funds from events table
			Statement stmt1=con.createStatement();
			ResultSet rs1=stmt1.executeQuery("select fund,collected from `esociety`.events where (name='"+eventname+"' and status='active')");
			while(rs1.next()){
				fund=rs1.getInt(1);
				collected=rs1.getInt(2);
				}
			
			//no such events
			if(collected==0 && fund==0) {
				System.out.println("No such events");
				request.setAttribute("paymentstatus","No such events");
				RequestDispatcher rd=request.getRequestDispatcher("Dashboard.jsp");            
				rd.include(request, response);
				return;
			}
			
			//updating money from wallet
			Statement stmt4=con.createStatement();
			ResultSet rs4=stmt4.executeQuery("select wallet from "+persontype+" where mailid='"+email+"'");
			while(rs4.next()){
				wallet=rs4.getInt(1);
				}
			if(amount>wallet) {
				System.out.println("Only "+wallet+" is in wallet");
				request.setAttribute("paymentstatus","Only "+wallet+" is in wallet");
				RequestDispatcher rd=request.getRequestDispatcher("Dashboard.jsp");            
				rd.include(request, response);
				return;
			}
		
			//calc reqfund
			reqfund=fund-collected;
			System.out.println(fund+","+collected+","+reqfund+"");
			
			// message of surplus amount
			if(amount>reqfund) {
				System.out.println("Only "+reqfund+" is required, you are paying surplus amount");
				request.setAttribute("paymentstatus","Only "+reqfund+" is required, you are paying surplus amount");
				RequestDispatcher rd=request.getRequestDispatcher("Dashboard.jsp");            
				rd.include(request, response);
				return;
			}
			
			wallet=wallet-amount;
			PreparedStatement ps4=con.prepareStatement("update "+persontype+" set wallet="+wallet+" where mailid='"+email+"'");
			int x4=ps4.executeUpdate();
			
			//calculating total
			total=total+collected+amount;
			
			//updating events table
			PreparedStatement ps1=con.prepareStatement("update events set collected="+total+" where name='"+eventname+"'");
			int x1=ps1.executeUpdate();
			
			//getting money from vault
			Statement stmt2=con.createStatement();
			ResultSet rs2=stmt2.executeQuery("select amount from vault where id=1");
			while(rs2.next()){vault=rs2.getInt(1);}
			
			vault=vault+amount;
			
			//updating vault
			PreparedStatement ps2=con.prepareStatement("update vault set amount="+vault+" where id=1");
			int x2=ps2.executeUpdate();
			
			//inserting into inward
			PreparedStatement ps=con.prepareStatement("insert into inward(name,mailid,event,amount,date) values ('"+session.getAttribute("username")+"','"+session.getAttribute("email")+"','"+eventname+"',"+amount+",'"+timestamp+"')");
			int x=ps.executeUpdate();
			
			System.out.println(x+","+x1+","+x2+","+x4);
			if(x4>0 && x2>0 && x1>0 && x>0) {
				System.out.println("inward success!!");
				request.setAttribute("paymentstatus","Payment successful");
	
			}
			else {
				System.out.println("inward failed");
				request.setAttribute("paymentstatus","Payment failed");
			}
				RequestDispatcher rd=request.getRequestDispatcher("Dashboard.jsp");            
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
