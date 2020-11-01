package cn.second_hand.product.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bson.types.ObjectId;

import cn.second_hand.product.dao.ProductDao;
import cn.second_hand.product.domain.Product;
import cn.second_hand.product.service.ProductService;
import cn.second_hand.query.AuditQueryObject;
import cn.second_hand.query.PageResult;
import cn.second_hand.user.domain.User;
import cn.second_hand.user.servlet.BaseServlet;

public class ProductServlet extends BaseServlet {

	private ProductService productService = new ProductService();

	public String auditSaleApplication(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Product product = new Product();
		product.setAuditState(Integer.parseInt(request.getParameter("state")));
		product.setRemark(request.getParameter("remark"));
		product.setOid(new ObjectId(request.getParameter("oid")));
		productService.auditSaleApplication(product);
		return "";
	}

	public String saleApplication(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Product product = new Product();
		product.setTitle(request.getParameter("title"));
		product.setPicture1(request.getParameter("image1").equals("") ? null : request.getParameter("image1"));
		product.setPicture2(request.getParameter("image2").equals("") ? null : request.getParameter("image2"));
		User user = (User) request.getSession().getAttribute("session_user");
		product.setApplierEmail(user.getEmail());
		product.setApplyTime(new Date());
		product.setHide(false);
		product.setCategory(request.getParameter("category"));
		product.setDescription(request.getParameter("description"));
		product.setPrice(new Integer(request.getParameter("salePrice")));
		product.setBargainStatus(request.getParameter("bargainStatus").equals("0") ? true : false);
		productService.saveSaleApp(product);
		return "";
	}

	public String auditSaleApplyPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AuditQueryObject auditQueryObject = new AuditQueryObject();
		auditQueryObject.setPageSize(5);
		int currentPage = 1;
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").equals("")) {
			auditQueryObject.setCurrentPage(currentPage);
		} else {
			auditQueryObject.setCurrentPage(Integer.valueOf(request.getParameter("currentPage")));
		}
		PageResult pageResult;
		if (request.getParameter("state") != null && !request.getParameter("state").equals("-1")) {
			int state = new Integer(request.getParameter("state"));
			pageResult = productService.queryForSaleApplicationWithState(auditQueryObject, state);
			request.setAttribute("state", state);
		} else {
			pageResult = productService.queryForAllSaleApplication(auditQueryObject);
			request.setAttribute("state", null);
		}
		if (pageResult.getCurrentPage() > pageResult.getTotalPage()) {
			pageResult.setCurrentPage(pageResult.getTotalPage());
		}
		request.setAttribute("pageResult", pageResult);
		return "f:/auditSaleApplication.jsp";

	}

	public String saleApplyingListPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AuditQueryObject auditQueryObject = new AuditQueryObject();
		auditQueryObject.setPageSize(5);
		User user = (User) request.getSession().getAttribute("session_user");
		String currentUserEmail = user.getEmail();
		int currentPage = 1;
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").equals("")) {
			auditQueryObject.setCurrentPage(currentPage);
		} else {
			auditQueryObject.setCurrentPage(Integer.valueOf(request.getParameter("currentPage")));
		}
		PageResult pageResult = productService.queryCurrentUserApplyingList(auditQueryObject, currentUserEmail);
		request.setAttribute("pageResult", pageResult);
		return "f:/saleApplyOrderList.jsp";

	}

	public String sellingProductListPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AuditQueryObject auditQueryObject = new AuditQueryObject();
		auditQueryObject.setPageSize(5);
		User user = (User) request.getSession().getAttribute("session_user");
		String currentUserEmail = user.getEmail();
		int currentPage = 1;
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").equals("")) {
			auditQueryObject.setCurrentPage(currentPage);
		} else {
			auditQueryObject.setCurrentPage(Integer.valueOf(request.getParameter("currentPage")));
		}
		PageResult pageResult = productService.queryCurrentUserSellingList(auditQueryObject, currentUserEmail);
		request.setAttribute("pageResult", pageResult);
		return "f:/sellingProductList.jsp";

	}

	public String refusedSaleApplyingListPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AuditQueryObject auditQueryObject = new AuditQueryObject();
		auditQueryObject.setPageSize(5);
		User user = (User) request.getSession().getAttribute("session_user");
		String currentUserEmail = user.getEmail();
		int currentPage = 1;
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").equals("")) {
			auditQueryObject.setCurrentPage(currentPage);
		} else {
			auditQueryObject.setCurrentPage(Integer.valueOf(request.getParameter("currentPage")));
		}
		PageResult pageResult = productService.queryCurrentUserRefusedList(auditQueryObject, currentUserEmail);
		request.setAttribute("pageResult", pageResult);
		return "f:/refusedProductList.jsp";

	}

	public String editSaleApplyingListPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Product product = new Product();
		product.setOid(new ObjectId(request.getParameter("oid")));
		product.setPicture1(request.getParameter("image1"));
		product.setPicture2(request.getParameter("image2"));
		product.setBargainStatus(request.getParameter("bargainStatus").equals("0") ? true : false);
		product.setCategory(request.getParameter("category"));
		product.setDescription(request.getParameter("description"));
		product.setPrice(new Integer(request.getParameter("price")));
		product.setTitle(request.getParameter("title"));
		productService.editCurrentUserSaleApplyingListPage(product);
		return "f:/saleApplyOrderList.jsp";
	}

	public String withdrawSaleApply(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectId id = new ObjectId(request.getParameter("oid"));
		productService.hideCurrentUserSaleApplication(id);
		return "ProductServlet?method=saleApplyingListPage";
	}

	public String withdrawSaleProduct(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectId id = new ObjectId(request.getParameter("oid"));
		productService.hideCurrentUserSaleApplication(id);
		return "ProductServlet?method=sellingProductListPage";
	}

	public String allProductListPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AuditQueryObject auditQueryObject = new AuditQueryObject();
		auditQueryObject.setPageSize(8);
		int currentPage = 1;
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").equals("")) {
			auditQueryObject.setCurrentPage(currentPage);
		} else {
			auditQueryObject.setCurrentPage(Integer.valueOf(request.getParameter("currentPage")));
		}

		PageResult pageResult;
		// only includes keyword
		if (request.getParameter("keyword") != null && !request.getParameter("keyword").trim().equals("")
				&& (request.getParameter("category") == null || request.getParameter("category").trim().equals(""))
				&& (request.getParameter("sortBy") == null || request.getParameter("sortBy").trim().equals(""))) {
			String keyword = request.getParameter("keyword");
			pageResult = productService.queryForProductListWithKeyword(auditQueryObject, keyword);
			request.setAttribute("keyword", keyword);
		}
		// only includes category
		else if ((request.getParameter("keyword") == null || request.getParameter("keyword").trim().equals(""))
				&& (request.getParameter("category") != null && !request.getParameter("category").trim().equals(""))
				&& (request.getParameter("sortBy") == null || request.getParameter("sortBy").trim().equals(""))) {
			String category = request.getParameter("category");
			pageResult = productService.queryForProductListWithCategory(auditQueryObject, category);
			request.setAttribute("category", category);
		}
		// only includes sortby
		else if ((request.getParameter("keyword") == null || request.getParameter("keyword").trim().equals(""))
				&& ((request.getParameter("category") == null || request.getParameter("category").trim().equals("")))
				&& request.getParameter("sortBy") != null && !request.getParameter("sortBy").trim().equals("")) {
			int sortBy = Integer.parseInt(request.getParameter("sortBy"));
			pageResult = productService.queryForProductListWithSortBy(auditQueryObject, sortBy);
			request.setAttribute("sortBy", sortBy);
		}
		// includes category and keyword
		else if (request.getParameter("keyword") != null && !request.getParameter("keyword").trim().equals("")
				&& request.getParameter("category") != null && !request.getParameter("category").trim().equals("")
				&& (request.getParameter("sortBy") == null || request.getParameter("sortBy").trim().equals(""))) {
			String keyword = request.getParameter("keyword");
			String category = request.getParameter("category");
			pageResult = productService.queryForProductListWithKeywordCategory(auditQueryObject, keyword, category);
			request.setAttribute("keyword", keyword);
			request.setAttribute("category", category);
		}
		// includes keyword and sortby
		else if (request.getParameter("keyword") != null && !request.getParameter("keyword").trim().equals("")
				&& (request.getParameter("category") == null || request.getParameter("category").trim().equals(""))
				&& request.getParameter("sortBy") != null && !request.getParameter("sortBy").trim().equals("")) {
			String keyword = request.getParameter("keyword");
			int sortBy = Integer.parseInt(request.getParameter("sortBy"));
			pageResult = productService.queryForProductListWithKeywordSortBy(auditQueryObject, keyword, sortBy);
			request.setAttribute("keyword", keyword);
			request.setAttribute("sortBy", sortBy);
		}
		// includes category and sortby
		else if ((request.getParameter("keyword") == null || request.getParameter("keyword").trim().equals(""))
				&& request.getParameter("category") != null && !request.getParameter("category").trim().equals("")
				&& request.getParameter("sortBy") != null && !request.getParameter("sortBy").trim().equals("")) {
			String category = request.getParameter("category");
			int sortBy = Integer.parseInt(request.getParameter("sortBy"));
			pageResult = productService.queryForProductListWithCategorySortBy(auditQueryObject, category, sortBy);
			request.setAttribute("category", category);
			request.setAttribute("sortBy", sortBy);
		}
		// includes keyword and sortby and category
		else if (request.getParameter("keyword") != null && !request.getParameter("keyword").trim().equals("")
				&& request.getParameter("category") != null && !request.getParameter("category").trim().equals("")
				&& request.getParameter("sortBy") != null && !request.getParameter("sortBy").trim().equals("")) {
			String keyword = request.getParameter("keyword");
			String category = request.getParameter("category");
			int sortBy = Integer.parseInt(request.getParameter("sortBy"));
			pageResult = productService.queryForProductListWithKeywordCategorySortBy(auditQueryObject, keyword,
					category, sortBy);
			request.setAttribute("keyword", keyword);
			request.setAttribute("category", category);
			request.setAttribute("sortBy", sortBy);
		}
		// without keyword and sortby and category
		else {
			pageResult = productService.queryAllProductList(auditQueryObject);
		}

		if (pageResult.getCurrentPage() > pageResult.getTotalPage()) {
			pageResult.setCurrentPage(pageResult.getTotalPage());
		}
		request.setAttribute("pageResult", pageResult);
		return "f:/projects.jsp";
	}
	
	public String showProductDescription(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
			ObjectId oid = new ObjectId(request.getParameter("oid"));
			ProductDao dao = new ProductDao();
			Product p = dao.queryById(oid);
			request.setAttribute("product", p);
			return "f:/productdes.jsp";
		}

}
