package leifeng.scm.entity;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Page<T> implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private Integer page;//当前页
	private Integer rows;//页的大小
	private Integer totalRecord;//总记录数
	private List<T> list;//页面数据列表
	private String keyWord;//查询关键字
	private Integer start=1;//需要这里处理,开始记录数
	private T paramEntity;//多条件查询
	
	private Map<String, Object> pageMap = new HashMap<String, Object>() ;
	
	public Map<String, Object> getPageMap() {
		return pageMap;
	}
	
	/*public void setPageMap(Map<String, Object> pageMap) {
		this.pageMap = pageMap;
	}
*/	
	public T getParamEntity() {
		return paramEntity;
	}
	public void setParamEntity(T paramEntity) {
		this.paramEntity = paramEntity;
	}

	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	//不需要通过该方法来获取记录数。
	/*public Integer getTotalRecord() {
		return totalRecord;
	}*/
	public void setTotalRecord(Integer totalRecord) {
		pageMap.put("total", totalRecord);
		this.totalRecord = totalRecord;
	}
	
	/*public List<T> getList() {
		return list;
	}*/
	
	public void setList(List<T> list) {
		pageMap.put("rows", list);
		this.list = list;
	}
	
	public String getKeyWord() {
		return keyWord;
	}
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	public Integer getStart() {
		this.start=(page-1)*rows;
		return start;
	}
	public void setStart(Integer start) {
		this.start =start;
	}
	
	
}
