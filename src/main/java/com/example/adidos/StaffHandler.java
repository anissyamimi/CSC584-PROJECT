package com.example.adidos;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import com.example.adidos.Staff;
import com.example.adidos.StaffDao;

import java.sql.ResultSet;
import java.sql.Statement;

/**
 * Servlet implementation class StaffHandler
 */
@WebServlet("/StaffHandler")
public class StaffHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private StaffDao sd;
    public void init() {
        sd = new StaffDao();
    }
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StaffHandler() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  String action = request.getParameter("action");

	        try {
	            switch (action) {
	                case "logoutStaff":
	                    logout(request, response);
	                    break;
	            }
	        } 
	        
	        catch (SQLException e) {
	            throw new ServletException(e);
	        }
		
	}
	
	private void logout(HttpServletRequest request, HttpServletResponse response)
	          throws SQLException, IOException {
			  HttpSession session = request.getSession();
		        session.removeAttribute("staffID");
		        session.removeAttribute("staffName");
		        session.invalidate();
		        response.sendRedirect("MainPage.jsp");
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

        String action = request.getParameter("action");
        try {
            switch (action) {
            	case "createStaff":
            		createStaff(request,response);
                    break;
                case "updateStaff":
                    updateStaff(request,response);
                    break;
                case "loginStaff":
                	loginStaff(request, response);
                	break;
            }
        }
        
        catch (SQLException e) {
            throw new ServletException(e);
        }
	}
	
    private void createStaff(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
    	
    	String staffID = request.getParameter("staffID");
    	String staffName = request.getParameter("staffName");
    	String staffPhone = request.getParameter("staffPhone");
    	String staffEmail = request.getParameter("staffEmail");
    	String staffBirthDate = request.getParameter("staffBirthDate");
    	String staffAddress = request.getParameter("staffAddress");
    	String staffCity = request.getParameter("staffCity");
    	int staffPostcode = Integer.parseInt(request.getParameter("staffPostcode"));
    	String staffState = request.getParameter("staffState");
    	String staffGender = request.getParameter("staffGender");
    	String staffNationality = request.getParameter("staffNationality");
    	String staffMaritalStatus = request.getParameter("staffMaritalstatus");
    	String staffRace = request.getParameter("staffRace");
    	String staffPassword = request.getParameter("staffPassword");
        
        Staff sta = new Staff();
        
        sta.setStaffID(staffID);
        sta.setStaffName(staffName);
        sta.setStaffPhone(staffPhone);
        sta.setStaffEmail(staffEmail);
        sta.setStaffBirthDate(Date.valueOf(staffBirthDate));
        sta.setStaffAddress(staffAddress);
        sta.setStaffCity(staffCity);
        sta.setStaffPostcode(staffPostcode);
        sta.setStaffState(staffState);
        sta.setStaffGender(staffGender);
        sta.setStaffNationality(staffNationality);
        sta.setStaffMaritalStatus(staffMaritalStatus);
        sta.setStaffRace(staffRace);
        sta.setStaffPassword(staffPassword);

        sd.createStaff(sta);
        response.sendRedirect("Login.jsp");
    }
    
    private void updateStaff(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
    	
    	//HttpSession session = request.getSession();
    	String staffID = request.getParameter("staffID");
    	String staffName = request.getParameter("staffName");
    	String staffPhone = request.getParameter("staffPhone");
    	String staffEmail = request.getParameter("staffEmail");
    	String staffBirthDate = request.getParameter("staffBirthDate");
    	String staffAddress = request.getParameter("staffAddress");
    	String staffCity = request.getParameter("staffCity");
    	int staffPostcode = Integer.parseInt(request.getParameter("staffPostcode"));
    	String staffState = request.getParameter("staffState");
    	String staffGender = request.getParameter("staffGender");
    	String staffNationality = request.getParameter("staffNationality");
    	String staffMaritalStatus = request.getParameter("staffMaritalStatus");
    	String staffRace = request.getParameter("staffRace");
    	String staffPassword = request.getParameter("staffPassword");
        
        Staff sta = new Staff();
        
        sta.setStaffID(staffID);
        sta.setStaffName(staffName);
        sta.setStaffPhone(staffPhone);
        sta.setStaffEmail(staffEmail);
        sta.setStaffBirthDate(Date.valueOf(staffBirthDate));
        sta.setStaffAddress(staffAddress);
        sta.setStaffCity(staffCity);
        sta.setStaffPostcode(staffPostcode);
        sta.setStaffState(staffState);
        sta.setStaffGender(staffGender);
        sta.setStaffNationality(staffNationality);
        sta.setStaffMaritalStatus(staffMaritalStatus);
        sta.setStaffRace(staffRace);
        sta.setStaffPassword(staffPassword);
        
        sd.updateStaff(sta);
        
        response.sendRedirect("staffInformation.jsp");
    }
    
    public void loginStaff(HttpServletRequest request, HttpServletResponse response)
    		throws SQLException, IOException {
    	
    	HttpSession session = request.getSession();
    	response.setContentType("text/html");
    	StringWriter sWriter = new StringWriter();
    	PrintWriter out = new PrintWriter(sWriter);
    	
    	String username = request.getParameter("identificationnumber");
    	String password = request.getParameter("password1"); 
    	
	    Connection con = null;
    	try {
    		Class.forName("org.postgresql.Driver");
    		String dbURL = "jdbc:postgresql://ec2-44-206-197-71.compute-1.amazonaws.com/d5rq8o52eacr8k";
    	    String user = "snzyojrrgmxiog";
    	    String pass = "f97a885181429218179ab9db94ff4fc6ab7ef611657375b7e35dad06697b711c";
    	    con = DriverManager.getConnection(dbURL,user, pass);
    	    
    	    String sql ="SELECT * From staff";
    	    Statement stmt=con.createStatement();
    	    ResultSet res=stmt.executeQuery(sql);
                
                while (res.next()){
                    if(username.equals(res.getString("staffid")) && password.equals(res.getString("staffpassword")))
                    {
                    	 Staff sta = new Staff();
                    	 
                         sta.setStaffID(res.getString(1));
                         sta.setStaffName(res.getString(2));
                         sta.setStaffPhone(res.getString(3));
                         sta.setStaffEmail(res.getString(4));
                         sta.setStaffBirthDate(res.getDate(5));
                         sta.setStaffGender(res.getString(6));
                         sta.setStaffAddress(res.getString(7));
                         sta.setStaffCity(res.getString(8));
                         sta.setStaffPostcode(res.getInt(9));
                         sta.setStaffState(res.getString(10));
                         sta.setStaffNationality(res.getString(11));
                         sta.setStaffMaritalStatus(res.getString(12));
                         sta.setStaffRace(res.getString(13));
                         sta.setStaffPassword(res.getString(14));

                        session.setAttribute("staffID",sta.getStaffID());
    		         	session.setAttribute("staffName",sta.getStaffName());
    		         	session.setAttribute("staffPhone",sta.getStaffPhone());
    		         	session.setAttribute("staffEmail",sta.getStaffEmail());
    		         	session.setAttribute("staffBirthDate",sta.getStaffBirthDate());
    		         	session.setAttribute("staffAddress",sta.getStaffAddress());
    		         	session.setAttribute("staffCity",sta.getStaffCity());
    		         	session.setAttribute("staffPostcode",sta.getStaffPostcode());
    		         	session.setAttribute("staffState",sta.getStaffState());
    		         	session.setAttribute("staffGender",sta.getStaffGender());
    		         	session.setAttribute("staffNationality",sta.getStaffNationality());
    		         	session.setAttribute("staffMaritalStatus",sta.getStaffMaritalStatus());
    		         	session.setAttribute("staffReligion",sta.getStaffRace());
    		         	session.setAttribute("staffPassword",sta.getStaffPassword());
         	     
                        response.sendRedirect("staffInformation.jsp");
                    }
                    else{}
                }out.print("Password / Identification Number is invalid");
    	}
    	catch (Exception e){
    		e.printStackTrace();
       }
    }

}