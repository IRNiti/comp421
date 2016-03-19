package main.java;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.* ;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
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
            String url = "jdbc:postgresql://comp421.cs.mcgill.ca:5432/cs421";
            connection = DriverManager.getConnection (url, null, null); // change both null values to username and password to connect to the db
//			String url = "jdbc:postgresql://10.0.1.8:5432/CarRental";
//			connection = DriverManager.getConnection(url, "pi", "nguyen");
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
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		String isPremium = request.getParameter("isPremium"); // on client side, the value should be either TRUE or FALSE, not 0 or 1
		int points = 0;
		
		String tableName = "\"cs421g04\"" + "." + "\"Users\"";
		String insertStatement = String.format("INSERT INTO %s (name, address, email, \"isPremium\", points) VALUES ('%s', '%s', '%s', '%s', %d)", 
				tableName, name, address, email, isPremium, points);
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery(insertStatement);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
