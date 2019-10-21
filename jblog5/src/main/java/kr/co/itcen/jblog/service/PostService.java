package kr.co.itcen.jblog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.jblog.repository.PostDao;
import kr.co.itcen.jblog.vo.PostVo;

@Service
public class PostService {
	
	@Autowired
	private PostDao postDao;
	
	public List<PostVo> getList(String id) {
		return postDao.getList(id);
	}

	public void insert(PostVo vo) {
		postDao.insert(vo);		
	}

	public PostVo getView(Long no) {
		return postDao.getView(no);
	}

	public List<PostVo> getList(Long categoryNo) {
		return postDao.getListNo(categoryNo);
	}

}
