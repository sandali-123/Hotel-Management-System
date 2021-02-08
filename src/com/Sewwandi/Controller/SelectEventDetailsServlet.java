package com.Sewwandi.Controller;

import java.io.IOException;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Sewwandi.Bean.EventBean;
import com.Sewwandi.Model.EventDB;

@WebServlet("/SelectEventDetailsServlet")
public class SelectEventDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
		String  name = request.getParameter("customername");
		String date = request.getParameter("eventdate");
		
		
		try {
		List<EventBean> eventDetails = EventDB.validate(name,date);
		request.setAttribute("eventDetails", eventDetails);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher dis = request.getRequestDispatcher("http://localhost:8080/Hotel_SEWWANDI/HallBookingDetails.jsp");
		dis.forward(request, response);
		
		
		
	}

}
