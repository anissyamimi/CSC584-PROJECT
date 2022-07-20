package com.example.adidos;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ProductDAO {
	String dbURL = "jdbc:postgresql://ec2-44-206-197-71.compute-1.amazonaws.com/d5rq8o52eacr8k";
    String user = "snzyojrrgmxiog";
    String pass = "f97a885181429218179ab9db94ff4fc6ab7ef611657375b7e35dad06697b711c";

    protected Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(dbURL, user, pass);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return con;

    }
    public void createProduct (Product pdt) throws SQLException {

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement
                     ("insert into product(productname,productprice,productquantity,productcolor,productavailability,categoryid) values(?,?,?,?,?,?)"))
        {

            ps.setString(1, pdt.getProductName());
            ps.setFloat(2, pdt.getProductPrice());
            ps.setInt(3, pdt.getProductQuantity());
            ps.setString(4, pdt.getProductColor());
            ps.setString(5, pdt.getProductAvailability());
            ps.setInt(6, pdt.getCategoryID());

            ps.executeUpdate();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
        
        public void updateProduct (Product pdt) throws SQLException {
        		try (Connection connection = getConnection();
                    PreparedStatement ps = connection.prepareStatement("update product set productname=?,productprice=?,productquantity=?,productcolor=?,productavailability=?,categoryid=? where productid=?");) 

            {

                ps.setString(1, pdt.getProductName());
                ps.setFloat(2, pdt.getProductPrice());
                ps.setInt(3, pdt.getProductQuantity());
                ps.setString(4, pdt.getProductColor());
                ps.setString(5, pdt.getProductAvailability());
                ps.setInt(6, pdt.getCategoryID());
                ps.setInt(7, pdt.getProductID());


                ps.executeUpdate();
            }
            catch (Exception e) {
                e.printStackTrace();
            
    }
            }
        
        public void deleteProduct(int id) throws SQLException {
            try (Connection connection = getConnection();
                 PreparedStatement statement = connection.prepareStatement("delete from product where productid=?")) {
                statement.setInt(1, id);
                
                statement.executeUpdate();
            }
        }        
          
    /*
    public boolean deleteAnnouncement(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("delete from announcement where announcementid=?");) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
    public boolean updateAnnouncement(Announcement anc) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement("update announcement set announcementpicture=?,announcementtitle=?,announcementdesc=?,announcementdate=?,announcementtime=? where announcementid=?");) {

            ps.setString(1, anc.getPicture());
            ps.setString(2, anc.getTitle());
            ps.setString(3, anc.getDescr());
            ps.setDate(4, anc.getDate());
            ps.setString(5, anc.getTime());
            ps.setInt(6, anc.getId());
            rowUpdated = ps.executeUpdate() > 0;
        }
        return rowUpdated;
    }*/
}

