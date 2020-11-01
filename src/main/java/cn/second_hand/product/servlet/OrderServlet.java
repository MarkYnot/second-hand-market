package cn.second_hand.product.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.second_hand.product.service.OrderService;
import cn.second_hand.query.AuditQueryObject;
import cn.second_hand.query.PageResult;
import cn.second_hand.user.servlet.BaseServlet;

public class OrderServlet extends BaseServlet{
	private OrderService orderService = new OrderService();
	
	public void getOrderList(HttpServletRequest request, HttpServletResponse response) throws ServletException,Exception {
		String typeString =  request.getParameter("typeId");
		String keywords = request.getParameter("keywords");
		AuditQueryObject auditQueryObject = new AuditQueryObject();
		auditQueryObject.setPageSize(1);
		int currentPage = 1;
		if(request.getParameter("currentPage")==null || request.getParameter("currentPage").equals("")) {
			auditQueryObject.setCurrentPage(currentPage);
		}
		PageResult pageResult;
		
		if (Integer.valueOf(typeString)==1) {
			if(keywords == null || keywords.equals("")) {
				pageResult = orderService.getBuyersOrder(auditQueryObject);
			}else {
				pageResult = orderService.getBuyersOrderbyOderNumber(auditQueryObject, keywords);
				request.setAttribute("searchParam", keywords);
			}
			
			request.setAttribute("pageResult", pageResult);
			request.getRequestDispatcher("/BuyersOrder.jsp").forward(request, response);
			//return "http://localhost:8080/second-hand/BuyersOrder.jsp";
		}else {
			if(keywords == null || keywords.equals("")) {
				pageResult = orderService.getSellerOrder(auditQueryObject);
			}else {
				pageResult = orderService.getSellerOrderbyOderNumber(auditQueryObject, keywords);
				request.setAttribute("searchParam", keywords);
			}
			
			request.setAttribute("pageResult", pageResult);
			request.getRequestDispatcher("/SellerOrder.jsp").forward(request, response);
			//return "http://localhost:8080/second-hand/SellerOrder.jsp";
			//http://localhost:8080/second-hand/OrderServlet?method=getOrderList&typeId=1
		}
	
	}

}
