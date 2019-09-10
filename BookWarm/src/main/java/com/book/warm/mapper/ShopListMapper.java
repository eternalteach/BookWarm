package com.book.warm.mapper;

import java.util.List;

import com.book.warm.page.Criteria;
import com.book.warm.vo.ShopListBoardVO;

public interface ShopListMapper {
	////isbn ������ �ҷ�����
	public List<ShopListBoardVO> shoplist();
	
	//�����(��������)������ �ҷ�����
	public List<ShopListBoardVO> shoplist2();
	
	//å �������� �������� �̵�
	public ShopListBoardVO bookdetail(String isbn);
	
	//å�� ���� �帣 ��������
	public List<ShopListBoardVO> bookgenre(String isbn);
	
	//�����̸��� ���� å �ҷ�����
	public List<ShopListBoardVO> bookwriter(String writer_name);
	
	//����¡ ó��
	public List<ShopListBoardVO> shoplistpage(Criteria criteria);
	// 총 페이지 수
	public int gettotalcount(Criteria criteria);
	
}
