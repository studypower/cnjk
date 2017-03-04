package com.yakov.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

public class ExcelReader {

	public static List<String[]> readExcel(File excelFile, int rowNum) throws BiffException, IOException {
		// 创建一个list用来存读取的内容
		List<String[]> list = new ArrayList<String[]>();
		Workbook rwb = null;
		Cell cell = null;
		// 创建输入流
		InputStream stream = new FileInputStream(excelFile);
		// 获取Excel文件对象
		rwb = Workbook.getWorkbook(stream);
		// 获取文件的指定工作表默认的第一个
		Sheet sheet = rwb.getSheet(0);
		// 行数(表头的目录不需要，从1开始)
		for (int i = rowNum - 1; i < sheet.getRows(); i++) {
			// 创建一个数组 用来存储每一列的值
			String[] str = new String[sheet.getColumns()];
			// 列数
			for (int j = 0; j < sheet.getColumns(); j++) {
				// 获取第i行，第j列的值
				cell = sheet.getCell(j, i);
				str[j] = cell.getContents();
			}
			list.add(str);
		}
		return list;
	}
}
