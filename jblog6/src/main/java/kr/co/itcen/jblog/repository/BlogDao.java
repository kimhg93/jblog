package kr.co.itcen.jblog.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.jblog.vo.BlogVo;

@Repository
public class BlogDao {

	@Autowired
	private SqlSession sqlSession;
	
	public BlogVo get(String id) {
		return sqlSession.selectOne("blog.get", id);
	}

	public void update(BlogVo vo) {
		sqlSession.update("blog.update", vo);		
	}

	public List<BlogVo> getList() {
		return sqlSession.selectList("blog.getList");
	}

	public void updateHit(String id) {
		sqlSession.update("blog.updateHit", id);		
	}

}
