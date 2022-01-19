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
 * Servlet implementation class WalletServ
 */
@WebServlet("/WalletServ")
public class WalletServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WalletServ() {
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
		
		int money=Integer.parseInt(request.getParameter("money"));
		int wallet=0;
		String persontype=(String) session.getAttribute("persontype");
		String email=(String) session.getAttribute("email");
		
		try {
			Dbcon obj=new Dbcon();
			Connection con=obj.createcon();
	
			//getting money from vault
			Statement stmt2=con.createStatement();
			ResultSet rs2=stmt2.executeQuery("select wallet from "+persontype+" where mailid='"+email+"'");
			while(rs2.next()){wallet=rs2.getInt(1);}
			
			wallet=wallet+money;
		  
			PreparedStatement ps=con.prepareStatement("update "+persontype+" set wallet="+wallet+" where mailid='"+email+"'");
			int x=ps.executeUpdate();
		
			
		
			if(x>0) {
				System.out.println("recharege successful!!");
				request.setAttribute("paymentstatus","Recharge successful!!");
	
			}
			else {
				System.out.println("recharge failed!");
				request.setAttribute("paymentstatus","Recharege failed!");
			}
				RequestDispatcher rd=request.getRequestDispatcher("Wallet.jsp");            
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
