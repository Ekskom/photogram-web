package com.example.SpringProg.service;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.example.SpringProg.domain.Message;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import javax.validation.Valid;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

@Service
@Slf4j
public class StorageService {

    @Value("my-photogram-web-bucket")
    private String bucketName;

    @Autowired
    private AmazonS3 s3;


    public String uploadFile(@Valid Message message, MultipartFile file){

        File fileObj = convertMultiPartFileToFile(file);

        String fileName = System.currentTimeMillis()+"_"+file.getOriginalFilename();

        s3.putObject(new PutObjectRequest(bucketName, fileName, fileObj));
        fileObj.delete();

        message.setFilename(fileName);


        return "FileUploaded: " + fileName;


    }





    private File convertMultiPartFileToFile(MultipartFile file) {
        File convertedFile = new File(file.getOriginalFilename());
        try (FileOutputStream fos = new FileOutputStream(convertedFile)) {
            fos.write(file.getBytes());
        } catch (IOException e) {
            System.out.println(e);
        }
        return convertedFile;
    }

}
