package com.wzj.ms.action;

import com.wzj.ms.cus.Cus;
import com.wzj.ms.goods.Goods;
import com.wzj.ms.pojo.Pages;
import com.wzj.ms.pojo.User;
import com.wzj.ms.prov.Prov;
import com.wzj.ms.utils.Utils;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping({ "/provM" })

public class ProvAction extends CommonAction{
	
	
	@RequestMapping({ "/query" })//在进行修改前查出该商品的基本信息，这样就可以减少一部分用户手动输入了
	@ResponseBody
	public ModelAndView query(Prov prov, HttpServletRequest request) {
		if (prov == null) {
			prov = new Prov();
		}
		if (!Utils.isNULL(prov.getId())) {
			System.out.println("**********************");
			this.map.put("prov", this.service.find(prov));
			System.err.println(this.service.find(prov));
		}

		return new ModelAndView("provM/update", this.map);
	}
	
	
	
	 @RequestMapping({"/list"})
	  @ResponseBody
	  public ModelAndView list(Prov prov, Pages page, HttpServletRequest request) {
	    if (prov == null) {
	    	prov = new Prov();
	    }
	    this.map = this.service.list(prov, page);
	    this.map.put("us", prov);
	    return new ModelAndView("provM/list", this.map);
	  }
	 @RequestMapping({ "/addProv" })
		@ResponseBody
		public ModelAndView addProv(Prov prov, HttpServletRequest request) {
			this.map.put("us", prov);
			return new ModelAndView("provM/add", this.map);
			
		}

		@RequestMapping({ "/add" })
		@ResponseBody
		public ModelAndView add(Prov prov, Pages page, HttpServletRequest request) {
			
			if (prov == null) {
				prov = new Prov();
			}
			prov.setId(Utils.uuID()); 
			prov.setTime(Utils.DateTime("yyyy-MM-dd HH:mm:ss"));
			this.service.insert(prov, "insertProv");
		
			
			return list(prov, page, request);
		}
		
		
		

		 @RequestMapping({ "/update" })
			@ResponseBody
			public ModelAndView update(Prov prov, Pages page, HttpServletRequest request) {
			 
				if (prov == null) {
					prov = new Prov();
					System.out.print("");
				}
				this.service.update(prov);
				return list(prov, page, request);
			}
		 //另一种不需要页面跳转的修改方式，修改完成后，直接alert（“成功”）
	/*	@RequestMapping({ "/ajax" })
		@ResponseBody
		public Object ajax(Cus goods, HttpServletRequest request) {
			int data = 0;
			if (goods == null) {
				goods = new Goods();
			}
			
			if (this.service.update(goods) ){
				data = 1;
			}
        System.err.print(data);
       
			return Integer.valueOf(data);
		}

	
	 */
		 @RequestMapping({ "/ajax" })
			@ResponseBody
			public Object ajax(Prov prov, HttpServletRequest request) {
				int data = 0;
				if (prov == null) {
					prov = new Prov();
				}
				//if ((Prov.getProvname() != "") && (this.service.find(Prov, "findProvname") != null)) {
					//data = 1;
				//}

				return Integer.valueOf(data);
			}

			
	 
	 @RequestMapping({ "/delete" })
		@ResponseBody
		public Object delete(Prov prov, Pages page, HttpServletRequest request) {
			if (prov == null) {
				prov = new Prov();
			}
			int data = 0;
			if ((!Utils.isNULL(prov.getId())) ) {
				this.service.delete(prov);
				data = 1;
			}

			return Integer.valueOf(data);
		}
	 
	 

}








/*public class GoodsAction extends CommonAction {
	

	@RequestMapping({ "/list" })
	@ResponseBody
	public ModelAndView list(Goods goods, Pages page, HttpServletRequest request) {
		if (goods == null) {
			goods = new Goods();
		}
		System.out.print(request.getSession().getAttribute("loginU"));
		Goods g = (Goods) request.getSession().getAttribute("loginU");
		System.out.print(request.getSession().getAttribute("loginU"));
		if (g.getRole() != 1) {
			goods.setId(g.getId());
			goods.setRole(g.getRole());
		}
		goods.setDept(g.getDept());
		this.map = this.service.list(goods, page);
		this.map.put("us", goods);
		return new ModelAndView("goodsM/list", this.map);
	}
	@RequestMapping({ "/query" })
	@ResponseBody
	public ModelAndView query(Goods goods, HttpServletRequest request) {
		if (goods == null) {
			goods = new Goods();
		}
		if (!Utils.isNULL(goods.getId())) {
			this.map.put("goods", this.service.find(goods));
		}

		return new ModelAndView("goodsM/update", this.map);
	}

	@RequestMapping({ "/addGoods" })
	@ResponseBody
	public ModelAndView addGoods(Goods goods, HttpServletRequest request) {
		this.map.put("us", this.service.find(goods, "maxSign"));
		return new ModelAndView("goodsM/add", this.map);
	}

	@RequestMapping({ "/add" })
	@ResponseBody
	public ModelAndView add(Goods goods, Pages page, HttpServletRequest request) {
		if (goods == null) {
			goods = new Goods();
		}
		goods.setId(Utils.uuID());
		goods.setTime(Utils.DateTime("yyyy-MM-dd HH:mm:ss"));
		this.service.insert(goods, "insertGoods");
		//Goods.setRole(-1);
		request.getSession().removeAttribute("agoods");
		request.getSession().removeAttribute("sgoods");
		List alist = (List) this.service.list(goods, "allgoodslist", new Pages(1, 100)).get("list");
		List ulist = (List) this.service.list(goods, "goodslist", new Pages(1, 100)).get("list");
		request.getSession().setAttribute("agoods", alist);
		request.getSession().setAttribute("sgoods", ulist);
		return list(goods, page, request);
	}

	@RequestMapping({ "/delete" })
	@ResponseBody
	public Object delete(Goods goods, Pages page, HttpServletRequest request) {
		if (goods == null) {
			goods = new Goods();
		}
		int data = 0;
		if ((!Utils.isNULL(goods.getId())) && (((Integer) this.service.find(goods, "findProvtomer")).intValue() == 0)) {
			this.service.delete(goods);
			data = 1;
		}

		return Integer.valueOf(data);
	}

	@RequestMapping({ "/loginOut" })
	@ResponseBody
	public ModelAndView loginOut(HttpServletRequest request) {
		Goods goods = (Goods) request.getSession().getAttribute("loginU");
		if (goods == null) {
			this.map.put("goods", Integer.valueOf(1));
			return new ModelAndView("login", this.map);
		}
		this.map.put("goods", Integer.valueOf(1));
		return new ModelAndView("login", this.map);
	}

	@RequestMapping({ "/update" })
	@ResponseBody
	public ModelAndView update(Goods goods, Pages page, HttpServletRequest request) {
		if (goods == null) {
			goods = new Goods();
		}
		Goods u = (Goods) request.getSession().getAttribute("loginU");
		if (!Utils.isNULL(goods.getId())) {
			if (u.getRole() != 1) {
				goods.setRole(-1);
			}
			if (this.service.update(goods)) {
				List alist = (List) this.service.list(goods, "allgoodslist", new Pages(1, 100)).get("list");
				List ulist = (List) this.service.list(goods, "goodslist", new Pages(1, 100)).get("list");
				request.getSession().setAttribute("agoods", alist);
				request.getSession().setAttribute("sgoods", ulist);
			}
		}
		goods.setRole(-1);
		return list(goods, page, request);
	}

	@RequestMapping({ "/updateRole" })
	@ResponseBody
	public Object updateRole(Goods goods, Pages page, HttpServletRequest request) {
		if (goods == null) {
			goods = new Goods();
		}
		int data = 0;
		if (((Integer) this.service.find(goods, "findCustomer")).intValue() == 0) {
			this.service.update(goods);

			List alist = (List) this.service.list(goods, "allgoodslist", new Pages(1, 100)).get("list");
			List ulist = (List) this.service.list(goods, "goodslist", new Pages(1, 100)).get("list");
			request.getSession().setAttribute("agoods", alist);
			request.getSession().setAttribute("sgoods", ulist);
			data = 1;
		}
		return Integer.valueOf(data);
	}

	@RequestMapping({ "/ajax" })
	@ResponseBody
	public Object ajax(Goods goods, HttpServletRequest request) {
		int data = 0;
		if (goods == null) {
			goods = new Goods();
		}
		//if ((goods.getGoodsname() != "") && (this.service.find(goods, "findGoodsname") != null)) {
			//data = 1;
		//}

		return Integer.valueOf(data);
	}

	@RequestMapping({ "/findRole" })
	@ResponseBody
	public Object findRole(Goods goods, HttpServletRequest request) {
		int data = 0;
		if ((goods.getId() != null) && (((Integer) this.service.find(goods, "findCustomer")).intValue() == 0)) {
			data = 1;
		}

		return Integer.valueOf(data);
	}
	
}*/