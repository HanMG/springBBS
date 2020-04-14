package com.moon.controller;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.moon.domain.BoardVO;
import com.moon.persistence.BoardDAO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class BoardDAOTest {
	private static final Logger logger = LoggerFactory.getLogger(BoardDAOTest.class);
	
	@Inject
	private BoardDAO dao;	
	
	@Test
	public void testCreate() throws Exception{
		
		BoardVO board = new BoardVO();
		board.setTitle("새로운 타이틀을 넣습니다.");
		board.setContent("새로운 내용을 넣습니다.");
		board.setWriter("user00");		
		dao.create(board);
	}
	
	@Test
	public void testRead() throws Exception{
		logger.info(dao.read(1).toString());
	}
	
	@Test
	public void testUpadet() throws Exception{
		BoardVO board = new BoardVO();
		board.setBno(1);
		board.setTitle("수정된 타이틀 입니다.");
		board.setContent("수정된 내용입니다.");
		dao.update(board);
	}
	
	@Test
	public void testDelete() throws Exception{
		dao.delete(1);
	}
	
	
}