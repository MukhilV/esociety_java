package esoc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ReportServ
 */
@WebServlet("/ReportServ")
public class ReportServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportServ() {
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
		 
		String range1=request.getParameter("range1");
		String range2=request.getParameter("range2");
		String from="",to="";
		/*Date from = null,to=null;
		
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd"); 
		try { from = sdf1.parse(range1);}
		catch(Exception e) {System.out.println(e);}
		
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd"); 
		try { to = sdf2.parse(range2);}
		catch(Exception e) {System.out.println(e);}
		*/
		
		String[] fromarr=range1.split("-");
		String[] toarr=range2.split("-");
		for(String i :fromarr) {from=from+i;}
		for(String i :toarr) {to=to+i;}
		Double dfrom=Double.parseDouble(from),dto=Double.parseDouble(to);
		System.out.println(from+","+to);
		
		try {
			Dbcon obj=new Dbcon();
			Connection con=obj.createcon();
	
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery("select * from inward");
			String output="";
			output="<div id='reports'>";
			// out.println("<table border=2>");
			 //out.println("<tr><th>Name</th><th>a]Amount</th><th>Date</th></tr>");
			 output=output+"<table class=\"table table-hover\" style='width:70%;margin:0 auto;'>"+"<tr><th>Name</th><th>Amount</th><th>Event</th><th>Date</th></tr>";
			while(rs.next()) {
				String name=rs.getString("name");
				String ename=rs.getString("event");
				String amount=""+rs.getInt("amount");
				String sdate=rs.getString("date");
				 String[] str=sdate.split("-");
				 String[] temp=str[2].split(" ");
				 System.out.println(str[0]+str[1]+temp[0]);
				 Double date=Double.parseDouble(str[0]+str[1]+temp[0]);
				
				 if(date>=dfrom && date<=dto) {
					 
					// out.println("<tr><td>"+name+"</td><td>"+amount+"</td><td>"+sdate+"</td></tr>");
					 output=output+"<tr><td>"+name+"</td><td>"+amount+"</td><td>"+ename+"</td><td>"+sdate+"</td></tr>";
				 }
				
			}
			// out.println("</table>");
			 output=output+"</table>";
			 output=output+"</div>";
			 request.setAttribute("output", output);
			 
			 
			 
			 
			 Statement stmt1=con.createStatement();
				ResultSet rs1=stmt1.executeQuery("select * from outward");
				String output1="";
				output1="<div id='reports1'>";
				// out.println("<table border=2>");
				 //out.println("<tr><th>Name</th><th>a]Amount</th><th>Date</th></tr>");
				 output1=output1+"<table class=\"table table-hover\" style='width:70%;margin:0 auto;'>"+"<tr><th>Date</th><th>Amount</th><th>Event</th></tr>";
				while(rs1.next()) {
					
					String sdate=rs1.getString("time");
					 String[] str=sdate.split("-");
					 String[] temp=str[2].split(" ");
					 System.out.println(str[0]+str[1]+temp[0]);
					 Double date=Double.parseDouble(str[0]+str[1]+temp[0]);
					 String amount=""+rs1.getInt("amount");
					 String eventname=rs1.getString("eventname");
					
					 if(date>=dfrom && date<=dto) {
						 
						// out.println("<tr><td>"+name+"</td><td>"+amount+"</td><td>"+sdate+"</td></tr>");
						 output1=output1+"<tr><td>"+sdate+"</td><td>"+amount+"</td><td>"+eventname+"</td></tr>";
					 }
					
				}
				// out.println("</table>");
				 output1=output1+"</table>";
				 output1=output1+"</div>";
				 request.setAttribute("output1", output1);
			 
			 
			 RequestDispatcher rd=request.getRequestDispatcher("Reports.jsp");            
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
