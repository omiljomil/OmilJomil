package question.model.service;


import question.model.dao.QuestionDAO;
import question.model.vo.Question;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

public class QuestionService {
	private QuestionDAO qDAO = new QuestionDAO();

	public ArrayList<Question> selectQuestion() {
		Connection conn = getConnection();
		ArrayList<Question> list = qDAO.selectQuestion(conn);
		close(conn);
		return list;
	}
}
