package logic.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logic.bean.LibrBean;
import logic.bean.StudentBean;
import logic.control.LibrarianSuperviseController;
import logic.control.SuperviseController;

/**
 * Servlet implementation class SuperviseServlet
 */
public class SuperviseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LibrarianSuperviseController superviseController;
	private List<String> usernameList;
   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SuperviseServlet() {
        super();
        superviseController = new SuperviseController();
        usernameList = new ArrayList<>();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		LibrBean libraryBean = (LibrBean)request.getSession().getAttribute("libraryBean");
		for (int i=0; i<usernameList.size(); i++) {
			if (request.getParameter(usernameList.get(i)) != null) {
				request.getSession().setAttribute("studentBean", superviseController.getInfoStudent(usernameList.get(i)));
				request.getRequestDispatcher("InfoAccount.jsp").forward(request, response);
				return;
			}
		}
		
		usernameList = superviseController.fillSupervisePage(libraryBean.getMail());
		request.setAttribute("usernameList", usernameList);
		request.getRequestDispatcher("SupervisePage.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LibrBean libraryBean = (LibrBean)request.getSession().getAttribute("libraryBean");
		StudentBean studentBean = (StudentBean)(request.getSession().getAttribute("studentBean"));
		superviseController.increaseReportingCounter(studentBean.getMail(), libraryBean.getMail(), "infoAccount");
		doGet(request,response);
	}
	

}
