package com.example.adidos;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class CategoryHandler
 */
@WebServlet("/StoreHandler")
public class StoreHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private StoreDao cd;
    public void init() {
        cd = new StoreDao();
    }
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreHandler() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String action = request.getParameter("action");
        try {
            switch (action) {
                case "createStore":
                    createStore(request, response);
                    break;
                case "deleteStore":
                    deleteStore(request,response);
                    break;
                case "updateStore":
                    updateStore(request,response);
                    break;
            }

        } catch (SQLException e) {
            throw new ServletException(e);
        }

    }
    private void createStore(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {

        String storeName = request.getParameter("storeName");
        String storeStatus = request.getParameter("storeStatus");

        Store cat = new Store();

        cat.setStoreName(storeName);
        cat.setStoreStatus(storeStatus);

        cd.createStore(cat);
        response.sendRedirect("storeList.jsp");
    }

    private void deleteStore(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("storeID"));
        cd.deleteStore(id);
        response.sendRedirect("storeList.jsp");
    }

    private void updateStore(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int storeID = Integer.parseInt(request.getParameter("storeID"));
        String storeName = request.getParameter("storeName");
        String storeStatus = request.getParameter("storeStatus");
        
        Store cat = new Store();

        cat.setStoreID(storeID);
        cat.setStoreName(storeName);
        cat.setStoreStatus(storeStatus);

        cd.updateStore(cat);

        response.sendRedirect("storeList.jsp");
    }
}