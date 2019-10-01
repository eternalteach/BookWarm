package com.book.warm.task;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.inject.Inject;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.book.warm.mapper.ReviewBoardMapper;
import com.book.warm.vo.CouponNoVO;
import com.book.warm.vo.ReviewAttachVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Component
public class FileCheckTask {
	
	@Inject
	private ReviewBoardMapper mapper;
	
	private String getFolderYesterDay() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -1);
		String str = sdf.format(cal.getTime());
		return str.replace("-", File.separator);
	}
	
	@Scheduled(cron="0 0 2 * * *")
	public void checkFiles() throws Exception {
		log.warn("File Check Task Run");
		log.warn(new Date());
		// file list in database
		List<ReviewAttachVO> fileList = mapper.getOldFiles();
		
		//ready for check file in directory with database file list
		List<Path> fileListPaths = fileList.stream()
				.map(vo -> Paths.get("C:\\upload", vo.getUploadPath(), vo.getUuid() + "_" + vo.getFileName()))
				.collect(Collectors.toList());
		
		
		//image file has thumbnail file
		fileList.stream()
				.map(vo -> Paths.get("C:\\upload", vo.getUploadPath(), "s_" + vo.getUuid() + "_" + vo.getFileName()))
				.forEach(p -> fileListPaths.add(p));
		
		log.warn("==========================================");
		
		fileListPaths.forEach(p -> log.warn(p));
		
		//files in yesterday directory
		File targetDir = Paths.get("C:\\upload", getFolderYesterDay()).toFile();
		File[] removeFiles = targetDir.listFiles(file -> fileListPaths.contains(file.toPath()) == false);
		
		log.warn("====================================");
		for(File file : removeFiles) {
			log.warn(file.getAbsolutePath());
			file.delete();
		}
	}
	
	@Scheduled(cron="0 0 0 * * *")
	public void updateCouponAvailable() throws Exception {
		System.out.println("---------coupon_no테이블 갱신----------");
		// 매일 00시에 coupon_no테이블(coupon_available 컬럼) 갱신
		
		// 1. 현재 시간(sysdate)보다 기간이 이전인 쿠폰 객체를 불러온다.
		List<CouponNoVO> couponList = mapper.compareCouponTime();
		System.out.println("couponList.size() : " + couponList.size());
		
		System.out.println("couponList.size() : " + couponList.size());
		// 2. 가져온 쿠폰객체들의 COUPON_AVAILABLE 컬럼을 'f'로 바꿔준다.
		for(int i=0; i<couponList.size(); i++) {
			mapper.changeCouponAvailable(couponList.get(i));
			System.out.println("------"+couponList.get(i).getCoupon_no()+", "+couponList.get(i).getUser_id()+"--------");
		}
		
		System.out.println("----------coupon_no테이블 갱신 완료----------");
	}
}
