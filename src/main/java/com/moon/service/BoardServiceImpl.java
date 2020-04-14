package com.moon.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.moon.domain.BoardVO;
import com.moon.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Inject
	private BoardDAO dao;
	
	/* 게시글 등록 */
	@Override
	public void regist(BoardVO board) throws Exception {
		dao.create(board);		
	}

	/* 게시글 읽기 */
	@Override
	public BoardVO read(Integer bno) throws Exception {
		return dao.read(bno);
	}
	
	/* 게시글 수정 */
	@Override
	public void modify(BoardVO board) throws Exception {
		dao.update(board);		
	}

	/* 게시글 삭제 */
	@Override
	public void remove(Integer bno) throws Exception {
		dao.delete(bno);		
	}

	/* 리스트 전체 불러오기 */
	@Override
	public List<BoardVO> listAll() throws Exception {
		return dao.listAll();
	}

}