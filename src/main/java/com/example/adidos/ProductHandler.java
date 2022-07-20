package com.example.adidos;


import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.adidos.Product;
import com.example.adidos.ProductDAO;


/**
 * Servlet implementation class ProductHandler
 */
@WebServlet("/ProductHandler")
public class ProductHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    private ProductDAO pd;
    public void init() {
        pd = new ProductDAO();
    }

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductHandler() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        String action = request.getParameter("action");
        try {
            switch (action) {
                case "createProduct":
                	createProduct(request, response);
                    break;
                case "updateProduct":
                	updateProduct(request,response);
                    break;
                /*case "deleteAnnouncement":
                    deleteAnnouncement(request,response);
                    break;

                case "cancel":
                    cancel(request, response);
                    break;*/

            }

        } catch (SQLException e) {
            throw new ServletException(e);
        }

    }
    private void createProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {

        String productname = request.getParameter("productname");
        float productprice = Float.parseFloat(request.getParameter("productprice"));
        String productcolor = request.getParameter("productcolor");
        int productquantity = Integer.parseInt(request.getParameter("productquantity"));
        String productavailability = request.getParameter("productavailability");
        int categoryid = Integer.parseInt(request.getParameter("categoryid"));


        
        Product pdt = new Product();
        pdt.setProductName(productname);
        pdt.setProductPrice(productprice);
        pdt.setProductColor(productcolor);
        pdt.setProductQuantity(productquantity);
        pdt.setProductAvailability(productavailability);
        pdt.setCategoryID(categoryid);




        pd.createProduct(pdt);
        response.sendRedirect("categoryList.jsp");
    }
    
    /*
    private void deleteAnnouncement(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("aId"));
        ad.deleteAnnouncement(id);
        response.sendRedirect("Announcement.jsp");
    }
    private void updateAnnouncement(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String pic = request.getParameter("aPicture");
        String title = request.getParameter("aTitle");
        String desc = request.getParameter("aDesc");
        String date = request.getParameter("aDate");
        String timme = request.getParameter("aTime");

        Announcement anc = new Announcement();
        anc.setId(id);
        anc.setPicture(pic);
        anc.setTitle(title);
        anc.setDescr(desc);
        anc.setDate(Date.valueOf(date));
        anc.setTime(timme);

        ad.updateAnnouncement(anc);

        response.sendRedirect("Announcement.jsp");
    }

    private void cancel(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        response.sendRedirect("Announcement.jsp");
    }*/
}

