package com.example.adidos;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import static java.lang.System.out;

public class StaffDao {
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
    public void createStaff(Staff sta) throws SQLException {

        // try-with-resource statement will auto close the connection.
    	
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement
                     ("INSERT INTO STAFF(staffID,staffName,staffPhone,staffEmail,staffBirthDate,staffAddress,staffCity,staffPostcode,staffState,staffGender,staffNationality,staffMaritalStatus,staffRace,staffPassword) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)"))
        {
            ps.setString(1, sta.getStaffID());
            ps.setString(2, sta.getStaffName());
            ps.setString(3, sta.getStaffPhone());
            ps.setString(4, sta.getStaffEmail());
            ps.setDate(5, sta.getStaffBirthDate());
            ps.setString(6, sta.getStaffAddress());
            ps.setString(7, sta.getStaffCity());
            ps.setInt(8, sta.getStaffPostcode());
            ps.setString(9, sta.getStaffState());
            ps.setString(10, sta.getStaffGender());
            ps.setString(11, sta.getStaffNationality());
            ps.setString(12, sta.getStaffMaritalStatus());
            ps.setString(13, sta.getStaffRace());
            ps.setString(14, sta.getStaffPassword());
            out.println(ps);
            ps.executeUpdate();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean updateStaff (Staff sta) throws SQLException {
    	
    	boolean rowUpdated = true;
        // try-with-resource statement will auto close the connection.
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement
                     ("UPDATE staff set staffName=?,staffPhone=?,staffEmail=?,staffBirthDate=?,staffAddress=?,staffCity=?,staffPostcode=?,staffState=?,staffGender=?,staffNationality=?,staffMaritalStatus=?,staffRace=?,staffPassword WHERE staffID = ?");)
        {
            ps.setString(1, sta.getStaffName());
            ps.setString(2, sta.getStaffPhone());
            ps.setString(3, sta.getStaffEmail());
            ps.setDate(4, sta.getStaffBirthDate());
            ps.setString(5, sta.getStaffAddress());
            ps.setString(6, sta.getStaffCity());
            ps.setInt(7, sta.getStaffPostcode());
            ps.setString(8, sta.getStaffState());
            ps.setString(9, sta.getStaffGender());
            ps.setString(10, sta.getStaffNationality());
            ps.setString(11, sta.getStaffMaritalStatus());
            ps.setString(12, sta.getStaffRace());
            ps.setString(13, sta.getStaffPassword());
            ps.setString(14, sta.getStaffID());
            
             //ps.executeUpdate();
             rowUpdated = ps.executeUpdate() > 0;        
    	}

        catch (Exception e) {
            e.printStackTrace();
        }
        
        return rowUpdated;
    }
}
