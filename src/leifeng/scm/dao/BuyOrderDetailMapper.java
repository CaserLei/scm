package leifeng.scm.dao;

import java.util.List;
import leifeng.scm.entity.BuyOrderDetail;

public interface BuyOrderDetailMapper extends BaseMapper<BuyOrderDetail> {
	public int insertList(List<BuyOrderDetail> buyOrderDetails);
}