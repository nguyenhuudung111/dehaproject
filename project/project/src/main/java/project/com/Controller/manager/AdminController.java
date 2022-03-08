package project.com.Controller.manager;

import java.io.IOException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import project.com.Controller.user.BaseController;



@Controller
public class AdminController extends BaseController {
	@RequestMapping(value = { "admin/index" }, method = RequestMethod.GET) // -> action
	public String admin(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response)
			throws IOException {
		
		
		
		return "manager/index";
		
		
}
}
