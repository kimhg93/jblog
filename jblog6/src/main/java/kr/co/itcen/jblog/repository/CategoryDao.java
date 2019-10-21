package kr.co.itcen.jblog.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.jblog.vo.CategoryVo;

@Repository
public class CategoryDao {
	@Autowired 
	private SqlSession sqlSession;
	public List<CategoryVo> getList(String id) {
		return sqlSession.selectList("category.getList", id);
	}
	public void add(CategoryVo vo) {
		sqlSession.insert("category.add", vo);
	}
	public void delete(Long no) {
		sqlSession.delete("category.delete", no);		
	}

}
