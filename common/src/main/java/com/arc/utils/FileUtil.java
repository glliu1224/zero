package com.arc.utils;

import org.springframework.util.Assert;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

/**
 * 系统文件工具
 *
 * @author 叶超
 * 2018/10/22 18:09
 */
public class FileUtil {
    /**
     * 英文点号
     * The extension separator character.
     *
     * @since 1.4
     */
    public static final char EXTENSION_SEPARATOR = '.';

    /**
     * 下划线;
     */
    public static final char EXTENSION_UNDERLINE = '_';

    /**
     * 找不到，坐标溢出
     */
    private static final int NOT_FOUND = -1;

    /**
     * 正斜线
     * The Unix separator character.
     */
    private static final char UNIX_SEPARATOR = '/';

    /**
     * 反斜线
     * The Windows separator character.
     */
    private static final char WINDOWS_SEPARATOR = '\\';

    /**
     * @param filename     文件名称
     * @param targetString 需要输出的字符串
     */
    public void output(String filename, String targetString) {
        FileWriter fw;
        try {
            fw = new FileWriter(filename);
            fw.write(targetString, 0, targetString.length());
            fw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    //=====================================================
    //                                          工具方法
    //=====================================================

    /**
     * @return 获取时间戳，精度到毫秒并拼接上随机数
     */
    public static String getSimpleCode() {
        StringBuffer stringBuffer = new StringBuffer();
        String time = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
        int x = (int) (Math.random() * 900) + 1000;
        stringBuffer.append(time).append(x);
        return stringBuffer.toString();
    }


    /**
     * 获取现在时间字符串
     */
    public static String getDateString() {
        return new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
    }

    /**
     * @param sourceFileName 源文件名称
     * @return 唯一目标文件名称
     */
    public static String getTargetFileName(String sourceFileName) {
        //时间戳+uuid+sourceFileName
        return System.currentTimeMillis() + getUUID() + EXTENSION_UNDERLINE + sourceFileName;
    }

    /**
     * 获取uuid变体，去除了“-”
     *
     * @return
     */
    public static String getUUID() {
        return UUID.randomUUID().toString().replace("-", "");
    }


    /**
     * @param in  输入
     * @param out 输出
     * @return
     * @throws IOException
     */
    public static int copy(InputStream in, OutputStream out) throws IOException {
        Assert.notNull(in, "No InputStream specified");
        Assert.notNull(out, "No OutputStream specified");

        int byteCount = 0;
        byte[] buffer = new byte[4096];

        int bytesRead;
        for (boolean var4 = true; (bytesRead = in.read(buffer)) != -1; byteCount += bytesRead) {
            out.write(buffer, 0, bytesRead);
        }

        out.flush();
        return byteCount;
    }


//    /***
//     * 处理文件上传
//     *
//     * @param file
//     * @param basePath        存放文件的目录的绝对路径 servletContext.getRealPath("/upload")
//     * @return
//     */
//
//    public static String upload(MultipartFile file, String basePath) {
//        String orgFileName = file.getOriginalFilename();
//        String fileName = UUID.randomUUID().toString() + "." + FilenameUtils.getExtension(orgFileName);
//        try {
//            File targetFile = new File(basePath, fileName);
//            FileUtils.writeByteArrayToFile(targetFile, file.getBytes());
//            //把文件同步到公共文件夹
//            File publicFile = new File("/", fileName);
//            FileUtils.writeByteArrayToFile(publicFile, file.getBytes());
//
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//        return fileName;
//    }


    /**
     * 判断文件名称是否有异常
     *
     * @param filename 文件名称
     * @return
     */
    public static String getExtension(final String filename) {
        if (filename == null) {
            return null;
        }
        final int index = indexOfExtension(filename);
        if (index == NOT_FOUND) {
            return "";
        } else {
            return filename.substring(index + 1);
        }
    }


    /**
     * 获取扩展名的index
     *
     * @param filename
     * @return
     */
    public static int indexOfExtension(final String filename) {
        if (filename == null) {
            return NOT_FOUND;
        }
        final int extensionPos = filename.lastIndexOf(EXTENSION_SEPARATOR);
        final int lastSeparator = indexOfLastSeparator(filename);
        return lastSeparator > extensionPos ? NOT_FOUND : extensionPos;
    }

    /**
     * 获取分隔符的index
     *
     * @param filename
     * @return
     */
    public static int indexOfLastSeparator(final String filename) {
        if (filename == null) {
            return NOT_FOUND;
        }
        final int lastUnixPos = filename.lastIndexOf(UNIX_SEPARATOR);
        final int lastWindowsPos = filename.lastIndexOf(WINDOWS_SEPARATOR);
        return Math.max(lastUnixPos, lastWindowsPos);
    }


    /**
     * 删除文件，可以是文件或文件夹
     *
     * @param fileName 要删除的文件名
     * @return 删除成功返回true，否则返回false
     */
    public static boolean delete(String fileName) {
        File file = new File(fileName);
        if (!file.exists()) {
            System.out.println("删除文件失败:" + fileName + "不存在！");
            return false;
        } else {
            if (file.isFile()) {
                return deleteFile(fileName);
            } else {
                return deleteDirectory(fileName);
            }
        }
    }

    /**
     * 删除单个文件
     *
     * @param fileName 要删除的文件的文件名
     * @return 单个文件删除成功返回true，否则返回false
     */
    public static boolean deleteFile(String fileName) {
        File file = new File(fileName);
        // 如果文件路径所对应的文件存在，并且是一个文件，则直接删除
        if (file.exists() && file.isFile()) {
            if (file.delete()) {
                System.out.println("删除单个文件" + fileName + "成功！");
                return true;
            } else {
                System.out.println("删除单个文件" + fileName + "失败！");
                return false;
            }
        } else {
            System.out.println("删除单个文件失败：" + fileName + "不存在！");
            return false;
        }
    }

    /**
     * 删除目录及目录下的文件
     *
     * @param dir 要删除的目录的文件路径
     * @return 目录删除成功返回true，否则返回false
     */
    public static boolean deleteDirectory(String dir) {
        // 如果dir不以文件分隔符结尾，自动添加文件分隔符
        if (!dir.endsWith(File.separator))
            dir = dir + File.separator;
        File dirFile = new File(dir);
        // 如果dir对应的文件不存在，或者不是一个目录，则退出
        if ((!dirFile.exists()) || (!dirFile.isDirectory())) {
            System.out.println("删除目录失败：" + dir + "不存在！");
            return false;
        }
        boolean flag = true;
        // 删除文件夹中的所有文件包括子目录
        File[] files = dirFile.listFiles();
        for (int i = 0; i < files.length; i++) {
            // 删除子文件
            if (files[i].isFile()) {
                flag = FileUtil.deleteFile(files[i].getAbsolutePath());
                if (!flag)
                    break;
            }
            // 删除子目录
            else if (files[i].isDirectory()) {
                flag = FileUtil.deleteDirectory(files[i]
                        .getAbsolutePath());
                if (!flag)
                    break;
            }
        }
        if (!flag) {
            System.out.println("删除目录失败！");
            return false;
        }
        // 删除当前目录
        if (dirFile.delete()) {
            System.out.println("删除目录" + dir + "成功！");
            return true;
        } else {
            return false;
        }
    }

    /**
     * 获取文件扩展名
     *
     * @param filename
     * @return
     */
    public static String getExtensionName(String filename) {
        if ((filename != null) && (filename.length() > 0)) {
            int dot = filename.lastIndexOf('.');
            if ((dot > -1) && (dot < (filename.length() - 1))) {
                return filename.substring(dot + 1);
            }
        }
        return filename;
    }

    /**
     * 删除文件扩展名
     *
     * @param filename
     * @return
     */
    public static String deleteExtensionName(String filename) {
        if ((filename != null) && (filename.length() > 0)) {
            int dot = filename.lastIndexOf('.');
            if ((dot > -1) && (dot < (filename.length() - 1))) {
                return filename.substring(0, dot);
            }
        }
        return filename;
    }


    /**
     * 测试main
     *
     * @param args 无用
     */
    public static void main(String[] args) {

        System.out.println("24534612203910144".length());
        System.out.println(new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()));//20190113 180709850

        System.out.println();
        String uuid = UUID.randomUUID().toString();
        String uuidReplace = uuid.replace("-", "");
        System.out.println(uuid);                      //c4bf200f-85bf-431c-b91a-1c4c8247f1d7
        System.out.println(uuidReplace);        //c4bf200f85bf431cb91a1c4c8247f1d7


        Object x = Math.random();
        System.out.println("random--> " + x);
        System.out.println("测试 --> " + getSimpleCode());

        String file2 = "a/b/c/application.txt";
        System.out.println(indexOfLastSeparator("application.txt"));

        System.out.println(indexOfLastSeparator(file2));

        System.out.println();
        System.out.println(getExtension(file2));
    }


}
