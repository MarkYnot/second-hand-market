package cn.second_hand.cart.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

import cn.second_hand.cart.domain.Cart;
import cn.second_hand.cart.service.CartService;
import cn.second_hand.cart.vos.CartVo;
import cn.second_hand.product.dao.ProductDao;
import cn.second_hand.product.domain.Product;
import cn.second_hand.user.domain.User;
import cn.second_hand.user.servlet.BaseServlet;

public class PayServlet extends BaseServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private CartService cartService = new CartService();
	private ProductDao productDao = new ProductDao();

    public String payList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User)request.getSession().getAttribute("session_user");
        List<CartVo> cartVos = cartService.queryByUser(user.getEmail());
        String productIds = request.getParameter("productIds");
        int totalPrice = 0;
        if(productIds!=null && productIds.length()>0){
        	String[] productIdArr = productIds.split(",");
        	for(String id:productIdArr){
        		Product product = productDao.queryByIdStr(id);
        		totalPrice += product.getPrice();
        	}
        	
                    	
        }
        
        request.setAttribute("totalPrice", totalPrice);
        return "f:/pay.jsp";
    }

    
}
