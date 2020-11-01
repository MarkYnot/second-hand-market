package cn.second_hand.user.dao;

import java.util.ArrayList;
import java.util.List;

import org.bson.Document;
import org.bson.conversions.Bson;

import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;

import cn.second_hand.user.domain.User;
import cn.second_hand.user.utils.MongoDBUtils;

public class UserDao {
	private MongoDatabase database = MongoDBUtils.getConnect();
	private MongoCollection<Document> collection = database.getCollection("customer");
	
	public Document findByEmail(String email) {
		Bson filter = Filters.eq("email", email);
		FindIterable findIterable = collection.find(filter);
		Document document = (Document) findIterable.first();
		return document;
	}
	
	public void register(User user) {
		collection.insertOne(new Document("email",user.getEmail()).append("password", user.getPassword()).append("verifyCode", user.getVerifyCode()).append("activeStatus", false).append("saleApplyStatus", false));
	}
	
	public Document findByVerifyCode(String code) {
		Bson filter = Filters.eq("verifyCode", code);
		FindIterable findIterable = collection.find(filter);
		Document document = (Document) findIterable.first();
		return document;
	}
	
	public void updateActiveState(String code,boolean state) {
		 collection.updateOne(Filters.eq("verifyCode", code), new Document("$set",new Document("activeStatus",state)));
	}

	public void forgotPassword(String userEmail, String resetCode) {
		 collection.updateOne(Filters.eq("email", userEmail), new Document("$set",new Document("passwordResetCode",resetCode)));
	}

	public Document findByPasswordResetCode(String code) {
		Bson filter = Filters.eq("passwordResetCode", code);
		FindIterable findIterable = collection.find(filter);
		Document document = (Document) findIterable.first();
		return document;
	}

	public void resetPassword(String code, String password) {
		 collection.updateOne(Filters.eq("passwordResetCode", code), new Document("$set",new Document("password",password).append("passwordResetCode", null)));
	}
	
	public void updateBalance(String userEmail, Double bal) {
		 collection.updateOne(Filters.eq("email", userEmail), new Document("$set",new Document("balance",bal)));
	}
	
	public List<User> findAll() {
		FindIterable<Document> findIterable = collection.find();
		List<User> list = new ArrayList<User>();
		for(Document d: findIterable) {
			User user = new User();
			user.setOid(d.getObjectId("_id"));
			user.setEmail(d.getString("email"));
			user.setActiveStatus(d.getBoolean("activeStatus"));
			user.setPassword(d.getString("password"));
			list.add(user);
			
		}
		
		return list;
		
	}
	
}
