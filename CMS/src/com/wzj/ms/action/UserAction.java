package com.wzj.ms.action;

import com.wzj.ms.goods.Goods;
import com.wzj.ms.pojo.Pages;
import com.wzj.ms.pojo.User;
import com.wzj.ms.utils.Utils;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping({ "/userM" })
public class UserAction extends CommonAction {
	@RequestMapping({ "/login" })
	@ResponseBody
	public ModelAndView login(User user, HttpServletRequest request) {
		user = this.service.login(user);
		if (user == null) {
			this.map.put("user", Integer.valueOf(0));
			return new ModelAndView("login", this.map);
		}
		List alist = (List) this.service.list(user, "alluserlist", new Pages(1, 100)).get("list");
		List ulist = (List) this.service.list(user, "userlist", new Pages(1, 100)).get("list");
		request.getSession().setAttribute("auser", alist);
		request.getSession().setAttribute("suser", ulist);

		user.setSession(Utils.uuID());
		request.getSession().setAttribute("loginU", user);
		User u = (User) request.getSession().getAttribute("loginU");
		if (u.getRole() == 3) {
			int newNum = ((Integer) this.service.find(user, "findNewRet")).intValue();
			int allCus = ((Integer) this.service.find(user, "findAllRetNum")).intValue();
			if (allCus == 0) {
				allCus = 1;
			}
			this.map.put("newNum", Integer.valueOf(newNum));
			this.map.put("newNumB", Integer.valueOf(newNum * 100 / allCus));
		}
		if (u.getRole() == 0) {
			int nRate = 0;
			int aRate = 0;
			user.setName(u.getName());
			/*if (this.service.find(user, "findCusRate") != null) {
				nRate = ((Integer) this.service.find(user, "findCusRate")).intValue();
			}
			if (this.service.find(user, "findCusRateAll") != null) {
				aRate = ((Integer) this.service.find(user, "findCusRateAll")).intValue();
			}*/
			int newNum = ((Integer) this.service.find(user, "findNewCus")).intValue();
			int allCus = ((Integer) this.service.find(user, "findAllCus")).intValue();
			if (aRate == 0) {
				aRate = 1;
				nRate = 1;
			}
			if (allCus == 0) {
				allCus = 1;
			}

			int dt = ((Integer) this.service.find(user, "finddt")).intValue();
			this.map.put("dt", Integer.valueOf(dt));
			this.map.put("num", Integer.valueOf(nRate));
			this.map.put("numAll", Integer.valueOf(aRate));
			this.map.put("number", Integer.valueOf(nRate * 100 / aRate));
			this.map.put("newNum", Integer.valueOf(newNum));
			this.map.put("newNumB", Integer.valueOf(newNum * 100 / allCus));
		}
		return new ModelAndView("index", this.map);
	}

	@RequestMapping({ "index" })
	@ResponseBody
	public ModelAndView index(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("loginU");
		List alist = (List) this.service.list(user, "alluserlist", new Pages(1, 100)).get("list");
		List ulist = (List) this.service.list(user, "userlist", new Pages(1, 100)).get("list");
		request.getSession().setAttribute("auser", alist);
		request.getSession().setAttribute("suser", ulist);
		user.setSession(Utils.uuID());
		request.getSession().setAttribute("loginU", user);
		User u = (User) request.getSession().getAttribute("loginU");
	
		/*if (u.getRole() == 3) {
			int newNum = ((Integer) this.service.find(user, "findNewRet")).intValue();
			int allCus = ((Integer) this.service.find(user, "findAllRetNum")).intValue();
			if (allCus == 0) {
				allCus = 1;
			}
			this.map.put("newNum", Integer.valueOf(newNum));
			this.map.put("newNumB", Integer.valueOf(newNum * 100 / allCus));
		}
		if (u.getRole() == 0) {
			int nRate = ((Integer) this.service.find(user, "findCusRate")).intValue();
			int aRate = ((Integer) this.service.find(user, "findCusRateAll")).intValue();
			int newNum = ((Integer) this.service.find(user, "findNewCus")).intValue();
			int allCus = ((Integer) this.service.find(user, "findAllCus")).intValue();
			if (aRate == 0) {
				aRate = 1;
			}
			if (allCus == 0) {
				allCus = 1;
			}
			this.map.put("num", Integer.valueOf(nRate));
			this.map.put("numAll", Integer.valueOf(aRate));
			this.map.put("number", Integer.valueOf(nRate * 100 / aRate));
			this.map.put("newNum", Integer.valueOf(newNum));
			this.map.put("newNumB", Integer.valueOf(newNum * 100 / allCus));
		}*/
		return new ModelAndView("index", this.map);
	}

	@RequestMapping({ "/checkLogin" })
	@ResponseBody
	public Object checkLogin(HttpServletRequest request) {
		int data = 1;
		User user = (User) request.getSession().getAttribute("loginU");
		if (user == null) {
			data = 0;
		} else {
		}
		return Integer.valueOf(data);
	}

	/*@RequestMapping({ "/list" })
	@ResponseBody
	public ModelAndView list(User user, Pages page, HttpServletRequest request) {
		if (user == null) {
			user = new User();
		}
		User u = (User) request.getSession().getAttribute("loginU");
		if (u.getRole() != 1) {
			user.setId(u.getId());
			user.setRole(u.getRole());
		}
		user.setDept(u.getDept());
		this.map = this.service.list(user, page);
		this.map.put("us", user);
		return new ModelAndView("userM/list", this.map);
	}*/

	 @RequestMapping({"/list"})
	  @ResponseBody
	  public ModelAndView list (User user, Pages page, HttpServletRequest request) {
	    if (user == null) {
	    	user = new User();
	    }
	    this.map = this.service.list(user, page);
	    this.map.put("us", user);
	    return new ModelAndView("userM/list", this.map);
	  }
	
	
	
	@RequestMapping({ "/query" })
	@ResponseBody
	public ModelAndView query(User user, HttpServletRequest request) {
		if (user == null) {
			user = new User();
		}
		if (!Utils.isNULL(user.getId())) {
			this.map.put("user", this.service.find(user));
		}

		return new ModelAndView("userM/update", this.map);
	}

	@RequestMapping({ "/addUser" })
	@ResponseBody
	public ModelAndView addUser(User user, HttpServletRequest request) {
		this.map.put("us", user);
		return new ModelAndView("userM/add", this.map);
	}

	@RequestMapping({ "/add" })
	@ResponseBody
	public ModelAndView add(User user, Pages page, HttpServletRequest request) {
		if (user == null) {
			user = new User();
		}
		
		user.setId(Utils.uuID()); 
		user.setTime(Utils.DateTime("yyyy-MM-dd HH:mm:ss"));
		this.service.insert(user, "insertGoods");
		user.setRole(-1);System.out.print(user);System.out.print("**********************");	
		request.getSession().removeAttribute("auser");
		request.getSession().removeAttribute("suser");
		List alist = (List) this.service.list(user, "alluserlist", new Pages(1, 100)).get("list");
		List ulist = (List) this.service.list(user, "userlist", new Pages(1, 100)).get("list");
		request.getSession().setAttribute("auser", alist);
		request.getSession().setAttribute("suser", ulist);
		return list(user, page, request);
	}
	
	@RequestMapping({ "/update" })
	@ResponseBody
	public ModelAndView update(User user, Pages page, HttpServletRequest request) {
		if (user == null) {
			user = new User();
		}
		User u = (User) request.getSession().getAttribute("loginU");
		if (!Utils.isNULL(user.getId())) {
			if (u.getRole() != 1) {
				user.setRole(-1);
			}
			if (this.service.update(user)) {
				List alist = (List) this.service.list(user, "alluserlist", new Pages(1, 100)).get("list");
				List ulist = (List) this.service.list(user, "userlist", new Pages(1, 100)).get("list");
				request.getSession().setAttribute("auser", alist);
				request.getSession().setAttribute("suser", ulist);
			}
		}
		user.setRole(-1);
		return list(user, page, request);
	}


	@RequestMapping({ "/delete" })
	@ResponseBody
	public Object delete(User user, Pages page, HttpServletRequest request) {
		if (user == null) {
			user = new User();
		}
		int data = 0;
		if ((!Utils.isNULL(user.getId())) ){
			this.service.delete(user);
			data = 1;
		}

		return Integer.valueOf(data);
	}

	@RequestMapping({ "/loginOut" })
	@ResponseBody
	public ModelAndView loginOut(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("loginU");
		if (user == null) {
			this.map.put("user", Integer.valueOf(1));
			return new ModelAndView("login", this.map);
		}
		this.map.put("user", Integer.valueOf(1));
		return new ModelAndView("login", this.map);
	}

	
	@RequestMapping({ "/updateRole" })
	@ResponseBody
	public Object updateRole(User user, Pages page, HttpServletRequest request) {
		if (user == null) {
			user = new User();
		}
		int data = 0;
	
			this.service.update(user);

			List alist = (List) this.service.list(user, "alluserlist", new Pages(1, 100)).get("list");
			List ulist = (List) this.service.list(user, "userlist", new Pages(1, 100)).get("list");
			request.getSession().setAttribute("auser", alist);
			request.getSession().setAttribute("suser", ulist);
			data = 1;
		
		return Integer.valueOf(data);
	}

	@RequestMapping({ "/ajax" })
	@ResponseBody
	public Object ajax(User user, HttpServletRequest request) {
		int data = 0;
		if (user == null) {
			user = new User();
		}
		System.err.print(this.service.find(user, "findUsername"));//////这里是有问题的！！！！！！！
		if(this.service.find(user, "findUsername")=="[]")
		{System.err.print("findUsername***********1");}
		if(this.service.find(user, "findUsername")==null)
		{System.err.print("findUsername***********2");}
		if(this.service.find(user, "findUsername")!=null)
		{System.err.print(this.service.find(user, "findUsername"));}
		if ((user.getUsername() == "") && (this.service.find(user, "findUsername")!="[]")) {
			data = 1;
			System.err.print(this.service.find(user, "findUsername"));
		}
		///System.out.print(Integer.valueOf(data));
	
		return Integer.valueOf(data);
	}

	@RequestMapping({ "/findRole" })
	@ResponseBody
	public Object findRole(User user, HttpServletRequest request) {
		int data = 0;
		if ((user.getId() != null) ) {
			data = 1;
		}

		return Integer.valueOf(data);
	}
}