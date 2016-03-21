package main.java;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class ReservationServlet
 */
public class ReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationServlet() {
        super();
        // TODO Auto-generated constructor stub
        try {
        	DriverManager.registerDriver (new org.postgresql.Driver());
//            String url = "jdbc:postgresql://comp421.cs.mcgill.ca:5432/cs421";
//            connection = DriverManager.getConnection (url, "cs421g04", "CarRental#1"); // change both null values to username and password to connect to the db
			String url = "jdbc:postgresql://10.0.1.8:5432/CarRental";
			connection = DriverManager.getConnection(url, "pi", "nguyen");
        } catch (Exception e){
        	e.printStackTrace();
        }
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		String pickUpDate = request.getParameter("pickupDate");
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String returnDate = request.getParameter("dropOffDate");
		Date pickUpDateFormatted = null;
		Date returnDateFormatted = null;
		
		String licenseNumber = request.getParameter("licenseNumber");
		boolean isReturned = false;//request.getParameter("isReturned");
		int userId = Integer.parseInt(request.getParameter("uId"));
		int vehicleId = Integer.parseInt(request.getParameter("vId"));
		String insurance = request.getParameter("insurance");
		
		try {
			pickUpDateFormatted = formatter.parse(pickUpDate);
			returnDateFormatted = formatter.parse(returnDate);
			// error checking to see if pick up date is after return date
			if (pickUpDateFormatted.compareTo(returnDateFormatted) > 0) {
				String jsonResponse = new Gson().toJson(Collections.singletonMap("return", -1));
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(jsonResponse);
				// return error status
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}
		String tableName = "\"cs421g04\"" + "." + "\"Reservations\"";
		String insertStatement = String.format("INSERT INTO %s (\"licenseNumber\", \"pickUpDate\", \"returnDate\", \"isReturned\", \"uID\", \"vID\", \"typeOfCoverage\") VALUES ('%s', '%s', '%s', '%s', %d, %d, '%s')"
				,tableName, licenseNumber, pickUpDateFormatted, returnDateFormatted, isReturned, userId, vehicleId, insurance);		
		Statement statement;
		try {
			if (this.canReserve(pickUpDateFormatted, vehicleId)) {
				statement = this.connection.createStatement();
				statement.executeUpdate(insertStatement);
				String jsonResponse = new Gson().toJson(Collections.singletonMap("return", 0));
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(jsonResponse);
			} else {
				String jsonResponse = new Gson().toJson(Collections.singletonMap("return", -1));
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(jsonResponse);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	private boolean canReserve(Date pickUpDate, int vehicleId) {
		String tableName = "\"cs421g04\"" + "." + "\"Reservations\"";
		String query = String.format("SELECT \"returnDate\" FROM %s WHERE \"vID\"=%d", tableName, vehicleId);
		try {
			Statement statement = this.connection.createStatement();
			ResultSet rs = statement.executeQuery(query);
			while (rs.next()) {
				if (pickUpDate.compareTo(rs.getDate("returnDate")) < 0) {
					return false;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return true;
		
	}

}
