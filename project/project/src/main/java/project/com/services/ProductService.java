package project.com.services;

import java.io.File;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;



import project.com.dto.Constants;
import project.com.dto.ProductSearch;
import project.com.entities.Product;
import project.com.entities.ProductImages;



@Service
public class ProductService extends BaseService<Product> implements Constants {

	@Override
	protected Class<Product> clazz() {
		return Product.class;
	}
	public List<Product> searchByCate(int id) {
		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_products p WHERE 1=1";
		
		sql += " AND p.category_id =" + id;

		return executeNativeSql(sql, -1);
	}
	
	public List<Product> findAllActive() {
		String sql = "SELECT * FROM tbl_products";
		return super.executeNativeSql(sql, -1);
	}
	//tat ca cac services can co ham search
	// tất cả các services cần thêm hàm search.
		public List<Product> search(ProductSearch searchModel) {

			// khởi tạo câu lệnh
			String sql = "SELECT * FROM tbl_products p WHERE 1=1";

			// tim kiem san pham theo seachText
			if (!StringUtils.isEmpty(searchModel.getKeyword())) {
				sql += " and (p.title like '%" + searchModel.getKeyword() + "%'" + " or p.detail_description like '%"
						+ searchModel.getKeyword() + "%'" + " or p.short_description like '%"
						+ searchModel.getKeyword() + "%')";
			}
			
			// chi lay san pham chua xoa
//			sql += " and p.status=1 ";

			return executeNativeSql(sql,searchModel.getPage());
		}
	
	
		
	private boolean isEmptyUploadFile(MultipartFile[] images) {
		if (images == null || images.length <= 0)
			return true;

		if (images.length == 1 && images[0].getOriginalFilename().isEmpty())
			return true;

		return false;
	}

	private boolean isEmptyUploadFile(MultipartFile image) {
		return image == null || image.getOriginalFilename().isEmpty();
	}

	@Transactional
	public Product edit(Product product, MultipartFile productAvatar, MultipartFile[] productPictures)
			throws Exception {

		// lay thong tin san pham trong db.
		Product productOnDb = super.getById(product.getId());
		
		// có đẩy avartar ???
		if(!isEmptyUploadFile(productAvatar)) {
			// xóa avatar trong folder lên
			new File(UPLOAD_FOLDER_ROOT + productOnDb.getAvatar()).delete();
			
			// add avartar moi
			productAvatar.transferTo(new File(UPLOAD_FOLDER_ROOT + "product\\avatar\\" + productAvatar.getOriginalFilename()));
			product.setAvatar("product\\avatar\\" + productAvatar.getOriginalFilename());
		} else {
			// su dung lai avatar cu
			product.setAvatar(productOnDb.getAvatar());
		}
		
		// có đẩy pictures ???
		if (!isEmptyUploadFile(productPictures)) {
			
			
			for (MultipartFile pic : productPictures) {
				pic.transferTo(new File(UPLOAD_FOLDER_ROOT + "product\\pictures\\" + pic.getOriginalFilename()));

				ProductImages pi = new ProductImages();
				pi.setPath("product\\pictures\\" + pic.getOriginalFilename());
				pi.setTitle(pic.getOriginalFilename());
				
				product.addProductImages(pi);
			}
		}

		// lưu vào database
		return super.saveOrUpdate(product);
	}

	@Transactional
	public Product save(Product product, MultipartFile productAvatar, MultipartFile[] productPictures)
			throws Exception {

		// có đẩy avatar lên không ???
		if (!isEmptyUploadFile(productAvatar)) {
			String pathToFile = UPLOAD_FOLDER_ROOT + "product\\avatar\\" + productAvatar.getOriginalFilename();
			productAvatar.transferTo(new File(pathToFile));
			product.setAvatar("product\\avatar\\" + productAvatar.getOriginalFilename());
		}

		// có đẩy pictures ???
		if (!isEmptyUploadFile(productPictures)) {
			for (MultipartFile pic : productPictures) {
				pic.transferTo(new File(UPLOAD_FOLDER_ROOT + "product\\pictures\\" + pic.getOriginalFilename()));

				ProductImages pi = new ProductImages();
				pi.setPath("product\\pictures\\" + pic.getOriginalFilename());
				pi.setTitle(pic.getOriginalFilename());

				product.addProductImages(pi);
			}
		}

		// lưu vào database
		return super.saveOrUpdate(product);
	}


}
