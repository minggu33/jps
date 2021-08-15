package com.jps.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jps.domain.ItemVO;
import com.jps.domain.Item_detailVO;
import com.jps.domain.NoticeVO;
import com.jps.domain.UserVO;
import com.jps.domain.searchVO;
import com.jps.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	private AdminDAO adao;

	@Override
	public void item(ItemVO vo, List<Item_detailVO> dtlList) throws Exception {
		adao.insertItem(vo, dtlList);
	}

	@Override
	public List<ItemVO> itemlist(searchVO vo) throws Exception {
		return adao.itemlist(vo);
	}

	@Override
	public List<ItemVO> itemSearchOfSubject(searchVO vo) throws Exception {
		return adao.itemSearchOfSubject(vo);
	}

	@Override
	public List<ItemVO> itemSearchOfContent(searchVO vo) throws Exception {
		return adao.itemSearchOfContent(vo);
	}

	@Override
	public List<ItemVO> itemSearchOfSC(searchVO vo) throws Exception {
		return adao.itemSearchOfSC(vo);
	}

	@Override
	public List<UserVO> userlist(searchVO vo) throws Exception {
		return adao.userlist(vo);
	}

	@Override
	public List<NoticeVO> noticelist(searchVO vo) throws Exception {
		return adao.noticelist(vo);
	}

	@Override
	public List<NoticeVO> noticeSearchOfSubject(searchVO vo) throws Exception {

		System.out.println("S : noticeSearchOfSubject() 호출");

		return adao.noticeSearchOfSubject(vo);
	}

	@Override
	public List<NoticeVO> noticeSearchOfContent(searchVO vo) throws Exception {

		System.out.println("S : noticeSearchOfContent() 호출");

		return adao.noticeSearchOfContent(vo);
	}

	@Override
	public List<NoticeVO> noticeSearchOfSC(searchVO vo) throws Exception {

		System.out.println("S : noticeSearchOfSC() 호출");

		return adao.noticeSearchOfSC(vo);
	}

	@Override
	public int noticeCountOfSubject(searchVO vo) throws Exception {

		System.out.println("S : noticeCountOfSubject() 호출");

		return adao.noticeCountOfSubject(vo);
	}

	@Override
	public int noticeCountOfContent(searchVO vo) throws Exception {

		System.out.println("S : noticeCountOfContent() 호출");

		return adao.noticeCountOfContent(vo);
	}

	@Override
	public int noticeCountOfSC(searchVO vo) throws Exception {

		System.out.println("S : noticeCountOfSC() 호출");

		return adao.noticeCountOfSC(vo);
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
	public int itemCount() throws Exception {
		return adao.itemCount();
	}

	@Override
	public int itemCountOfSubject(searchVO vo) throws Exception {
		return adao.itemCountOfSubject(vo);
	}

	@Override
	public int itemCountOfContent(searchVO vo) throws Exception {
		return adao.itemCountOfContent(vo);
	}

	@Override
	public int itemCountOfSC(searchVO vo) throws Exception {
		return adao.itemCountOfSC(vo);
	}

	@Override
	public int getNoticeCnt() throws Exception {
		return adao.getNoticeCnt();
	}

	@Override
	public void insertNotice(NoticeVO vo) throws Exception {
		adao.insertNotice(vo);
	}

	@Override
	public List<Map<String, Object>> readItemInfo(String item_num) throws Exception {
		return adao.readItemInfo(item_num);
	}

	@Override
	public void updateItem(ItemVO vo, List<Item_detailVO> dtlList) throws Exception {
		adao.updateItem(vo, dtlList);
	}

	
	
}
