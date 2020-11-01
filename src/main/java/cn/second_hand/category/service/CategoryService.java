package cn.second_hand.category.service;

import java.util.List;

import org.bson.types.ObjectId;

import cn.second_hand.category.dao.CategoryDao;
import cn.second_hand.category.domain.Category;

public class CategoryService {

	private CategoryDao dao = new CategoryDao();
	
	
	/**
	 * 查询所有
	 * @return
	 */

	public List<Category> findAll() {
		
		return dao.findAll();
	}


	public void add(Category category) {
	   
		dao.add(category);
		
	}


	public void delete(ObjectId oid) {
		dao.delete(oid);
		
	}


	public Category load(ObjectId oid) {
		return dao.load(oid);
	}


	public void edit(Category category) {
		dao.edit(category);
		
	}
	
	
}
