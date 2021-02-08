package com.Sewwandi.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Sewwandi.Bean.AddBookingDetailsBean;
import com.Sewwandi.Model.AddBookingDetailsDB;

/**
 * Servlet implementation class UpdateBkServlet
 */
@WebServlet("/UpdateBkServlet")
public class UpdateBkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateBkServlet() {
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
		doGet(request, response);
		
		
		
		if (request.getParameter("updateBk") != null) {

			String roomReservationId = request.getParameter("roomReservationId");
			String cName = request.getParameter("cName");
			String checkIn = request.getParameter("checkIn");
			String checkOut = request.getParameter("checkOut");
			String arrivalTime = request.getParameter("arrivalTime");
			String no_of_adults = request.getParameter("no_of_adults");
			String no_of_kids = request.getParameter("no_of_kids");
			String roomNo = request.getParameter("roomNo");
			String phone_No = request.getParameter("phone_No");
			String roomType = request.getParameter("roomType");
			String totRAmount = request.getParameter("totRAmount");

			int bkID = Integer.parseInt(roomReservationId);
			int adults = Integer.parseInt(no_of_adults);
			int kids = Integer.parseInt(no_of_kids);

			AddBookingDetailsBean AddBookingDetailsBean = new AddBookingDetailsBean();

			AddBookingDetailsBean.setRoomReservationId(bkID);
			AddBookingDetailsBean.setcName(cName);
			AddBookingDetailsBean.setCheckIn(checkIn);
			AddBookingDetailsBean.setCheckOut(checkOut);
			AddBookingDetailsBean.setArrivalTime(arrivalTime);
			AddBookingDetailsBean.setNo_of_adults(adults);
			AddBookingDetailsBean.setNo_of_kids(kids);
			AddBookingDetailsBean.setRoomNo(roomNo);
			AddBookingDetailsBean.setPhone_No(phone_No);
			AddBookingDetailsBean.setRoomType(roomType);
			AddBookingDetailsBean.setTotRAmount(totRAmount);

			AddBookingDetailsDB roomDB = new AddBookingDetailsDB();
			String s2 = roomDB.updateBk(AddBookingDetailsBean);
			System.out.println("hi");

			response.sendRedirect("http://localhost:8080/Hotel_SEWWANDI/selectMyRBookings.jsp");
			System.out.println(s2);

		}
	}

}
