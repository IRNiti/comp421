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
		
		String returnBranch = request.getParameter("dropoffBranchAddress");
		String licenseNumber = request.getParameter("licenseNumber");
		boolean isReturned = false;
		int userId = Integer.parseInt(request.getParameter("uId"));
		int vehicleId = Integer.parseInt(request.getParameter("vId"));
		String insurance = request.getParameter("insurance");
		int queryBranch = -1;
		String message = "";
		String jsonResponse = "";
		
		try {
			Statement bidStatement = this.connection.createStatement();
			String querySQL = "SELECT \"bID\" FROM \"cs421g04\".\"Branches\" WHERE \"address\" ="+"'"+returnBranch+"'";
			java.sql.ResultSet rs = bidStatement.executeQuery ( querySQL ) ;
			while ( rs.next ( ) ) {
				queryBranch = rs.getInt ( 1 ) ;
			}
		} catch(SQLException e) {
			message = e.getMessage();
			jsonResponse = new Gson().toJson(message);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(jsonResponse);
			return;
		}
		
		try {
			pickUpDateFormatted = formatter.parse(pickUpDate);
			returnDateFormatted = formatter.parse(returnDate);
			// error checking to see if pick up date is after return date
			if (pickUpDateFormatted.compareTo(returnDateFormatted) > 0) {
				jsonResponse = new Gson().toJson(Collections.singletonMap("return", -1));
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(jsonResponse);
				// return error status
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}
		String tableName = "\"cs421g04\"" + "." + "\"Reservations\"";
		String insertStatement = String.format("INSERT INTO %s (\"licenseNumber\", \"pickUpDate\", \"returnDate\", \"isReturned\", \"uID\", \"vID\", \"typeOfCoverage\") VALUES ('%s', '%s', '%s', '%s', %d, %d, '%s') RETURNING \"rID\""
				,tableName, licenseNumber, pickUpDateFormatted, returnDateFormatted, isReturned, userId, vehicleId, insurance);		
		Statement statement;
		try {
			if (this.canReserve(pickUpDateFormatted, vehicleId)) {
				int reservationId = 0;
				statement = this.connection.createStatement();
				ResultSet rs = statement.executeQuery(insertStatement);
				while (rs.next()) {
					reservationId = rs.getInt("rID");
				}
				// successfully reservation here so add to drop off table
				if (reservationId >= 0) {
					String dropOffTable = "\"cs421g04\"" + "." + "\"Dropoff\"";
					String insertIntoDropOff = String.format("INSERT INTO %s (\"rID\", \"bID\") VALUES (%d, %d)", dropOffTable, reservationId, queryBranch);
					statement = this.connection.createStatement();
					int status = statement.executeUpdate(insertIntoDropOff);
					if (status == 1) {
						// successfully added to the drop off table
						jsonResponse = new Gson().toJson(Collections.singletonMap("return", 0));
						response.setContentType("application/json");
						response.setCharacterEncoding("UTF-8");
						response.getWriter().write(jsonResponse);
					} else {
						// failed to add to the drop off table
						jsonResponse = new Gson().toJson(Collections.singletonMap("return", -1));
						response.setContentType("application/json");
						response.setCharacterEncoding("UTF-8");
						response.getWriter().write(jsonResponse);
					}
				} else {
					// reseration failed for some other reason
					jsonResponse = new Gson().toJson(Collections.singletonMap("return", -1));
					response.setContentType("application/json");
					response.setCharacterEncoding("UTF-8");
					response.getWriter().write(jsonResponse);
				}
			} else {
				// resercation failed because car is already reserverd for when you want to reserve it
				jsonResponse = new Gson().toJson(Collections.singletonMap("return", -1));
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
