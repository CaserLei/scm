package leifeng.scm.controller;


import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import leifeng.scm.entity.Page;
import leifeng.scm.entity.Supplier;
import leifeng.scm.service.SupplierService;

@Controller
@RequestMapping(value="/supplier")
public class SupplierAction {
	private static Logger logger =LoggerFactory.getLogger(SupplierAction.class);
	
	@Resource
	private SupplierService supplierService;
	
	@RequestMapping(value="/selectSupplierById")
	public Supplier selectSupplierById(Integer id){
		Supplier supplier= supplierService.selectByPrimaryKey(id);
		System.out.println(supplier);
		return supplier;
	}
	
	@RequestMapping(value="/insertSupplier")
	@ResponseBody
	public Object saveDept(Supplier supplier) throws Exception{
		System.out.println("---action.dept:"+supplier);
		int i=0;
		try {
			i=supplierService.insert(supplier);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return i;
	}
	
	@ResponseBody
	@RequestMapping(value="/updateSupplier")
	public Object updateSupplier(Supplier supplier) throws Exception{
		logger.debug("-----------------修改供应商信息开始----------------");
		int i=0;
		try {
			i=supplierService.updateByPrimaryKeySelective(supplier);
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.debug("-----------------修改供应商信息结束----------------");
		return i;
		
	}
	
	@RequestMapping(value="/deleteList")
	@ResponseBody
	public Object deleteList(String[] pks){
		int i=0;
		System.out.println("请求删除吗成功！！"+pks);
		try {
			i=supplierService.deleteList(pks);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return i;
	}
	
	//通过关键字分页查询
	@RequestMapping("/selectPage")
	@ResponseBody //如果返回json格式，需要这个注解，这里用来测试环境
	public Object selectPage(Page<Supplier> page){
		
		Page p = supplierService.selectPage(page);
		System.out.println("----page:"+page);
		//supplier.setSupName("supName1");
		/*Map<String, Object> map =new HashMap<String, Object>();
		map.put("total",p.getTotalRecord());
		map.put("rows",p.getList());*/
		return page.getPageMap();
	}
	
	//通过关键字分页查询
	@RequestMapping("/selectPageUseDyc")
	@ResponseBody //如果返回json格式，需要这个注解，这里用来测试环境
	public Object selectPageUseDyc(Page<Supplier> page,Supplier supplier){
		
		System.out.println("+++++++++++++++++++++"+supplier);
		page.setParamEntity(supplier);
		System.out.println("----page:"+page);

		Page p = supplierService.selectPageUseDyc(page);
		//supplier.setSupName("supName1");
		/*Map<String, Object> map =new HashMap<String, Object>();
		map.put("total",p.getTotalRecord());
		map.put("rows",p.getList());*/
		return p.getPageMap();
	}
	
	

}
