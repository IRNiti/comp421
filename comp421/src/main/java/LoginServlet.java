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

import com.google.gson.Gson;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("emailAddress");
		User user = this.getUser(email);
		if (user != null) {
			String jsonResponse = new Gson().toJson(user);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(jsonResponse);
			
		} else {
			User badUser = new User(-1, "", "", "", false, -1);
			String jsonResponse = new Gson().toJson(badUser);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(jsonResponse);
		}
	}
	
	private User getUser(String email) {
		String tableName = "\"cs421g04\"" + "." + "\"Users\"";
		String getUsers = String.format("SELECT * from %s WHERE email='%s'", tableName, email);
		try {
			Statement statement = this.connection.createStatement();
			ResultSet rs = statement.executeQuery(getUsers);
			while (rs.next()) {
				User user = new User(rs.getInt("uID"), rs.getString("name"), rs.getString("address"), rs.getString("email"), rs.getBoolean("isPremium"), rs.getInt("points"));
				return user;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
