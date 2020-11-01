package cn.second_hand.cart.dao;

import cn.second_hand.cart.domain.Cart;
import cn.second_hand.cart.utils.DateUtils;
import cn.second_hand.user.utils.MongoDBUtils;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;
import org.bson.Document;
import org.bson.conversions.Bson;
import org.bson.types.ObjectId;


public class CartDao {
    private MongoDatabase database = MongoDBUtils.getConnect();
    private MongoCollection<Document> cartCollection = database.getCollection("cart");


    /**
     *
     * @param cart
     */
    public void saveCart(Cart cart) {
        Document document = new Document("userEmail", cart.getUserEmail());
        document.append("productId", cart.getProductId())
                .append("quantity", cart.getQuantity())
                .append("createAt", DateUtils.currentDatetime());
        cartCollection.insertOne(document);
    }

    /**
     *
     * @param email user email
     * @return
     */
    public FindIterable<Document> queryByUser(String email) {
        Bson filter = Filters.eq("userEmail", email);
        FindIterable<Document> results = cartCollection.find(filter);
        return results;
    }

    public void deleteById(ObjectId id) {
        Bson filter = Filters.eq("_id", id);
//        DeleteResult deleteResult = cartCollection.deleteOne(filter);
        cartCollection.findOneAndDelete(filter);
    }
}
