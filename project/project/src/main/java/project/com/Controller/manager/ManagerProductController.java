package project.com.Controller.manager;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.aspectj.bridge.IMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;



import project.com.Controller.user.BaseController;
import project.com.dto.ProductSearch;
import project.com.entities.Categories;
import project.com.entities.Product;

import project.com.services.CategoriesService;
import project.com.services.ProductService;
@Controller
public class ManagerProductController extends BaseController{

	
	  

		// inject mot bean(service) vao trong mot bean khac(controller)
	@Autowired
	private CategoriesService categoriesService;
	
	@Autowired
	private ProductService productService;
		
	
	@RequestMapping(value = { "admin/list" }, method = RequestMethod.GET) // -> action
	public String login(final Model model,
			final HttpServletRequest request,

			final HttpServletResponse response)
			throws IOException {
		
		 
		
		
		
		//Tim tu khoa
		String keyword = request.getParameter("keyword");
		ProductSearch ps = new ProductSearch();
		ps.setKeyword(keyword);
		//page
		ps.setPage(getCurrentPage(request));

		int pagePrevious = ps.getPage();
		if(pagePrevious <= 0) {
			pagePrevious = 1;
		}
		else {pagePrevious = pagePrevious-1;}

		int pageNext = ps.getPage()+2;
		if(pageNext <= 1) {
			pageNext = pageNext+1;
		}

		
		model.addAttribute("pagePrevious",pagePrevious);
		model.addAttribute("pageNext",pageNext);
		//can lay danh sach categories tu db va tra ve view qua model
		model.addAttribute("products",productService.search(ps));
		
		
		
		
		return "manager/listproduct";
	}
		@RequestMapping(value = { "/admin/addproduct" }, method = RequestMethod.GET) // -> action
		public String managerproduct(final Model model,
				final HttpServletRequest request,
				final HttpServletResponse response)
				throws IOException {
			
			//can lay danh sach categories tu db va tra ve view qua model
			List<Categories> categories = categoriesService.findAllActive();
			
			//day xuong view de xu li
			model.addAttribute("categories", categories);
			
			model.addAttribute("product", new Product());

			
			return "manager/addproduct";
		}
		@RequestMapping(value = { "/admin/edit-products/{productId}" }, method = RequestMethod.GET) // -> action
		public String editProduct(final Model model,
				final HttpServletRequest request,
				final HttpServletResponse response,
				@PathVariable("productId") int productId)
				throws IOException {

		
			// lấy sản phẩm từ database
			Product product = productService.getById(productId);
			
			//can lay danh sach categories tu db va tra ve view qua model
			List<Categories> categories = categoriesService.findAllActive();
			
			//day xuong view de xu li
			model.addAttribute("categories", categories);
			
			model.addAttribute("product", product);
			
			// cac views se duoc dat tai thu muc: /src/main/webapp/WEB-INF/views
			return "manager/addproduct"; // -> duong dan toi VIEW.
		}
		
		@RequestMapping(value = { "/admin/addproduct" }, method = RequestMethod.POST) // -> action
		public String addProduct(final Model model,
				final HttpServletRequest request,
				final HttpServletResponse response,
				@ModelAttribute("product") Product product,
				@RequestParam("productAvatar") MultipartFile productAvatar,
				@RequestParam("productPictures") MultipartFile[] productPictures)
				throws Exception {
			
			// kiểm tra xem action là thêm mới hay chỉnh sửa
			if(product.getId() == null || product.getId() <= 0) {
				productService.save(product, productAvatar, productPictures);
			} else {
				productService.edit(product, productAvatar, productPictures);
			}
			return "manager/addproduct"; // -> duong dan toi VIEW.
		}
	@RequestMapping(value = { "/admin/delete/{productId}" }, method = RequestMethod.GET) // -> action
	public String deleteProduct(final Model model,
							  final HttpServletRequest request,
							  final HttpServletResponse response,

							  @PathVariable("productId") int productId)
			throws Exception {

		productService.deleteById(productId);


		//day xuong view de xu li


		// cac views se duoc dat tai thu muc: /src/main/webapp/WEB-INF/views
		return "manager/index"; // -> duong dan toi VIEW.
	}
		
		
	}

