package com.jps.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jps.domain.ItemVO;
import com.jps.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService{

	@Inject
	private AdminDAO adao;
	
	@Override
	public void item(ItemVO vo) throws Exception{
		adao.insertItem(vo);
	}

	@Override
	public List<ItemVO> itemlist() throws Exception {
		return adao.itemlist();
	}

	
	
	
}
