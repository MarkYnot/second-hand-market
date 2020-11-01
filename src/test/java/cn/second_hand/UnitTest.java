package cn.second_hand;

import java.util.Date;

import org.junit.Test;

import cn.second_hand.product.dao.ProductDao;
import cn.second_hand.product.domain.Product;
import cn.second_hand.user.dao.UserDao;
import cn.second_hand.user.domain.User;
import cn.second_hand.user.utils.MongoDBUtils;

public class UnitTest {
	
	MongoDBUtils mangoDb;
	
	UserDao userDao = new UserDao();
//	
//	CartDao carDao = new CartDao();
//	
//	OrderDao orderDao = new OrderDao();
	
	ProductDao productDao = new ProductDao();
	
	@Test
	public void testSaveSaleApp() {
		Product product = new Product();
		product.setApplierEmail("test");
		product.setApplyStatus(false);
		product.setApplyTime(new Date());
		product.setBargainStatus(false);
		product.setCategory("Fashion");
		product.setDescription("gucci watch");
		product.setPrice(200);
		product.setTitle("gucci watch");
		productDao.saveSaleApp(product);
	}
	
	@Test
	public void testAuditSaleApplication() {
		Product product = new Product();
		product.setApplierEmail("test");
		product.setApplyStatus(false);
		product.setApplyTime(new Date());
		product.setBargainStatus(false);
		product.setCategory("Fashion");
		product.setDescription("gucci watch");
		product.setPrice(200);
		product.setTitle("gucci watch");
		productDao.auditSaleApplication(product);
	}
	
	
	
	@Test
	public void testMangoDBConnection() {
		mangoDb.getConnect();
	}
	
	@Test
	public void testFindByEmail() {
		userDao.findByEmail("574811625@qq.com");
	}
	
	@Test
	public void testRegister() {
		User user =new User();
		user.setEmail("123@gmail.com");
		user.setActiveStatus(true);
		user.setPassword("123456");
		user.setVerifyCode("123");
		userDao.register(user);
	}
//	
//	@Test
//	public void testupdateActiveState() {
//		userDao.updateActiveState("123", true);
//	}
	
//	@Test
//	public void testgetSellerOrderList() {
//		orderDao.getSellerOrderList(new AuditQueryObject());
//	}
}
