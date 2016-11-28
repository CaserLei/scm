package leifeng.scm.service;

import leifeng.scm.entity.Page;

public interface BaseService<T> {
	
	int deleteByPrimaryKey(Integer supId) throws Exception;

	int insert(T entity) throws Exception;

	int insertSelective(T entity) throws Exception;

	T selectByPrimaryKey(Integer supId);

    int updateByPrimaryKeySelective(T entity) throws Exception;

	int updateByPrimaryKey(T entity) throws Exception;
	
	//通过关键字分页查询
	public Page<T> selectPage(Page<T> page); 
	
	
	//通过多条件分页查询
	public Page<T> selectPageUseDyc(Page<T> page); 
	
	
	/**
	 * 通过主键批量删除
	 * @return
	 */
	public int deleteList(String[] pks) throws Exception;

}
