package servlet;

import java.io.IOException;

import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.tour.user.option.loginOpt;

/**
 * Servlet implementation class loginCheck
 */
@WebServlet("/loginCheck")
public class loginCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		loginOpt login = new loginOpt();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		boolean flag = login.userLookupDatabase(username,password);
		if(flag == true){
			session.setAttribute("admain", username);
			System.out.println("Login Success");
			response.sendRedirect("/com.work.tour/index.jsp");
		}
		else{
			System.out.println("Login Falure");
			//request.setAttribute("message", "用户名或密码错误！");
			String messages = "用户名或密码错误";
			response.sendRedirect("/com.work.tour/login.jsp?message="+URLEncoder.encode(messages, "utf-8"));
			//request.getRequestDispatcher("/login.jsp").forward(request,response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
