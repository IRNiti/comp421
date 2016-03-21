	package main.java;
	
	import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
	

	import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
	

import com.google.gson.Gson;
	
	/**
	 * Servlet implementation class ReviewServlet
	 */
	public class ReviewServlet extends HttpServlet {
		private static final long serialVersionUID = 1L;
		private Connection connection;
		private Statement statement;
	       
	    /**
	     * @see HttpServlet#HttpServlet()
	     */
	    public ReviewServlet() {
	        super();
	        // TODO Auto-generated constructor stub
	        try {
	        	DriverManager.registerDriver (new org.postgresql.Driver());
	        	
	//			String url = "jdbc:postgresql://10.0.1.8:5432/CarRental";
	//			connection = DriverManager.getConnection(url, "pi", "nguyen");
	            statement = connection.createStatement ( ) ;
	            
	        } catch (Exception e){
	        	e.printStackTrace();
	        }
	    }
	    
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
	    	
	    	
	    	 int sqlCode=0;      // Variable to hold SQLCODE
	         String sqlState="00000";  // Variable to hold SQLSTATE
	         String message = "";
	         
			String vID = request.getParameter("vehicleID");
			
			String userName = request.getParameter("userName");
	    	String review = "'"+request.getParameter("review")+"'";
	    	
	    	DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    	Date date = new Date();
	    	String dbDate = "'"+dateFormat.format(date)+"'"; 
	    	
	    	String rating = request.getParameter("rating");
			
			String tableName = "\"cs421g04\"" + "." + "\"Review\"";
				
			try {
			    String insertSQL = "INSERT INTO " + tableName +
			    	" VALUES ("+vID+", "+"'"+userName+"'"+", "+review+", "+dbDate+", "+rating+")";
	
			    System.out.println ( insertSQL ) ;
			    statement.executeUpdate ( insertSQL ) ;
			    System.out.println ( "DONE" ) ;
			    message = "DONE";
	
			    
	
			} catch (SQLException e)
		            {
		                sqlCode = e.getErrorCode(); // Get SQLCODE
		                sqlState = e.getSQLState(); // Get SQLSTATE
		                message = e.getMessage();
		                
		                // Your code to handle errors comes here;
		                // something more meaningful than a print would be good
		                System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
		                System.out.println("Message: " + message);
		            }
				// return json response to front-end
				String jsonResponse = new Gson().toJson(message);
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(jsonResponse);
			
		}
	
	}
