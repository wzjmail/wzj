package buaa.sem.ps.mainBaseData.action;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.DynaActionForm;

import buaa.sem.ps.ConsistBean;
import buaa.sem.ps.abstractClass.LO;
import buaa.sem.ps.action.BaseAction;
import buaa.sem.ps.dataGrabManagement.model.Blog;
import buaa.sem.ps.mainBaseData.dao.MonthMgmtDAO;
import buaa.sem.ps.mainBaseData.dao.weeklyInfluzaMgmtDAO;
import buaa.sem.ps.mainBaseData.model.DiseaseInfo;
import buaa.sem.ps.mainBaseData.model.MonthMgmt;
import buaa.sem.ps.mainBaseData.model.weeklyInfluzaMgmt;
import buaa.sem.ps.util.PageUtility;
import buaa.sem.ps.util.readExcel;

public class weeklyInfluzaMgmtAction extends BaseAction {

	private weeklyInfluzaMgmtDAO weeklyInfluzaMgmtDAO;

	public weeklyInfluzaMgmtDAO getWeeklyInfluzaMgmtDAO() {
		return weeklyInfluzaMgmtDAO;
	}

	public void setWeeklyInfluzaMgmtDAO(weeklyInfluzaMgmtDAO weeklyInfluzaMgmtDAO) {
		this.weeklyInfluzaMgmtDAO = weeklyInfluzaMgmtDAO;
	}

	public ActionForward toeditweeklyInfluzaMgmt(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		System.err.println("1");
		PageUtility pageRequest = new PageUtility(request);
		int id = pageRequest.getParameter("id", 0);
		weeklyInfluzaMgmt di = this.weeklyInfluzaMgmtDAO.getWeeklyInfluzaMgmtById(id);

		request.setAttribute("weeklyInfluzaMgmt", di);

		return mapping.findForward("editweeklyInfluzaMgmt");
	}

	public ActionForward deleteweeklyInfluzaMgmt(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		PageUtility pageRequest = new PageUtility(request);
		int id = pageRequest.getParameter("id", 0);

		try {
			weeklyInfluzaMgmt di = this.weeklyInfluzaMgmtDAO.getWeeklyInfluzaMgmtById(id);
			this.weeklyInfluzaMgmtDAO.delete(di);
			this.sendAjaxMsg("true", "删除成功！", response);
		} catch (Exception e) {
			e.printStackTrace();
			this.sendAjaxMsg("false", " 删除失败!", response);
		}
		return null;
	}

	public ActionForward listWeeklyInfluzaMgmt(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, ParseException {
		DynaActionForm forms = (DynaActionForm)form;
		String unitFullName = (String)forms.get("weekNo");
		
		String  weekNo = (String)forms.get("weekNo");
		String  remark = (String)forms.get("remark");
		double sourthIli = (double)forms.get("sourthIli");
		double northIli = (double)forms.get("northIli");
		double nationIli = (double)forms.get("nationIli");
		int numCurPage = ((Integer)forms.get("page")).intValue();
		
		
	/*	String filepath = request.getSession().getServletContext().getRealPath("/upload/" + file.getServerName());
		List<weeklyInfluzaMgmt> representlist = readExcel.readExcelFile(filepath); 
		for(Blog blog: blogs){
			this.blogDAO.insert(blog);
		}
		*/
		
		
		
		LO lo=new LO();
		if (numCurPage <= 0) numCurPage = 1;
		lo.setCurPage(numCurPage);
		lo.setPageSize(ConsistBean.getPageSize(request));
		lo.setIsSinglePage(false);
		lo.setQryKeywords("weekNo",unitFullName);
		lo = this.weeklyInfluzaMgmtDAO.getPagedList(lo, "weeklyInfluzaMgmt");
		request.setAttribute("lo", lo);
		request.setAttribute("weekNo", weekNo);
		request.setAttribute("remark", remark);
		request.setAttribute("sourthIli", sourthIli);
		request.setAttribute("northIli", northIli);
		request.setAttribute("nationIli", nationIli);
		//System.err.println(sourthIli);System.err.println(nationIli);System.err.println("###");
		return mapping.findForward("weeklyinfluza");
	}

	public ActionForward toaddWeeklyInfluzaMgmt(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException, ParseException {
		PageUtility pageRequest = new PageUtility(request);
		List<weeklyInfluzaMgmt> representlist = this.weeklyInfluzaMgmtDAO.getAllWeeklyInfluzaMgmtInfo();
		request.setAttribute("weeklyInfluzaMgmtNum", representlist.size());

		return mapping.findForward("addWeeklyInfluzaMgmt");
	}

	public ActionForward toweeklyinfluzadetail(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		PageUtility pageRequest = new PageUtility(request);
		int id = pageRequest.getParameter("id", 0);
		weeklyInfluzaMgmt di = this.weeklyInfluzaMgmtDAO.getWeeklyInfluzaMgmtById(id);

		request.setAttribute("weeklyInfluzaMgmt", di);

		return mapping.findForward("weeklyinfluzamgmtdetail");
	}

	public ActionForward addWeeklyInfluzaMgmt(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		PageUtility pageRequest = new PageUtility(request);
		String weekNo = pageRequest.getParameter("weekNo", "");
		double sourthIli = pageRequest.getParameter("sourthIli", 0.0);

		double northIli = pageRequest.getParameter("northIli", 0.0);
		double nationIli = pageRequest.getParameter("nationIli", 0.0);
		String remark = pageRequest.getParameter("remark", "");
		List<weeklyInfluzaMgmt> add_weeklyInfluzaMgmt_list = this.weeklyInfluzaMgmtDAO
				.getAllWeeklyInfluzaMgmtByweekNo(weekNo);
		if (add_weeklyInfluzaMgmt_list != null) {
			this.sendAjaxMsg("false", "该周疾病指数信息存在！", response);
			return null;
		}

		try {
			weeklyInfluzaMgmt di = new weeklyInfluzaMgmt();
			di.setWeekNo(weekNo);
			di.setSourthIli(sourthIli);
			di.setNorthIli(northIli);
			di.setNationIli(nationIli);
			di.setRemark(remark);

			this.weeklyInfluzaMgmtDAO.insert(di);
			this.sendAjaxMsg("true", "添加成功！", response);
		} catch (Exception e) {
			e.printStackTrace();
			this.sendAjaxMsg("false", " 添加失败!", response);
		}
		return null;

	}

	public ActionForward editweeklyInfluzaMgmt(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.err.println("555");

		PageUtility pageRequest = new PageUtility(request);
		int id = pageRequest.getParameter("id", 0);
		String weekNo = pageRequest.getParameter("weekNo", "");

		double northIli = pageRequest.getParameter("northIli", 0.0);
		double sourthIli = pageRequest.getParameter("sourthIli", 0.0);
		double nationIli = pageRequest.getParameter("nationIli", 0.0);

		String remark = pageRequest.getParameter("remark", "");

		try {
			weeklyInfluzaMgmt di = this.weeklyInfluzaMgmtDAO.getWeeklyInfluzaMgmtById(id);

			di.setWeekNo(weekNo);
			di.setNorthIli(northIli);
			di.setSourthIli(sourthIli);
			di.setNationIli(nationIli);

			di.setRemark(remark);

			this.weeklyInfluzaMgmtDAO.update(di);
			this.sendAjaxMsg("true", "更新成功", response);
		} catch (Exception e) {
			e.printStackTrace();
			this.sendAjaxMsg("false", " 更新失败!", response);
		}
		return null;
	}

}
