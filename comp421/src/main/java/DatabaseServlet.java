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
        // TODO Auto-generated constructor stub
        try {
        	DriverManager.registerDriver (new org.postgresql.Driver());
//            String url = "jdbc:postgresql://comp421.cs.mcgill.ca:5432/cs421";
//            connection = DriverManager.getConnection (url, null, null); // change both null values to username and password to connect to the db
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
		String name = "LALALALA";
		request.setAttribute("name", name); 
		request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response); // returns rendered jsp page
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 * This method will be used to create an account
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// Creating a user account: uid, name, address, email, isPremium, points
		HttpSession session = request.getSession(true);
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		String isPremium = request.getParameter("isPremium"); // on client side, the value should be either TRUE or FALSE, not 0 or 1
		boolean premium;
		if (isPremium.toLowerCase().equals("true")) {
			premium = true;
		} else {
			premium = false;
		}
		int points = 0;
		String tableName = "\"cs421g04\"" + "." + "\"Users\"";
		String insertStatement = String.format("INSERT INTO %s (name, address, email, \"isPremium\", points) VALUES ('%s', '%s', '%s', '%s', %d)", 
				tableName, name, address, email, isPremium, points);		
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
		String getUID = String.format("SELECT * from %s WHERE email='%s'", tableName, email);
		String getNextUserId = String.format("select nextval('unique_userid')");
		int emailCount = 0;
		int userCount = 0;
		try {
			Statement statement = this.connection.createStatement();
			ResultSet rs = statement.executeQuery(getUID);
			while (rs.next()) {
				emailCount++;
			}
			if (emailCount != 0) {
				return null;
			}
			statement = this.connection.createStatement();
			rs = statement.executeQuery(getNextUserId);
			while (rs.next()) {
				userCount = rs.getInt("nextval");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// using the same email is not allowed

		User user = new User(userCount, name, address, email, isPremium, points);
		return user;
	}

}
