package cn.second_hand.product.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bson.Document;

import com.mongodb.BasicDBObject;
import com.mongodb.ConnectionString;
import com.mongodb.MongoClientSettings;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;

import cn.second_hand.product.domain.Product;

/**
 * Servlet implementation class OnlineTicketing
 */
@WebServlet("/detail")
public class ItemDescription extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static MongoDatabase mongoDatabase;

	/**
	 * Default constructor.
	 */
	public ItemDescription() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		ConnectionString connString = new ConnectionString(
				"mongodb://marin:a123456@ds019950.mlab.com:19950/heroku_p78k6xgn");
		MongoClientSettings settings = MongoClientSettings.builder().applyConnectionString(connString)
				.retryWrites(false).build();
		MongoClient mongoClient = MongoClients.create(settings);
		MongoDatabase database = mongoClient.getDatabase("heroku_p78k6xgn");
		BasicDBObject queryObject = null;
		if (id == 1) {
			queryObject = new BasicDBObject("title", "bphone");
		}
		if (id == 2) {
			queryObject = new BasicDBObject("title", "apple watch");
		}
		if (id == 3) {
			queryObject = new BasicDBObject("title", "laptop");
		}
		if (id == 4) {
			queryObject = new BasicDBObject("title", "macbook 2017");
		}
		FindIterable<Document> doc = database.getCollection("product").find(queryObject);
		MongoCursor<Document> mongoCursor = doc.iterator();
		Product product = new Product();
		while (mongoCursor.hasNext()) {
			Document document = mongoCursor.next();
			System.out.println(document);
			System.out.println("sdf" + document.get("title"));
			product.setApplierEmail(document.get("applyEmail") == null ? "" : document.get("applyEmail").toString());
//			product.setApplyStatus(document.get("applyStatus") == null ? "" : document.get("applyStatus").toString());
//			product.setApplyTime(document.get("applyTime") == null ? "" : document.get("applyTime").toString());
//			product.setAuditTime(document.get("auditTime") == null ? "" : document.get("auditTime").toString());
//			product.setBargainStatus(
//					document.get("bargainStatus") == null ? "" : document.get("bargainStatus").toStzzring());
			product.setCategory(document.get("category") == null ? "" : document.get("category").toString());
			product.setDescription(document.get("description") == null ? "" : document.get("description").toString());
			product.setHide(
					Boolean.getBoolean(document.get("isHide") == null ? "" : document.get("isHide").toString()));
			product.setPicture1(document.get("picture1") == null ? "" : document.get("picture1").toString());
			product.setPicture2(document.get("picture2") == null ? "" : document.get("picture2").toString());
			product.setPrice(document.get("price") == null ? new Integer("") : document.getInteger("price"));
			product.setRemark(document.get("remark") == null ? "" : document.get("remark").toString());
			product.setTitle(document.get("title") == null ? "" : document.get("title").toString());
			product.setAuditState(
					Integer.parseInt(document.get("auditState") == null ? "" : document.get("auditState").toString()));
			if (!"".equals(product.getTitle()) && product.getTitle() != null) {
				break;
			}
		}
		if (id == 1) {
			request.setAttribute("product", product);
			request.getRequestDispatcher("detail-earphone.jsp").forward(request, response);
		} else if (id == 2) {
			request.setAttribute("product", product);
			request.getRequestDispatcher("detail-mainframe-computer.jsp").forward(request, response);
		} else if (id == 3) {
			request.setAttribute("product", product);
			request.getRequestDispatcher("detail-earphone.jsp").forward(request, response);
		} else {
			request.setAttribute("product", product);
			request.getRequestDispatcher("detail-ipad.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	public MongoDatabase getConnect() {
		ConnectionString connString = new ConnectionString(
				"mongodb://marin:a123456@ds019950.mlab.com:19950/heroku_p78k6xgn");
		MongoClientSettings settings = MongoClientSettings.builder().applyConnectionString(connString)
				.retryWrites(false).build();
		MongoClient mongoClient = MongoClients.create(settings);
		MongoDatabase database = mongoClient.getDatabase("heroku_p78k6xgn");
		return database;
	}
}
