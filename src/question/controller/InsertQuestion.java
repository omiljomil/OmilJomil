package question.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import common.MyFileRenamePolicy;

import question.model.service.QuestionService;
import question.model.vo.Question;
import review.model.vo.Photo;

/**
 * Servlet implementation class InsertQuestion
 */
@WebServlet("/insertQuestion.qs")
public class InsertQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertQuestion() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String title = request.getParameter("brackets") + request.getParameter("title");
		String write = request.getParameter("write");
		String Content = request.getParameter("questionContent"); 
		Question q = new Question(0, title, Content, write, null, null, null);
		
		int result = new QuestionService().insertQuestion(q);
		
		if(result >0) {
			response.sendRedirect("questionList.bo");
		}else {
			request.setAttribute("msg", "문의 사항 등록 실패");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
		}
		
		
		
		
		
		/*if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10;//10Mbyte
			String root = request.getSession().getServletContext().getRealPath("/"); //웹 서버 컨테이너 경로 추출 : WebContent
			String savePath = root + "thumbnail_uploadFiles/";
			
			File f = new File(savePath);
			if(!f.exists()) {
				f.mkdir();
			}
			
			//DefaultFileRenamePolicy (cos.jar안에 존재)
			//: 같은 파일명이 있는지 검사하고, 있을 경우 파일 명 뒤에 숫자를 붙임
			// ex> aaa.jpg aaa1.jsp aaa2.jsp
			
			//cos.jar
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize,"UTF-8", new MyFileRenamePolicy());
			
			ArrayList<String> saveFiles = new ArrayList<String>(); //파일의 바뀐 이름을 저장할 ArrayList
			ArrayList<String> originFiles = new ArrayList<String>(); //파일의 원래 이름을 저장할 ArrayList
			
			Enumeration<String> files =  multiRequest.getFileNames();
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				
				if(multiRequest.getFilesystemName(name) != null) {
					saveFiles.add(multiRequest.getFilesystemName(name));
					originFiles.add(multiRequest.getOriginalFileName(name));
				}
				
			}
			String brackets = request.getParameter("brackets");
			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("questionContent");
			String writer = multiRequest.getParameter("write");
			
			Question q = new Question(0, title, content, writer, null, null, null);
			ArrayList<Photo> fileList = new ArrayList<Photo>();
			for (int i = originFiles.size() - 1; i >=0; i--) {
				Photo a = new Photo();
				a.setFilePath(savePath);
				a.setImgName(originFiles.get(i));
				a.setImgChangeName(saveFiles.get(i));
				
				if(i==originFiles.size() - 1) {
					a.setFileLevel(0);
				}else {
					a.setFileLevel(1);
				}
				fileList.add(a);
			}
			int result = new QuestionService().insertQuestion(q,fileList);
			
			if(result>=1+fileList.size()) {
				response.sendRedirect("insertQuestionForm.qt");
			}else {
				request.setAttribute("msg", "사진 게시판 등록 실패");
				request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
				for (int i = 0; i < saveFiles.size(); i++) {
					File fail = new File(savePath + saveFiles.get(i));
					fail.delete();
				}
			}
					
		}*/
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
