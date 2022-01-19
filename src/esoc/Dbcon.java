package esoc;

import java.sql.*;
import java.io.*;
import java.util.*;

public class Dbcon {

	  Connection conn = null;

	public Connection createcon() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		 conn=DriverManager.getConnection("jdbc:mysql://localhost:3307/esociety","root","Pswrd@MySQL");
			//PreparedStatement ps=conn.prepareStatement("insert into members(userid,mailid,password) values (1,'aplha','123')");
			System.out.println("success");
			}
		catch(Exception e) {
			System.out.println("failed");
			System.out.println(e);
		}
		return conn;
	}
}