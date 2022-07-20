package com.example.adidos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import static java.lang.System.out;

public class CategoryDao {

    String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
    String user = "udonation";
    String pass = "system";

    protected Connection getConnection() {
        Connection con = null;
        try {
        	//Load the driver class
            Class.forName("oracle.jdbc.driver.OracleDriver");
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
                     ("INSERT INTO CATEGORY(categoryID,categoryName,categoryStatus) values(?,?,?)"))
        {
            ps.setInt(1, cat.getCategoryID());
            ps.setString(2, cat.getCategoryName());
            ps.setString(3, cat.getCategoryStatus());
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
             PreparedStatement statement = connection.prepareStatement("DELETE FROM category WHERE categoryID=?");) {
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
                     ("UPDATE staff set categoryName=?,categoryStatus=? WHERE categoryID = ?");)
        {
            ps.setString(2, cat.getCategoryName());
            ps.setString(3, cat.getCategoryStatus());
            ps.setInt(1, cat.getCategoryID());
            
             //ps.executeUpdate();
             rowUpdated = ps.executeUpdate() > 0;        
    	}

        catch (Exception e) {
            e.printStackTrace();
        }
        
        return rowUpdated;
    }
}
