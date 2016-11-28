package leifeng.scm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import leifeng.scm.dao.AccountMapper;
import leifeng.scm.entity.Account;
import leifeng.scm.entity.Page;
import leifeng.scm.service.AccountService;

@Service("accountService")
public class AccountServiceImpl  extends BaseServieImpl<Account> implements AccountService{
	
	@Autowired
	private AccountMapper accountMapper;

	/**
	 * 用户登录
	 */
	@Override
	public Account login(Account account) {
		return accountMapper.login(account);
	}

}
