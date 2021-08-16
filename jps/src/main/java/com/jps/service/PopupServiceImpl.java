package com.jps.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jps.domain.PopupVO;
import com.jps.persistence.PopupDAO;

@Service
public class PopupServiceImpl implements PopupService {
	
	@Inject
	PopupDAO pdao;
	
	@Override
	public void insertPopup_img(PopupVO vo) throws Exception {
		
		System.out.println("S : insertPopup_img(vo) 호출");
		
		pdao.insertPopup_img(vo);
		
	}
	
	@Override
	public PopupVO getPopup_img() throws Exception {
			
		System.out.println("S : getPopup_img(vo) 호출");
		
		return pdao.getPopup_img();
	}

}
