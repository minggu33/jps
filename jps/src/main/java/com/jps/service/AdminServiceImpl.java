package com.jps.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jps.domain.ItemVO;
import com.jps.domain.Item_detailVO;
import com.jps.domain.NoticeVO;
import com.jps.domain.UserVO;
import com.jps.domain.searchVO;
import com.jps.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService{

	@Inject
	private AdminDAO adao;
	
	@Override
	public void item(ItemVO vo, List<Item_detailVO> dtlList) throws Exception {
		adao.insertItem(vo, dtlList);
	}

	@Override
	public List<ItemVO> itemlist() throws Exception {
		return adao.itemlist();
	}

	@Override
	public List<UserVO> userlist(searchVO vo) throws Exception {
		return adao.userlist(vo);
	}
	
	@Override
	public List<NoticeVO> noticelist() throws Exception {
		return adao.noticelist();
	}

	@Override
	public int updatePoint(UserVO vo) throws Exception {
		return adao.updatePoint(vo);
	}

	@Override
	public int resetPW(String user_num) throws Exception {
		return adao.resetPW(user_num);
	}

	@Override
	public int updateState(UserVO vo) throws Exception {
		return adao.updateState(vo);
	}

	@Override
	public int getUserCnt() throws Exception {
		return adao.getUserCnt();
	}

	@Override
	public int getItemCnt() throws Exception {
		return adao.getItemCnt();
	}

	@Override
	public int getNoticeCnt() throws Exception {
		return adao.getNoticeCnt();
	}
	
	
	
}
