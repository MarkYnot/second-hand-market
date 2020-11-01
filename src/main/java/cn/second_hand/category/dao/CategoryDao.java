package cn.second_hand.category.dao;

import java.util.ArrayList;
import java.util.List;

import org.bson.Document;
import org.bson.conversions.Bson;
import org.bson.types.ObjectId;

import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;

import cn.second_hand.category.domain.Category;
import cn.second_hand.user.utils.MongoDBUtils;

public class CategoryDao {
	
	private MongoDatabase database = MongoDBUtils.getConnect();
    private MongoCollection<Document> CategoryCollection = database.getCollection("category");
	
    
    /**
     * search category
     * @return
     */
    public List<Category> findAll() {
		FindIterable<Document> findIterable = CategoryCollection.find();
		List<Category> list = new ArrayList<Category>();
		for(Document d: findIterable) {
			Category c = new Category();
			c.setOid(d.getObjectId("_id"));
			c.setCategoriesName(d.getString("categoriesName"));
			c.setDescription(d.getString("description"));
			list.add(c);
			
		}
		return list;
	}

/**
 * add category
 * @param category
 */
	public void add(Category category) {
		CategoryCollection.insertOne(new Document("categoriesName", category.getCategoriesName())
				.append("description", category.getDescription()));
		
	}

public void delete(ObjectId oid) {
	 Bson filter = Filters.eq("_id", oid);
	 CategoryCollection.findOneAndDelete(filter);
	
}

public Category load(ObjectId categoryId) {
	 Bson filter = Filters.eq("_id",categoryId);
	Document d = CategoryCollection.find(filter).first();
	Category c = null;
		if (d !=null) {
			c = new Category();
			c.setOid(d.getObjectId("_id"));
			c.setCategoriesName(d.getString("categoriesName"));
			c.setDescription(d.getString("description"));
			
		}
		return c;
}

public void edit(Category category) {
	ObjectId oid = category.getOid();
	Bson filter = Filters.eq("_id",oid);
	CategoryCollection.updateOne(filter, 
			new Document("$set",
			      new Document("categoriesName", category.getCategoriesName())
			               .append("description", category.getDescription())));    
	
		}

    
    
    
}
