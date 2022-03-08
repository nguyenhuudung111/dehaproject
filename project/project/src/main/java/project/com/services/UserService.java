package project.com.services;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import project.com.entities.User;

;

@Service
public class UserService extends BaseService<User>{
	
	

	@Override
	protected Class<User> clazz() {
		// TODO Auto-generated method stub
		return User.class;
	}
	
	public User loadUserByUsername(String username) {
		String sql = "SELECT * FROM tbl_users u WHERE u.username='"+username+"'";
		List<User> users = this.executeNativeSql(sql, -1);
		if (users == null || users.size() <= 0) {
			return null;
		}
		return users.get(0);
	}
	
}
