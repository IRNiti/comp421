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
 * Servlet implementation class VehicleServlet
 */
public class VehicleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VehicleServlet() {
        super();
       
        try {
        	DriverManager.registerDriver (new org.postgresql.Driver());
            String url = "jdbc:postgresql://comp421.cs.mcgill.ca:5432/cs421";
            connection = DriverManager.getConnection (url, null, null); // change both null values to username and password to connect to the db
        } catch (Exception e){
        	e.printStackTrace();
        }
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String branchAddress = request.getParameter("branchAddress");
		String showAllVehicles = request.getParameter("all");
		String tableName = "\"cs421g04\"" + "." + "\"Vehicles\"";
		int branchId = this.getBranchId(branchAddress);
		ArrayList<Vehicle> vehicles = new ArrayList<Vehicle>();
		// return all cars
		if (showAllVehicles != null) { 
			String getVehicles = String.format("SELECT * FROM %s", tableName, branchId);
			try {
				Statement statement = this.connection.createStatement();
				ResultSet rs = statement.executeQuery(getVehicles);
				while (rs.next()) {
					vehicles.add(new Vehicle(rs.getInt("vID"), rs.getInt("bID"), rs.getString("make"), rs.getString("model"), rs.getInt("passCapacity"),
							rs.getInt("costPerDay"), rs.getString("type"), rs.getString("transmission")));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			// return json response to front-end
			String jsonResponse = new Gson().toJson(vehicles);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(jsonResponse);
		} else {
			// error case so just return an empty list
			if (branchId == -1) {
				ArrayList<Vehicle> emptyVehicles = new ArrayList<Vehicle>();
				String jsonResponse = new Gson().toJson(emptyVehicles);
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(jsonResponse);
			} else {
				// ideal case, given a branch address, find branch id then all vehicles belonging to that branch id
				String getVehicles = String.format("SELECT * FROM %s WHERE \"bID\"='%d'", tableName, branchId);
				try {
					Statement statement = this.connection.createStatement();
					ResultSet rs = statement.executeQuery(getVehicles);
					while (rs.next()) {
						vehicles.add(new Vehicle(rs.getInt("vID"), rs.getInt("bID"), rs.getString("make"), rs.getString("model"), rs.getInt("passCapacity"),
								rs.getInt("costPerDay"), rs.getString("type"), rs.getString("transmission")));
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				// return json response to front-end
				String jsonResponse = new Gson().toJson(vehicles);
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(jsonResponse);
			}
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
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
