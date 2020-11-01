package cn.second_hand.product.service;

import java.util.ArrayList;
import java.util.List;

import cn.second_hand.product.dao.OrderDao;
import cn.second_hand.product.domain.Order;
import cn.second_hand.query.AuditQueryObject;
import cn.second_hand.query.PageResult;

public class OrderService {
	private OrderDao orderDao = new OrderDao();
	
	//保存订单
	public void saveOrder(Order order) {
		orderDao.saveOrder(order);
	}
	
	//买家订单表
	public PageResult getBuyersOrder(AuditQueryObject auditQueryObject) {
		int count = orderDao.queryForCount(auditQueryObject);
		List<Order> orders = orderDao.getBuyersOrderList(auditQueryObject);
		return new PageResult(orders, count, auditQueryObject.getCurrentPage(), auditQueryObject.getPageSize());
	}
	
	//卖家订单表
	public PageResult getSellerOrder(AuditQueryObject auditQueryObject) {
		int count = orderDao.queryForCount(auditQueryObject);
		List<Order> orders = orderDao.getSellerOrderList(auditQueryObject);
		return new PageResult(orders, count, auditQueryObject.getCurrentPage(), auditQueryObject.getPageSize());
	}
	
	public PageResult getBuyersOrderbyOderNumber(AuditQueryObject auditQueryObject, String OrderNumber) {
		PageResult ps = getBuyersOrder(auditQueryObject);
		List<Order> searchOrders = new ArrayList<Order>();
		for(Order o : (ArrayList<Order>)ps.getListData()) {
			if(o.getoId().toString().contains(OrderNumber)) {
				searchOrders.add(o);
			}
		}
		ps = new PageResult(searchOrders, searchOrders.size(), auditQueryObject.getCurrentPage(), auditQueryObject.getPageSize());
		return ps;
	}
	
	public PageResult getSellerOrderbyOderNumber(AuditQueryObject auditQueryObject, String OrderNumber) {
		PageResult ps = getSellerOrder(auditQueryObject);
		List<Order> searchOrders = new ArrayList<Order>();
		for(Order o : (ArrayList<Order>)ps.getListData()) {
			if(o.getoId().toString().contains(OrderNumber)) {
				searchOrders.add(o);
			}
		}
		ps = new PageResult(searchOrders, searchOrders.size(), auditQueryObject.getCurrentPage(), auditQueryObject.getPageSize());
		return ps;
	}
}
