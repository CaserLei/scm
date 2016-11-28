package leifeng.scm.service;

import leifeng.scm.entity.Account;

public interface AccountService extends BaseService<Account>{
	
	public Account login(Account account);

}
