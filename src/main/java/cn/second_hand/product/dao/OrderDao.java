package cn.second_hand.product.dao;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.bson.Document;
import org.bson.conversions.Bson;
import org.bson.types.ObjectId;

import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;

import cn.second_hand.product.domain.Order;
import cn.second_hand.query.AuditQueryObject;
import cn.second_hand.query.QueryObject;
import cn.second_hand.user.dao.UserDao;
import cn.second_hand.user.utils.MongoDBUtils;

public class OrderDao {
	public static MongoDatabase database = MongoDBUtils.getConnect();
	private MongoCollection<Document> orderCollection = database.getCollection("order");
	private UserDao userDao = new UserDao();
	public void saveOrder(Order order) {
		orderCollection.insertOne(new Document("oId",order.getoId())
				.append("uId", order.getuId())
				.append("userTypeId", order.getUserTypeId())
				.append("category", order.getCategory())
				.append("money", order.getMoney())
				.append("number", order.getNumber())
				.append("payType", order.getPayType())
				.append("description", order.getDescription())
				.append("orderState", order.getOrderState())
				.append("deliveryAddress", order.getDeliveryAddress())
				.append("logistic", order.getLogistic())
				.append("createTime", order.getCreateTime())
				.append("updateTime", order.getUpdateTime())
				);
	}
	public int queryForCount(AuditQueryObject auditQueryObject) {
		return (int) orderCollection.count();
	}
	public List<Order> selectAllOrderList(QueryObject queryObject) {
		FindIterable<Document> findIterable = orderCollection.find().limit(queryObject.getPageSize())
				.skip(queryObject.getStart());
		List<Order> list = new ArrayList<Order>();
		for (Document document:findIterable) {
			Order order = new Order();
			order.setoId(document.getObjectId("_id"));
			order.setuId(document.getInteger("uId"));
			order.setUserTypeId(document.getInteger("userTypeId"));
			order.setCategory(document.getString("category"));
			order.setMoney(document.getDouble("money"));
			order.setPayType(document.getInteger("payType"));
			order.setDescription(document.getString("description"));
			order.setOrderState(document.getInteger("orderState"));
			order.setDeliveryAddress(document.getString("deliveryAddress"));
			order.setLogistic(document.getString("logistic"));
			order.setOrderState(document.getInteger("orderState"));
			order.setNumber(document.getInteger("number"));
			order.setCreateTime(document.getDate("createTime"));
			order.setUpdateTime(document.getDate("updateTime"));
			list.add(order);
		}
		return list;
	}
	public List<Order> getBuyersOrderList(AuditQueryObject auditQueryObject) {
		Bson bson = Filters.eq("userTypeId",1);
		FindIterable<Document> findIterable = orderCollection.find(bson).limit(auditQueryObject.getPageSize())
				.skip(auditQueryObject.getStart());
		List<Order> list = new ArrayList<Order>();
		for (Document document:findIterable) {
			Order order = new Order();
			order.setoId(document.getObjectId("_id"));
			order.setuId(document.getInteger("uId"));
			order.setUserTypeId(document.getInteger("userTypeId"));
			order.setCategory(document.getString("category"));
			order.setMoney(document.getDouble("money"));
			order.setPayType(document.getInteger("payType"));
			order.setDescription(document.getString("description"));
			order.setOrderState(document.getInteger("orderState"));
			order.setDeliveryAddress(document.getString("deliveryAddress"));
			order.setLogistic(document.getString("logistic"));
			order.setOrderState(document.getInteger("orderState"));
			order.setNumber(document.getInteger("number"));
			order.setCreateTime(document.getDate("createTime"));
			order.setUpdateTime(document.getDate("updateTime"));
			list.add(order);
		}
		return list;
	}
	public List<Order> getSellerOrderList(AuditQueryObject auditQueryObject) {
		Bson bson = Filters.eq("userTypeId",2);
		FindIterable<Document> findIterable = orderCollection.find(bson).limit(auditQueryObject.getPageSize())
				.skip(auditQueryObject.getStart());
		List<Order> list = new ArrayList<Order>();
		for (Document document:findIterable) {
			Order order = new Order();
			order.setoId(document.getObjectId("_id"));
			order.setuId(document.getInteger("uId"));
			order.setUserTypeId(document.getInteger("userTypeId"));
			order.setCategory(document.getString("category"));
			order.setMoney(document.getInteger("money"));
			order.setPayType(document.getInteger("payType"));
			order.setDescription(document.getString("description"));
			order.setOrderState(document.getInteger("orderState"));
			order.setDeliveryAddress(document.getString("deliveryAddress"));
			order.setLogistic(document.getString("logistic"));
			order.setOrderState(document.getInteger("orderState"));
			order.setNumber(document.getInteger("number"));
			order.setCreateTime(document.getDate("createTime"));
			order.setUpdateTime(document.getDate("updateTime"));
			list.add(order);
		}
		return list;
	}
	public static void main(String[] args) {
		OrderDao orderDao = new OrderDao();
		AuditQueryObject auditQueryObject = new AuditQueryObject();
		auditQueryObject.setPageSize(2);
		System.out.println(orderDao.getBuyersOrderList(auditQueryObject));
		System.out.println(orderDao.getSellerOrderList(auditQueryObject));
		/*
		 * OrderDao orderDao = new OrderDao(); Order order = new Order();
		 * order.setDescription("This is a description");
		 * order.setCategory("This is a species"); order.setCreateTime(new Date());
		 * order.setUpdateTime(new Date()); order.setLogistic("Amazon");
		 * order.setDeliveryAddress("ChengDu"); order.setNumber(2); order.setMoney(258);
		 * order.setoId(ObjectId.get()); order.setuId(2); order.setUserTypeId(2);
		 * order.setOrderState(1); order.setPayType(1); orderDao.saveOrder(order);
		 */
		/*
		 * MongoCollection<Document> productCollection =
		 * database.getCollection("order"); FindIterable<Document> findIterable =
		 * productCollection.find(); MongoCursor<Document> mongoCursor =
		 * findIterable.iterator(); Document document = mongoCursor.next();
		 * System.out.println(document.getString("name")+",");
		 */
	}
}