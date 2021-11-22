package question.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import question.model.service.QuestionService;
import question.model.vo.Question;

/**
 * Servlet implementation class QuestionDetail
 */
@WebServlet("/QuestionDetail.qs")
public class QuestionDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String write = request.getParameter("qId");
		Question q = new QuestionService().selectQuestionDetail(write);
		int idx = q.getQst_title().indexOf(")");
		String title = q.getQst_title().substring(0,idx);
		String brackets = q.getQst_title().substring(idx+1);


		
		request.setAttribute("title", title);
		request.setAttribute("brackets", brackets);
		request.setAttribute("q", q);
		request.getRequestDispatcher("WEB-INF/views/question/questionDetail.jsp").forward(request, response);
			
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
