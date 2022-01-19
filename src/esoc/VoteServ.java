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
 * Servlet implementation class VoteServ
 */
@WebServlet("/VoteServ")
public class VoteServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VoteServ() {
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
		
		HttpSession session1=request.getSession();
		String persontype=(String) session1.getAttribute("persontype");
		String email=(String) session1.getAttribute("email");
		String name=(String) session1.getAttribute("username");
		
		int vote=Integer.parseInt(request.getParameter("vote"));
		String eventname=request.getParameter("eventname");
		
		int voteindb=0,upvote=0,downvote=0;
		
		try {
			Dbcon obj=new Dbcon();
			Connection con=obj.createcon();
			
			//checking for previous vote 
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery("select vote from votes where mailid='"+email+"' and eventname='"+eventname+"'");
			while(rs.next()) {
				 voteindb=rs.getInt("vote");
				 
			}
			
			//already voted
			if(voteindb!=0) {
				request.setAttribute("votestatus", "You have already voted for "+eventname);
				System.out.println("You already voted for "+eventname);
				
			}
			else {
				//upvote
				if(vote==1) {
				PreparedStatement ps=con.prepareStatement("insert into votes(`eventname`,`vote`,`mailid`,`votername`) values ('"+eventname+"',"+vote+",'"+email+"','"+name+"');");
				int x=ps.executeUpdate();
				if(x>0) {
					//request.setAttribute("votestatus", "You have upvoted this event");
					System.out.println("You have upvoted this event"); 
					}
				else {
					System.out.println("voting failed");
					//request.setAttribute("votestatus","Some error has occured");
					}
				
				//updating events table
				Statement stmt1=con.createStatement();
				ResultSet rs1=stmt1.executeQuery("select upvote from events where name='"+eventname+"'");
				while(rs1.next()) {
					 upvote=rs1.getInt("upvote");	 
				}
				upvote=upvote+1;
				
				PreparedStatement ps1=con.prepareStatement("update events set upvote="+upvote+" where name='"+eventname+"'");
				int x1=ps1.executeUpdate();
				
				if(x1>0) {
					request.setAttribute("votestatus", "You have upvoted for "+eventname);
					System.out.println("You have upvoted this event"); 
					 
					}
				else {
					System.out.println("voting failed");
					request.setAttribute("votestatus","Some error has occured");
					
					}
				
				}
				
				//downvote
				if(vote==-1) {
					
					PreparedStatement ps=con.prepareStatement("insert into votes(`eventname`,`vote`,`mailid`,`votername`) values ('"+eventname+"',"+vote+",'"+email+"','"+name+"');");
					int x=ps.executeUpdate();
					if(x>0) {
						//request.setAttribute("votestatus", "You have downvotedvoted this event");
						System.out.println("You have downvoted this event"); 
						}
					else {
						System.out.println("voting failed");
						//request.setAttribute("votestatus","Some error has occured");
						}
					
					//updating events table
					Statement stmt1=con.createStatement();
					ResultSet rs1=stmt1.executeQuery("select downvote from events where name='"+eventname+"'");
					while(rs1.next()) {
						 downvote=rs1.getInt("downvote");	 
					}
					downvote=downvote+1;
					
					PreparedStatement ps1=con.prepareStatement("update events set downvote="+downvote+" where name='"+eventname+"'");
					int x1=ps1.executeUpdate();
					
					if(x1>0) {
						request.setAttribute("votestatus", "You have downvoted for "+eventname);
						System.out.println("You have downvoted this event"); 
						 
						}
					else {
						System.out.println("voting failed");
						request.setAttribute("votestatus","Some error has occured");
						
						}	
					
					}
			}
			
			RequestDispatcher rd=request.getRequestDispatcher("Dashboard.jsp");            
			rd.include(request, response);
			
			
		}catch(Exception e) {
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
