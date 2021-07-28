package com.jps.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jps.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO{

	@Inject
	private SqlSession sqlSession;
	
	// mapper 주소 
	private static final String namespace
		= "com.jps.mapper.ItemMapper";

	@Override
	public UserVO LoginUser(UserVO vo) {
		System.out.println("DAO :  loginUser() 호출");
		System.out.println("DAO :  DB연결 sqlSession, mapper 사용 sql구문 실행");		
		
		//전달되는 데이터값이 연관이 없을 경우, 
		//Map사용하여 데이터 저장 > key,value 쌍으로 데이터 저장
		//*key값은 객체의 변수명/컬럼명과 동일하게 사용하기
		
		return sqlSession.selectOne(namespace+".loginUser",vo);
	}
	
	
	
}
