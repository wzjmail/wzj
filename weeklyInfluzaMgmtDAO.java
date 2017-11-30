package buaa.sem.ps.mainBaseData.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import buaa.sem.ps.abstractClass.LO;
import buaa.sem.ps.mainBaseData.model.DiseaseInfo;
import buaa.sem.ps.mainBaseData.model.MonthMgmt;
import buaa.sem.ps.mainBaseData.model.weeklyInfluzaMgmt;

public interface weeklyInfluzaMgmtDAO {
	
	public void insert(Object obj);
	public void delete(Object obj);
	public void update(Object obj);
	
	public LO getPagedList(LO lo, Object entity);
	public int getTotalCountByCriteria(DetachedCriteria criteria);
	public List getPagedList(DetachedCriteria detachedCriteria, int startIndex,int endIndex);
	public List getList();
	
	public List<weeklyInfluzaMgmt> getWeekNoByYear(String thisYear);
	public weeklyInfluzaMgmt getWeeklyInfluzaMgmtById(int id);
	public List<weeklyInfluzaMgmt> getAllWeeklyInfluzaMgmtInfo();
	public List<weeklyInfluzaMgmt> getAllWeeklyInfluzaMgmtByweekNo(String weekNo);

}
