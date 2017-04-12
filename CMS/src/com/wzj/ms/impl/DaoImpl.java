package com.wzj.ms.impl;

import com.github.pagehelper.Page;
import com.wzj.ms.dao.Dao;
import com.wzj.ms.pojo.Pages;
import com.wzj.ms.pojo.User;
import com.wzj.ms.utils.Utils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository("dao")
public class DaoImpl extends SqlSessionDaoSupport
  implements Dao
{
  Map<String, Object> map = new HashMap();

  @Resource
  public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
    super.setSqlSessionFactory(sqlSessionFactory);
  }

  public User login(User user)
  {
    return (User)getSqlSession().selectOne(Utils.getOName(user) + ".login", user);
  }

  public boolean insert(Object obj)
  {
    return getSqlSession().insert(Utils.getOName(obj) + ".login", obj) > 0;
  }

  public boolean insert(Object obj, String table)
  {
    return getSqlSession().insert(Utils.getOName(obj) + "." + table, obj) > 0;
  }

  public boolean insert(Map<String, Object> search)
  {
    return getSqlSession().insert(search.get("table") + ".insert", search) > 0;
  }

  public boolean insert(Map<String, Object> search, String table)
  {
    return getSqlSession().insert(search.get("table") + "." + table, search) > 0;
  }

  public boolean delete(Object obj)
  {
    return getSqlSession().delete(Utils.getOName(obj) + ".delete", obj) > 0;
  }

  public boolean delete(Object obj, String table)
  {
    return getSqlSession().delete(Utils.getOName(obj) + "." + table, obj) > 0;
  }

  public boolean delete(Map<String, Object> search)
  {
    return getSqlSession().delete(search.get("table") + ".delete", search) > 0;
  }

  public boolean delete(Map<String, Object> search, String table)
  {
    return getSqlSession().delete(search.get("table") + "." + table, search) > 0;
  }

  public boolean update(Object obj)
  {
    return getSqlSession().update(Utils.getOName(obj) + ".update", obj) > 0;
  }

  public boolean update(Object obj, String table)
  {
    return getSqlSession().update(Utils.getOName(obj) + "." + table, obj) > 0;
  }

  public boolean update(Map<String, Object> search)
  {
    return getSqlSession().update(search.get("table") + ".update", search) > 0;
  }

  public boolean update(Map<String, Object> search, String table)
  {
    return getSqlSession().update(search.get("table") + "." + table, search) > 0;
  }

  public Map<String, Object> list(Object obj, Pages pa)
  {
    List list = getSqlSession().selectList(Utils.getOName(obj) + ".list", obj, new RowBounds(pa.getPageNum(), pa.getPageSize()));
    Page pages = (Page)list;
    Pages page = new Pages(pages.getPageNum(), pages.getPageSize(), pages.getTotal(), pages.getPages());
    this.map.put("list", list);
    this.map.put("page", page);
    return this.map;
  }

  public Map<String, Object> list(Object obj, String table, Pages pa)
  {
    List list = getSqlSession().selectList(Utils.getOName(obj) + "." + table, obj, new RowBounds(pa.getPageNum(), pa.getPageSize()));
    Page pages = (Page)list;
    Pages page = new Pages(pages.getPageNum(), pages.getPageSize(), pages.getTotal(), pages.getPages());
    this.map.put("list", list);
    this.map.put("page", page);
    return this.map;
  }

  public Map<String, Object> list(Map<String, Object> search, Pages pa)
  {
    List list = getSqlSession().selectList(search.get("table") + ".list", search, new RowBounds(pa.getPageNum(), pa.getPageSize()));
    Page pages = (Page)list;
    Pages page = new Pages(pages.getPageNum(), pages.getPageSize(), pages.getTotal(), pages.getPages());
    this.map.put("list", list);
    this.map.put("page", page);
    return this.map;
  }

  public Map<String, Object> list(Map<String, Object> search, String table, Pages pa)
  {
    List list = getSqlSession().selectList(search.get("table") + "." + table, search, new RowBounds(pa.getPageNum(), pa.getPageSize()));
    Page pages = (Page)list;
    Pages page = new Pages(pages.getPageNum(), pages.getPageSize(), pages.getTotal(), pages.getPages());
    this.map.put("list", list);
    this.map.put("page", page);
    return this.map;
  }

  public Object find(Object obj)
  {
    return getSqlSession().selectOne(Utils.getOName(obj) + ".find", obj);
  }

  public Object find(Object obj, String table)
  {
    return getSqlSession().selectList(Utils.getOName(obj) + "." + table, obj);
  }

  public Object find(Map<String, Object> search, String table)
  {
    return getSqlSession().selectList(search.get("table") + "." + table, search);
  }

  public Object find(Map<String, Object> search)
  {
    return getSqlSession().selectList(search.get("table") + ".find", search);
  }
}

