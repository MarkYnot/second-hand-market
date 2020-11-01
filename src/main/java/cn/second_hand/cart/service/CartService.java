package cn.second_hand.cart.service;

import java.util.ArrayList;
import java.util.List;

import org.bson.Document;
import org.bson.types.ObjectId;

import com.mongodb.client.FindIterable;

import cn.second_hand.cart.dao.CartDao;
import cn.second_hand.cart.domain.Cart;
import cn.second_hand.cart.vos.CartVo;
import cn.second_hand.product.dao.ProductDao;
import cn.second_hand.product.domain.Product;

public class CartService {
	private CartDao cartDao = new CartDao();
	private ProductDao productDao = new ProductDao();

	/**
	 *
	 * @param cart {@link Cart}
	 */
	public void saveCart(Cart cart) {
		cartDao.saveCart(cart);
	}

	/**
	 *
	 * @param email user email
	 * @return {@link Cart}
	 */
	public List<CartVo> queryByUser(String email) {
		FindIterable<Document> results = cartDao.queryByUser(email);
		List<CartVo> cartVos = new ArrayList<>();
		if (null != results) {
			for (Document doc : results) {
				CartVo cartVo = new CartVo();
				String productId = doc.getString("productId");
				Product product = productDao.queryByIdStr(productId);
				cartVo.setProductId(product.getOid());
				cartVo.setProductTitle(product.getTitle());
				cartVo.setProductPicture(product.getPicture1());
				cartVo.setProductPrice(product.getPrice());
				cartVo.setQuantity(doc.getInteger("quantity"));
				//cartVo.setCreateAt(doc.getDate("createAt"));

				cartVos.add(cartVo);
			}
		}

		return cartVos;
	}

	/**
	 *
	 * @param id
	 */
	public void deleteById(ObjectId id) {
		cartDao.deleteById(id);
	}
}
