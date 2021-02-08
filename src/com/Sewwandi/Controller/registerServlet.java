package com.Sewwandi.Controller;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Sewwandi.Bean.User;
import com.Sewwandi.Model.registerService;


@WebServlet("/registerServlet")
public class registerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public registerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		//register page post input
		System.out.println("test");
		
				response.setContentType("text/html");
				
				User user =  new User();
				
				user.setFname(request.getParameter("fname"));
				user.setLname(request.getParameter("lname"));
				user.setGender(request.getParameter("gender"));
				user.setNic(request.getParameter("nic"));
				user.setAddress(request.getParameter("address"));
				user.setPhone(request.getParameter("phone"));
				user.setEmail(request.getParameter("email"));
				user.setPassword(request.getParameter("password"));
				user.setUsername(request.getParameter("username"));
				
				registerService register = new registerService();
				register.register(user);
				
				if(register.getUserRegister()==0) {
					request.setAttribute("user", user);
					HttpSession session = request.getSession();
					session.setAttribute("errors_success",2);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/register.jsp");
					dispatcher.forward(request, response);
				}else if(register.getUserRegister()==1){
					request.setAttribute("user", user);
					HttpSession session = request.getSession();
					session.setAttribute("errors_success",1);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/login.jsp");
					dispatcher.forward(request, response);
				}else if(register.getUserRegister()==2){
					request.setAttribute("user", user);
					HttpSession session = request.getSession();
					session.setAttribute("errors_success",3);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/register.jsp");
					dispatcher.forward(request, response);
				}
				
		
	}

}
