package main.java;

import com.google.gson.JsonObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;

/**
 * Servlet implementation class LoginServlet
 */
public class DeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Connection connection;


    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServlet() {
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
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uID = request.getParameter("uID");
        JsonObject jsonResponse = new JsonObject();
        jsonResponse.addProperty("success", deleteUser(uID));
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResponse.toString());
    }

    /**
     * Delete user with provided uID
     * @return true if successful, false otherwise
     */
    private boolean deleteUser(String uID) {
        String tableName = "\"cs421g04\"" + "." + "\"Users\"";
        String deleteUserQuery = String.format("DELETE FROM %s WHERE \"uID\"=%s;", tableName, uID);
        try {
            connection.createStatement().executeUpdate(deleteUserQuery);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}
