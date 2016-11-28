package leifeng.scm.dao;

import java.util.List;
import leifeng.scm.entity.SysParam;

public interface SysParamMapper extends BaseMapper<SysParam> {
	public List<SysParam> selectList(String type);
	public List<SysParam> selectOthreTable(String sql);
   
}