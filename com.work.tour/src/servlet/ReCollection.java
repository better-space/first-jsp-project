package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tour.user.option.Collection;

/**
 * Servlet implementation class test
 */
@WebServlet("/test")
public class ReCollection extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReCollection() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("gb2312");
		response.setContentType("text/html;gb2312");
		response.setCharacterEncoding("gb2312");
		// PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		Collection coll = new Collection();
		String username = (String) session.getAttribute("admain");
		String words = request.getParameter("words");
		//System.out.println(words+"  "+username);
		boolean flag = false;
		boolean cnt = false;
		flag = coll.gainCollection(username, words);

		String feedback = null;
		if (flag == true) {
			// System.out.println("已收藏");
			cnt = coll.updateCollection(words);
			if (cnt == true) {
				feedback = "已收藏";
				response.sendRedirect("/com.work.tour/index.jsp?feedback=" + URLEncoder.encode(feedback, "utf-8")
						+ "&words=" + URLEncoder.encode(words, "utf-8"));
			} else {
				feedback = "收藏失败";
				response.sendRedirect("/com.work.tour/index.jsp?feedback=" + URLEncoder.encode(feedback, "utf-8")
						+ "&words=" + URLEncoder.encode(words, "utf-8"));
			}
		} else {
			// System.out.println("添加到收藏");
			feedback = "收藏失败";
			response.sendRedirect("/com.work.tour/index.jsp?feedback=" + URLEncoder.encode(feedback, "utf-8")
					+ "&words=" + URLEncoder.encode(words, "utf-8"));
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
