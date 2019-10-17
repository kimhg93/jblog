package kr.co.itcen.jblog.repository;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.jblog.vo.UserVo;

@Repository
public class UserDao {
	@Autowired
	private SqlSession sqlSession;
	
	public void insert(UserVo vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", vo.getId());
		map.put("name", vo.getName());
		sqlSession.insert("user.insert", vo);	
		sqlSession.insert("blog.insert", map);
		sqlSession.insert("category.insert" , vo.getId());
	}

	public UserVo getUser(UserVo vo) {
		return sqlSession.selectOne("user.get", vo);
	}

	public int checkId(String id) {
		return sqlSession.selectOne("user.checkId", id);
	}

}
