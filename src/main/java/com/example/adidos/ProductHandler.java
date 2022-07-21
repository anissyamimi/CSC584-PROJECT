package com.example.adidos;


import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
                case "deleteProduct":
                	deleteProduct(request,response);
                    break;



            }

        } catch (SQLException e) {
            throw new ServletException(e);
        }

    }
    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		// TODO Auto-generated method stub
    	
        String productname = request.getParameter("productname");
        float productprice = Float.parseFloat(request.getParameter("productprice"));
        String productcolor = request.getParameter("productcolor");
        int productquantity = Integer.parseInt(request.getParameter("productquantity"));
        String productavailability = request.getParameter("productavailability");
        int categoryid = Integer.parseInt(request.getParameter("categoryid"));
        int productid = Integer.parseInt(request.getParameter("id"));
        String id = request.getParameter("sid");



        
        Product pdt = new Product();
        pdt.setProductID(productid);
        pdt.setProductName(productname);
        pdt.setProductPrice(productprice);
        pdt.setProductColor(productcolor);
        pdt.setProductQuantity(productquantity);
        pdt.setProductAvailability(productavailability);
        pdt.setCategoryID(categoryid);
        pdt.setStaffID(id);
        int storeid = Integer.parseInt(request.getParameter("storeid"));
        pdt.setStoreID(storeid);
        
        System.out.println(pdt.getStaffID());





        pd.updateProduct(pdt);
        response.sendRedirect("productList.jsp");

		
	}


	private void createProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
		
		
		HttpSession session = request.getSession();
        String productname = request.getParameter("productname");
        float productprice = Float.parseFloat(request.getParameter("productprice"));
        String productcolor = request.getParameter("productcolor");
        int productquantity = Integer.parseInt(request.getParameter("productquantity"));
        String productavailability = request.getParameter("productavailability");
        int categoryid = Integer.parseInt(request.getParameter("categoryid"));
        int storeid = Integer.parseInt(request.getParameter("storeid"));
        String id = (String) session.getAttribute("staffID");


        
        Product pdt = new Product();
        pdt.setProductName(productname);
        pdt.setProductPrice(productprice);
        pdt.setProductColor(productcolor);
        pdt.setProductQuantity(productquantity);
        pdt.setProductAvailability(productavailability);
        pdt.setCategoryID(categoryid);
        pdt.setStaffID(id);
        pdt.setStoreID(storeid);




        pd.createProduct(pdt);
        response.sendRedirect("productList.jsp");
    }
	
    private void deleteProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("productid"));
        pd.deleteProduct(id);
        response.sendRedirect("productList.jsp");
    }
    
}

