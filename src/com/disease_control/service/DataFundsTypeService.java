package com.disease_control.service;

import java.util.List;
import java.util.Map;

import com.disease_control.core.page.Page;
import com.disease_control.db.dao.BasalDao;
import com.disease_control.web.form.DataFundsType;

/**
 * 经费类别
 * @author 
 *
 */
public class DataFundsTypeService {
	  /**
	   * 列表
	   * @param pageIndex
	   * @param pageSize
	   * @return
	   */
     public Page List(int pageIndex,int pageSize){
    	 String sql="select id,name,status from data_funds_type order by id desc";
    	 return basalDao.pagedQuery_mysql_sql(sql, pageIndex, pageSize,new Object[]{});
     }
     
     /**
      * 添加
      * @param fundsType
      * @return
      */
     public int add(DataFundsType fundsType){
    	 String sql="select count(1) from data_funds_type where name=?";
    	 if(basalDao.queryInt(sql,new Object[]{fundsType.getName()})>0){
    		 return -1;
    	 }
    	 sql="insert into data_funds_type (name,status) values(?,1)";
    	 return basalDao.runUSql(sql,new Object[]{fundsType.getName()});
     }
     
     /**
      * 查出详情
      * @param id
      * @return
      */
     public Map get(int id){
    	 String sql="select id,name,status from data_funds_type where id=?";
    	 return basalDao.queryMap(sql,new Object[]{id});
     }
     
     /**
      * 修改
      * @param fundsType
      * @return
      */
     public int update(DataFundsType fundsType){
    	 String sql="select count(1) from data_funds_type where name=? and id<>?";
    	 if(basalDao.queryInt(sql,new Object[]{fundsType.getName(),fundsType.getId()})>0){
    		 return -1;
    	 }
    	 sql="update data_funds_type set name=? where id=?";
    	 return basalDao.runUSql(sql,new Object[]{fundsType.getName(),fundsType.getId()});
     }
     
     /**
      * 更改状态
      * @param id
      * @param status
      * @return
      */
     public int updateStatus(int id,int status){
    	 String sql="update data_funds_type set status=? where id=?";
    	 return basalDao.runUSql(sql,new Object[]{status,id});
     }
     
     /**
      * 查出所有状态为开启的经费类别
      * @return
      */
     public List list(){
    	 String sql="select id,name from data_funds_type where status=1";
    	 return basalDao.queryList(sql,new Object[]{});
     }

	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}
}
