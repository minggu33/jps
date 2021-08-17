package com.jps.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jps.domain.ItemVO;
import com.jps.domain.Item_detailVO;
import com.jps.domain.NoticeVO;
import com.jps.domain.PopupVO;
import com.jps.domain.UserVO;
import com.jps.domain.searchVO;

@Repository
public class AdminDAOImpl implements AdminDAO{

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace
		= "com.jps.mapper.AdminMapper";
	
	@Override
	public void insertItem(ItemVO vo, List<Item_detailVO> dtlList) {
		sqlSession.insert(namespace+".insertItem", vo);
		
		int item_num = sqlSession.selectOne(namespace+".getItemNum");
		
		for(int i=0; i<dtlList.size(); i++) {
			Item_detailVO dtlvo = dtlList.get(i);
			dtlvo.setItem_num(item_num);
			sqlSession.insert(namespace+".insertItemDetail", dtlvo);
		}
	}

	@Override
	public List<ItemVO> itemlist(searchVO vo) {
		return sqlSession.selectList(namespace+".itemlist", vo);
	}
	
	@Override
	public List<ItemVO> itemSearchOfSubject(searchVO vo) {
		return sqlSession.selectList(namespace+".itemSearchOfSubject", vo);
	}
	
	@Override
	public List<ItemVO> itemSearchOfContent(searchVO vo) {
		return sqlSession.selectList(namespace+".itemSearchOfContent", vo);
	}
	
	@Override
	public List<ItemVO> itemSearchOfSC(searchVO vo) {
		return sqlSession.selectList(namespace+".itemSearchOfSC", vo);
	}

	@Override
	public List<UserVO> userlist(searchVO vo) {
		return sqlSession.selectList(namespace+".userlist", vo);
	}
	
	@Override
	public List<NoticeVO> noticelist(searchVO vo) {
		return sqlSession.selectList(namespace+".noticelist", vo);
	}
	
	@Override
	public List<NoticeVO> noticeSearchOfSubject(searchVO vo) {

		System.out.println("DAO : 공지사항 제목검색 목록 출력");
		return sqlSession.selectList(namespace+".noticeSearchOfSubject", vo);
	}
	
	@Override
	public List<NoticeVO> noticeSearchOfContent(searchVO vo) {

		System.out.println("DAO : 공지사항 내용검색 목록 출력");
		return sqlSession.selectList(namespace+".noticeSearchOfContent", vo);
	}
	
	@Override
	public List<NoticeVO> noticeSearchOfSC(searchVO vo) {

		System.out.println("DAO : 공지사항 제목+내용 목록 출력");
		return sqlSession.selectList(namespace+".noticeSearchOfSC", vo);
	}
	
	@Override
	public int noticeCountOfSubject(searchVO vo) {
		System.out.println("DAO : 공지사항 제목검색 카운트");
		return sqlSession.selectOne(namespace+".noticeCountOfSubject", vo);
	}
	
	@Override
	public int noticeCountOfContent(searchVO vo) {

		System.out.println("DAO : 공지사항 내용검색 카운트");
		return sqlSession.selectOne(namespace+".noticeCountOfContent", vo);
	}
	
	@Override
	public int noticeCountOfSC(searchVO vo) {

		System.out.println("DAO : 공지사항 제목+내용검색 카운트");
		return sqlSession.selectOne(namespace+".noticeCountOfSC", vo);
	}
	
	@Override
	public int updatePoint(UserVO vo) {
		return sqlSession.update(namespace+".updatePoint", vo);
	}

	@Override
	public int resetPW(String user_num) {
		return sqlSession.update(namespace+".resetPW", user_num);
	}

	@Override
	public int updateState(UserVO vo) {
		return sqlSession.update(namespace+".updateState", vo);
	}

	@Override
	public int getUserCnt() {
		return sqlSession.selectOne(namespace+".userCnt");
	}

	@Override
	public int itemCount() {
		return sqlSession.selectOne(namespace+".itemCnt");
	}
	
	@Override
	public int itemCountOfSubject(searchVO vo) {
		return sqlSession.selectOne(namespace+".itemCountOfSubject", vo);
	}
	
	@Override
	public int itemCountOfContent(searchVO vo) {
		return sqlSession.selectOne(namespace+".itemCountOfContent", vo);
	}
	
	@Override
	public int itemCountOfSC(searchVO vo) {
		return sqlSession.selectOne(namespace+".itemCountOfSC", vo);
	}

	@Override
	public int getNoticeCnt() {
		return sqlSession.selectOne(namespace+".noticeCnt");
	}

	@Override
	public void insertNotice(NoticeVO vo) {
		sqlSession.insert(namespace+".insertNotice", vo);
	}

	@Override
	public List<Map<String, Object>> readItemInfo(String item_num) {
		return sqlSession.selectList(namespace+".getItemJoinList", item_num);
	}

	@Override
	public void updateItem(ItemVO vo, List<Item_detailVO> dtlList) {
		sqlSession.insert(namespace+".updateItem", vo);
		
		List<Integer> idxList = sqlSession.selectList(namespace+".detailIdxList", vo);
		
		System.out.println(idxList);
		
		for(int i=0; i<dtlList.size(); i++) {
			Item_detailVO dtlvo = dtlList.get(i);
			if(dtlvo.getItem_detail_idx() == 0) {
				sqlSession.insert(namespace+".insertItemDetail", dtlvo);
			} else {
				sqlSession.update(namespace+".updateItemDetail", dtlvo);
			}
			
			for(int j=0; j<idxList.size(); j++) {
				if(dtlvo.getItem_detail_idx() == idxList.get(j)) {
					idxList.remove(j);
				}
			}
		}
		
		System.out.println(idxList);
		
		for(int i=0; i<idxList.size(); i++) {
			sqlSession.delete(namespace+".deleteDetailOfIdx", idxList.get(i));
		}
	}

	@Override
	public int deleteItem(int item_num) {
		sqlSession.delete(namespace+".deleteDetailOfItemNum", item_num);
		
		return sqlSession.delete(namespace+".deleteItem", item_num);
	}

	@Override
	public NoticeVO readNoticeInfo(int notice_num) {
		return sqlSession.selectOne(namespace+".noticeInfo", notice_num);
	}

	@Override
	public void updateNotice(NoticeVO vo) {
		sqlSession.update(namespace+".updateNotice", vo);
	}

	@Override
	public int deleteNotice(int notice_num) {
		return sqlSession.delete(namespace+".deleteNotice", notice_num);
	}

	@Override
	public List<PopupVO> popupList() {
		return sqlSession.selectList(namespace+".popupList");
	}

	@Override
	public void insertPopup(PopupVO vo) {
		sqlSession.insert(namespace+".insertPopup", vo);
	}

	@Override
	public int changePopup(int popup_num) {
		sqlSession.update(namespace+".resetCheck");
		return sqlSession.update(namespace+".changePopup", popup_num);
	}

	@Override
	public int checkPopupCnt() {
		return sqlSession.selectOne(namespace+".checkPopupCnt");
	}
	
	
	
}
