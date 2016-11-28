package leifeng.scm.service;

import leifeng.scm.entity.BuyOrder;

public interface BuyOrderService extends BaseService<BuyOrder> {
	
	public int insertBuyOrder(BuyOrder buyOrder) throws Exception;
	 
}
