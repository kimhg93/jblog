package kr.co.itcen.jblog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.jblog.repository.CategoryDao;
import kr.co.itcen.jblog.vo.CategoryVo;

@Service
public class CategoryService {
	
	@Autowired
	private CategoryDao categoryDao;
	
	public List<CategoryVo> getList(String id) {
		return categoryDao.getList(id);		
	}

	public void add(CategoryVo vo) {
		categoryDao.add(vo);
	}

	public void delete(Long no) {
		categoryDao.delete(no);		
	}

}
