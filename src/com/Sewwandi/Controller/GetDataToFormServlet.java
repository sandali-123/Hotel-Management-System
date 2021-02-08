package com.Sewwandi.Controller;

import java.io.IOException;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Sewwandi.Bean.EmpBean;

/*import com.Sewwandi.Bean.empLeaveBean;*/
import com.Sewwandi.Model.leaveDB;

/**
 * Servlet implementation class GetDataToFormServlet
 */
@WebServlet("/GetDataToFormServlet")
public class GetDataToFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// catch the ID form per_leave_applyEID.jsp
				String ID = request.getParameter("L_Emp_ID");

				try {
					// make list object
					List<EmpBean> empDetails = leaveDB.getDataToForm(ID); // set the details
					request.setAttribute("empDetails", empDetails);
				} catch (Exception e) {
					e.printStackTrace();
				}

				// redirect to the values to another page servlet-> to view
				RequestDispatcher dis = request.getRequestDispatcher("Per_leave_apply.jsp");
				dis.forward(request, response);
			}
		
		
		
}
