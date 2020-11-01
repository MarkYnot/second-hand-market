package cn.second_hand.manager.dao;

import org.bson.Document;
import org.bson.conversions.Bson;

import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;

import cn.second_hand.user.utils.MongoDBUtils;

public class ManagerDao {

	private MongoDatabase database = MongoDBUtils.getConnect();
	private MongoCollection<Document> collection = database.getCollection("Manager");
	
	

	public Document findByEmail(String email) {
		Bson filter = Filters.eq("email", email);
		FindIterable findIterable = collection.find(filter);
		Document document = (Document) findIterable.first();
		return document;
	}
}


