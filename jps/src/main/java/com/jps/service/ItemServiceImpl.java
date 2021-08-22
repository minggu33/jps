package com.jps.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jps.domain.ItemVO;
import com.jps.domain.Item_detailVO;
import com.jps.domain.OrderVO;
import com.jps.persistence.ItemDAO;
import com.jps.persistence.Item_detailDAO;

@Service
public class ItemServiceImpl implements ItemService{

	@Inject
	private ItemDAO idao;
	private Item_detailDAO iddao;
	
	@Override
	public void item(ItemVO vo) throws Exception{
		idao.insertItem(vo);
	}

	@Override
	public List<ItemVO> itemlist() throws Exception {
		return idao.itemlist();
	}

	@Override
	public ItemVO read(Integer item_num) throws Exception {
		return idao.itemdetail(item_num);
	}

	@Override
	public void order(Integer item_num) throws Exception {
		
		iddao.insertOrder(item_num);
	}

	@Override
	public List<Item_detailVO> getItemDetail(Integer item_num) throws Exception {
		return idao.getItemDetail(item_num);
	}

	@Override
	public Item_detailVO getItemSC(Integer idx) throws Exception {
		return idao.getItemSC(idx);
	}

	@Override
	public void realorder(OrderVO vo) throws Exception {
		idao.insertRealorder(vo);
	}

	@Override
	public String ordernum() throws Exception {
		return idao.ordernum();
	}

	
	
	
	
	
}
