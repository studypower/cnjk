package com.yakov.utils;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.jar.JarFile;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

public class ZipReader {

	ZipFile zipFile = null;

	public ZipReader(File zip) {
		try {
			zipFile = new JarFile(zip);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ZipReader() {
	}

	public InputStream getJarFileInputStream(String fileName) {
		try {
			ZipEntry zipEntry = zipFile.getEntry(fileName);
			InputStream inputStream = zipFile.getInputStream(zipEntry);
			return zipFile.getInputStream(zipEntry);
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}

	public void getJarFile() throws IOException {
		// 指定文件路径
		String filepathe = "D:/1.zip";
		// 获取文件对象
		File file = new File(filepathe);
		// 创建zipfile 对象
		ZipFile zipFile = new JarFile(file);
		System.out.println(zipFile.getName());
		// 查找指定的文件
		String name = "1.jpg";
		ZipEntry z = zipFile.getEntry(name);
		System.out.println(z.getSize());
		// 创建输出流
		OutputStream output = new FileOutputStream("D:/1.jpg");
		// 创建写入流
		InputStream input = zipFile.getInputStream(z);
		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		// 创建临时变量
		int temp = 0;
		while ((temp = input.read()) != -1) {
			bos.write(temp);
		}
		byte[] file_buff = bos.toByteArray();
		output.write(file_buff);
		// 关闭写入流
		input.close();
		// 关闭输出流
		output.close();
	}

	public static void main(String[] args) throws IOException {
		ZipReader t = new ZipReader();
		t.getJarFile();
		System.err.println("Success!");
	}

}
