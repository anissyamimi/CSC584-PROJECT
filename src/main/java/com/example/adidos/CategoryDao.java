package com.example.adidos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import static java.lang.System.out;

public class CategoryDao {

    String dbURL = "jdbc:postgresql://ec2-44-206-197-71.compute-1.amazonaws.com/d5rq8o52eacr8k";
    String user = "snzyojrrgmxiog";
    String pass = "f97a885181429218179ab9db94ff4fc6ab7ef611657375b7e35dad06697b711c";

    protected Connection getConnection() {
        Connection con = null;
        try {
        	//Load the driver class
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(dbURL, user, pass);
        }
        
        catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return con;

    }

    public void createCategory(Category cat) throws SQLException {

        // try-with-resource statement will auto close the connection.
    	
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement
                     ("INSERT INTO CATEGORY(categoryName,categoryStatus) values(?,?)"))
        {
            ps.setString(1, cat.getCategoryName());
            ps.setString(2, cat.getCategoryStatus());
            out.println(ps);
            ps.executeUpdate();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public boolean deleteCategory(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("DELETE FROM category WHERE categoryID=?")) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateCategory (Category cat) throws SQLException {
    	
    	boolean rowUpdated = true;
        // try-with-resource statement will auto close the connection.
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement
                     ("UPDATE category set categoryName=?,categoryStatus=? WHERE categoryID = ?"))

        {
            ps.setString(1, cat.getCategoryName());
            ps.setString(2, cat.getCategoryStatus());
            ps.setInt(3, cat.getCategoryID());
            
             //ps.executeUpdate();
             rowUpdated = ps.executeUpdate() > 0;        
    	}

        catch (Exception e) {
            e.printStackTrace();
        }
        
        return rowUpdated;
    }
}
