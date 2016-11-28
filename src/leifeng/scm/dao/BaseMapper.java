package leifeng.scm.dao;

import java.util.List;

import leifeng.scm.entity.Page;


public interface BaseMapper<T> {
	
	int deleteByPrimaryKey(Integer accId);
	
	int insertSelective(T entity);
	
	T selectByPrimaryKey(Integer accId);
	
	int updateByPrimaryKeySelective(T entity);
	
	int updateByPrimaryKey(T entity);
	
	//添加单个对象
	public int insert(T entity);
	
	
	//通过关键字分页查询数据列表
	public List<T> selectPageList(Page<T> page);
	
	//通过关键字分页查询，返回总记录数
	public Integer selectPageCount(Page<T> page);
	
	
	//通过关键字分页查询数据列表
	public List<T> selectPageListUseDyc(Page<T> page);
		
		//通过关键字分页查询，返回总记录数
	public Integer selectPageCountUseDyc(Page<T> page);
	
	/**
	 * 通过主键批量删除
	 * @return
	 */
	public int deleteList(String[] pks);

}

