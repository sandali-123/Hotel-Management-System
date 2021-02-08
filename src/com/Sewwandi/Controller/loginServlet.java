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
import com.Sewwandi.Model.loginService;
import com.Sewwandi.Model.registerService;



@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public loginServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
		
		//login page post input
		
		response.setContentType("text/html");
		
		User user =  new User();
		
		user.setUsername(request.getParameter("username"));
		user.setPassword(request.getParameter("password"));
		
		
		loginService login = new loginService();
		login.login(user);
		
		if(login.getLoginUser()==1) {
			HttpSession session = request.getSession();
			session.setAttribute("userEmail",user.getUsername());
			session.setAttribute("userType","user");
			session.setAttribute("userPoints",login.getUserPoints());
			session.setAttribute("fname",login.getFname());
			session.setAttribute("lname", login.getLname());
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/customerloghome.jsp");
			dispatcher.forward(request, response);
		}else if(login.getLoginUser()==2) {
			HttpSession session = request.getSession();
			session.setAttribute("userEmail",user.getUsername());
			session.setAttribute("userType","receptionist");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Receptionist.jsp");
			dispatcher.forward(request, response);
		}else if(login.getLoginUser()==3) {
			HttpSession session = request.getSession();
			session.setAttribute("userEmail",user.getUsername());
			session.setAttribute("userType","manager");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/MangerHome.jsp");
			dispatcher.forward(request, response);
		}else if(login.getLoginUser()==4) {
			HttpSession session = request.getSession();
			session.setAttribute("userEmail",user.getUsername());
			session.setAttribute("userType","admin");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/adminhome.jsp");
			dispatcher.forward(request, response);
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("errors_success",2);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/login.jsp");
			dispatcher.forward(request, response);
		}
		
		
		
		
		
		
	}

}
