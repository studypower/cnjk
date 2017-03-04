package com.yakov.utils;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.imageio.ImageIO;

import org.csource.fastdfs.StorageClient;
import org.csource.fastdfs.StorageServer;
import org.csource.fastdfs.TrackerClient;
import org.csource.fastdfs.TrackerServer;
import org.springframework.context.support.StaticApplicationContext;

public class PhotoUtil {

	/**
	 * 对现有图形进行缩放
	 * 
	 * @param file
	 *            现有图形文件
	 * @param maxSize
	 *            缩放后的最大边长
	 * @return
	 */
	public static byte[] compressImage(File file, int maxSize) {
		try {
			FileInputStream fis = new FileInputStream(file);
			Image src = javax.imageio.ImageIO.read(fis); // construct
			int width = src.getWidth(null); // get the width
			int height = src.getHeight(null);// get the height
			double scale = 1;
			if (width > maxSize || height > maxSize) {
				scale = width > height ? (double) maxSize / width : (double) maxSize / height;
			}
			if (scale != 1) {
				int reWidth = (int) (scale * (double) width);
				int reHeight = (int) (scale * (double) height);
				BufferedImage tag = new BufferedImage(reWidth, reHeight, BufferedImage.TYPE_INT_RGB);
				tag.getGraphics().drawImage(src, 0, 0, reWidth, reHeight, null); // draw
				ByteArrayOutputStream out = new ByteArrayOutputStream();
				ImageIO.write(tag, "gif", out);
				byte[] file_byte = out.toByteArray();
				out.flush();
				out.close();
				fis.close();
				return file_byte;
			} else {
				BufferedInputStream in = new BufferedInputStream(new FileInputStream(file));
				ByteArrayOutputStream out = new ByteArrayOutputStream(1024);
				byte[] temp = new byte[1024];
				int size = 0;
				while ((size = in.read(temp)) != -1) {
					out.write(temp, 0, size);
				}
				in.close();
				byte[] file_byte = out.toByteArray();
				return file_byte;
			}
		} catch (Exception e) {
		}
		return null;
	}

	/**
	 * 取得上传图片的后缀名
	 * 
	 * @param file
	 *            文件地址
	 */
	public static String postfix(String file) {
		return file.substring(file.lastIndexOf(".") + 1).toLowerCase();
	}

	/**
	 * 以文件形式保存图片
	 * 
	 * @return
	 */
	public static boolean saveImg(File file, String fileUrl) {
		if (file.length() == 0) {
			try {
				new File(fileUrl).createNewFile();
			} catch (IOException e) {
				return false;
			}
			return true;
		}
		BufferedInputStream inputStream = null;
		BufferedOutputStream outputStream = null;
		byte[] block = new byte[1024];
		try {
			File newFile = new File(fileUrl);
			if (!newFile.exists()) {
				newFile.createNewFile();
			}
			inputStream = new BufferedInputStream(new FileInputStream(file));
			outputStream = new BufferedOutputStream(new FileOutputStream(newFile));
			while (true) {
				int readLength = inputStream.read(block);
				if (readLength == -1) {
					break;
				}
				outputStream.write(block, 0, readLength);
			}
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (inputStream != null) {
				try {
					inputStream.close();
				} catch (IOException ex) {
				}
			}
			if (outputStream != null) {
				try {
					outputStream.close();
				} catch (IOException ex) {
				}
			}
		}
		return false;
	}

	public static boolean saveImg(InputStream inputStream, String imageFile) {
		ByteArrayOutputStream bos = null;
		try {
			bos = new ByteArrayOutputStream();
			byte[] buffer = new byte[4096];
			int count = 0;
			while ((count = inputStream.read(buffer)) > 0) {
				bos.write(buffer, 0, count);
			}
			byte[] file_buff = bos.toByteArray();
			return saveImg(imageFile, file_buff);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (bos != null) {
				try {
					bos.flush();
					bos.close();
				} catch (IOException ex) {

				}
			}
		}
		return false;
	}

	/**
	 * 以字节数组形式保存图片
	 * 
	 */
	public static boolean saveImg(String imageFile, byte[] fileByte) {
		File file = new File(imageFile);
		OutputStream os = null;
		try {
			os = new FileOutputStream(file);
			os.write(fileByte);
			return true;
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (os != null) {
				try {
					os.flush();
					os.close();
				} catch (IOException ex) {

				}
			}
		}
		return false;
	}
}
