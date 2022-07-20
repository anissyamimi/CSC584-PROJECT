import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.adidos.Category;
import com.example.adidos.CategoryDao;

/**
 * Servlet implementation class CategoryHandler
 */
@WebServlet("/CategoryHandler")
public class CategoryHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private CategoryDao cd;
    public void init() {
        cd = new CategoryDao();
    }
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryHandler() {
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
                case "createCategory":
                    createCategory(request, response);
                    break;
                case "deleteCategory":
                    deleteCategory(request,response);
                    break;
                case "updateCategory":
                    updateCategory(request,response);
                    break;
            }

        } catch (SQLException e) {
            throw new ServletException(e);
        }

    }
    private void createCategory(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {

    	int categoryID = Integer.parseInt(request.getParameter("categoryID"));
        String categoryName = request.getParameter("categoryName");
        String categoryStatus = request.getParameter("categoryStatus");

        Category cat = new Category();

        cat.setCategoryID(categoryID);
        cat.setCategoryName(categoryName);
        cat.setCategoryStatus(categoryStatus);

        cd.createCategory(cat);
        response.sendRedirect("categoryList.jsp");
    }

    private void deleteCategory(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("categoryID"));
        cd.deleteCategory(id);
        response.sendRedirect("categoryList.jsp");
    }

    private void updateCategory(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String categoryName = request.getParameter("categoryName");
        String categoryStatus = request.getParameter("categoryStatus");
        
        Category cat = new Category();

        cat.setCategoryID(id);
        cat.setCategoryName(categoryName);
        cat.setCategoryStatus(categoryStatus);

        cd.updateCategory(cat);

        response.sendRedirect("donationList.jsp");
    }
}