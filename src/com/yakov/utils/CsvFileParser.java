package com.yakov.utils;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import com.Ostermiller.util.ExcelCSVParser;
import com.Ostermiller.util.LabeledCSVParser;

/**
 * ����csv�ļ�
 * 
 * @author gcyu
 */
public class CsvFileParser {

	private LabeledCSVParser csvParser; // csv�����������ڵ�һ�еı�ͷ��Ϣ���Զ�����Ϊ����ؼ���

	private int currLineNum = -1; // �ļ����������

	private String[] currLine = null; // ������ŵ�ǰ�е����

	public CsvFileParser(InputStream in) throws IOException {
		csvParser = new LabeledCSVParser(new ExcelCSVParser(new InputStreamReader(in, "GBK")));
		currLineNum = csvParser.getLastLineNumber();
	}

	/**
	 * Get the titles of csv file.
	 * 
	 * return String[]
	 */
	public String[] getTitles() throws IOException {
		return csvParser.getLabels();
	}

	/**
	 * 是否有下一行
	 * 
	 * @return
	 * @throws IOException
	 */
	public boolean hasMore() throws IOException {
		currLine = csvParser.getLine();
		currLineNum = csvParser.getLastLineNumber();
		if (null == currLine || currLine[0] == null || "".equals(currLine[0])) {
			return false;
		}
		return true;
	}

	/**
	 * 根据列名，获取值
	 * 
	 * @param fieldName
	 * @return
	 */
	public String getByFieldName(String fieldName) {
		return csvParser.getValueByLabel(fieldName);
	}

	/**
	 * 关闭CSV文件
	 * 
	 * @throws IOException
	 */
	public void close() throws IOException {
		csvParser.close();
	}

	/**
	 * 读取一行数据
	 * 
	 * @return
	 * @throws IOException
	 */
	public String[] readLine() throws IOException {
		currLine = csvParser.getLine();
		currLineNum = csvParser.getLastLineNumber();
		return currLine;
	}

	/**
	 * 获取行数
	 * 
	 * @return
	 */
	public int getCurrLineNum() {
		return currLineNum;

	}

	/**
	 * 获取一行值
	 * 
	 * @return
	 */
	public String[] getCurrLine() {
		return currLine;
	}

}
