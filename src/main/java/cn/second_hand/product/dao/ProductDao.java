package cn.second_hand.product.dao;

import java.util.ArrayList;
import java.util.List;

import org.bson.Document;
import org.bson.conversions.Bson;
import org.bson.types.ObjectId;

import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;

import cn.second_hand.product.domain.Product;
import cn.second_hand.query.AuditQueryObject;
import cn.second_hand.user.dao.UserDao;
import cn.second_hand.user.utils.MongoDBUtils;

public class ProductDao {
	private MongoDatabase database = MongoDBUtils.getConnect();
	private MongoCollection<Document> productCollection = database.getCollection("product");
	private UserDao userDao = new UserDao();

	public void saveSaleApp(Product product) {
		productCollection.insertOne(new Document("title", product.getTitle())
				.append("applyEmail", product.getApplierEmail()).append("applyTime", product.getApplyTime())
				.append("auditTime", null).append("category", product.getCategory())
				.append("description", product.getDescription()).append("picture1", product.getPicture1())
				.append("picture2", product.getPicture2()).append("price", product.getPrice())
				.append("bargainStatus", product.isBargainStatus()).append("applyStatus", false).append("remark", null)
				.append("auditState", 0).append("isHide", false).append("sold", false));
	}

	public int queryForAllSaleApplicationCount(AuditQueryObject auditQueryObject) {
		Bson filter = Filters.and(Filters.eq("isHide", false));
		return (int) productCollection.count(filter);
	}

	public List<Product> queryForAllSaleApplication(AuditQueryObject auditQueryObject) {
		Bson filter = Filters.and(Filters.eq("isHide", false));
		FindIterable<Document> findIterable = productCollection.find(filter).limit(auditQueryObject.getPageSize())
				.skip(auditQueryObject.getStart());
		List<Product> list = new ArrayList<Product>();
		for (Document d : findIterable) {
			Product p = new Product();
			p.setOid(d.getObjectId("_id"));
			p.setApplierEmail(d.getString("applyEmail"));
			p.setApplyStatus(d.getBoolean("applyStatus"));
			p.setApplyTime(d.getDate("applyTime"));
			p.setBargainStatus(d.getBoolean("bargainStatus"));
			p.setCategory(d.getString("category"));
			p.setDescription(d.getString("description"));
			p.setPicture1(d.getString("picture1"));
			p.setPicture2(d.getString("picture2"));
			p.setPrice(d.getInteger("price"));
			p.setTitle(d.getString("title"));
			p.setAuditState(d.getInteger("auditState"));
			list.add(p);
		}

		return list;
	}

	public List<Product> queryForSaleApplicationWithState(AuditQueryObject auditQueryObject, Integer state) {
		Bson filter = Filters.and(Filters.eq("isHide", false), Filters.eq("auditState", state));
		FindIterable<Document> findIterable = productCollection.find(filter).limit(auditQueryObject.getPageSize())
				.skip(auditQueryObject.getStart());
		List<Product> list = new ArrayList<Product>();
		for (Document d : findIterable) {
			Product p = new Product();
			p.setOid(d.getObjectId("_id"));
			p.setApplierEmail(d.getString("applyEmail"));
			p.setApplyStatus(d.getBoolean("applyStatus"));
			p.setApplyTime(d.getDate("applyTime"));
			p.setBargainStatus(d.getBoolean("bargainStatus"));
			p.setCategory(d.getString("category"));
			p.setDescription(d.getString("description"));
			p.setPicture1(d.getString("picture1"));
			p.setPicture2(d.getString("picture2"));
			p.setPrice(d.getInteger("price"));
			p.setTitle(d.getString("title"));
			p.setAuditState(d.getInteger("auditState"));
			list.add(p);
		}

		return list;
	}

	public int queryForSaleApplicationCountWithState(AuditQueryObject auditQueryObject, Integer state) {
		Bson filter = Filters.eq("auditState", state);
		return (int) productCollection.count(filter);
	}

	public int queryCurrentUserApplyingListForCount(AuditQueryObject auditQueryObject, String currentUserEmail) {
		Bson filter = Filters.and(Filters.eq("auditState", 0), Filters.eq("applyEmail", currentUserEmail),
				Filters.eq("isHide", false));
		return (int) productCollection.count(filter);
	}

	public List<Product> queryCurrentUserApplyingList(AuditQueryObject auditQueryObject, String currentUserEmail) {
		Bson filter = Filters.and(Filters.eq("auditState", 0), Filters.eq("isHide", false),
				Filters.eq("applyEmail", currentUserEmail));
		FindIterable<Document> findIterable = productCollection.find(filter).limit(auditQueryObject.getPageSize())
				.skip(auditQueryObject.getStart());
		List<Product> list = new ArrayList<Product>();
		for (Document d : findIterable) {
			Product p = new Product();
			p.setOid(d.getObjectId("_id"));
			p.setApplierEmail(d.getString("applyEmail"));
			p.setApplyStatus(d.getBoolean("applyStatus"));
			p.setApplyTime(d.getDate("applyTime"));
			p.setBargainStatus(d.getBoolean("bargainStatus"));
			p.setCategory(d.getString("category"));
			p.setDescription(d.getString("description"));
			p.setPicture1(d.getString("picture1"));
			p.setPicture2(d.getString("picture2"));
			p.setPrice(d.getInteger("price"));
			p.setTitle(d.getString("title"));
			p.setAuditState(d.getInteger("auditState"));
			p.setHide(d.getBoolean("isHide"));
			list.add(p);
		}

		return list;
	}

	public void editCurrentUserSaleApplyingListPage(Product product) {
		ObjectId oid = product.getOid();
		Bson filter = Filters.eq("_id", oid);
		productCollection.updateOne(filter,
				new Document("$set",
						new Document("title", product.getTitle()).append("bargainStatus", product.isBargainStatus())
								.append("category", product.getCategory())
								.append("description", product.getDescription()).append("price", product.getPrice())
								.append("picture1", product.getPicture1()).append("picture2", product.getPicture2())));
	}

	public void hideCurrentUserSaleApplication(ObjectId id) {
		Bson filter = Filters.eq("_id", id);
		productCollection.updateOne(filter, new Document("$set", new Document("isHide", true)));
	}

	public Product queryById(ObjectId productId) {
		Bson filter = Filters.eq("_id", productId);
		Document d = productCollection.find(filter).first();
		Product p = null;
		if (null != d) {
			p = new Product();
			p.setOid(d.getObjectId("_id"));
			p.setApplierEmail(d.getString("applyEmail"));
			p.setApplyStatus(d.getBoolean("applyStatus"));
			p.setApplyTime(d.getDate("applyTime"));
			p.setBargainStatus(d.getBoolean("bargainStatus"));
			p.setCategory(d.getString("category"));
			p.setDescription(d.getString("description"));
			p.setPicture1(d.getString("picture1"));
			p.setPicture2(d.getString("picture2"));
			p.setPrice(d.getInteger("price"));
			p.setTitle(d.getString("title"));
			p.setAuditState(d.getInteger("auditState"));
			p.setHide(d.getBoolean("isHide"));
		}
		return p;
	}

	public int queryAllProductListForCount(AuditQueryObject auditQueryObject) {
		Bson filter = Filters.and(Filters.eq("auditState", 1), Filters.eq("isHide", false), Filters.eq("sold", false));
		return (int) productCollection.count(filter);
	}

	public List<Product> queryAllProductList(AuditQueryObject auditQueryObject) {
		Bson filter = Filters.and(Filters.eq("auditState", 1), Filters.eq("isHide", false), Filters.eq("sold", false));
		FindIterable<Document> findIterable = productCollection.find(filter).limit(auditQueryObject.getPageSize())
				.skip(auditQueryObject.getStart());
		List<Product> list = new ArrayList<Product>();
		for (Document d : findIterable) {
			Product p = new Product();
			p.setOid(d.getObjectId("_id"));
			p.setApplierEmail(d.getString("applyEmail"));
			p.setApplyTime(d.getDate("applyTime"));
			p.setBargainStatus(d.getBoolean("bargainStatus"));
			p.setCategory(d.getString("category"));
			p.setDescription(d.getString("description"));
			p.setPicture1(d.getString("picture1"));
			p.setPicture2(d.getString("picture2"));
			p.setPrice(d.getInteger("price"));
			p.setTitle(d.getString("title"));
			list.add(p);
		}

		return list;
	}

	public int queryForProductListCountWithKeyword(AuditQueryObject auditQueryObject, String keyword) {
		Bson filter = Filters.and(Filters.eq("auditState", 1), Filters.eq("isHide", false),
				Filters.regex("title", "^.*" + keyword + ".*$"), Filters.eq("sold", false));
		return (int) productCollection.count(filter);
	}

	public List<Product> queryForProductListWithKeyword(AuditQueryObject auditQueryObject, String keyword) {
		Bson filter = Filters.and(Filters.eq("auditState", 1), Filters.eq("isHide", false),
				Filters.regex("title", "^.*" + keyword + ".*$"), Filters.eq("sold", false));
		FindIterable<Document> findIterable = productCollection.find(filter).limit(auditQueryObject.getPageSize())
				.skip(auditQueryObject.getStart());
		List<Product> list = new ArrayList<Product>();
		for (Document d : findIterable) {
			Product p = new Product();
			p.setOid(d.getObjectId("_id"));
			p.setApplierEmail(d.getString("applyEmail"));
			p.setApplyTime(d.getDate("applyTime"));
			p.setBargainStatus(d.getBoolean("bargainStatus"));
			p.setCategory(d.getString("category"));
			p.setDescription(d.getString("description"));
			p.setPicture1(d.getString("picture1"));
			p.setPicture2(d.getString("picture2"));
			p.setPrice(d.getInteger("price"));
			p.setTitle(d.getString("title"));
			list.add(p);
		}

		return list;
	}

	public int queryForProductListCountWithCategory(AuditQueryObject auditQueryObject, String category) {
		Bson filter = Filters.and(Filters.eq("auditState", 1), Filters.eq("isHide", false),
				Filters.eq("category", category), Filters.eq("sold", false));
		return (int) productCollection.count(filter);
	}

	public List<Product> queryForProductListWithCategory(AuditQueryObject auditQueryObject, String category) {
		Bson filter = Filters.and(Filters.eq("auditState", 1), Filters.eq("isHide", false),
				Filters.eq("category", category), Filters.eq("sold", false));
		FindIterable<Document> findIterable = productCollection.find(filter).limit(auditQueryObject.getPageSize())
				.skip(auditQueryObject.getStart());
		List<Product> list = new ArrayList<Product>();
		for (Document d : findIterable) {
			Product p = new Product();
			p.setOid(d.getObjectId("_id"));
			p.setApplierEmail(d.getString("applyEmail"));
			p.setApplyTime(d.getDate("applyTime"));
			p.setBargainStatus(d.getBoolean("bargainStatus"));
			p.setCategory(d.getString("category"));
			p.setDescription(d.getString("description"));
			p.setPicture1(d.getString("picture1"));
			p.setPicture2(d.getString("picture2"));
			p.setPrice(d.getInteger("price"));
			p.setTitle(d.getString("title"));
			list.add(p);
		}

		return list;
	}

	public int queryForProductListCountWithKeywordCategory(AuditQueryObject auditQueryObject, String keyword,
			String category) {
		Bson filter = Filters.and(Filters.eq("auditState", 1), Filters.eq("isHide", false),
				Filters.regex("title", "^.*" + keyword + ".*$"), Filters.eq("category", category),
				Filters.eq("sold", false));
		return (int) productCollection.count(filter);
	}

	public List<Product> queryForProductListWithKeywordCategory(AuditQueryObject auditQueryObject, String keyword,
			String category) {
		Bson filter = Filters.and(Filters.eq("auditState", 1), Filters.eq("isHide", false),
				Filters.regex("title", "^.*" + keyword + ".*$"), Filters.eq("category", category),
				Filters.eq("sold", false));
		FindIterable<Document> findIterable = productCollection.find(filter).limit(auditQueryObject.getPageSize())
				.skip(auditQueryObject.getStart());
		List<Product> list = new ArrayList<Product>();
		for (Document d : findIterable) {
			Product p = new Product();
			p.setOid(d.getObjectId("_id"));
			p.setApplierEmail(d.getString("applyEmail"));
			p.setApplyTime(d.getDate("applyTime"));
			p.setBargainStatus(d.getBoolean("bargainStatus"));
			p.setCategory(d.getString("category"));
			p.setDescription(d.getString("description"));
			p.setPicture1(d.getString("picture1"));
			p.setPicture2(d.getString("picture2"));
			p.setPrice(d.getInteger("price"));
			p.setTitle(d.getString("title"));
			list.add(p);
		}

		return list;
	}

	public List<Product> queryForProductListWithSortBy(AuditQueryObject auditQueryObject, int sortBy) {
		DBObject sort = new BasicDBObject();
		sort.put("price", sortBy);
		Bson filter = Filters.and(Filters.eq("auditState", 1), Filters.eq("isHide", false), Filters.eq("sold", false));
		FindIterable<Document> findIterable = productCollection.find(filter).limit(auditQueryObject.getPageSize())
				.skip(auditQueryObject.getStart()).sort((Bson) sort);
		List<Product> list = new ArrayList<Product>();
		for (Document d : findIterable) {
			Product p = new Product();
			p.setOid(d.getObjectId("_id"));
			p.setApplierEmail(d.getString("applyEmail"));
			p.setApplyTime(d.getDate("applyTime"));
			p.setBargainStatus(d.getBoolean("bargainStatus"));
			p.setCategory(d.getString("category"));
			p.setDescription(d.getString("description"));
			p.setPicture1(d.getString("picture1"));
			p.setPicture2(d.getString("picture2"));
			p.setPrice(d.getInteger("price"));
			p.setTitle(d.getString("title"));
			list.add(p);
		}

		return list;
	}

	public List<Product> queryForProductListWithKeywordsortBy(AuditQueryObject auditQueryObject, String keyword,
			int sortBy) {
		DBObject sort = new BasicDBObject();
		sort.put("price", sortBy);
		Bson filter = Filters.and(Filters.eq("auditState", 1), Filters.eq("isHide", false),
				Filters.regex("title", "^.*" + keyword + ".*$"), Filters.eq("sold", false));
		FindIterable<Document> findIterable = productCollection.find(filter).limit(auditQueryObject.getPageSize())
				.skip(auditQueryObject.getStart()).sort((Bson) sort);
		List<Product> list = new ArrayList<Product>();
		for (Document d : findIterable) {
			Product p = new Product();
			p.setOid(d.getObjectId("_id"));
			p.setApplierEmail(d.getString("applyEmail"));
			p.setApplyTime(d.getDate("applyTime"));
			p.setBargainStatus(d.getBoolean("bargainStatus"));
			p.setCategory(d.getString("category"));
			p.setDescription(d.getString("description"));
			p.setPicture1(d.getString("picture1"));
			p.setPicture2(d.getString("picture2"));
			p.setPrice(d.getInteger("price"));
			p.setTitle(d.getString("title"));
			list.add(p);
		}

		return list;
	}

	public List<Product> queryForProductListWithCategorysortBy(AuditQueryObject auditQueryObject, String category,
			int sortBy) {
		DBObject sort = new BasicDBObject();
		sort.put("price", sortBy);
		Bson filter = Filters.and(Filters.eq("auditState", 1), Filters.eq("isHide", false),
				Filters.eq("category", category), Filters.eq("sold", false));
		FindIterable<Document> findIterable = productCollection.find(filter).limit(auditQueryObject.getPageSize())
				.skip(auditQueryObject.getStart()).sort((Bson) sort);
		List<Product> list = new ArrayList<Product>();
		for (Document d : findIterable) {
			Product p = new Product();
			p.setOid(d.getObjectId("_id"));
			p.setApplierEmail(d.getString("applyEmail"));
			p.setApplyTime(d.getDate("applyTime"));
			p.setBargainStatus(d.getBoolean("bargainStatus"));
			p.setCategory(d.getString("category"));
			p.setDescription(d.getString("description"));
			p.setPicture1(d.getString("picture1"));
			p.setPicture2(d.getString("picture2"));
			p.setPrice(d.getInteger("price"));
			p.setTitle(d.getString("title"));
			list.add(p);
		}

		return list;
	}

	public List<Product> queryForProductListWithKeywordCategorySortBy(AuditQueryObject auditQueryObject, String keyword,
			String category, int sortBy) {
		DBObject sort = new BasicDBObject();
		sort.put("price", sortBy);
		Bson filter = Filters.and(Filters.eq("auditState", 1), Filters.eq("isHide", false),
				Filters.eq("category", category), Filters.regex("title", "^.*" + keyword + ".*$"),
				Filters.eq("sold", false));
		FindIterable<Document> findIterable = productCollection.find(filter).limit(auditQueryObject.getPageSize())
				.skip(auditQueryObject.getStart()).sort((Bson) sort);
		List<Product> list = new ArrayList<Product>();
		for (Document d : findIterable) {
			Product p = new Product();
			p.setOid(d.getObjectId("_id"));
			p.setApplierEmail(d.getString("applyEmail"));
			p.setApplyTime(d.getDate("applyTime"));
			p.setBargainStatus(d.getBoolean("bargainStatus"));
			p.setCategory(d.getString("category"));
			p.setDescription(d.getString("description"));
			p.setPicture1(d.getString("picture1"));
			p.setPicture2(d.getString("picture2"));
			p.setPrice(d.getInteger("price"));
			p.setTitle(d.getString("title"));
			list.add(p);
		}

		return list;
	}

	public void auditSaleApplication(Product product) {
		ObjectId oid = product.getOid();
		Bson filter = Filters.eq("_id", oid);
		productCollection.updateOne(filter, new Document("$set",
				new Document("auditState", product.getAuditState()).append("remark", product.getRemark())));
	}

	public int queryCurrentUserSellingListForCount(AuditQueryObject auditQueryObject, String currentUserEmail) {
		Bson filter = Filters.and(Filters.eq("auditState", 1), Filters.eq("applyEmail", currentUserEmail),
				Filters.eq("isHide", false));
		return (int) productCollection.count(filter);
	}

	public List<Product> queryCurrentUserSellingList(AuditQueryObject auditQueryObject, String currentUserEmail) {
		Bson filter = Filters.and(Filters.eq("auditState", 1), Filters.eq("isHide", false),
				Filters.eq("applyEmail", currentUserEmail));
		FindIterable<Document> findIterable = productCollection.find(filter).limit(auditQueryObject.getPageSize())
				.skip(auditQueryObject.getStart());
		List<Product> list = new ArrayList<Product>();
		for (Document d : findIterable) {
			Product p = new Product();
			p.setOid(d.getObjectId("_id"));
			p.setApplierEmail(d.getString("applyEmail"));
			p.setApplyStatus(d.getBoolean("applyStatus"));
			p.setApplyTime(d.getDate("applyTime"));
			p.setBargainStatus(d.getBoolean("bargainStatus"));
			p.setCategory(d.getString("category"));
			p.setDescription(d.getString("description"));
			p.setPicture1(d.getString("picture1"));
			p.setPicture2(d.getString("picture2"));
			p.setPrice(d.getInteger("price"));
			p.setTitle(d.getString("title"));
			p.setAuditState(d.getInteger("auditState"));
			p.setHide(d.getBoolean("isHide"));
			p.setRemark(d.getString("remark"));
			list.add(p);
	}
		return list;
	}

	public int queryCurrentUserRefusedListForCount(AuditQueryObject auditQueryObject, String currentUserEmail) {
		Bson filter = Filters.and(Filters.eq("auditState", 2), Filters.eq("applyEmail", currentUserEmail),
				Filters.eq("isHide", false));
		return (int) productCollection.count(filter);
	}

	public List<Product> queryCurrentUserRefusedList(AuditQueryObject auditQueryObject, String currentUserEmail) {
		Bson filter = Filters.and(Filters.eq("auditState", 2), Filters.eq("isHide", false),
				Filters.eq("applyEmail", currentUserEmail));
		FindIterable<Document> findIterable = productCollection.find(filter).limit(auditQueryObject.getPageSize())
				.skip(auditQueryObject.getStart());
		List<Product> list = new ArrayList<Product>();
		for (Document d : findIterable) {
			Product p = new Product();
			p.setOid(d.getObjectId("_id"));
			p.setApplierEmail(d.getString("applyEmail"));
			p.setApplyStatus(d.getBoolean("applyStatus"));
			p.setApplyTime(d.getDate("applyTime"));
			p.setBargainStatus(d.getBoolean("bargainStatus"));
			p.setCategory(d.getString("category"));
			p.setDescription(d.getString("description"));
			p.setPicture1(d.getString("picture1"));
			p.setPicture2(d.getString("picture2"));
			p.setPrice(d.getInteger("price"));
			p.setTitle(d.getString("title"));
			p.setAuditState(d.getInteger("auditState"));
			p.setHide(d.getBoolean("isHide"));
			p.setRemark(d.getString("remark"));
			list.add(p);
	}
		return list;
	}
	
	public Product queryByIdStr(String productId) {
		Bson filter = Filters.eq("_id", new ObjectId(productId));
		Document d = productCollection.find(filter).first();
		Product p = null;
		if (null != d) {
			p = new Product();
			p.setOid(d.getObjectId("_id"));
			p.setApplierEmail(d.getString("applyEmail"));
			p.setApplyStatus(d.getBoolean("applyStatus"));
			p.setApplyTime(d.getDate("applyTime"));
			p.setBargainStatus(d.getBoolean("bargainStatus"));
			p.setCategory(d.getString("category"));
			p.setDescription(d.getString("description"));
			p.setPicture1(d.getString("picture1"));
			p.setPicture2(d.getString("picture2"));
			p.setPrice(d.getInteger("price"));
			p.setTitle(d.getString("title"));
			p.setAuditState(d.getInteger("auditState"));
			p.setHide(d.getBoolean("isHide"));
		}
		return p;
	}
}
