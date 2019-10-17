package kr.co.itcen.jblog.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


import kr.co.itcen.jblog.repository.BlogDao;
import kr.co.itcen.jblog.vo.BlogVo;

@Service
public class BlogService {
	private static final String SAVE_PATH = "/kimhg/logos";
	
	@Autowired
	private BlogDao blogDao;
	
	public BlogVo get(String id) {
		return blogDao.get(id);		
	}
	
	public void updateHit(String id) {
		blogDao.updateHit(id);
		
	}

	public void update(BlogVo vo) {
		blogDao.update(vo);
	}
	
	public List<BlogVo> getList() {
		return blogDao.getList();
	}
	public String restore(MultipartFile multipartFile) {
		System.out.println("testtesttest");
		String url = "";
		try {				
			if(multipartFile==null) {
				return url;
			}			
			String originalFilename = multipartFile.getOriginalFilename();			
			String saveFileName = generateSaveFileName(originalFilename.substring(originalFilename.lastIndexOf('.')+1));					
			byte[] fileData =  multipartFile.getBytes();
			OutputStream os = new FileOutputStream(SAVE_PATH+"/"+saveFileName);
			os.write(fileData);
			os.close();
			
			url = saveFileName;
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return url;
	}
	
	private String generateSaveFileName(String extName) {
		String filename = "";		
		Calendar calendar = Calendar.getInstance();
		filename += calendar.get(Calendar.YEAR);
		filename += calendar.get(Calendar.MONTH);
		filename += calendar.get(Calendar.DATE);
		filename += calendar.get(Calendar.HOUR);
		filename += calendar.get(Calendar.MINUTE);
		filename += calendar.get(Calendar.SECOND);
		filename += calendar.get(Calendar.MILLISECOND);
		filename += "."+extName;
		return filename;
	}
	
}
