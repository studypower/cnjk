package com.disease_control.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.disease_control.core.page.Page;
import com.disease_control.db.dao.BasalDao;
import com.disease_control.web.form.DataFileInfo;
import com.disease_control.web.form.DepotRkEntry;
import com.disease_control.web.form.PurchaseOrder;
import com.disease_control.web.form.PurchaseOrderAudit;
import com.disease_control.web.form.PurchaseOrderEntry;
import com.disease_control.web.form.PurchaseOrderSupplier;
import com.yakov.utils.DateUtil;
import com.yakov.utils.StringUtil;

public class PurchaseOrderService {

	/**
	 * 
	 * @param fundsApplyNum
	 *            经费单编号
	 * @param name
	 * @param step
	 *            流程编号
	 * @param startTime
	 * @param endTime
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public Page list(String fundsApplyNum, String name, int step, Date startTime, Date endTime, int pageIndex, int pageSize, int type, String sidx, String sord, int staffId, int departmentId) {
		ArrayList paramList = new ArrayList();
		StringBuffer sql = new StringBuffer(
				"select po.*,poe.entryNames,fai.num as fundsApplyNum,fai.name as fundsApplyName,fai.money as fundsApplyMoney,di.name as applyDepartmentName,si.name as applyStaffName from purchase_order as po");
		sql.append(" inner join funds_apply_info as fai on fai.id=po.funds_apply_id");
		sql.append(" inner join department_info as di on fai.apply_department_id=di.id and di.`status`=1");
		sql.append(" left join (select group_concat(fase.name) as entryNames,poe.order_id from purchase_order_entry as poe inner join funds_apply_stock_entry as fase on fase.id=poe.funds_apply_entry_id group by poe.order_id) as poe on poe.order_id=po.id");
		sql.append(" inner join staff_info as si on fai.apply_staff_id=si.id where 1=1");
		if (step == 1) {
			if (type == 0) {
				sql.append(" and si.id=?");
				paramList.add(staffId);
			}
		}
		if (step < 5) {
			sql.append(" and po.step>=?");
			paramList.add(step);
		}
		if (step == 5) {
			sql.append(" and (po.step>=? or (po.step=4 and po.status=1))");
			paramList.add(step);
		}
		if (step == 6) {
			sql.append(" and (po.step>=? or (po.step=4 and po.status=1) or (po.step=5 and po.status=1))");
			paramList.add(step);
		}
		if (type != -100) {
			sql.append(" and po.type=?");
			paramList.add(type);
		}
		if (step == -2) {
			sql.append(" and fai.apply_department_id=?");
			paramList.add(departmentId);
		}
		if (step == 3) {
			sql.append(" and fai.money>=30000");
		}
		if (fundsApplyNum != null && !fundsApplyNum.equals("")) {
			sql.append(" and fai.num like ?");
			paramList.add("%" + fundsApplyNum + "%");
		}
		if (name != null && !name.equals("")) {
			sql.append(" and po.name like ?");
			paramList.add("%" + name + "%");
		}
		if (startTime != null) {
			sql.append(" and po.create_time >= ?");
			paramList.add(startTime);
		}
		if (endTime != null) {
			sql.append(" and po.create_time <= ?");
			paramList.add(endTime);
		}
		if (sidx != null && !"".equals(sidx) && sord != null && !"".equals(sord)) {
			sql.append(" order by po." + sidx + " " + sord);
		} else {
			sql.append(" order by po.id desc");
		}
		Object[] params = new Object[paramList.size()];
		for (int i = 0; i < paramList.size(); i++) {
			params[i] = paramList.get(i);
		}
		return basalDao.pagedQuery_mysql_sql(sql.toString(), pageIndex, pageSize, params);
	}

	/**
	 * 
	 * @param fundsApplyNum
	 *            经费单编号
	 * @param name
	 * @param step
	 *            流程编号
	 * @param startTime
	 * @param endTime
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public List exportDate(String fundsApplyNum, String name, int step, Date startTime, Date endTime, int type, int departmentId) {
		ArrayList paramList = new ArrayList();
		StringBuffer sql = new StringBuffer(
				"select po.*,poe.entryNames,fai.num as fundsApplyNum,fai.name as fundsApplyName,fai.money as fundsApplyMoney,di.name as applyDepartmentName,si.name as applyStaffName from purchase_order as po");
		sql.append(" inner join funds_apply_info as fai on fai.id=po.funds_apply_id");
		sql.append(" inner join department_info as di on fai.apply_department_id=di.id and di.`status`=1");
		sql.append(" left join (select group_concat(fase.name) as entryNames,poe.order_id from purchase_order_entry as poe inner join funds_apply_stock_entry as fase on fase.id=poe.funds_apply_entry_id group by poe.order_id) as poe on poe.order_id=po.id");
		sql.append(" inner join staff_info as si on fai.apply_staff_id=si.id where 1=1");
		if (step < 5) {
			sql.append(" and po.step>=?");
			paramList.add(step);
		}
		if (step == 5) {
			sql.append(" and (po.step>=? or (po.step=4 and po.status=1 and (poe0.order_id is not null or poe1.order_id is not null)))");
			paramList.add(step);
		}
		if (step == 6) {
			sql.append(" and (po.step>=? or (po.step=4 and po.status=1 and (poe2.order_id is not null or poe3.order_id is not null)) or (po.step=5 and po.status=1 and (poe2.order_id is not null or poe3.order_id is not null)))");
			paramList.add(step);
		}
		if (type != -100) {
			sql.append(" and po.type=?");
			paramList.add(type);
		}
		if (step == 3) {
			sql.append(" and fai.money>=30000");
		}
		if (step == -2) {
			sql.append(" and fai.apply_department_id=?");
			paramList.add(departmentId);
		}
		if (fundsApplyNum != null && !fundsApplyNum.equals("")) {
			sql.append(" and fai.num like ?");
			paramList.add("%" + fundsApplyNum + "%");
		}
		if (name != null && !name.equals("")) {
			sql.append(" and po.name like ?");
			paramList.add("%" + name + "%");
		}
		if (startTime != null) {
			sql.append(" and po.create_time >= ?");
			paramList.add(startTime);
		}
		if (endTime != null) {
			sql.append(" and po.create_time <= ?");
			paramList.add(endTime);
		}
		sql.append(" order by po.id desc");
		Object[] params = new Object[paramList.size()];
		for (int i = 0; i < paramList.size(); i++) {
			params[i] = paramList.get(i);
		}
		List<Map> list = basalDao.queryList(sql.toString(), params);
		for (Map map : list) {
			if (map.get("type").toString().equals("0")) {
				map.put("type", "科室采购");
			} else if (map.get("type").toString().equals("2")) {
				map.put("type", "政府采购");
			} else if (map.get("type").toString().equals("3")) {
				map.put("type", "集中采购");
			}

			String str = "";
			if (map.get("step").toString().equals("0")) {
				str = "采购登记";
			} else if (map.get("step").toString().equals("1")) {
				str = "采购比价";
			} else if (map.get("step").toString().equals("2")) {
				str = "比价审核";
			} else if (map.get("step").toString().equals("3")) {
				str = "比价审核";
			} else if (map.get("step").toString().equals("4")) {
				str = "资产采购";
			} else if (map.get("step").toString().equals("5")) {
				str = "资产验收";
			} else if (map.get("step").toString().equals("6")) {
				str = "资产入库";
			}
			str += "-->";

			if (map.get("status").toString().equals("-1")) {
				str += "驳回";
			} else if (map.get("status").toString().equals("0")) {
				str += "待处理";
			} else if (map.get("status").toString().equals("1")) {
				if (map.get("step").toString().equals("4")) {
					str += "部分采购";
				} else if (map.get("step").toString().equals("5")) {
					str += "部分验收";
				} else if (map.get("step").toString().equals("6")) {
					str += "部分入库";
				} else {
					str += "已完结";
				}
			} else if (map.get("status").toString().equals("2")) {
				str += "已完结";
			}

			map.put("step", str);
		}
		return list;
	}

	/**
	 * 新增采购单
	 * 
	 * @param purchaseOrder
	 * @return
	 */
	public int add_Tx(PurchaseOrder purchaseOrder) {
		int resultInt = 0;
		int step = 1;
		String sql = "select count(id) from purchase_order where create_time=?";
		int count = basalDao.queryInt(sql, new Object[] { "" + DateUtil.getNewDate() + "" }) + 1;
		sql = "select * from funds_apply_info where id=?";
		Map fundsApplyInfoMap = basalDao.queryMap(sql, new Object[] { purchaseOrder.getFundsApplyId() });
		Double funsApplyMoney = (Double) fundsApplyInfoMap.get("money");
		if (funsApplyMoney >= 30000) {
			step = 0;
		}
		purchaseOrder.setName("CG-" + StringUtil.tonicZero(fundsApplyInfoMap.get("apply_department_id"), 2) + "-" + DateUtil.getYmd() + "-" + StringUtil.tonicZero(count, 3));
		sql = "insert into purchase_order(funds_apply_id,name,type,sign_supplier_id,sign_contract_num,money,step,`status`,create_time,cg_type) values(?,?,?,?,?,?,?,?,?,?)";
		resultInt = basalDao.runUSql(sql,
				new Object[] { purchaseOrder.getFundsApplyId(), purchaseOrder.getName(), purchaseOrder.getType(), purchaseOrder.getSignSupplierId(), purchaseOrder.getSignContractNum(), 0,
						purchaseOrder.getStep(), purchaseOrder.getStatus(), new Date(), purchaseOrder.getCgType() });
		if (resultInt == 1) {
			int orderId = basalDao.queryInt("select id from purchase_order where funds_apply_id=? and name=?  and step=? and `status`=? order by id desc limit 1",
					new Object[] { purchaseOrder.getFundsApplyId(), purchaseOrder.getName(), purchaseOrder.getStep(), purchaseOrder.getStatus() });
			for (PurchaseOrderEntry purchaseOrderEntry : purchaseOrder.getPurchaseOrderEntryList()) {
				sql = "insert into purchase_order_entry(order_id,funds_apply_entry_id,sg_amount) values(?,?,?)";
				basalDao.runUSql(sql, new Object[] { orderId, purchaseOrderEntry.getFundsApplyEntryId(), purchaseOrderEntry.getAmount() });
				sql = "update funds_apply_stock_entry set buy_amount = buy_amount+? where id=?";
				basalDao.runUSql(sql, new Object[] { purchaseOrderEntry.getAmount(), purchaseOrderEntry.getFundsApplyEntryId() });
			}
		}
		return resultInt;
	}

	/**
	 * 查询采购单详情
	 * 
	 * @param id
	 * @return
	 */
	public Map info(int id) {
		StringBuffer sql = new StringBuffer(
				"select po.*,fai.id as fundsApplyId,fai.num as fundsApplyNum,fai.name as fundsApplyName,fai.money as funds_apply_money,di.name as applyDepartmentName,si.name as applyStaffName,sui.name as sign_supplier_name from purchase_order as po");
		sql.append(" inner join funds_apply_info as fai on fai.id=po.funds_apply_id");
		sql.append(" inner join department_info as di on fai.apply_department_id=di.id and di.`status`=1");
		sql.append(" inner join staff_info as si on fai.apply_staff_id=si.id");
		sql.append(" left join supplier_info as sui on po.sign_supplier_id=sui.id");
		sql.append(" where po.id=?");
		Map purchaseOrderMap = basalDao.queryMap(sql.toString(), new Object[] { id });
		if (purchaseOrderMap != null) {
			sql = new StringBuffer("select poe.*,fase.name as device_name,fase.money as device_money,fase.remark as device_remark from purchase_order_entry as poe");
			sql.append(" inner join funds_apply_stock_entry as fase on fase.id=poe.funds_apply_entry_id");
			sql.append(" where poe.order_id=?");
			purchaseOrderMap.put("purchaseOrderEntryList", basalDao.queryList(sql.toString(), new Object[] { id }));

			sql = new StringBuffer("select poa.*,si.name as audit_staff_name from purchase_order_audit as poa");
			sql.append(" inner join staff_info as si on si.id=poa.audit_staff_id");
			sql.append(" where poa.order_id=?");
			purchaseOrderMap.put("purchaseOrderAuditList", basalDao.queryList(sql.toString(), new Object[] { id }));

			sql = new StringBuffer("select pos.*,si.name as supplier_name from purchase_order_supplier as pos");
			sql.append(" inner join supplier_info as si on si.id=pos.supplier_id");
			sql.append(" where pos.order_id=?");
			purchaseOrderMap.put("purchaseOrderSupplierList", basalDao.queryList(sql.toString(), new Object[] { id }));

			sql = new StringBuffer("select dre.*,ddt.name as device_type_name,dd.name as device_name,db.name as brand_name,dbf.name as brand_format_name from depot_rk_entry as dre");
			sql.append(" inner join data_device_type as ddt on ddt.id=dre.device_type_id");
			sql.append(" inner join data_device as dd on dd.id=dre.device_id");
			sql.append(" inner join data_brand as db on db.id=dre.brand_id");
			sql.append(" inner join data_brand_format as dbf on dbf.id=dre.brand_format_id");
			sql.append(" where dre.wzcg_info_id=?");
			purchaseOrderMap.put("depotRkEntryList", basalDao.queryList(sql.toString(), new Object[] { id }));
		}
		if (purchaseOrderMap.get("cg_file") != null && !purchaseOrderMap.get("cg_file").equals("")) {
			String cgFileUrl = String.valueOf(purchaseOrderMap.get("cg_file"));
			String cgFileUrlArray[] = cgFileUrl.split("\\|");
			List list = new ArrayList();
			for (int i = 0; i < cgFileUrlArray.length; i++) {
				Map map = new HashMap();
				String fileArray[] = cgFileUrlArray[i].split(",");
				for (int j = 0; j < fileArray.length; j++) {
					if (j == 0) {
						map.put("fileName", fileArray[j]);
					} else if (j == 1) {
						map.put("fileUrl", fileArray[j]);
					}
				}
				list.add(map);
			}
			purchaseOrderMap.put("cgFileUrlList", list);
		}

		if (purchaseOrderMap.get("ys_file") != null && !purchaseOrderMap.get("ys_file").equals("")) {
			String ysFileUrl = String.valueOf(purchaseOrderMap.get("ys_file"));
			String ysFileUrlArray[] = ysFileUrl.split("\\|");
			List list = new ArrayList();
			for (int i = 0; i < ysFileUrlArray.length; i++) {
				Map map = new HashMap();
				String fileArray[] = ysFileUrlArray[i].split(",");
				for (int j = 0; j < fileArray.length; j++) {
					if (j == 0) {
						map.put("fileName", fileArray[j]);
					} else if (j == 1) {
						map.put("fileUrl", fileArray[j]);
					}
				}
				list.add(map);
			}
			purchaseOrderMap.put("ysFileUrlList", list);
		}
		purchaseOrderMap.put("zczlFileUrlList", basalDao.queryList("select * from data_file_info where target_table='wzcg_zczl' and target_id=?", new Object[] { id }));
		return purchaseOrderMap;
	}

	/**
	 * 添加采购供应商比价信息
	 * 
	 * @param purchaseOrder
	 * @return
	 */
	public int addSupplier_Tx(PurchaseOrder purchaseOrder) {
		int resultInt = 0;
		String sql = "update purchase_order set step=2,`status`=0 where id=?";
		resultInt = basalDao.runUSql(sql, new Object[] { purchaseOrder.getId() });
		if (resultInt > 0) {
			sql = "delete from purchase_order_supplier where order_id=?";
			basalDao.runUSql(sql, new Object[] { purchaseOrder.getId() });
			sql = "insert into purchase_order_supplier(order_id,supplier_id,money,file_url,`status`) values(?,?,?,?,?)";
			for (PurchaseOrderSupplier purchaseOrderSupplier : purchaseOrder.getPurchaseOrderSupplierList()) {
				basalDao.runUSql(sql, new Object[] { purchaseOrderSupplier.getOrderId(), purchaseOrderSupplier.getSupplierId(), purchaseOrderSupplier.getMoney(), purchaseOrderSupplier.getFileUrl(),
						purchaseOrderSupplier.getStatus() });
			}
			if (purchaseOrder.getPurchaseOrderEntryId() != null) {
				for (int i = 0; i < purchaseOrder.getPurchaseOrderEntryId().size(); i++) {
					sql = "update purchase_order_entry set amount=?,money=? where id=?";
					basalDao.runUSql(sql, new Object[] { purchaseOrder.getAmount().get(i), purchaseOrder.getMoney().get(i), purchaseOrder.getPurchaseOrderEntryId().get(i) });
				}
			}
		}
		return resultInt;
	}

	/**
	 * 进行供应商比价审核
	 * 
	 * @param purchaseOrder
	 */
	public void audit_Tx(PurchaseOrder purchaseOrder) {
		PurchaseOrderAudit purchaseOrderAudit = purchaseOrder.getPurchaseOrderAudit();
		String sql = "select * from funds_apply_info where id=?";
		Map fundsApplyInfoMap = basalDao.queryMap(sql, new Object[] { purchaseOrder.getFundsApplyId() });
		if (purchaseOrderAudit.getStatus() == 1) {
			purchaseOrder.setStep(5);
			purchaseOrder.setStatus(0);
		} else {
			purchaseOrder.setStatus(purchaseOrderAudit.getStatus());
		}
		sql = "update purchase_order set step=?,`status`=? where id=?";
		basalDao.runUSql(sql, new Object[] { purchaseOrder.getStep(), purchaseOrder.getStatus(), purchaseOrder.getId() });
		if (purchaseOrder.getSelectedSupplierId() != 0) {
			basalDao.runUSql("update purchase_order_supplier set selected=0 where order_id=?", new Object[] { purchaseOrder.getId() });
			basalDao.runUSql("update purchase_order_supplier set selected=1 where supplier_id=? and order_id=?", new Object[] { purchaseOrder.getSelectedSupplierId(), purchaseOrder.getId() });
		}
		sql = "insert into purchase_order_audit(order_id,audit_staff_id,step,status,remark,create_time) values(?,?,?,?,?,now())";
		basalDao.runUSql(sql,
				new Object[] { purchaseOrderAudit.getOrderId(), purchaseOrderAudit.getAuditStaffId(), purchaseOrderAudit.getStep(), purchaseOrderAudit.getStatus(), purchaseOrderAudit.getRemark() });
	}

	/**
	 * 采购操做
	 * 
	 * @param purchaseOrder
	 */
	public void purchase_Tx(PurchaseOrder purchaseOrder) {
		String sql = "update purchase_order set cg_file=?,sign_supplier_id=?,sign_contract_num=?,step=5,`status`=0 where id=?";
		basalDao.runUSql(sql, new Object[] { purchaseOrder.getCgFileUrl(), purchaseOrder.getSignSupplierId(), purchaseOrder.getSignContractNum(), purchaseOrder.getId() });
	}

	/**
	 * 验收操做
	 * 
	 * @param purchaseOrder
	 * @param staffId
	 */
	public void acceptance_Tx(PurchaseOrder purchaseOrder, int staffId) {
		String sql = "select count(id) from purchase_order where ys_time=?";
		int count = basalDao.queryInt(sql, new Object[] { "" + DateUtil.getNewDate() + "" }) + 1;

		sql = "select * from funds_apply_info as fai inner join purchase_order as po on po.funds_apply_id=fai.id where po.id=?";
		Map fundsApplyInfoMap = basalDao.queryMap(sql, new Object[] { purchaseOrder.getId() });
		purchaseOrder.setYsdKey("YS-" + StringUtil.tonicZero(fundsApplyInfoMap.get("apply_department_id"), 2) + "-" + DateUtil.getYmd() + "-" + StringUtil.tonicZero(count, 3));

		sql = "update purchase_order set ys_file=?,ysd_key=?,ys_staff_id=?,ys_time=now() where id=?";
		basalDao.runUSql(sql, new Object[] { purchaseOrder.getYsFileUrl(), purchaseOrder.getYsdKey(), staffId, purchaseOrder.getId() });

		if (purchaseOrder.getPurchaseOrderEntryId() != null) {
			for (int i = 0; i < purchaseOrder.getPurchaseOrderEntryId().size(); i++) {
				sql = "update purchase_order_entry set ys_amount=? where id=?";
				basalDao.runUSql(sql, new Object[] { purchaseOrder.getPurchaseOrderEntryAmount().get(i), purchaseOrder.getPurchaseOrderEntryId().get(i) });
			}
		}

		sql = "update purchase_order set ys_file=?,step=6,`status`=0,ys_staff_id=? where id=?";
		basalDao.runUSql(sql, new Object[] { purchaseOrder.getYsFileUrl(), staffId, purchaseOrder.getId() });

	}

	/**
	 * 入库操做
	 * 
	 * @param purchaseOrder
	 * @param staffId
	 */
	public void storage_Tx(PurchaseOrder purchaseOrder, int staffId) {
		String sql = "select count(id) from purchase_order where rk_time=?";
		int count = basalDao.queryInt(sql, new Object[] { "" + DateUtil.getNewDate() + "" }) + 1;

		sql = "select * from funds_apply_info as fai inner join purchase_order as po on po.funds_apply_id=fai.id where po.id=?";
		Map fundsApplyInfoMap = basalDao.queryMap(sql, new Object[] { purchaseOrder.getId() });
		purchaseOrder.setRkdKey("RK-" + StringUtil.tonicZero(fundsApplyInfoMap.get("apply_department_id"), 2) + "-" + DateUtil.getYmd() + "-" + StringUtil.tonicZero(count, 3));

		sql = "update purchase_order set rkd_key=?,rk_staff_id=?,rk_time=now(),step=6,`status`=2 where id=?";
		basalDao.runUSql(sql, new Object[] { purchaseOrder.getRkdKey(), staffId, purchaseOrder.getId() });

		sql = "select po.*,fai.apply_staff_id from purchase_order as po inner join funds_apply_info as fai on fai.id=po.funds_apply_id where po.id=?";
		Map purchaseOrderMap = basalDao.queryMap(sql, new Object[] { purchaseOrder.getId() });

		for (DepotRkEntry depotRkEntry : purchaseOrder.getDepotRkEntryList()) {
			sql = "insert into depot_rk_entry(wzcg_info_id,device_type_id,device_id,brand_id,brand_format_id,amount,money) value(?,?,?,?,?,?,?)";
			basalDao.runUSql(sql, new Object[] { purchaseOrder.getId(), depotRkEntry.getDeviceTypeId(), depotRkEntry.getDeviceId(), depotRkEntry.getBrandId(), depotRkEntry.getBrandFormatId(),
					depotRkEntry.getAmount(), depotRkEntry.getMoney() });
			for (int i = 0; i < depotRkEntry.getAmount(); i++) {
				sql = "insert into assets_info(num,name,storage_mode_id,device_type_id,device_id,brand_id,brand_format_id,serial_number,origin_place,measure_unit,amount,unit_price,unit_price1,invoice_number,use_situation_id,service_situation_id,service_firm,supplier_id,buy_staff_id,buy_time,sign_staff_id,sign_time,depot_staff_id,depot_time,use_place_id,remark,status) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				basalDao.runUSql(
						sql,
						new Object[] { "", "", 0, depotRkEntry.getDeviceTypeId(), depotRkEntry.getDeviceId(), depotRkEntry.getBrandId(), depotRkEntry.getBrandFormatId(), "", "", "", 1,
								depotRkEntry.getMoney(), depotRkEntry.getMoney(), "", 1, 0, "", purchaseOrderMap.get("sign_supplier_id"), purchaseOrderMap.get("apply_staff_id"),
								purchaseOrderMap.get("create_time"), purchaseOrderMap.get("ys_staff_id"), purchaseOrderMap.get("ys_time"), staffId, new Date(), 0, "", 1 });
			}
		}
	}

	/**
	 * 供应商采购记录查询
	 * 
	 * @param pageIndex
	 * @param pageSize
	 * @param signSupplierId
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public Page listByOrder(int pageIndex, int pageSize, int signSupplierId, Date startTime, Date endTime) {
		List paramList = new ArrayList();
		StringBuffer sqlBuffer = new StringBuffer(
				"select po.*,poe.amount,si.name as supplierName,ddt.name as deviceTypeName,dd.name as deviceName,db.name as brandName,dbf.name as brandFormatName,dbf.money as deviceMoney  from purchase_order as po inner join depot_rk_entry as poe on po.id=poe.wzcg_info_id");
		sqlBuffer.append(" inner join data_device_type as ddt on poe.device_type_id=ddt.id inner join data_device as dd on poe.device_id=dd.id");
		sqlBuffer
				.append(" inner join data_brand as db on poe.brand_id=db.id inner join data_brand_format as dbf on poe.brand_format_id=dbf.id inner join supplier_info as si on po.sign_supplier_id=si.id where po.sign_supplier_id=? and po.step=6 and po.status=2");
		paramList.add(signSupplierId);
		if (startTime != null && !"".equals(startTime)) {
			sqlBuffer.append(" and po.create_time>=?");
			paramList.add(startTime);
		}
		if (endTime != null && !"".equals(endTime)) {
			sqlBuffer.append(" and po.create_time<=?");
			paramList.add(endTime);
		}
		sqlBuffer.append(" order by po.id desc,poe.id desc");
		Object[] params = new Object[paramList.size()];
		for (int i = 0; i < paramList.size(); i++) {
			params[i] = paramList.get(i);
		}
		return basalDao.pagedQuery_mysql_sql(sqlBuffer.toString(), pageIndex, pageSize, params);
	}

	public void delete_Tx(int id) {
		String sql = "delete from purchase_order where id=?";
		basalDao.runUSql(sql, new Object[] { id });
		sql = "select * from purchase_order_entry where order_id=?";
		List<Map> purchaseOrderEntryList = basalDao.queryList(sql, new Object[] { id });
		for (Map purchaseOrderEntry : purchaseOrderEntryList) {
			sql = "update funds_apply_stock_entry set buy_amount=buy_amount-? where id=?";
			basalDao.runUSql(sql, new Object[] { purchaseOrderEntry.get("sg_amount"), purchaseOrderEntry.get("funds_apply_entry_id") });
		}
		sql = "delete from purchase_order_entry where order_id=?";
		basalDao.runUSql(sql, new Object[] { id });
	}

	public void addZczl_Tx(PurchaseOrder purchaseOrder) {
		String sql = "update purchase_order set step=5, `status`=0, zc_remark=? where id=?";
		int resultInt = basalDao.runUSql(sql, new Object[] { purchaseOrder.getZcRemark(), purchaseOrder.getId() });
		if (resultInt > 0) {
			if (purchaseOrder.getPurchaseOrderEntryId() != null) {
				for (int i = 0; i < purchaseOrder.getPurchaseOrderEntryId().size(); i++) {
					sql = "update purchase_order_entry set amount=?,money=? where id=?";
					basalDao.runUSql(sql, new Object[] { purchaseOrder.getAmount().get(i), purchaseOrder.getMoney().get(i), purchaseOrder.getPurchaseOrderEntryId().get(i) });
				}
			}
			if (purchaseOrder.getDataFileInfoList() != null) {
				for (DataFileInfo dataFileInfo : purchaseOrder.getDataFileInfoList()) {
					sql = "insert into data_file_info (target_table,target_id,file_name,file_url) values (?,?,?,?)";
					basalDao.runUSql(sql, new Object[] { dataFileInfo.getTargetTable(), purchaseOrder.getId(), dataFileInfo.getFileName(), dataFileInfo.getFileUrl() });
				}
			}
		}
	}

	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}

}
