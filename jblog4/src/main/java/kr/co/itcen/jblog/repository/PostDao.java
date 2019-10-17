package kr.co.itcen.jblog.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.jblog.vo.PostVo;

@Repository
public class PostDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<PostVo> getList(String id) {
		return sqlSession.selectList("post.getList", id);
	}
	
	public List<PostVo> getListNo(Long categoryNo) {
		return sqlSession.selectList("post.getListNo", categoryNo);
	}
	
	public void insert(PostVo vo) {
		sqlSession.insert("post.insert", vo);
	}

	public PostVo getView(Long no) {
		return sqlSession.selectOne("post.getView", no);
	}

	

}
