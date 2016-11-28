package leifeng.scm.dao;

import leifeng.scm.entity.Account;

public interface AccountMapper extends BaseMapper<Account>{
	
	public Account login(Account account);

   
}