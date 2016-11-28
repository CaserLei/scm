package leifeng.scm.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import leifeng.scm.entity.Account;
import leifeng.scm.service.AccountService;

@Controller
@RequestMapping(value="/account")
public class AccountAction extends BaseAction{
	
	@Resource
	private AccountService accountService;
	
	@RequestMapping(value="/login")
	public String login(Account account,HttpServletRequest request,HttpSession session){
		
		System.out.println("================="+account.getAccLogin()+account.getAccPass());
		Account ac=accountService.login(account);
		
		if(ac!=null){
			session.setAttribute("account", account);
			return "forward:/WEB-INF/main/main.jsp";
		}else{
			request.setAttribute("msg","输入的用户名和密码错误！");
			return "forward:/login.jsp";
		}
		
	}

}
