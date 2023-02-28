package com.mycom.auction.goods.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mycom.auction.goods.domain.ProductDTO;
import com.mycom.auction.goods.service.GoodsService;


@Controller
public class GoodsRegisterController {

	private static final Logger logger = LoggerFactory.getLogger(GoodsRegisterController.class);
	
	@Autowired
	GoodsService goodsService;
	
	private static final String REPO_PATH = "C:\\uploads";

	@GetMapping("/goodsRegisterForm")
	public String registerGetGoods(HttpServletRequest request) {
		/*
		 * HttpSession session = request.getSession();
		 * session.setAttribute("AUTHUSER_ID", "hongid");//임시
		 */			
		return "/acutionGoods/auctionGoodsRegisterPage";
	}
		
	  	
	@RequestMapping(value="/goodsRegisterForm" ,method={RequestMethod.POST})
	public ResponseEntity registerPostGoods(ModelAndView mv,MultipartHttpServletRequest multipartRequest) throws Exception {			
		/* multipartRequest.setCharacterEncoding("utf-8"); */
		Map map = new HashMap();
		Enumeration enu = multipartRequest.getParameterNames();  
		while( enu.hasMoreElements() ) {
			String name = (String)enu.nextElement();
			String value= multipartRequest.getParameter(name);
			logger.info("컨트롤러 while문안 map.put(name,value)="+name+","+value);
	  		map.put(name,value);
		}
		List<ProductDTO> imageFileList = upload(multipartRequest);
		if( imageFileList!=null && imageFileList.size()!=0) {
			map.put("imageFileList",imageFileList);
		}
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type","text/html;charset=utf-8");
		String msg = null;
		String imageFileName = null;

		try {
			String goods=goodsService.insertImageGoods(map);//글관련정보+첨부파일정보
			//입력성공이 되면 
			//글등록이 되었습니다. 라는 alert 띄우기 + 입력폼페이지로 이동 + 업로드된 이미지 출력
			//1)임시파일을 저장소로 복사 (temp폴더 안의 임시파일을 글번호 폴더 생성후 그 하위에 이동)
			if( imageFileList!=null && imageFileList.size()!=0){
				for(ProductDTO productDTO  : imageFileList) {
					imageFileName=productDTO.getImage();
					File srcFile = new File(REPO_PATH+"\\temp\\"+imageFileName); 
					File destDir = new File(REPO_PATH+"\\"+goods);
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
				}
			}
			//2)글등록이 되었습니다. 라는 alert띄우기
			msg   = "<script>;";
			msg  += "alert('상품이 등록되었습니다.');";
			msg  += "location.href='"+multipartRequest.getContextPath()+"/acutionGoods/auctionGoodsListPage';";
			msg  += "</script>";
			//3)입력폼 페이지로 이동
		}catch(Exception e) {
			//입력 실패되면
			// "글등록이 실패되었습니다." 라는 alert 띄우기 + 입력폼페이지로 이동 + 업로드된 이미지 출력
			//1)업로드된 이미지 삭제
			if( imageFileList!=null && imageFileList.size()!=0){
				for(ProductDTO productDTO  : imageFileList) {
					imageFileName=productDTO.getImage();
					File srcFile = new File(REPO_PATH+"\\temp\\"+imageFileName); 
					srcFile.delete();
				}
			}
			//2)오류발생 되었습니다. 라는 alert띄우기
			msg   = "<script>;";
			msg  += "alert('오류가 발생 되었습니다.');";
			msg  += "location.href='"+multipartRequest.getContextPath()+"/acutionGoods/auctionGoodsListPage';";
			msg  += "</script>";
			//3)입력폼 페이지로 이동
			e.printStackTrace();
		}
		resEntity=	new ResponseEntity(msg,responseHeaders,HttpStatus.OK); 
		return resEntity;
	}
		
	
		
		
		
		
  	public List<ProductDTO> upload(MultipartHttpServletRequest multipartRequest) throws Exception{
  		List<ProductDTO> fileList= new ArrayList<ProductDTO>();
  		Iterator<String> fileNames = multipartRequest.getFileNames();
  		while(fileNames.hasNext()){
  			ProductDTO productDTO =new ProductDTO();
  			String fileName = fileNames.next();
  			MultipartFile mFile = multipartRequest.getFile(fileName);
  			String originalFileName=mFile.getOriginalFilename();
  			System.out.println("originalFilename="+originalFileName);
  			productDTO.setImage(originalFileName);
  			
  			fileList.add(productDTO);
  			File file = new File(REPO_PATH+"\\"+fileName);
  			if(mFile.getSize()!=0) {  
  			 System.out.println("첨부된 파일이 존재한다면");
  			 if( !file.exists() ) { 
  			 	if( file.getParentFile().mkdirs()  ) { 
  			 		file.createNewFile();
  			 	}
  			  }
  			mFile.transferTo(new File(REPO_PATH+"\\temp\\"+originalFileName));
  			}
  		}
  		return fileList;
  	}//upload끝
	
	
	
	@GetMapping("/goodsListForm")
	public String listGetGoods(Model model) {
		return "/acutionGoods/auctionGoodsListPage";
	}
	@PostMapping("/goodsListForm")
	public String listPostGoods(Model model) {
		return "/acutionGoods/auctionGoodsListPage";
	}
	
	@GetMapping("/goodsDetailForm")
	public String DetailGetGoods(Model model) {
		return "/acutionGoods/auctionGoodsDetailPage";
	}
	@PostMapping("/goodsDetailForm")
	public String DetailPostGoods(Model model) {
		return "/acutionGoods/auctionGoodsDetailPage";
	}
}





