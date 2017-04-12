package com.wzj.ms.cus;

import com.wzj.ms.utils.Utils;

public class Common
{
  private String id;
  private String name;
  private String gname;
  public String getGname() {
	return gname;
}

public void setGname(String gname) {
	this.gname = gname;
}

public String getGoodsname() {
	return goodsname;
}

public void setGoodsname(String goodsname) {
	this.goodsname = goodsname;
}

private String goodsname;
  private String ip;
  private String area;
  private String menus;
  private String search = "";
  private String cfrom = "";
  private Integer project;
  private int role;
  private String password;
  private String qq;
  private int permission;
  private int status;
  private String tel;
  private String time;
  private Integer type = Integer.valueOf(0);
  private String startTime;
  private String endTime = Utils.numberday(1);
  private String belongs;
  private String str;
  private Integer times;
  private Integer dept;
  private String deptName;
  private Integer sign;
  private String lasttime;
  private String address;
  private String remark;
  private double npincome;
  private double lsincome;
  private double fvincome;
  private double bnincome;
  private double miniincome;
  private double allincome;
  private Integer restatus;
  private Integer caim;
  private String gysdkv;
  private String imeicount;
  private String email;
  private int storage;

  public int getStorage() {
	return storage;
}

public void setStorage(int storage) {
	this.storage = storage;
}

public String getRemark()
  {
    return this.remark;
  }

  public void setRemark(String remark) {
    this.remark = remark;
  }

  public String getEmail() {
    return this.email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getAddress() {
    return this.address;
  }

  public void setAddress(String address) {
    this.address = address;
  }

  public Integer getProject()
  {
    return this.project;
  }

  public void setProject(Integer project) {
    this.project = project;
  }

  public String getCfrom() {
    return this.cfrom;
  }

  public void setCfrom(String cfrom) {
    this.cfrom = cfrom;
  }

  public Integer getRestatus() {
    return this.restatus;
  }

  public void setRestatus(Integer restatus) {
    this.restatus = restatus;
  }

  public Integer getCaim() {
    return this.caim;
  }

  public void setCaim(Integer caim) {
    this.caim = caim;
  }

  public String getStr() {
    return this.str;
  }

  public void setStr(String str) {
    this.str = str;
  }

  public String getGysdkv() {
    return this.gysdkv;
  }

  public void setGysdkv(String gysdkv) {
    this.gysdkv = gysdkv;
  }

  public String getImeicount() {
    return this.imeicount;
  }

  public void setImeicount(String imeicount) {
    this.imeicount = imeicount;
  }

  public String getTel() {
    return this.tel;
  }

  public void setTel(String tel) {
    this.tel = tel;
  }

  public String getDeptName() {
    return this.deptName;
  }

  public void setDeptName(String deptName) {
    this.deptName = deptName;
  }

  public String getId() {
    return this.id;
  }

  public void setId(String id) {
    this.id = id;
  }

  
  public String getName() {
    return this.name;
  }

  public void setName(String name)
  {
    this.name = name;
  }
  

/* public String getGoodsname() {
    return this.goodsname;
  }

  public void setGoodsname(String goodsname) {
    this.goodsname = goodsname;
  }
*/
  public String getIp() {
    return this.ip;
  }

  public void setIp(String ip) {
    this.ip = ip;
  }

  public String getArea() {
    return this.area;
  }

  public void setArea(String area) {
    this.area = area;
  }

  public String getMenus() {
    return this.menus;
  }

  public void setMenus(String menus) {
    this.menus = menus;
  }

  public String getSearch() {
    return this.search;
  }

  public void setSearch(String search) {
    this.search = search;
  }

  public String getTime() {
    return this.time;
  }

  public void setTime(String time) {
    this.time = time;
  }

  public Integer getType() {
    return this.type;
  }

  public void setType(Integer type) {
    this.type = type;
  }

  public String getStartTime() {
    return this.startTime;
  }

  public void setStartTime(String startTime) {
    this.startTime = startTime;
  }

  public String getEndTime() {
    return this.endTime;
  }

  public void setEndTime(String endTime) {
    this.endTime = endTime;
  }

  public String getBelongs() {
    return this.belongs;
  }

  public void setBelongs(String belongs) {
    this.belongs = belongs;
  }

  public Integer getTimes() {
    return this.times;
  }

  public void setTimes(Integer times) {
    this.times = times;
  }

  public Integer getDept() {
    return this.dept;
  }

  public void setDept(Integer dept) {
    this.dept = dept;
  }

  public Integer getSign() {
    return this.sign;
  }

  public void setSign(Integer sign) {
    this.sign = sign;
  }

  public String getLasttime() {
    return this.lasttime;
  }

  public void setLasttime(String lasttime) {
    this.lasttime = lasttime;
  }

  public int getRole() {
    return this.role;
  }

  public void setRole(int role) {
    this.role = role;
  }

  public String getPassword() {
    return this.password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getQq() {
    return this.qq;
  }

  public void setQq(String qq) {
    this.qq = qq;
  }

  public int getPermission() {
    return this.permission;
  }

  public void setPermission(int permission) {
    this.permission = permission;
  }

  public int getStatus() {
    return this.status;
  }

  public void setStatus(int status) {
    this.status = status;
  }

  public double getNpincome() {
    return this.npincome;
  }

  public void setNpincome(double npincome) {
    this.npincome = npincome;
  }

  public double getLsincome() {
    return this.lsincome;
  }

  public void setLsincome(double lsincome) {
    this.lsincome = lsincome;
  }

  public double getFvincome() {
    return this.fvincome;
  }

  public void setFvincome(double fvincome) {
    this.fvincome = fvincome;
  }

  public double getBnincome() {
    return this.bnincome;
  }

  public void setBnincome(double bnincome) {
    this.bnincome = bnincome;
  }

  public double getMiniincome() {
    return this.miniincome;
  }

  public void setMiniincome(double miniincome) {
    this.miniincome = miniincome;
  }

  public double getAllincome() {
    return this.allincome;
  }

  public void setAllincome(double allincome) {
    this.allincome = allincome;
  }
}