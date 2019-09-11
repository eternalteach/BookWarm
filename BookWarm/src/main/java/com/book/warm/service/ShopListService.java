//package com.book.warm.service;
//
//import java.util.List;
//
//import javax.inject.Inject;
//
//import org.springframework.stereotype.Service;
//
//import com.book.warm.mapper.ShopListMapper;
//import com.book.warm.page.Criteria;
//import com.book.warm.vo.ShopListBoardVO;
//
//@Service
//public class ShopListService {
//
//	@Inject
//	ShopListMapper shoplistmapper;
//	
//	//����Ʈ ������ �ҷ�����
//	public List<ShopListBoardVO> shoplist() throws Exception{
//		System.out.println("ShopList ����Ʈ������ �ҷ�����");
//
//		return shoplistmapper.shoplist();
//	}
//	
//	//�����(��������)������ �ҷ�����
//	public List<ShopListBoardVO> shoplist2() throws Exception{
//		System.out.println("shoplist2 ��������� �ҷ�����");
//		return shoplistmapper.shoplist2();
//	}
//	
//	//å ������ �ҷ�����
//	public ShopListBoardVO bookdetail(String isbn) throws Exception{
//		System.out.println("å ������ ��������");
//		return shoplistmapper.bookdetail(isbn);
//	}
//	
//	//å�� �帣 �ҷ�����
//	public List<ShopListBoardVO> bookgenre(String isbn) throws Exception {
//		System.out.println("�帣 �ҷ�����");
//		return shoplistmapper.bookgenre(isbn);
//	}
//	
//	//��ǥ������ �ٸ� å�� �ҷ�����
//	public List<ShopListBoardVO> bookwriter(String writer_name) throws Exception {
//		System.out.println("bookwriter ����");
//		return shoplistmapper.bookwriter(writer_name);
//	}
//	
//	//����¡ó��
//	public List<ShopListBoardVO> shoplistpage(Criteria criteria) throws Exception{
//		System.out.println("����¡ ó��");
//		return shoplistmapper.shoplistpage(criteria);
//	}
//	
//	
//	//��ü ����������
//	public int gettotalcount(Criteria criteria) {
//		System.out.println("��ü����");
//		return shoplistmapper.gettotalcount(criteria);
//	}
//	
//}
