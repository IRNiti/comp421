package main.java;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class ReturnServlet
 */
public class ReturnServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection;
	private Statement statement;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReturnServlet() {
		super();
		// TODO Auto-generated constructor stub
		try {
			DriverManager.registerDriver (new org.postgresql.Driver());
			String url = "jdbc:postgresql://comp421.cs.mcgill.ca:5432/cs421";
			connection = DriverManager.getConnection (url, "cs421g04", "CarRental#1"); // change both null values to username and password to connect to the db
			//			String url = "jdbc:postgresql://10.0.1.8:5432/CarRental";
			//			connection = DriverManager.getConnection(url, "pi", "nguyen");
			statement = connection.createStatement ( ) ;

		} catch (Exception e){
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String rID = request.getParameter("reservationID");
		String branchAddress = request.getParameter("branchAddress");
		int bId = this.getBranchId(branchAddress);
		int queryBranch = -1;
		String message = "";
		String jsonResponse = "";


		// check if entered branch is same as the one associated to rID in Dropoff table				
		try{
			String querySQL = "SELECT \"bID\" FROM \"cs421g04\".\"Dropoff\" WHERE \"rID\" ="+rID;
			java.sql.ResultSet rs = statement.executeQuery ( querySQL ) ;

			while ( rs.next ( ) ) {
				queryBranch = rs.getInt ( 1 ) ;
			}

			if(queryBranch != bId){
				message = "mismatch from dropoff branch. Check original reservation";
				jsonResponse = new Gson().toJson(message);
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(jsonResponse);
				return;
			}

		} catch(SQLException e)
		{

			message = e.getMessage();
			jsonResponse = new Gson().toJson(message);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(jsonResponse);
			return;

		}


		//update vehicle branch to new branch
		if(queryBranch == bId){
			try {
				String insertSQL = "UPDATE \"cs421g04\".\"Vehicles\" SET \"bID\" = "+bId+" WHERE \"rID\" = "+rID;

				System.out.println ( insertSQL ) ;
				statement.executeUpdate ( insertSQL ) ;
				message = "updated vehicle branch to "+bId;

			} catch (SQLException e)
			{
				message = e.getMessage();
				jsonResponse = new Gson().toJson(message);
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(jsonResponse);
				return;
			}

			// set the vehicle as being returned
			try {
				String updateSQL = "UPDATE \"cs421g04\".\"Reservations\" SET \"isReturned\" = true WHERE \"rID\" = "+rID;

				statement.executeUpdate ( updateSQL ) ;  

			} catch (SQLException e)
			{
				message = e.getMessage();
				jsonResponse = new Gson().toJson(message);
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(jsonResponse);
				return;
			}

		}



		// return json response to front-end
		jsonResponse = new Gson().toJson(message);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonResponse);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	private int getBranchId(String address) {
		String tableName = "\"cs421g04\"" + "." + "\"Branches\"";
		String getBranchId = String.format("SELECT \"bID\" FROM %s WHERE address='%s'", tableName, address);
		int id = -1;
		try {
			Statement statement = this.connection.createStatement();
			ResultSet rs = statement.executeQuery(getBranchId);
			while (rs.next()) {
				id = rs.getInt("bID");
				return id;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return id;
	}


}
