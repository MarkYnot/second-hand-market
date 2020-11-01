package cn.second_hand.manager.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.second_hand.manager.domain.Manager;
import cn.second_hand.manager.domain.ManagerException;
import cn.second_hand.manager.service.ManagerService;
import cn.second_hand.user.servlet.BaseServlet;

/**
 * Servlet implementation class ManageServlet
 */
public class ManagerServlet extends BaseServlet {
private ManagerService ManagerService = new ManagerService();
	
	public String logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().invalidate();
		return "r:/managerLogin.jsp";
	}
	
	
	
	public  String login(HttpServletRequest request, HttpServletResponse response)    { 
		
		
		Manager manager = new Manager();
		manager.setEmail(request.getParameter("email"));
		manager.setPassword(request.getParameter("password"));
		manager.setName(request.getParameter("name"));
		try {
			Manager cmanager = ManagerService.login(manager);
			request.getSession().setAttribute("session_manager", cmanager);
			return "r:/managerManagement.jsp";
		} catch (ManagerException e) {
			request.setAttribute("msg", e.getMessage());
			request.setAttribute("manager", manager);
			return "f:/managerLogin.jsp";
		}
	
	}

}
