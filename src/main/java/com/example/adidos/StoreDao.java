package com.example.adidos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import static java.lang.System.out;

public class StoreDao {

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

    public void createStore(Store cat) throws SQLException {

        // try-with-resource statement will auto close the connection.
    	
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement
                     ("INSERT INTO STORE(storeName,storeStatus) values(?,?)"))
        {
            ps.setString(1, cat.getStoreName());
            ps.setString(2, cat.getStoreStatus());
            out.println(ps);
            ps.executeUpdate();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public boolean deleteStore(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("DELETE FROM store WHERE storeID=?");) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateStore (Store cat) throws SQLException {
    	
    	boolean rowUpdated = true;
        // try-with-resource statement will auto close the connection.
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement
                     ("UPDATE store set storeName=?,storeStatus=? WHERE storeID = ?"))

        {
            ps.setString(1, cat.getStoreName());
            ps.setString(2, cat.getStoreStatus());
            ps.setInt(3, cat.getStoreID());
            
             //ps.executeUpdate();
             rowUpdated = ps.executeUpdate() > 0;        
    	}

        catch (Exception e) {
            e.printStackTrace();
        }
        
        return rowUpdated;
    }
}
