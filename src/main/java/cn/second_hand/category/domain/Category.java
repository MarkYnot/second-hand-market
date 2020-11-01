package cn.second_hand.category.domain;

import org.bson.types.ObjectId;

public class Category {
	
	private ObjectId oid;
	
	public ObjectId getOid() {
		return oid;
	}
	public void setOid(ObjectId oid) {
		this.oid = oid;
	}
	private String categoriesName;
	private String description;
	
	public String getCategoriesName() {
		return categoriesName;
	}
	public void setCategoriesName(String categoriesName) {
		this.categoriesName = categoriesName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Category(String categoriesName, String description) {
		super();
		this.categoriesName = categoriesName;
		this.description = description;
	}
	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Category [oid=" + oid + ", categoriesName=" + categoriesName + ", description=" + description + "]";
	}
	

	
}
