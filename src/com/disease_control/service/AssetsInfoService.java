package com.disease_control.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.disease_control.core.page.Page;
import com.disease_control.db.dao.BasalDao;
import com.disease_control.web.form.AssetsInfo;

public class AssetsInfoService {

	public Page list(int pageIndex, int pageSize, String num, int deviceTypeId, int deviceId, int brandId, int brandFormatId, int storageModeId, int useSituationId, int serviceSituationId) {
		List paramList = new ArrayList();
		StringBuffer sql = new StringBuffer(
				"select ai.*,ddt.name as device_type_name,dd.name as device_name,db.name as brand_name,dbf.name as brand_format_name,dssm.name as storage_mode_name,dsus.name as use_situation_name,dsss.name as service_situation_name,di.name as department_name,dup.room_num,bsi.name as buy_staff_name,ssi.name as sign_staff_name,dsi.name as depot_staff_name from assets_info as ai");
		sql.append(" inner join data_device_type as ddt on ai.device_type_id=ddt.id");
		sql.append(" inner join data_device as dd on ai.device_id=dd.id");
		sql.append(" inner join data_brand as db on ai.brand_id=db.id");
		sql.append(" inner join data_brand_format as dbf on ai.brand_format_id=dbf.id");
		sql.append(" left join data_system as dssm on ai.storage_mode_id=dssm.value and dssm.label='storage_mode'");
		sql.append(" left join data_system as dsus on ai.use_situation_id=dsus.value and dsus.label='use_situation'");
		sql.append(" left join data_system as dsss on ai.service_situation_id=dsss.value and dsss.label='service_situation'");
		sql.append(" left join data_use_place as dup on ai.use_place_id=dup.id");
		sql.append(" left join department_info as di on dup.department_id=di.id");
		sql.append(" left join staff_info as bsi on ai.buy_staff_id=bsi.id");
		sql.append(" left join staff_info as ssi on ai.sign_staff_id=ssi.id");
		sql.append(" left join staff_info as dsi on ai.depot_staff_id=dsi.id");
		sql.append(" where 1=1");
		if (num != null && !num.equals("")) {
			sql.append(" and ai.num like ?");
			paramList.add("%" + num + "%");
		}
		if (deviceTypeId != -100) {
			sql.append(" and ai.device_type_id = ?");
			paramList.add(deviceTypeId);
		}
		if (deviceId != -100) {
			sql.append(" and ai.device_id = ?");
			paramList.add(deviceId);
		}
		if (brandId != -100) {
			sql.append(" and ai.brand_id = ?");
			paramList.add(brandId);
		}
		if (brandFormatId != -100) {
			sql.append(" and ai.brand_format_id = ?");
			paramList.add(brandFormatId);
		}
		if (storageModeId != -100) {
			sql.append(" and dssm.value=? and dssm.label='storage_mode'");
			paramList.add(storageModeId);
		}
		if (useSituationId != -100) {
			sql.append(" and dsus.value=? and dsus.label='use_situation'");
			paramList.add(useSituationId);
		}
		if (serviceSituationId != -100) {
			sql.append(" and dsss.value=? and dsss.label='service_situation'");
			paramList.add(serviceSituationId);
		}
		sql.append(" order by id desc");
		Object[] params = new Object[paramList.size()];
		for (int i = 0; i < paramList.size(); i++) {
			params[i] = paramList.get(i);
		}
		return basalDao.pagedQuery_mysql_sql(sql.toString(), pageIndex, pageSize, params);
	}

	public int add_Tx(AssetsInfo assetsInfo) {
		String sql = "insert into assets_info(num,name,storage_mode_id,device_type_id,device_id,brand_id,brand_format_id,serial_number,origin_place,measure_unit,amount,unit_price,unit_price1,invoice_number,use_situation_id,service_situation_id,service_firm,supplier_id,buy_staff_id,buy_time,sign_staff_id,sign_time,depot_staff_id,depot_time,use_place_id,remark,status) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		return basalDao.runUSql(
				sql,
				new Object[] { assetsInfo.getNum(), assetsInfo.getName(), assetsInfo.getStorageModeId(), assetsInfo.getDeviceTypeId(), assetsInfo.getDeviceId(), assetsInfo.getBrandId(),
						assetsInfo.getBrandFormatId(), assetsInfo.getSerialNumber(), assetsInfo.getOriginPlace(), assetsInfo.getMeasureUnit(), assetsInfo.getAmount(), assetsInfo.getUnitPrice(),
						assetsInfo.getUnitPrice(), assetsInfo.getInvoiceNumber(), assetsInfo.getUseSituationId(), assetsInfo.getServiceSituationId(), assetsInfo.getServiceFirm(),
						assetsInfo.getSupplierId(), assetsInfo.getBuyStaffId(), assetsInfo.getBuyTime(), assetsInfo.getSignStaffId(), assetsInfo.getSignTime(), assetsInfo.getDepotStaffId(),
						assetsInfo.getDepotTime(), assetsInfo.getUsePlaceId(), assetsInfo.getRemark(), assetsInfo.getStatus() });
	}

	public Map get(int id) {
		String sql = "select * from assets_info where id=?";
		return basalDao.queryMap(sql, new Object[] { id });
	}

	public int update_Tx(AssetsInfo assetsInfo) {
		String sql = "update assets_info set num=?,name=?,serial_number=?,origin_place=?,unit_price=?,unit_price1=?,invoice_number=?,remark=? where id=?";
		return basalDao.runUSql(
				sql,
				new Object[] { assetsInfo.getNum(), assetsInfo.getName(), assetsInfo.getSerialNumber(), assetsInfo.getOriginPlace(), assetsInfo.getUnitPrice(), assetsInfo.getUnitPrice1(),
						assetsInfo.getInvoiceNumber(), assetsInfo.getRemark(), assetsInfo.getId() });
	}

	public int updateStatus_Tx(AssetsInfo assetsInfo) {
		int resultInt = 0;
		if (assetsInfo.getAssetsInfoLog().getType() == 1) {// 发放
			String sql = "update assets_info set use_situation_id=?,use_staff_id=? where id=?";
			resultInt = basalDao.runUSql(sql, new Object[] { 0, assetsInfo.getUseStaffId(), assetsInfo.getId() });
		} else if (assetsInfo.getAssetsInfoLog().getType() == 2) {// 归还
			String sql = "update assets_info set use_situation_id=?,use_staff_id=? where id=?";
			resultInt = basalDao.runUSql(sql, new Object[] { 1, 0, assetsInfo.getId() });
		} else if (assetsInfo.getAssetsInfoLog().getType() == 3) {// 维修
			String sql = "update assets_info set service_situation_id=? where id=?";
			resultInt = basalDao.runUSql(sql, new Object[] { 1, assetsInfo.getId() });
		} else if (assetsInfo.getAssetsInfoLog().getType() == 4) {// 正常使用
			String sql = "update assets_info set service_situation_id=? where id=?";
			resultInt = basalDao.runUSql(sql, new Object[] { 0, assetsInfo.getId() });
		}
		if (resultInt > 0) {
			String sql = "insert into assets_info_log(type,assets_id,operating_staff_id,operating_time,use_staff_id) values (?,?,?,?,?)";
			resultInt = basalDao.runUSql(sql,
					new Object[] { assetsInfo.getAssetsInfoLog().getType(), assetsInfo.getId(), assetsInfo.getAssetsInfoLog().getOperatingStaffId(), new Date(), assetsInfo.getUseStaffId() });
		}
		return resultInt;
	}

	/**
	 * 导入
	 * 
	 * @param DataList
	 * @return
	 */
	public int introduction_Tx(List DataList) {
		int sl = 0;
		for (int i = 0; i < DataList.size(); i++) {
			String[] str = (String[]) DataList.get(i);
			AssetsInfo assetsInfo = new AssetsInfo();
			for (int j = 0; j < str.length; j++) {
				if (j == 1) {
					assetsInfo.setNum(str[j]);
				} else if (j == 2) {
					String sql = "select id from data_device_type where name=?";
					Map map = basalDao.queryMap(sql, new Object[] { str[j] });
					if (map == null) {
						sql = "insert into data_device_type(name) values(?)";
						basalDao.runUSql(sql, new Object[] { str[j] });
						sql = "select id from data_device_type where name=?";
						map = basalDao.queryMap(sql, new Object[] { str[j] });
					}
					assetsInfo.setDeviceTypeId(Integer.parseInt(map.get("id").toString()));
				} else if (j == 3) {
					String sql = "select id from data_device where name=? and type_id=?";
					Map map = basalDao.queryMap(sql, new Object[] { str[j], assetsInfo.getDeviceTypeId() });
					if (map == null) {
						sql = "insert into data_device(name,type_id) values(?,?)";
						basalDao.runUSql(sql, new Object[] { str[j], assetsInfo.getDeviceTypeId() });
						sql = "select id from data_device where name=? and type_id=?";
						map = basalDao.queryMap(sql, new Object[] { str[j], assetsInfo.getDeviceTypeId() });
					}
					assetsInfo.setDeviceId(Integer.parseInt(map.get("id").toString()));
				} else if (j == 5) {
					String string = str[j];
					string = string.replaceAll(",", "");
					assetsInfo.setUnitPrice(Double.parseDouble(string));
					assetsInfo.setUnitPrice1(Double.parseDouble(string));
				} else if (j == 6) {
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					Date date = new Date();
					try {
						date = sdf.parse(str[j]);
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					assetsInfo.setSignTime(date);
				} else if (j == 8) {
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					Date date = new Date();
					try {
						date = sdf.parse(str[j]);
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					assetsInfo.setBuyTime(date);
					assetsInfo.setDepotTime(date);
				} else if (j == 9) {
					String string = str[j];
					string = string.replaceAll(" ", "");
					assetsInfo.setAmount(Integer.parseInt(string));
				} else if (j == 11) {
					assetsInfo.setMeasureUnit(str[j]);
				} else if (j == 14) {
					Map map = new HashMap();
					if (str[j] == null || "".equals(str[j])) {
						String sql = "select id from data_brand where name=? and device_id=?";
						map = basalDao.queryMap(sql, new Object[] { "其他", assetsInfo.getDeviceId() });
						if (map == null) {
							sql = "insert into data_brand(name,device_id) values (?,?)";
							basalDao.runUSql(sql, new Object[] { "其他", assetsInfo.getDeviceId() });
							sql = "select id from data_brand where name=? and device_id=?";
							map = basalDao.queryMap(sql, new Object[] { "其他", assetsInfo.getDeviceId() });
						}
					} else {
						String sql = "select id from data_brand where name=? and device_id=?";
						map = basalDao.queryMap(sql, new Object[] { str[j], assetsInfo.getDeviceId() });
						if (map == null) {
							sql = "insert into data_brand(name,device_id) values (?,?)";
							basalDao.runUSql(sql, new Object[] { str[j], assetsInfo.getDeviceId() });
							sql = "select id from data_brand where name=? and device_id=?";
							map = basalDao.queryMap(sql, new Object[] { str[j], assetsInfo.getDeviceId() });
						}
					}
					assetsInfo.setBrandId(Integer.parseInt(map.get("id").toString()));
				} else if (j == 15) {
					Map map = new HashMap();
					if (str[j] == null || "".equals(str[j])) {
						String sql = "select id from data_brand_format where name=? and brand_id=?";
						map = basalDao.queryMap(sql, new Object[] { "其他", assetsInfo.getBrandId() });
						if (map == null) {
							sql = "insert into data_brand_format(name,money,brand_id) values (?,?,?)";
							basalDao.runUSql(sql, new Object[] { "其他", 0, assetsInfo.getBrandId() });
							sql = "select id from data_brand_format where name=? and brand_id=?";
							map = basalDao.queryMap(sql, new Object[] { "其他", assetsInfo.getBrandId() });
						}
					} else {
						String sql = "select id from data_brand_format where name=? and brand_id=?";
						map = basalDao.queryMap(sql, new Object[] { str[j], assetsInfo.getBrandId() });
						if (map == null) {
							sql = "insert into data_brand_format(name,money,brand_id) values (?,?,?)";
							basalDao.runUSql(sql, new Object[] { str[j], assetsInfo.getUnitPrice(), assetsInfo.getBrandId() });
							sql = "select id from data_brand_format where name=? and brand_id=?";
							map = basalDao.queryMap(sql, new Object[] { str[j], assetsInfo.getBrandId() });
						}
					}
					assetsInfo.setBrandFormatId(Integer.parseInt(map.get("id").toString()));
				} else if (j == 17) {
					assetsInfo.setRemark(str[j]);
					System.out.println(assetsInfo.getRemark());
				}
			}

			String sql = "insert into assets_info(num,name,storage_mode_id,device_type_id,device_id,brand_id,brand_format_id,serial_number,origin_place,measure_unit,amount,unit_price,unit_price1,invoice_number,use_situation_id,service_situation_id,service_firm,supplier_id,buy_staff_id,buy_time,sign_staff_id,sign_time,depot_staff_id,depot_time,use_place_id,remark,status) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			int resultInt = basalDao.runUSql(
					sql,
					new Object[] { assetsInfo.getNum() == null ? "" : assetsInfo.getNum(), assetsInfo.getName() == null ? "" : assetsInfo.getName(), 0, assetsInfo.getDeviceTypeId(),
							assetsInfo.getDeviceId(), assetsInfo.getBrandId(), assetsInfo.getBrandFormatId(), assetsInfo.getSerialNumber() == null ? "" : assetsInfo.getSerialNumber(),
							assetsInfo.getOriginPlace() == null ? "" : assetsInfo.getOriginPlace(), assetsInfo.getMeasureUnit() == null ? "" : assetsInfo.getMeasureUnit(), assetsInfo.getAmount(),
							assetsInfo.getUnitPrice(), assetsInfo.getUnitPrice1(), assetsInfo.getInvoiceNumber() == null ? "" : assetsInfo.getInvoiceNumber(), 0, 0,
							assetsInfo.getServiceFirm() == null ? "" : assetsInfo.getServiceFirm(), assetsInfo.getSupplierId(), assetsInfo.getBuyStaffId(),
							assetsInfo.getBuyTime() == null ? "" : assetsInfo.getBuyTime(), assetsInfo.getSignStaffId(), assetsInfo.getSignTime() == null ? "" : assetsInfo.getSignTime(),
							assetsInfo.getDepotStaffId(), assetsInfo.getDepotTime() == null ? "" : assetsInfo.getDepotTime(), assetsInfo.getUsePlaceId(),
							assetsInfo.getRemark() == null ? "" : assetsInfo.getRemark(), 1 });
			if (resultInt > 0) {
				sl += 1;
				System.out.println("第" + sl + "条");
			}
		}
		return sl;

	}

	public List list(String ids) {
		StringBuffer sql = new StringBuffer("select ai.*,ddt.name as device_type_name,dd.name as device_name,db.name as brand_name,dbf.name as brand_format_name,dup.room_num as use_place_room_num from assets_info as ai");
		sql.append(" inner join data_device_type as ddt on ai.device_type_id=ddt.id");
		sql.append(" inner join data_device as dd on ai.device_id=dd.id");
		sql.append(" inner join data_brand as db on ai.brand_id=db.id");
		sql.append(" inner join data_brand_format as dbf on ai.brand_format_id=dbf.id");
		sql.append(" left join data_use_place as dup on ai.use_place_id=dup.id");
		sql.append(" where ai.id in (" + ids + ")");
		return basalDao.queryList(sql.toString(), null);
	}

	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}

}
