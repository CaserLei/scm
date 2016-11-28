package leifeng.scm.service;

import java.util.Map;

import leifeng.scm.entity.SysParam;

public interface SysParamService extends BaseService<SysParam> {
    public Map<String,Object>selectList();
	 
}
