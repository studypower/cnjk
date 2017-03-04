package com.yakov.utils;

import java.io.File;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Node;
import org.dom4j.io.SAXReader;

/**
 * Constant values used throughout the application.
 * 
 * <p>
 * <a href="Constants.java.html"><i>View Source</i></a>
 * </p>
 * 
 * @author <a href="mailto:matt@raibledesigns.com">Matt Raible</a>
 */
public class Constants {
	// ~ Static fields/initializers
	// =============================================

	/** The name of the ResourceBundle used in this application */
	public static final String BUNDLE_KEY = "ApplicationResources";

	/** The encryption algorithm key to be used for passwords */
	public static final String ENC_ALGORITHM = "algorithm";

	/** A flag to indicate if passwords should be encrypted */
	public static final String ENCRYPT_PASSWORD = "encryptPassword";

	/** File separator from System properties */
	public static final String FILE_SEP = System.getProperty("file.separator");

	/** User home from System properties */
	public static final String USER_HOME = System.getProperty("user.home")
			+ FILE_SEP;

	/** The name of the configuration hashmap stored in application scope. */
	public static final String CONFIG = "appConfig";

	/**
	 * Session scope attribute that holds the locale set by the user. By setting
	 * this key to the same one that Struts uses, we get synchronization in
	 * Struts w/o having to do extra work or have two session-level variables.
	 */
	public static final String PREFERRED_LOCALE_KEY = "org.apache.struts.action.LOCALE";

	/**
	 * The request scope attribute under which an editable user form is stored
	 */
	public static final String USER_KEY = "userForm";

	/**
	 * The request scope attribute that holds the user list
	 */
	public static final String USER_LIST = "userList";

	/**
	 * The request scope attribute for indicating a newly-registered user
	 */
	public static final String REGISTERED = "registered";

	/**
	 * The name of the Administrator role, as specified in web.xml
	 */
	public static final String ADMIN_ROLE = "admin";

	/**
	 * The name of the User role, as specified in web.xml
	 */
	public static final String USER_ROLE = "user";

	/**
	 * The name of the user's role list, a request-scoped attribute when
	 * adding/editing a user.
	 */
	public static final String USER_ROLES = "userRoles";

	/**
	 * The name of the available roles list, a request-scoped attribute when
	 * adding/editing a user.
	 */
	public static final String AVAILABLE_ROLES = "availableRoles";

	/**
	 * The request scope attribute that holds the jigou list
	 */
	public static final String JIGOU_ALLLIST = "alllist";

	/**
	 * ��Ա״̬--��Ч
	 */
	public static final Long DMRYZT_YOUXIAO = new Long(1);

	/**
	 * ��Ա״̬--��Ч
	 */
	public static final Long DMRYZT_WUXIAO = new Long(2);
	
	/**
	 * ��Ա״̬--������ 
	 */
	public static final Long DMRYZT_SHENPIZHONG = new Long(3);
	
	/**
	 * ��ҵ��Ա״̬--�����
	 */
	public static final Long DMRYZT_BEIDIAOCHU = new Long(4);
	
	/**
	 * ��Ա״̬--ע��
	 */
	public static final Long DMRYZT_ZHUXIAO = new Long(5);
	
	/**
	 * ��Ա״̬--��ʡת��
	 */
	public static final Long DMRYZT_ZHUANJI = new Long(6);
	
	/**
	 * ��Ա״̬--��ִҵתִҵ
	 */
	public static final Long DMRYZT_ZHUANZHIYE = new Long(7);
	/**
	 * ��Ա״̬--ת��
	 */
	public static final Long DMRYZT_ZHUANSUO = new Long(8);
	/**
	 * ��Ա״̬--ִҵת��ִҵ
	 */
	public static final Long DMRYZT_ZHUANFEIZHIYE = new Long(9);
	
	
	/**
	 * ��Ա������״̬--��
	 */
	public static final Long DMRYSPGCZT_ZHENGCHANG = new Long(1);

	/**
	 * ��Ա������״̬--����������
	 */
	public static final Long DMRYSPGCZT_BASPZ = new Long(2);
	
	/**
	 * ��Ա������״̬--������ͨ��
	 */
	public static final Long DMRYSPGCZT_BABTG = new Long(3);
	/**
	 * ��Ա������״̬--���������
	 */
	public static final Long DMRYSPGCZT_BGSPZ = new Long(4);
	/**
	 * ��Ա������״̬--���ͨ��
	 */
	public static final Long DMRYSPGCZT_BGBTG = new Long(5);
	/**
	 * ��Ա������״̬--ת��������
	 */
	public static final Long DMRYSPGCZT_ZJSPZ = new Long(6);
	/**
	 * ��Ա������״̬--ת��������
	 */
	public static final Long DMRYSPGCZT_ZSSPZ = new Long(7);
	/**
	 * ��Ա������״̬--ת��ִҵ������
	 */
	public static final Long DMRYSPGCZT_ZHUANFEIZHIYESPZ = new Long(8);
	/**
	 * ��Ա������״̬--ע��������
	 */
	public static final Long DMRYSPGCZT_ZHUXIAOSPZ = new Long(9);
	/**
	 * ��Ա������״̬--ת��������
	 */
	public static final Long DMRYSPGCZT_ZSSPZB = new Long(10);
	
	/**

	 * ��״̬ ��ʼ����b 1
	 */
	public final static Long JGZT_CSHSL = new Long(1);

	/**
	 * ��״̬ ��ʼ���˻� 2
	 */
	public final static Long JGZT_CSHTH = new Long(2);

	/**
	 * ��״̬ ��ʼ��ͨ�� 3
	 */
	public final static Long JGZT_CSHTG = new Long(3);

	/**
	 * ��״̬ ��ʼ����ͨ�� 4
	 */
	public final static Long JGZT_CSHDTG = new Long(4);

	/**
	 * ��״̬ ������b 5
	 */
	public final static Long JGZT_BASL = new Long(5);

	/**
	 * ��״̬ �����˻� 6
	 */
	public final static Long JGZT_BATH = new Long(6);

	/**
	 * ��״̬ ����ͨ�� 7
	 */
	public final static Long JGZT_BATG = new Long(7);

	/**
	 * ��״̬ ������ͨ�� 8
	 */
	public final static Long JGZT_BADTG = new Long(8);

	/**
	 * ��״̬ ע�� 9
	 */
	public final static Long JGZT_ZX = new Long(9);

	/**
	 * ��״̬ �ϲ� 10
	 */
	public final static Long JGZT_HB = new Long(10);

	/**
	 * ��״̬ �� 11
	 */
	public final static Long JGZT_ZC = new Long(11);

	/**
	 * ��״̬ ������ͨ 12
	 */
	public final static Long JGZT_BADKT = new Long(12);

	/**
	 * ��״̬ ������ 13
	 */
	public final static Long JGZT_BDJ = new Long(13);

	/**
	 * ����״̬ ���� 1
	 */
	public final static Long FGZT_BC = new Long(1);

	/**
	 * ����״̬ ���� 2
	 */
	public final static Long FGZT_FB = new Long(2);

	/**
	 * ����״̬ ������ 1
	 */
	public final static Long SPZT_SPZ = new Long(1);

	/**
	 * ����״̬ ͨ�� 2
	 */
	public final static Long SPZT_TG = new Long(2);

	/**
	 * ����״̬ ��ͨ�� 3
	 */
	public final static Long SPZT_BTG = new Long(3);

	/**
	 * ����� ����
	 */
	public final static Long JGGZ_FEI = new Long(4);

	/**
	 * 
	 * ����״̬ ����� 4
	 */
	public final static Long SPZT_DSH = new Long(4);

	/**
	 * ����״̬ ��ϲ� 5
	 */
	public final static Long SPZT_DHB = new Long(5);

	/**
	 * ����״̬ �Ѻϲ� 6
	 */
	public final static Long SPZT_YHB = new Long(6);

	/**
	 * ����״̬ ���� 7
	 */
	public final static Long SPZT_DBG = new Long(7);

	/**
	 * ����״̬ �ѱ�� 8
	 */
	public final static Long SPZT_YBG = new Long(8);

	/**
	 * ����� ��
	 */
	public final static Long JGGZ_Y = new Long(3);

	/**
	 * ��Ա�ǳ����˷�������
	 */
	public final static Long FQRCZRSZ_Y = new Long(1);

	/**
	 * ��Ա���ǳ����˷�������
	 */
	public final static Long FQRCZRSZ_N = new Long(2);

	/**
	 * ������� �������������˲�������3�� 1
	 */
	public final static Long TJGZ_YXFQR = new Long(1);

	/**
	 * ������� �����˴�ҵ���鲻������3�� 2
	 */
	public final static Long TJGZ_CYJY = new Long(2);

	/**
	 * ������� ����������ִҵ˰��ʦ��������5�� 3
	 */
	public final static Long TJGZ_YXRS = new Long(3);

	/**
	 * ������� ���������������10������רְ��ҵ��Ա 4
	 */
	public final static Long TJGZ_YXZZCYRY = new Long(4);

	/**
	 * ������� ����������ע���ʽ�����30�� 5
	 */
	public final static Long TJGZ_YXZCZJ = new Long(5);

	/**
	 * ������� ��������������˳��ʶ��������ע���ʽ� 6
	 */
	public final static Long TJGZ_YXZE = new Long(6);

	/**
	 * ������� �в��ϸ���Ա���� 7
	 */
	public final static Long TJGZ_YXBHG = new Long(7);

	/**
	 * ������� �������������������С��65���� 8
	 */
	public final static Long TJGZ_YXCZRNL = new Long(8);

	/**
	 * ������� �ϻ���������ϻ��˲�������2�� 9
	 */
	public final static Long TJGZ_HHHHR = new Long(9);

	/**
	 * ������� �ϻ���������ִҵ˰��ʦ��������3�� 10
	 */
	public final static Long TJGZ_HHSWSRS = new Long(10);

	/**
	 * ������� �ϻ���������ע���ʽ�����10�� 11
	 */
	public final static Long TJGZ_HHZCZJ = new Long(11);

	/**
	 * ������� �ϻ���������ϻ��˳��ʶ��������ע���ʽ� 12
	 */
	public final static Long TJGZ_HHCZE = new Long(12);

	/**
	 * ������� �ϻ���������������������8�� 13
	 */
	public final static Long TJGZ_HHZRS = new Long(13);

	/**
	 * ������� �ϻ���������ϻ�������С��65���� 14
	 */
	public final static Long TJGZ_HHNL = new Long(14);

	/**
	 * ������� �ϻ�������������˲�������2�� 15
	 */
	public final static Long TJGZ_HHCZRS = new Long(15);

	/**
	 * ������� ��������������˲�������3�� 16
	 */
	public final static Long TJGZ_YXCZRS = new Long(16);

	/**
	 * ������� ����ִҵ˰��ʦ����С��70�� 17
	 */
	public final static Long TJGZ_QTSWSNL = new Long(17);

	/**
	 * ������--�ϻ�
	 */
	public static final Long JGXZ_HH = new Long(1);

	/**
	 * ������--����
	 */
	public static final Long JGXZ_YX = new Long(2);

	/**
	 * ͨ��״̬ ����� 5
	 */
	public final static Long TGZT_SHZ = new Long(5);

	/**
	 * ͨ��״̬ ��ͨ�� 6
	 */
	public final static Long TGZT_ZCTG = new Long(6);

	/**
	 * ͨ��״̬--ǿ��ͨ�� 7
	 */
	public static final Long TGZT_QXTG = new Long(7);

	/**
	 * �Ƿ��з�ִҵ˰��ʦ���� �� 1
	 */
	public final static String FZYCZ_YOU = "1";

	/**
	 * �Ƿ��з�ִҵ˰��ʦ���� û�� 2
	 */
	public static final String FZYCZ_MEIYOU = "2";
	
	/**
	 * ִҵ˰��ʦ�Ϸ��ԣ����Ϸ�������
	 */
	public static final String ZYSWSHFX_HF = "Y";

	/**
	 *  ִҵ˰��ʦ�Ϸ��ԣ������Ϸ�������
	 */
	public static final String ZYSWSHFX_BHF = "N";
	
	/**
	 * ���Թ����Ƿ񱸰���������������
	 */
	public static final String KSGLSFBA_BA = "Y";

	/**
	 *  ���Թ����Ƿ񱸰�����δ����������
	 */
	public static final String KSGLSFBA_WBA = "N";
	/**
	 * ��ҳҳ�� 10
	 */
	public static final int PAGE_SIZE=10;
	/**
	 * ��ҳҳ�� 5
	 */
	public static final int PAGE_SIZE_=5;
	
	/**
	 * ֪ͨ��� --���İ����쵼�����ҽ�����ش����� 1
	 */
	public static final Long TZLB_ZXLDAP = new Long(1);
	
	/**
	 * ֪ͨ��� --���������ϼ��쵼�����ҽ�����ش����� 2
	 */
	public static final Long TZLB_SWSLDAP = new Long(2);

	/**
	 * ֪ͨ��� --���İ����������� 3
	 */
	public static final Long TZLB_ZXGW = new Long(3);

	/**
	 * ֪ͨ��� --������������ 4
	 */
	public static final Long TZLB_SWSCLZX= new Long(4);

	/**
	 * ֪ͨ��� --ͼƬ�ĵ� 5
	 */
	public static final Long TZLB_TPWD= new Long(5);

	/**
	 * ֪ͨ��� --����֪ͨ 6
	 */
	public static final Long TZLB_CFTZ= new Long(6);

	/**
	 * ֪ͨ��� --����֪ͨ 7
	 */
	public static final Long TZLB_JLTZ= new Long(7);

	/**
	 * ֪ͨ��� --���������֪ͨ 8
	 */
	public static final Long TZLB_SWSNJ= new Long(8);

	/**
	 * ֪ͨ��� --ִҵ˰��ʦ���֪ͨ 9
	 */
	public static final Long TZLB_ZYSWSNJ= new Long(9);

	/**
	 * ֪ͨ��� --�������������! 10
	 */
	public static final Long TZLB_SWSBGHK= new Long(10);

	/**
	 * ֪ͨ��� --������ע�������! 11
	 */
	public static final Long TZLB_SWSZXHK= new Long(11);

	/**
	 * ֪ͨ��� --������ϲ������! 12
	 */
	public static final Long TZLB_SWSHBHK= new Long(12);

	/**
	 * ֪ͨ��� --ִҵ˰��ʦ��������! 13
	 */
	public static final Long TZLB_ZYSWSBGHK= new Long(13);
	
	/**
	 * ֪ͨ��� --ִҵ˰��ʦ���������! 14
	 */
	public static final Long TZLB_ZYSWSBAHK= new Long(14);

	/**
	 * ֪ͨ��� --ִҵ˰��ʦע�������! 15
	 */
	public static final Long TZLB_ZYSWSZXHK= new Long(15);

	/**
	 * ֪ͨ��� --����֪ͨ 16
	 */
	public static final Long TZLB_QTTZ= new Long(16);

	/**
	 * ����״̬ --���� 1
	 */
	public static final Long FBZT_BAOCUN= new Long(1);

	/**
	 * ����״̬ --���� ��
	 */
	public static final Long FBZT_FABU= new Long(2);
	/**
	 * ְ���� 5
	 */
	public static final Long DMZW_SZ = new Long(5);
	/**
	 * ְ���� 6
	 */
	public static final Long DMZW_FSZ = new Long(6);
	/**
	 * ���³� 1
	 */
	public static final Long DMZW_DSZ = new Long(1);
	/**
	 * �ܾ��� 2
	 */
	public static final Long DMZW_ZJL = new Long(2);
	/**
	 * ע��˰��ʦ 8
	 */
	public static final Long DMZW_ZCSWS = new Long(8);
	/**
	 * �μ�ͳ�� Y
	 */
	public static final String ISTJ_Y = "Y";
	/**
	 * ���μ�ͳ�� N
	 */
	public static final String ISTJ_N = "N";
	
	/**
	 * ���ñ�� 1
	 */
	public static final String ISQY_Y = "1";
	/**
	 * �����ñ�� 0
	 */
	public static final String ISQY_N = "0";
	
	/**
	 * �õ�ֵ
	 * 
	 * @param element
	 * @returnic
	 */
	
	/**
	 * �����Ƿ���Է���
	 */
	public static final String IS_FASONG="Y";
	
	/**
	 * ���ŷ������ip
	 */
	public static final String DUANXIN_IP="192.168.1.3";
	
	/**
	 * �ϴ�������С
	 */
	public static final int MAXFJ_SIZE=1024*1024*2;
	/**
	 * �ϴ���������ʱ����ʾ����Ϣ
	 */
	public static final String MAXfJ_ERR="ֻ֧���ϴ�2M�ĸ���";
	/**
	 * �ϴ�����δ�ҵ��ļ���ʾ����Ϣ
	 */
	public static final String NULLfJ_ERR="δ�ҵ��ļ�";
	/**
	 * ��b�����Ա��ɫ
	 */
	public static final Long SHELI_ROLE=new Long(4);
	/**
	 * ��bͨ���ʱ�����Ա��ɫ
	 */
	public static final Long SHELI_ROLE_TG=new Long(3);
	/**
	 * ������keyId
	 */
	public static final String KEY_ID="FFFFFFFFFFFFFFFF";//C7869ABF53FA8B72
	
	public static String getConstantValue(String name,String path) {
		String value = null;
		SAXReader reader = new SAXReader();
		try {
			Document document;
			document = reader.read(new File(path+"/WEB-INF/Constant.xml"));
			Node node= document.selectSingleNode("Constant");; // ��ȡ��Ԫ��
			value = node.valueOf(name);
			return value;
		} catch (DocumentException e) {
			e.printStackTrace();
			return null;
		}
	}
	public static java.sql.Timestamp untilDateConvertTimestamp(Date d){
		Format formatter;
		formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String s = formatter.format(d);
		java.sql.Timestamp sqlDate = java.sql.Timestamp.valueOf(s);
		return sqlDate;
	}
}
