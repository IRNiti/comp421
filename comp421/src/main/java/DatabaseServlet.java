package main.java;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
/**
 * 
 * Servlet implementation class DatabaseServlet
 */
public class DatabaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DatabaseServlet() {
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
		
		request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response); // returns rendered jsp page
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 * This method will be used to create an account
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Creating a user account: uid, name, address, email, isPremium, points
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String email = request.getParameter("emailAddress");
		String isPremium = request.getParameter("isPremium"); // on client side, the value should be either TRUE or FALSE, not 0 or 1
		boolean premium;
		if (isPremium != null) {
			premium = true;
		} else {
			premium = false;
		}
		int points = 0;
		String tableName = "\"cs421g04\"" + "." + "\"Users\"";
		String insertStatement = String.format("INSERT INTO %s (name, address, email, \"isPremium\", points) VALUES ('%s', '%s', '%s', '%s', %d)", 
				tableName, name, address, email, premium, points);		
		try {
			User newUser = this.createUser(name, address, email, premium, points);
			if (newUser != null) {
				Statement statement = this.connection.createStatement();
				statement.executeUpdate(insertStatement);
				String jsonResponse = new Gson().toJson(newUser);
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(jsonResponse);
			} else {
				// error has occured due to entering the same email
				User user = new User(-1, "", "", "", false, -1); // this cannot happen with a negative uid so front-end will need to check
				String jsonResponse = new Gson().toJson(user);
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(jsonResponse);
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private User createUser(String name, String address, String email, boolean isPremium, int points) {
		// need to make 
		String tableName = "\"cs421g04\"" + "." + "\"Users\"";
		String getUsers = String.format("SELECT * from %s WHERE email='%s'", tableName, email);
		String getNextUserId = "SELECT nextval('unique_userid')";
		int emailCount = 0;
		int userCount = 0;
		try {
			Statement statement = this.connection.createStatement();
			ResultSet rs = statement.executeQuery(getUsers);
			// Checking if email already exists, if it does return null
			// using the same email is not allowed
			while (rs.next()) {
				emailCount++;
			}
			if (emailCount != 0) {
				return null;
			}
			statement = this.connection.createStatement();
			rs = statement.executeQuery(getNextUserId);
			// checking the unique id that will be assigned to this new user
			while (rs.next()) {
				userCount = rs.getInt("nextval");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		User user = new User(userCount+1, name, address, email, isPremium, points);
		return user;
	}

}
