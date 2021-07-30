package com.jps.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jps.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {

	@Inject
	private SqlSession sqlSession;

	// mapper 주소
	private static final String namespace = "com.jps.mappers.UserMapper";

	@Override
	public UserVO loginUser(UserVO vo) {
		System.out.println("DAO :  loginUser() 호출");
		System.out.println("DAO :  DB연결 sqlSession, mapper 사용 sql구문 실행");

		// 전달되는 데이터값이 연관이 없을 경우,
		// Map사용하여 데이터 저장 > key,value 쌍으로 데이터 저장
		// *key값은 객체의 변수명/컬럼명과 동일하게 사용하기

		return sqlSession.selectOne(namespace + ".loginUser", vo);
	}

	@Override
	public UserVO infoUser(String user_num) {

		System.out.println("DAO : infoUser() 호출 ");
		System.out.println("DAO : DB연결 ");

		UserVO vo = sqlSession.selectOne(namespace + ".infoUser", user_num);

		System.out.println("DAO:mapper 실행완료 ");
		System.out.println("DAO : " + vo);

		return vo;
	}

	@Override
	public void insertUser(UserVO vo) {
		System.out.println("DAO :  insertUser() 호출");
		System.out.println("DAO :  DB연결 sqlSession, mapper 사용 sql구문 실행");

		sqlSession.insert(namespace + ".insertUser", vo);
	};

	@Override
	public int checkId(String user_id) {
		System.out.println("DAO :  checkId() 호출");
		System.out.println("DAO :  DB연결 sqlSession, mapper 사용 sql구문 실행");
		
		return sqlSession.selectOne(namespace + ".checkId", user_id);
	};

	@Override
	public int checkEmail(String user_email) {
		System.out.println("DAO :  checkEmail() 호출");
		System.out.println("DAO :  DB연결 sqlSession, mapper 사용 sql구문 실행");

		return sqlSession.selectOne(namespace + ".checkEmail", user_email);
	};

	@Override
	public int checkNickname(String user_nickname) {
		System.out.println("DAO :  checkNickname() 호출");
		System.out.println("DAO :  DB연결 sqlSession, mapper 사용 sql구문 실행");

		return sqlSession.selectOne(namespace + ".checkNickname", user_nickname);
	};

	@Override
	public int checkPhone(String user_phone) {
		System.out.println("DAO :  checkPhone() 호출");
		System.out.println("DAO :  DB연결 sqlSession, mapper 사용 sql구문 실행");

		return sqlSession.selectOne(namespace + ".checkPhone", user_phone);
	};

}
