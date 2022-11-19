package com.music.common;

import com.music.dao.MusicDAO;
import com.music.vo.MusicVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

public class FileUpload {
    public MusicVO uploadPhoto(HttpServletRequest request){
        String filename = "";
        int sizeLimit = 15 * 1024 * 1024;

        String realPath = request.getServletContext().getRealPath("upload");
        //System.out.println(realPath);

        File dir = new File(realPath);
        if(!dir.exists()) dir.mkdirs();

        MusicVO one = null;
        MultipartRequest multipartRequest = null;
        try {
            multipartRequest = new MultipartRequest(request, realPath,sizeLimit, "utf-8",new DefaultFileRenamePolicy());

            filename = multipartRequest.getFilesystemName("photo");
            one = new MusicVO();
            String sid = multipartRequest.getParameter("sid");
            if(sid!=null && !sid.equals("")) one.setSid(Integer.parseInt(sid));
            one.setTitle(multipartRequest.getParameter("title"));
            one.setArtist(multipartRequest.getParameter("artist"));
            one.setAlbum(multipartRequest.getParameter("album"));
            one.setGenre(multipartRequest.getParameter("genre"));

            if(sid!=null && !sid.equals("")){
                MusicDAO dao = new MusicDAO();
                String oldfilename = dao.getPhotoFilename(Integer.parseInt(sid));
                if(filename!=null && oldfilename!=null)
                    FileUpload.deleteFile(request, oldfilename);
                else if(filename==null && oldfilename!=null)
                    filename=oldfilename;
            }
            one.setPhoto(filename);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return one;
    }
    public static void deleteFile(HttpServletRequest request, String filename) {
        String filePath = request.getServletContext().getRealPath("upload");

        File f = new File(filePath + "/" + filename);
        if(f.exists()) f.delete();
    }

}
