package question.model.service;


import question.model.dao.QuestionDAO;
import question.model.vo.Question;
import review.model.vo.Photo;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import page.PageInfo;

public class QuestionService {
	private QuestionDAO qDAO = new QuestionDAO();

	public ArrayList<Question> selectQuestion(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Question> list = qDAO.selectQuestion(conn, pi);
		close(conn);
		return list;
	}
/*
	public int insertQuestion(Question q, ArrayList<Photo> fileList) {
		Connection conn = getConnection();
		
		int result1 = qDAO.insertQuestion(conn,q);
		int result2 = qDAO.insertQuestionImg(conn,fileList);
		if(result1>0 && result2 >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result1+result2;
	}
*/
	public int qsCount() {
		Connection conn = getConnection();
		int result = qDAO.qsCount(conn);
		close(conn);
		return result;
	}

	public ArrayList selectLFList() {
		Connection conn = getConnection();
		ArrayList list = null;
		
			list = qDAO.selectFList(conn);
		
		close(conn);
		return list;
	}
	public int insertQuestion(Question q) {
		Connection conn = getConnection();
		int result = qDAO.insertQuestion(conn,q);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		close(conn);
		return result;
	}
	public Question selectQuestionDetail(String write) {
		Connection conn = getConnection();
		Question q = qDAO.selectQuestionDetail(conn,write);
		close(conn);
		return q;
	}
	public int deleteQuestion(String write) {
		Connection conn = getConnection();
		int result = qDAO.deleteQuestion(conn,write);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}
	
}
