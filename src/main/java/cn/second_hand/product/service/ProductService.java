package cn.second_hand.product.service;

import java.util.List;

import org.bson.types.ObjectId;

import cn.second_hand.product.dao.ProductDao;
import cn.second_hand.product.domain.Product;
import cn.second_hand.query.AuditQueryObject;
import cn.second_hand.query.PageResult;

public class ProductService {

	private ProductDao productDao = new ProductDao();

	public void saveSaleApp(Product product) {
		productDao.saveSaleApp(product);
	}

	public PageResult queryForAllSaleApplication(AuditQueryObject auditQueryObject) {
		int count = productDao.queryForAllSaleApplicationCount(auditQueryObject);
		if (count > 0) {
			List<Product> list = productDao.queryForAllSaleApplication(auditQueryObject);
			return new PageResult(list, count, auditQueryObject.getCurrentPage(), auditQueryObject.getPageSize());
		} else {
			return PageResult.empty(auditQueryObject.getPageSize());
		}
	}

	public PageResult queryForSaleApplicationWithState(AuditQueryObject auditQueryObject, Integer state) {
		int count = productDao.queryForSaleApplicationCountWithState(auditQueryObject, state);
		if (count > 0) {
			List<Product> list = productDao.queryForSaleApplicationWithState(auditQueryObject, state);
			return new PageResult(list, count, auditQueryObject.getCurrentPage(), auditQueryObject.getPageSize());
		} else {
			return PageResult.empty(auditQueryObject.getPageSize());
		}
	}

	public PageResult queryCurrentUserApplyingList(AuditQueryObject auditQueryObject, String currentUserEmail) {
		int count = productDao.queryCurrentUserApplyingListForCount(auditQueryObject, currentUserEmail);
		if (count > 0) {
			List<Product> list = productDao.queryCurrentUserApplyingList(auditQueryObject, currentUserEmail);
			return new PageResult(list, count, auditQueryObject.getCurrentPage(), auditQueryObject.getPageSize());
		} else {
			return PageResult.empty(auditQueryObject.getPageSize());
		}
	}

	public void editCurrentUserSaleApplyingListPage(Product product) {
		productDao.editCurrentUserSaleApplyingListPage(product);

	}

	public void hideCurrentUserSaleApplication(ObjectId id) {
		productDao.hideCurrentUserSaleApplication(id);

	}

	public PageResult queryAllProductList(AuditQueryObject auditQueryObject) {
		int count = productDao.queryAllProductListForCount(auditQueryObject);
		if (count > 0) {
			List<Product> list = productDao.queryAllProductList(auditQueryObject);
			return new PageResult(list, count, auditQueryObject.getCurrentPage(), auditQueryObject.getPageSize());
		} else {
			return PageResult.empty(auditQueryObject.getPageSize());
		}
	}

	public PageResult queryForProductListWithKeyword(AuditQueryObject auditQueryObject, String keyword) {
		int count = productDao.queryForProductListCountWithKeyword(auditQueryObject, keyword);
		if (count > 0) {
			List<Product> list = productDao.queryForProductListWithKeyword(auditQueryObject, keyword);
			return new PageResult(list, count, auditQueryObject.getCurrentPage(), auditQueryObject.getPageSize());
		} else {
			return PageResult.empty(auditQueryObject.getPageSize());
		}
	}

	public PageResult queryForProductListWithCategory(AuditQueryObject auditQueryObject, String category) {
		int count = productDao.queryForProductListCountWithCategory(auditQueryObject, category);
		if (count > 0) {
			List<Product> list = productDao.queryForProductListWithCategory(auditQueryObject, category);
			return new PageResult(list, count, auditQueryObject.getCurrentPage(), auditQueryObject.getPageSize());
		} else {
			return PageResult.empty(auditQueryObject.getPageSize());
		}
	}

	public PageResult queryForProductListWithKeywordCategory(AuditQueryObject auditQueryObject, String keyword,
			String category) {
		int count = productDao.queryForProductListCountWithKeywordCategory(auditQueryObject, keyword, category);
		if (count > 0) {
			List<Product> list = productDao.queryForProductListWithKeywordCategory(auditQueryObject, keyword, category);
			return new PageResult(list, count, auditQueryObject.getCurrentPage(), auditQueryObject.getPageSize());
		} else {
			return PageResult.empty(auditQueryObject.getPageSize());
		}
	}

	public PageResult queryForProductListWithSortBy(AuditQueryObject auditQueryObject, int sortBy) {
		int count = productDao.queryAllProductListForCount(auditQueryObject);
		if (count > 0) {
			List<Product> list = productDao.queryForProductListWithSortBy(auditQueryObject, sortBy);
			return new PageResult(list, count, auditQueryObject.getCurrentPage(), auditQueryObject.getPageSize());
		} else {
			return PageResult.empty(auditQueryObject.getPageSize());
		}
	}

	public PageResult queryForProductListWithKeywordSortBy(AuditQueryObject auditQueryObject, String keyword,
			int sortBy) {
		int count = productDao.queryForProductListCountWithKeyword(auditQueryObject, keyword);
		if (count > 0) {
			List<Product> list = productDao.queryForProductListWithKeywordsortBy(auditQueryObject, keyword, sortBy);
			return new PageResult(list, count, auditQueryObject.getCurrentPage(), auditQueryObject.getPageSize());
		} else {
			return PageResult.empty(auditQueryObject.getPageSize());
		}
	}

	public PageResult queryForProductListWithCategorySortBy(AuditQueryObject auditQueryObject, String category,
			int sortBy) {
		int count = productDao.queryForProductListCountWithCategory(auditQueryObject, category);
		if (count > 0) {
			List<Product> list = productDao.queryForProductListWithCategorysortBy(auditQueryObject, category, sortBy);
			return new PageResult(list, count, auditQueryObject.getCurrentPage(), auditQueryObject.getPageSize());
		} else {
			return PageResult.empty(auditQueryObject.getPageSize());
		}
	}

	public PageResult queryForProductListWithKeywordCategorySortBy(AuditQueryObject auditQueryObject, String keyword,
			String category, int sortBy) {
		int count = productDao.queryForProductListCountWithKeywordCategory(auditQueryObject, keyword, category);
		if (count > 0) {
			List<Product> list = productDao.queryForProductListWithKeywordCategorySortBy(auditQueryObject, keyword,
					category, sortBy);
			return new PageResult(list, count, auditQueryObject.getCurrentPage(), auditQueryObject.getPageSize());
		} else {
			return PageResult.empty(auditQueryObject.getPageSize());
		}
	}

	public void auditSaleApplication(Product product) {
		productDao.auditSaleApplication(product);
	}

	public PageResult queryCurrentUserSellingList(AuditQueryObject auditQueryObject, String currentUserEmail) {
		int count = productDao.queryCurrentUserSellingListForCount(auditQueryObject, currentUserEmail);
		if (count > 0) {
			List<Product> list = productDao.queryCurrentUserSellingList(auditQueryObject, currentUserEmail);
			return new PageResult(list, count, auditQueryObject.getCurrentPage(), auditQueryObject.getPageSize());
		} else {
			return PageResult.empty(auditQueryObject.getPageSize());
		}
	}

	public PageResult queryCurrentUserRefusedList(AuditQueryObject auditQueryObject, String currentUserEmail) {
		int count = productDao.queryCurrentUserRefusedListForCount(auditQueryObject, currentUserEmail);
		if (count > 0) {
			List<Product> list = productDao.queryCurrentUserRefusedList(auditQueryObject, currentUserEmail);
			return new PageResult(list, count, auditQueryObject.getCurrentPage(), auditQueryObject.getPageSize());
		} else {
			return PageResult.empty(auditQueryObject.getPageSize());
		}
	}

}
