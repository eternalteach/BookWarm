package com.book.warm.mapper;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.book.warm.vo.Criteria;
import com.book.warm.vo.ShopListBoardVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class PagingBoardVOTest {
	
	@Inject
	ShopListMapper shoplistmapper;
	
	@Test
	public void test() {
		Criteria cri = new Criteria();
		List<ShopListBoardVO> list = shoplistmapper.shoplistpage(cri);
		
	}

}
