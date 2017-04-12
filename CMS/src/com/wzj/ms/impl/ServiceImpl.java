package com.wzj.ms.impl;

import com.wzj.ms.dao.Dao;
import com.wzj.ms.pojo.Pages;
import com.wzj.ms.pojo.User;
import com.wzj.ms.service.Service;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository("service")
@Transactional
public class ServiceImpl
  implements Service
{

  @Autowired
  private Dao dao;

  public User login(User user)
  {
    return this.dao.login(user);
  }
  @Autowired(required=true)
  public void setReqdao(Dao dao) {
    this.dao = dao;
  }

  public boolean insert(Object obj)
  {
    return this.dao.insert(obj);
  }

  public boolean insert(Object obj, String table)
  {
    return this.dao.insert(obj, table);
  }

  public boolean insert(Map<String, Object> search)
  {
    return this.dao.insert(search);
  }

  public boolean insert(Map<String, Object> search, String table)
  {
    return this.dao.insert(search, table);
  }

  public boolean delete(Object obj)
  {
    return this.dao.delete(obj);
  }

  public boolean delete(Object obj, String table)
  {
    return this.dao.delete(obj, table);
  }

  public boolean delete(Map<String, Object> search)
  {
    return this.dao.delete(search);
  }

  public boolean delete(Map<String, Object> search, String table)
  {
    return this.dao.delete(search, table);
  }

  public boolean update(Object obj)
  {
    return this.dao.update(obj);
  }

  public boolean update(Object obj, String table)
  {
    return this.dao.update(obj, table);
  }

  public boolean update(Map<String, Object> search)
  {
    return this.dao.update(search);
  }

  public boolean update(Map<String, Object> search, String table)
  {
    return this.dao.update(search, table);
  }

  public Map<String, Object> list(Object obj, Pages pa)
  {
    return this.dao.list(obj, pa);
  }

  public Map<String, Object> list(Object obj, String table, Pages pa)
  {
    return this.dao.list(obj, table, pa);
  }

  public Map<String, Object> list(Map<String, Object> search, Pages pa)
  {
    return this.dao.list(search, pa);
  }

  public Map<String, Object> list(Map<String, Object> search, String table, Pages pa)
  {
    return this.dao.list(search, table, pa);
  }

  public Object find(Object obj)
  {
    return this.dao.find(obj);
  }

  public Object find(Object obj, String table)
  {
    return this.dao.find(obj, table);
  }

  public Object find(Map<String, Object> search)
  {
    return this.dao.find(search);
  }
@Override
public Object find(Map<String, Object> search, String table)
{
  return this.dao.find(search, table);
}
}