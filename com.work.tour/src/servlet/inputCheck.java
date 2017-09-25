package servlet;

import java.io.IOException;

import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.user.option.inputOpt;

/**
 * Servlet implementation class rigisterCheck
 */
@WebServlet("/rigisterCheck")
public class inputCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public inputCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		//ServletContext application = request.getServletContext();
		response.setContentType("text/html;charset=utf-8");
		//PrintWriter out = response.getWriter();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		inputOpt input = new inputOpt();
		int num = input.userNum(username);
		String messages;
		if(num!=0){				//有问题待解决
			System.out.println(num);
			messages = "用户名已被注册";
			response.sendRedirect("/com.work.tour/input.jsp?message="+URLEncoder.encode(messages,"utf-8"));
			return ;
		}
		boolean flag = input.userInputDatabase(username, password);
		if(flag == true){
			System.out.println("Success");
			messages = "注册成功";
			response.sendRedirect("/com.work.tour/login.jsp?message="+URLEncoder.encode(messages,"utf-8"));
			return ;
		}
		else{
			System.out.println("Falure");
			messages = "注册失败";
			response.sendRedirect("/com.work.tour/input.jsp?message="+URLEncoder.encode(messages,"utf-8"));
			return ;
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
