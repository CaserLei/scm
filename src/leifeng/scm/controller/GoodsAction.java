package leifeng.scm.controller;


import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import leifeng.scm.entity.Goods;
import leifeng.scm.entity.Page;
import leifeng.scm.entity.Supplier;
import leifeng.scm.service.GoodsService;
import leifeng.scm.service.SupplierService;

@Controller
@RequestMapping(value="/goods")
public class GoodsAction extends BaseAction{
	private static Logger logger =LoggerFactory.getLogger(GoodsAction.class);
	
	@Resource
	private GoodsService goodsService;
	
	
	//通过关键字分页查询
	@RequestMapping("/selectPageUseDyc")
	@ResponseBody //如果返回json格式，需要这个注解，这里用来测试环境
	public Object selectPageUseDyc(Page<Goods> page,Goods goods){
		
 		System.out.println("+++++++++++++++++++++"+goods);
		page.setParamEntity(goods);
		System.out.println("----page:"+page);

		Page p = goodsService.selectPageUseDyc(page);
		//supplier.setSupName("supName1");
		/*Map<String, Object> map =new HashMap<String, Object>();
		map.put("total",p.getTotalRecord());
		map.put("rows",p.getList());*/
		return p.getPageMap();
	}
	
	

}
